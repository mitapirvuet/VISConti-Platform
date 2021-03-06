<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Education */

$this->title = 'Update Degree: ' . $model->degree . " at " . $model->institution;
$this->params['breadcrumbs'][] = ['label' => 'Educations', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<link href="../web/css/site.css" rel="stylesheet" />


<div class="education-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
