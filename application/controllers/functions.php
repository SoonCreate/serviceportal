<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Functions extends CI_Controller {

    function __construct(){
        parent::__construct();
        header('Content-Type: text/html; charset=utf-8');
        $this->load->model('function_model');
        $this->load->model('function_object_model');
        $this->load->model('function_obj_line_model');
    }

	public function index()
	{
        render();
	}

    function data(){
        $fn = new Function_model();
        $fn->order_by('controller');
        $fn->order_by('function_name');
        export_to_itemStore($fn->find_all(),'id','description',true);
    }

    function create(){
        if($_POST){
            $_POST['display_flag'] = v('display_flag');
            $_POST['render_flag'] = v('render_flag');
            $_POST['blank_flag'] = v('blank_flag');
            $_POST['help'] = tpost('help');
            $fn = new Function_model();
            if($fn->insert(_data('function_name','description','controller','action',
                'display_flag','display_class','help','render_flag','blank_flag'))){
                go_back();
                message_db_success();
            }else{
                validation_error();
            }

        }else{
            render();
        }
    }

    function edit(){
        $fn = new Function_model();
        $f = $fn->find(v('id'));
        if(empty($f)){
            show_404();
        }else{
            if($_POST){
                $_POST['display_flag'] = v('display_flag');
                $_POST['render_flag'] = v('render_flag');
                $_POST['blank_flag'] = v('blank_flag');
                $_POST['help'] = tpost('help');
                if($fn->update($f['id'],_data('description','controller','action','display_flag',
                    'render_flag','display_class','help','blank_flag'))){
                    go_back();
                    message_db_success();
                }else{
                    validation_error();
                }

            }else{
                render($f);
            }
        }

    }

    function destroy(){
        $this->load->model('role_module_line_model');
        $this->load->model('module_line_model');
        $f = new Function_model();
        $ml = new Module_line_model();
        $rml = new Role_module_line_model();
        $function_id = p('id');
        $fn = $f->find($function_id);
        $role_in_use = $rml->find_all_by_view(array('function_id'=>$function_id));
        $module_in_use = $ml->find_by(array('function_id'=>$function_id));
        if(!empty($fn) && empty($role_in_use) && empty($module_in_use)){
            if ($f->delete($function_id)) {
                message_db_success();
            }else{
                message_db_failure();
            }
        }else{
            custz_message('E','无法删除!功能正在模块或角色被使用');
        }
    }

    function allocate_modules(){
        $this->load->model('module_line_model');
        $ml = new Module_line_model();
        $fm = new Function_model();
        $fn = $fm->find(v('id'));
        if(empty($fn)){
            show_404();
        }else{
            if($_POST){
//                $ids = v('modules');
                $ids = explode(',',v('lines'));;
                $data['function_id'] = v('id');
                $data['sort'] = v('sort');
                $this->db->trans_start();

                if($ids === FALSE){
                    //删除所有
                    $ml->delete_by(array('function_id' => $data['function_id']));
                }else{
                    //先删除已取消勾选的
                    $this->db->where_not_in('module_id',$ids);
                    $ml->delete_by(array('function_id' => $data['function_id']));
                    //新增的部分
                    $ids = array_diff($ids,$ml->find_module_ids($data['function_id']));
                    foreach($ids as $id){
                        $data['module_id'] = $id;
                        $ml->insert($data);
                    }
                }
                $this->db->trans_complete();
                if ($this->db->trans_status() === FALSE) {
                    message_db_failure();
                }else{
                    go_back();
                    message_db_success();
                }
            }else{
                render();
            }
        }

    }

    //用于显示grid
    function module_data(){
        $fm = new Function_model();
        $fn = $fm->find(v('function_id'));
        if(empty($fn)){
            show_404();
        }else{
            $this->load->model('module_model');
            $this->load->model('module_line_model');
            $ml = new Module_line_model();
            $m = new Module_model();
            $m->order_by('sort');
            $ms = $m->find_all();
            $seleceds = array();
            for($i=0;$i<count($ms) ;$i++){
                $line = $ml->find_by(array('module_id'=>$ms[$i]['id'],'function_id'=>$fn['id']));
                if(!empty($line)){
                    array_push($seleceds,$ms[$i]['id']);
                }
            }
            $data['items'] = $ms;
            $data['selected'] = $seleceds;
        }
        $data["identifier"] = 'id';
        $data["label"] = 'description';
        $data["structure"] = build_structure('module_name','description','creation_date','sort');
        echo json_encode($data);
    }

    function objects(){
        $fm = new Function_model();
        $f = $fm->find(v('id'));
        if(empty($f)){
            show_404();
        }else{
            $fom = new Function_object_model();
            $data['objects'] = $fom->find_all_by_view(array('function_id'=>$f['id']));
            render($data);
        }
    }

    function object_create(){
        $fm = new Function_model();
        $f = $fm->find(v('function_id'));
        $object_id = v('object_id');
        if(empty($f)){
            show_404();
        }else{
            if($_POST){
                $fom = new Function_object_model();
                $l = $fom->find_by(array('object_id'=>$object_id,'function_id'=>$f['id']));
                //验证是否存在
                if(empty($l)){
                    $this->load->model('authobj_line_model');
                    $folm = new Function_obj_line_model();
                    $alm = new Authobj_line_model();
                    $this->db->trans_start();
                    $obj['function_id'] = $f['id'];
                    $obj['object_id'] = $object_id;
                    $line['fun_object_id'] = $fom->insert($obj);
                    $os = $alm->find_all_by(array('object_id'=>$object_id));
                    foreach($os as $o){
                        $line['object_line_id'] = $o['id'];
                        $line['default_value'] = $o['default_value'];
                        $folm->insert($line);
                    }
                    $this->db->trans_complete();
                    if ($this->db->trans_status() === FALSE) {
                        message_db_failure();
                    }else{
                        go_back();
                        message_db_success();
                    }
                }else{
                    custz_message('E','功能已包含该权限对象');
                }
            }else{
                $this->load->model('authority_object_model');
                $aom = new Authority_object_model();
                $data['objects'] = $aom->find_all();
                render($data);
            }
        }
    }

    function object_destroy(){
        $fom = new Function_object_model();
        $fo = $fom->find(v('id'));
        if(empty($fo)){
            show_404();
        }else{
            $folm = new Function_obj_line_model();
            $this->db->trans_start();
            $fom->delete($fo['id']);
            $folm->delete_by(array('fun_object_id'=>$fo['id']));
            $this->db->trans_complete();
            if ($this->db->trans_status() === FALSE) {
                message_db_failure();
            }else{
                message_db_success();
            }
        }
    }

    function object_items(){
        $fom = new Function_object_model();
        $fo = $fom->find(v('id'));
        if(empty($fo)){
            show_404();
        }else{
            $folm = new Function_obj_line_model();
            $data['items'] = $folm->find_all_by_view(array('fun_object_id'=>$fo['id']));
            render($data);
        }
    }

    function object_item_edit(){
        $folm = new Function_obj_line_model();
        $line = $folm->find_by_view(array('id'=>v('id')));
        if(empty($line)){
            show_404();
        }else{
            if($_POST){
                if($folm->update($line['id'],_data('default_value'))){
                    go_back();
                    message_db_success();
                }else{
                    validation_error();
                }
            }else{
                render($line);
            }
        }
    }

    //参数变式
    function variants(){
        $fm = new Function_model();
        $fn = $fm->find(v('id'));
        if(empty($fn)){
            show_404();
        }else{
            $this->load->model('variant_model');
            $vm = new Variant_model();
            $data['objects'] = _format($vm->find_my_variants($fn['id']),true);
            render($data);
        }

    }

    //获取某个功能的参数列表；参数bg为后台标志
    function variant_options(){
        $data = array();
        $this->load->model('variant_model');
        $vm = new Variant_model();
        $vs = $vm->find_all_by(array('function_id'=>v('id'),'background_flag'=>v('bg')));
        foreach($vs as $v){
            $d['value'] = $v['id'];
                        if(_user_config('technical_name')){
                $d['label'] = $v['variant_name'] . ' - '. $v['description'];
            }else{
                $d['label'] = $v['description'];
            }
            array_push($data,$d);
        }

        echo json_encode($data);
    }

    function variant_create(){
        if($_POST){
            if($this->_check_variant_name(v('variant_name'),v('function_name'))){
                $this->load->model('variant_model');
                $vm = new Variant_model();
                $_POST['share_flag'] = v('share_flag');
                $_POST['background_flag'] = v('background_flag');
                $variant_id = $vm->insert(_data('variant_name','description','method','function_id','share_flag','background_flag'));
                if($variant_id){
                    redirect_to('functions','variant_items',array('variant_id'=>$variant_id));
                    message_db_success();
                }else{
                    validation_error();
                }
            }
        }else{
            render();
        }
    }

    function variant_edit(){
        $this->load->model('variant_model');
        $vm = new Variant_model();
        $v = $vm->find(v('id'));
        if(empty($v)){
            show_404();
        }else{
            if($_POST){
                $_POST['share_flag'] = v('share_flag');
                $_POST['background_flag'] = v('background_flag');
                if($vm->update($v['id'],_data('variant_name','description','method','share_flag','background_flag'))){
                    go_back();
                    message_db_success();
                }else{
                    validation_error();
                }
            }else{
                render($v);
            }
        }
    }

    function variant_destroy(){
        $this->load->model('variant_model');
        $vm = new Variant_model();
        $v = $vm->find(v('id'));
        if(empty($v)){
            show_404();
        }else{
            $this->load->model('variant_line_model');
            $vlm = new Variant_line_model();
            $this->db->trans_start();
            $vlm->delete_by(array('variant_id'=>$v['id']));
            $vm->delete($v['id']);
            $this->db->trans_complete();
            if($this->db->trans_status() === FALSE){
                message_db_failure();
            }else{
                message_db_success();
            }
        }
    }

    function variant_items(){
        $this->load->model('variant_model');
        $vm = new Variant_model();
        $v = $vm->find(v('variant_id'));
        if(empty($v)){
            show_404();
        }else{
            $this->load->model('variant_line_model');
            $vlm = new Variant_line_model();
            $data['objects'] = _format($vlm->find_all_by(array('variant_id'=>$v['id'])),true);
            render($data);
        }
    }

    function variant_item_create(){
        $this->load->model('variant_model');
        $vm = new Variant_model();
        $v = $vm->find(v('variant_id'));
        if(empty($v)){
            show_404();
        }else{
            if($_POST){
                $this->load->model('variant_line_model');
                $vlm = new Variant_line_model();
                $_POST['now_flag'] = v('now_flag');
                if($vlm->insert($_POST)){
                    go_back();
                    message_db_success();
                }else{
                    validation_error();
                }
            }else{
                render();
            }
        }
    }

    function variant_item_edit(){
        $this->load->model('variant_line_model');
        $vlm = new Variant_line_model();
        $line = $vlm->find(v('id'));
        if(empty($line)){
            show_404();
        }else{
            if($_POST){
                $_POST['now_flag'] = v('now_flag');
                if($vlm->update($line['id'],$_POST)){
                    go_back();
                    message_db_success();
                }else{
                    validation_error();
                }
            }else{
                render($line);
            }
        }
    }

    function variant_item_destroy(){
        $this->load->model('variant_line_model');
        $vlm = new Variant_line_model();
        $line = $vlm->find(v('id'));
        if(empty($line)){
            show_404();
        }else{
            if($vlm->delete($line['id'])){
                message_db_success();
            }else{
                message_db_failure();
            }
        }
    }

    private function _check_variant_name($variant_name,$function_id){
        $this->load->model('variant_model');
        $vm = new Variant_model();
        $v = $vm->find_by(array('variant_name'=>$variant_name,'function_id'=>$function_id));
        if(empty($v)){
            return true;
        }else{
            add_validation_error('variant_name',label('variant_name').' 已存在');
            return false;
        }
    }
}