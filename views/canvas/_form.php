<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\captcha\Captcha;
use yii\captcha\CaptchaValidator;
use yii\captcha\CaptchaAction;
/* @var $this yii\web\View */
/* @var $model app\models\Canvas */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="canvas-form">

    <?php $form = ActiveForm::begin(['enableClientValidation' => false]); ?>

    <?= $form->field($model, 'title')->textarea(['rows' => 1])->textInput(['placeholder' => '5-50 Characters']) ?>

    <?= $form->field($model, 'content')->textarea(['rows' => 6])->widget(letyii\tinymce\Tinymce::className()) ?>

    <?= $form->field($model, 'language')->dropDownList(['en' => 'English', 'fr' => 'French', 'ro' => 'Romanian']); ?>

    <?= $form->field($model, 'eng_summary')->textarea(['rows' => 2])->textInput(['placeholder' => '10-120 Characters']) ?>

    <?= $form->field($model, 'captcha')->widget(\yii\captcha\Captcha::classname(), [
        // configure additional widget properties here
    ]) ?>
    
    <?php if(Yii::$app->user->identity->isAdmin || Yii::$app->user->can('expert'))
    {
    	echo $form->field($model,'requested')->radioList(['Accepted'=>'Accepted' , 'In queue'=>'In queue' ,'Declined'=>'Declined']);
    }
    ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
