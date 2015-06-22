<!DOCTYPE html>
<html>
<head>
    <title><?= _config('logo_text') ?></title>
    <?php $this->load->view('_header') ?>
</head>
<body class="sc">
<div id="reg">
    <div id="regHeader">
        <div class="comLogoImg"><img src="<?= base_url() ?>resources/images/logo.png" style="height: 35px"/></div>
        <div class="comLogoText"><?= _config('logo_text') ?></div>
    </div>

    <div  id="regPage" class="cl" >

        <h4><?= label('user_register')?></h4>
        <?= render_form_open('user','register')?>
        <div class="container-fluid userd">
            <?= render_form_input('username',true)?>
            <?= render_form_password('password',true)?>
            <?= render_form_password('repassword',true)?>
            <?= render_form_input('full_name',true)?>
            <?= render_radio_group('user_type',label('who_you_are'),'vl_register_select')?>
            <dl class="row dl-horizontal">
                <dt>&nbsp;</dt>
                <dd>
                    <button type="submit" data-dojo-type="sckj/form/Button" class="success bigBtn"><label><i class="icon-circle-arrow-right"></i>提交注册</label></button>
                </dd>
            </dl>
        </div>
        <?= render_form_close()?>
    </div>
    <div data-dojo-type="dojox/widget/Toaster" data-dojo-props="positionDirection:'tr-left'"
         id="toaster">
    </div>

    <?php $this->load->view('_footer') ?>
</div>
</body>

