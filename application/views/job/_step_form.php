<?= render_form_input('step',true)?>
<?= render_select_with_options('function_id','vl_functions',true,null,false,array('onChange'=>'_onFunctionSelectChange'))?>
<?= render_select_add_options('variant_id','')?>
<script type="text/javascript">
    onWsoLoad(function () {
        _onFunctionSelectChange(<?= _v('variant_id')?>);
    });
    _onFunctionSelectChange = function(variant_id){
        var o = dijitObject('function_id');
        var v = dijitObject('variant_id');
        if(o != undefined){
            $ajax.get(url("functions/variant_options",{id : o.getValue(),bg: 1}),{handleAs: "json"}).then(function(data){
                v.set("options",data);
                if(variant_id){
                    v.set("value", variant_id);
                }else{
                    v.set("value", v.getValue());
                }

            });
        }
    }
</script>