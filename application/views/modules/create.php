<?= render_form_header('module_create');?>
<div class="container-fluid userd">
    <?= render_form_open('modules','create') ?>
    <?= render_form_input('module_name',true)?>
    <?= render_form_input('description',true)?>
    <?= render_form_input('sort',true)?>
    <?= render_form_input('display_class',false,null,null,null,'<a target="_blank" href="http://www.bootcss.com/p/font-awesome/#icons-new">font-awesome</a>')?>
    <?= render_form_hidden('id',v('id'))?>
    <?= render_button_group()?>
    <?= render_form_close() ?>
</div>

