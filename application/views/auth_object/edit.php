<?= render_form_header('auth_object_edit');?>
<div class="container-fluid userd">
    <?= render_form_open('auth_object','edit') ?>
    <?= render_form_input('object_name',false,true);?>
    <?= render_form_input('description',true);?>
    <?= render_form_hidden('id',v('id'));?>
    <?= render_button_group();?>
    <?= render_form_close() ?>
</div>