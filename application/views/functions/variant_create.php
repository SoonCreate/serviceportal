<?= render_form_header('variant_create');?>
<div class="container-fluid userd">
    <?= render_form_open('functions','variant_create') ?>
    <?php $this->load->view('functions/_variant_form');?>
    <?= render_form_hidden('function_id');?>
    <?= render_button_group();?>
    <?= render_form_close() ?>
</div>
