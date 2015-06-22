<?= render_form_input('full_name',true)?>
<?= render_form_input('contact')?>
<?= render_radio_group('sex',null,'vl_sex')?>
<?= render_form_input('email')?>
<?= render_form_input('mobile_telephone')?>
<?= render_form_input('phone_number')?>
<?= render_form_input('qq')?>
<?= render_form_input('weixin')?>
<?= render_form_input('address')?>

<?php
//管理员可修改其他信息
if(_v('to') == 'admin_edit'){

    echo render_form_header('business_info');
    echo '<div class="container-fluid userd">';
    echo render_form_input('salesman');
    echo render_form_dateTextBox('contract_date');
    echo render_form_dateTextBox('last_pay_date');
    echo '</div>';

    echo render_form_header('license_info');
    echo '<div class="container-fluid userd">';
    echo render_form_input('license');
    echo render_form_dateTextBox('license_date');
    echo render_form_input('app_key');
    echo render_form_input('app_secret');
    echo '</div>';


    echo render_form_header('install_info');
    echo '<div class="container-fluid userd">';
    echo render_form_dateTextBox('install_date');
    echo render_form_input('server_host');
    echo render_form_input('server_version');
    echo render_form_input('server_username');
    echo render_form_input('server_password');
    echo render_form_input('db_name');
    echo render_form_input('db_version');
    echo render_form_input('db_username');
    echo render_form_input('db_password');
    echo render_form_input('bwb_number');
    echo render_form_input('bwb_password');
    echo render_form_textArea('remark');
    echo '</div>';
 }?>