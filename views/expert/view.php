<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\ExpertAccount */

$ed_check=false;
$contact_check=false;
$experience_check=false;
$personal_check=false;
$bio_check=false;
$specialization_check=false;

function getSpec($id, $type) // getter function for specialization
{   
    if($type=='sector')
    {
        $sector = app\models\Sector::find()->where(['id' => $id])->one();
        return $sector->name;
    }

    if($type=='subsector')
    {
        $subsector = app\models\SubSector::find()->where(['id' => $id])->one();
        return $subsector->name;
    }

    if($type=='specialization')
    {
        $spec = app\models\Specialization::find()->where(['id' => $id])->one();
        return $spec->name;
    }

    if($type=='interest')
    {
        $interest = app\models\Interest::find()->where(['id' => $id])->one();
        return $interest->name;
    }
}

$this->title = 'View Profile';
$this->params['breadcrumbs'][] = ['label' => 'Expert Accounts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="expert-account-view">

    <div class="row">
    <div class="col-xs-12 col-sm-6 col-md-6">
        <div class="row">
            <div class="col-sm-6 col-md-4">
                <img src="../web/images/avatar_big.png" alt="" class="img-rounded img-responsive" />
            </div>
            <div class="col-sm-6 col-md-8">
                <h4><?= $this->title ?></h4>
                <?php if (!empty($model->bio)) { ?>
                    <h5> <b>Bio :</b> <br> </h5>
                    <p style="word-break: break-all;width:600px;"><?= Html::encode($model->bio) ?></p>
                <?php  }$bio_check=true; ?>

                <ul style="padding: 0; list-style: none outside none;">
                    <h5> <b>Personal info :</b> </h5> 
                    <?php if (!empty($model->given_name) || !empty($model->family_name)) { $personal_check=true; ?>
                        <li><i class="glyphicon glyphicon-user text-muted"></i> Name : <?= Html::a(Html::encode($model->title)) . " " . Html::a(Html::encode($model->given_name)) . " " . Html::a(Html::encode($model->family_name))  ?></li>
                    <?php }    ?>
                    <?php if (!empty($model->website)) { $personal_check=true; ?>
                        <li><i class="glyphicon glyphicon-globe text-muted"></i> Website : <?= Html::a(Html::encode($model->website), Html::encode($model->website)) ?></li>
                    <?php }    ?>
                    <?php if (!empty($model->email)) { $personal_check=true; ?>
                        <li><i class="glyphicon glyphicon-envelope text-muted"></i> E-mail : <?= Html::a(Html::encode($model->email), 'mailto:' . Html::encode($model->email)) ?></li>
                    <?php }    ?>
                    <?php if (!empty($model->birth_year)) { $personal_check=true; ?>
                        <li><i class="glyphicon glyphicon-calendar text-muted"></i> Year of Birth : <?= Html::a(Html::encode($model->birth_year), Html::encode($model->birth_year)) ?></li>
                    <?php }    if($personal_check==false) echo "<li> Nothing Here </li>";?>

                    <h5> <b>Contact info :</b> </h5>
                    <?php if (!empty($model->phone)) { $contact_check=true; ?>
                        <li><i class="glyphicon glyphicon-earphone text-muted"></i> Phone Number :  <?= Html::a(Html::encode($model->phone)) ?></li>
                    <?php  } ?>
                    <?php if (!empty($model->mobile)) { $contact_check=true; ?>
                        <li><i class="glyphicon glyphicon-phone text-muted"></i> Mobile Number : <?= Html::a(Html::encode($model->mobile)) ?></li>
                    <?php  } ?>
                    <?php if (!empty($model->country)) { $contact_check=true; ?>
                        <li><i class="glyphicon glyphicon-globe text-muted"></i> Country : <?= Html::a(Html::encode($model->country)) ?> <?php if (!empty($model->state)) { ?> , <?= Html::a(Html::encode($model->state)) ?> <?php  } ?></li>
                    <?php  } ?>
                    <?php if (!empty($model->address)) { $contact_check=true; ?>
                        <li><i class="glyphicon glyphicon-map-marker text-muted"></i> Address : <?php if (!empty($model->city)) { ?> <?= Html::a(Html::encode($model->city)) ?> , <?php  } ?> <?= Html::a(Html::encode($model->address)) ?></li>
                    <?php  } ?>
                    <?php if (!empty($model->zip)) { $contact_check=true; ?>
                        <li><i class="glyphicon glyphicon-home text-muted"></i> Zip/Postal Code : <?= Html::a(Html::encode($model->zip)) ?></li>
                    <?php  } if($contact_check == false) echo "<li>Nothing here.</li>";?>
                     <h5> <b>Education :</b> </h5>

                    <?php if (!empty($education)) { $ed_check=true; ?>
                        <li><i class="glyphicon glyphicon-education text-muted"></i> Studies : 
                                <ul style="margin-left:25px;">
                                    <?php foreach($education as $item) : ?>
                                        <li><i class="glyphicon glyphicon-check text-muted"></i> <?= $item->degree . " at " . $item->institution . " , from " . $item->from . " to " . $item->to ?>;</li>
                                        <li style="margin-left:10px;"><i class="glyphicon glyphicon-cog text-muted"></i> Degree Details: <?= $item->degree_details ?>;</li>
                                    <?php endforeach; ?>
                                </ul>
                        </li>
                    <?php  } if($ed_check == false) echo "<li>Nothing here.</li>";  ?>

                     <h5> <b>Experience :</b> </h5>
                     <?php if (!empty($experience)) { $experience_check=true; ?>
                        <li><i class="glyphicon glyphicon-star text-muted"></i> Work Experience : 
                                <ul style="margin-left:25px;">
                                    <?php foreach($experience as $item) : ?>
                                        <li style="margin-top:5px;"><i class="glyphicon glyphicon-check text-muted"></i> <?= $item->job_title . " at " . $item->institution . " , from " . $item->from . " to " . $item->to ?>;</li>
                                        <li style="margin-left:10px;"><i class="glyphicon glyphicon-cog text-muted"></i> Job Details: <?= $item->job_description ?>;</li>
                                    <?php endforeach; ?>
                                </ul>
                        </li> <br>
                    <?php  }  if($experience_check == false) echo '<li style="height:25px;">Nothing here.</li>'; ?>

                    <h5> <b>Specialization :</b> </h5>
                     <?php if (!empty($sectors)) { $specialization_check=true; ?>
                        <li><i class="glyphicon glyphicon-star text-muted"></i> Sectors : 
                                <ul style="margin-left:25px;">
                                    <?php foreach($sectors as $item) : ?>
                                        <li style="margin-top:5px;"><i class="glyphicon glyphicon-check text-muted"></i> <?= getSpec($item->sector_id,'sector'); ?>;</li>
                                    <?php endforeach; ?>
                                </ul>
                        </li> <br>
                    <?php  } ?> 

                    <?php if (!empty($subsectors)) { $specialization_check=true; ?>
                        <li><i class="glyphicon glyphicon-star text-muted"></i> Sub-Sectors : 
                                <ul style="margin-left:25px;">
                                    <?php foreach($subsectors as $item) : ?>
                                        <li style="margin-top:5px;"><i class="glyphicon glyphicon-check text-muted"></i> <?= getSpec($item->subsector,'subsector'); ?>;</li>
                                    <?php endforeach; ?>
                                </ul>
                        </li> <br>
                    <?php  } ?> 

                    <?php if (!empty($specializations)) { $specialization_check=true; ?>
                        <li><i class="glyphicon glyphicon-star text-muted"></i> Specializations : 
                                <ul style="margin-left:25px;">
                                    <?php foreach($specializations as $item) : ?>
                                        <li style="margin-top:5px;"><i class="glyphicon glyphicon-check text-muted"></i> <?= getSpec($item->specialization,'specialization'); ?>;</li>
                                    <?php endforeach; ?>
                                </ul>
                        </li> <br>
                    <?php  } ?> 

                    <?php if (!empty($interests)) { $specialization_check=true; ?>
                        <li><i class="glyphicon glyphicon-star text-muted"></i> Interests : 
                                <ul style="margin-left:25px;">
                                    <?php foreach($interests as $item) : ?>
                                        <li style="margin-top:5px;"><i class="glyphicon glyphicon-check text-muted"></i> <?= getSpec($item->interest,'interest'); ?>;</li>
                                    <?php endforeach; ?>
                                </ul>
                        </li> <br>
                    <?php  } ?> 

                    <?php if($experience_check == false) echo '<li style="height:25px;">Nothing here.</li>'; ?>

                    <li><i class="glyphicon glyphicon-time text-muted"></i> <?= 'Joined on '.$model->created_on ?></li>
                </ul>
                
            </div>
        </div>
    </div>
</div>

</div>