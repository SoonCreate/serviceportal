<?= render_form_header('status_edit') ?>
<div class="container-fluid userd">
    <?= render_form_open('status','edit') ?>
    <?= render_form_input('status_code',false,TRUE) ?>
    <?= render_form_input('description',true) ?>
    <?= render_select_with_options('sys_order_id','vl_sys_orders',false,null,true)?>
    <?= render_form_hidden('id',v('id'));?>
    <?= render_button_group();?>
    <?= render_form_close() ?>
</div>
