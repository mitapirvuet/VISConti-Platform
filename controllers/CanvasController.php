<?php

namespace app\controllers;

use Yii;
use app\models\Canvas;
use app\models\CanvasSearch;
use app\models\File;
use yii\helpers\Html;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\behaviors\TimestampBehavior;
use yii\db\Expression;
use yii\db\Query;
use yii\filters\AccessControl;
use yii\web\UploadedFile;
use app\models\Expert;
use app\models\ExpertSector;
use app\models\ExpertCanvas;
use app\models\Student;
use app\models\Sector;
use app\models\SubSector;

/**
 * CanvasController implements the CRUD actions for Canvas model.
 */
class CanvasController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],

            'access' => [
                'class' => AccessControl::className(),
                'only' => ['create', 'index','update','delete','view'],
                'rules' => [
                    [
                        'allow' => false,
                        'actions' => ['create', 'index','update','delete','view'],
                        'roles' => ['?'],
                    ],
                    [
                        'allow' => true,
                        'actions' => ['create','view','update'],
                        'matchCallback' => function ($rule, $action) {
                            return Yii::$app->user->identity->type == 's';
                        },
                    ],
                    [
                        'allow' => true,
                        'actions' => ['index','view','update'],
                        'matchCallback' => function ($rule, $action) {
                            return Yii::$app->user->identity->type == 'e';
                        },
                    ],
                    [
                        'allow' => false,
                        'actions' => ['delete'],
                    ],

                ],
            ],
        ];
    }

    /**
     * Lists all Canvas models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new CanvasSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Canvas model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $model = $this->findModel($id);

        $student = Student::find()->where(['id' => $model->created_by])->one();

        $canvas_experts = ExpertCanvas::find()->where(['project' => $model->id])->all();

        $sector = Sector::find()->where(['id' => $model->sector])->one()->name;

        $subsector = SubSector::find()->where(['id' => $model->subsector])->one()->name;

        $experts=[];

        foreach($canvas_experts as $e)
        {
            $expert= Expert::find()->where(['id' => $e->expert])->one();

            if(!empty($expert->given_name) && !empty($expert->family_name))
            {
                $expert = $expert->given_name . ' ' . $expert->family_name;
            }
            else $expert = $expert->email;
            
            array_push($experts, $expert);
        }

        if(!empty($student->given_name) && !empty($student->family_name))
            $student = $student->given_name . ' ' . $student->family_name;
        else $student = $student->email;



        return $this->render('view', [
            'model' => $model,
            'student' => $student,
            'experts' => $experts,
            'sector' => $sector,
            'subsector' => $subsector
        ]);
    }

    /**
     * Creates a new Canvas model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Canvas();

        if ($model->load(Yii::$app->request->post())) {
          $model->date_added = new Expression('NOW()');
          $model->date_modified = new Expression('NOW()');
          $model->created_by= Yii::$app->user->id;
          $model->status = 'Submitted';

           if ($model->save()) {
              if(!$this->findExperts($model)) {
                    return $this->render('update', [
                        'model' => $model,
                        'error' => 'Sorry, we could not find experts available to review your project at this time. Please try again later.'
                    ]);
                }
                else {$model->status = 'Expert evaluation requested';$model->update();}

             return $this->redirect(['view', 'id' => $model->id]);             
           } 
        } 
        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Canvas model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post())) {
          $model->date_modified = new Expression('NOW()');
           if ($model->save()) {        

             if(!$this->findExperts($model)) {
                    return $this->render('update', [
                        'model' => $model,
                        'error' => 'Sorry, we could not find experts available to review your project at this time. Please try again later.'
                    ]);
                }

                else {$model->status = 'Expert evaluation requested';$model->update();}


             return $this->redirect(['view', 'id' => $model->id]);             
           } 
        } 
        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Canvas model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Canvas model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Canvas the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Canvas::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function findExperts($model)
    {       
            $technical_experts = Expert::find()->where(['role' => 'Technical', 'confirmed' => 'Yes'])->orderBy('active_projects')->all();

            if($technical_experts == NULL) $exist=false;

            $exist = true;

            $tech_exist = ExpertCanvas::find()->where([ 'role' => 'Technical' , 'project' => $model->id])->one(); // check if there's already a technical expert for this canvas

            if($tech_exist == NULL) {

                foreach($technical_experts as $expert)
                    {      
                        $sector_check = ExpertSector::find()->where(['sector_id' => $model->sector , 'expert' => $expert->id])->one();

                        if($sector_check != NULL)
                            {   
                                $record = new ExpertCanvas();
                                $record->project = $model->id;
                                $record->expert = $expert->id;
                                $record->status = 'Pending';
                                $record->role = 'Technical';
                                $record->expiry_date = new Expression('DATE_ADD(NOW(), INTERVAL 14 DAY)');
                                $record->save();

                                $id = openssl_encrypt($record->id, 'AES-128-ECB', '12345678abcdefgh');

                                Yii::$app->mailer->compose()
                                    ->setTo($expert->email)
                                    ->setFrom('mailer@cop.viscontiproject.eu')
                                    ->setSubject('New Project Invitation')
                                    ->setHtmlBody("
                                        <h3>You received an invitation for a project!</h3>  <br><br>".
                                        'Project title:' . $model->title . '<br>' .
                                        'Project summary:' . $model->eng_summary . '<br>' .
                                        'More information: <a href="' . Yii::$app->urlManager->createAbsoluteUrl(
                                        ['canvas/view','id'=>$record->project]) . '"> Here </a> <br><br>' .
                                        'In order to accept the invitation, please click the following link: <a href="'.
                                        Yii::$app->urlManager->createAbsoluteUrl(
                                        ['canvas/confirm','id'=>$id]) . '"> Accept </a>')
                                    ->send();

                                break;
                            } 
                        else $exist = false;
                    }
            }

            $economical_experts = Expert::find()->where(['role' => 'Economical', 'confirmed' => 'Yes'])->orderBy('active_projects')->all();

            if($economical_experts == NULL) $exist=false;

            $econ_exist = ExpertCanvas::find()->where([ 'role' => 'Economical' , 'project' => $model->id])->one(); // check if canvas has economical expert already assigned

            if($econ_exist == NULL) {

                    foreach($economical_experts as $expert)
                        {      
                            $sector_check = ExpertSector::find()->where(['sector_id' => $model->sector , 'expert' => $expert->id])->one();

                            if($sector_check != NULL)
                                {   
                                    $record = new ExpertCanvas();
                                    $record->project = $model->id;
                                    $record->expert = $expert->id;
                                    $record->status = 'Pending';
                                    $record->role = 'Economical';
                                    $record->expiry_date = new Expression('DATE_ADD(NOW(), INTERVAL 14 DAY)');
                                    $record->save();

                                    $id = openssl_encrypt($record->id, 'AES-128-ECB', '12345678abcdefgh');

                                    Yii::$app->mailer->compose()
                                    ->setTo($expert->email)
                                    ->setFrom('mailer@cop.viscontiproject.eu')
                                    ->setSubject('New Project Invitation')
                                    ->setHtmlBody("
                                        <h3>You received an invitation for a project!</h3>  <br><br>".
                                        'Project title:' . $model->title . '<br>' .
                                        'Project summary:' . $model->eng_summary . '<br>' .
                                        'More information: <a href="' . Yii::$app->urlManager->createAbsoluteUrl(
                                        ['canvas/view','id'=>$record->project]) . '"> Here </a> <br><br>' .
                                        'In order to accept the invitation, please click the following link: <a href="'.
                                        Yii::$app->urlManager->createAbsoluteUrl(
                                        ['canvas/confirm','id'=>$id]) . '"> Accept </a>')
                                    ->send();


                                    break;
                                }
                            else $exist=false; 
                        }
            }

            $creative_experts = Expert::find()->where(['role' => 'Creative', 'confirmed' => 'Yes'])->orderBy('active_projects')->all();

            $creative_exist = ExpertCanvas::find()->where([ 'role' => 'Creative' , 'project' => $model->id])->one(); // check if canvas has creative expert already assigned

            if($creative_experts == NULL) $exist=false;

            if($creative_exist == NULL) {

                foreach($creative_experts as $expert)
                    {      
                        $sector_check = ExpertSector::find()->where(['sector_id' => $model->sector , 'expert' => $expert->id])->one();

                        if($sector_check != NULL)
                            {   
                                $record = new ExpertCanvas();
                                $record->project = $model->id;
                                $record->expert = $expert->id;
                                $record->status = 'Pending';
                                $record->role = 'Creative';
                                $record->expiry_date = new Expression('DATE_ADD(NOW(), INTERVAL 14 DAY)');
                                $record->save();

                                $id = openssl_encrypt($record->id, 'AES-128-ECB', '12345678abcdefgh');
                                
                                Yii::$app->mailer->compose()
                                    ->setTo($expert->email)
                                    ->setFrom('mailer@cop.viscontiproject.eu')
                                    ->setSubject('New Project Invitation')
                                    ->setHtmlBody("
                                        <h3>You received an invitation for a project!</h3>  <br><br>".
                                        'Project title:' . $model->title . '<br>' .
                                        'Project summary:' . $model->eng_summary . '<br>' .
                                        'More information: <a href="' . Yii::$app->urlManager->createAbsoluteUrl(
                                        ['canvas/view','id'=>$record->project]) . '"> Here </a> <br><br>' .
                                        'In order to accept the invitation, please click the following link: <a href="'.
                                        Yii::$app->urlManager->createAbsoluteUrl(
                                        ['canvas/confirm','id'=>$id]) . '"> Accept </a>')
                                    ->send();

                                break;
                            }
                        else $exist=false; 
                    }
            }
            return $exist;
    }

    public function actionConfirm($id){ // $e - expert , $c - canvas

        $record = ExpertCanvas::find()->where(['id' => openssl_decrypt($id, 'AES-128-ECB', '12345678abcdefgh') , 'status' => 'Pending' ])->one();

        if($record == NULL)
        {
            Yii::$app->getSession()->setFlash('warning','Invalid confirmation link or link already accessed.');
            return $this->redirect('index.php?r=site/confirmation');
        }

        else {
            $transaction=ExpertCanvas::getDb()->beginTransaction();
            try {
                $record->status = 'Active';
                $record->update();

                $pending_expert = ExpertCanvas::find()->where(['project' => $record->project , 'status' => 'Pending'])->one();

                $experts_on_project = ExpertCanvas::find()->where(['project' => $record->project])->count();

                if(is_null($pending_expert) && $experts_on_project == 3) // all experts accepted, need to change state of project
                {
                    $canvas_record=Canvas::find()->where(['id' => $record->project])->one(); // get canvas record
                    $canvas_record->status = 'Expert evaluation in progress';  
                    $update = $canvas_record->update();
                    if (!empty($canvas_record->errors)) {
                        throw new Exception("Could not update canvas");
                    }
                }

                $expert_record = Expert::find()->where(['id' => $record->expert])->one();
                $expert_record->active_projects++;
                $expert_record->update();
                $transaction->commit();
            } catch (Exception $e) {
                $transaction->rollback();
            }


            Yii::$app->getSession()->setFlash('success','Project accepted successfully.');
            Yii::$app->getSession()->setFlash('link',Html::a('Click to go to project' , Yii::$app->urlManager->createAbsoluteUrl(
                                        ['canvas/view','id'=>$record->project]) ));
            return $this->redirect('index.php?r=site/confirmation');
        }

    }
}
