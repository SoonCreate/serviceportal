<?= render_form_header('class_edit');?>
<div class="container-fluid userd">
    <?= render_form_open('messages','class_edit') ?>
    <?= render_form_input('class_code',false,TRUE);?>
    <?= render_form_input('description',TRUE);?>
    <?= render_form_hidden('id',v('id'));?>
    <?= render_button_group();?>
    <?= render_form_close() ?>
</div>