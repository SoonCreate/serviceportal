<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Order extends CI_Controller {

    function __construct(){
        parent::__construct();
        header('Content-Type: text/html; charset=utf-8');
        $this->load->model('order_model');
        $this->load->model('auth_model');
    }

	public function index()
	{
        $order_type = v('order_type');
        $s['value'] = _config('all_values');
        $s['label'] = label('all');
        if($order_type){
            $data['order_type'] = $order_type;
            $this->load->model('status_line_model');
            $sm = new Status_model();
            $data['status'] = $sm->options(default_value('status',$data['order_type']));
            array_unshift($data['status'],$s);
            render($data);
        }else{
            $am = new Auth_model();
            $order_types = $am->can_show_order_types();
            if(count($order_types) > 1){
                $data['objects'] = $order_types;
                render_view('order/choose_type',$data);
            }elseif(count($order_types) == 1){
                $data['order_type'] = $order_types[0];
                $this->load->model('status_line_model');
                $sm = new Status_model();
                $data['status'] = $sm->options(default_value('status',$data['order_type']));
                array_unshift($data['status'],$s);
                render($data);
            }else{
                render_error('您没有权限查看投诉单列表！');
            }
        }

	}

    function order_data(){
        $this->load->model('status_model');
        $this->load->model('order_log_model');
        $om = new Order_model();

        $start = 0;
        $end = 0 ;
//        print_r($where);
        if(isset($_SERVER['HTTP_RANGE'])){
            $idx = stripos($_SERVER['HTTP_RANGE'],'-');
            $start = intval(substr($_SERVER['HTTP_RANGE'],6,$idx-6));
            $end = intval(substr($_SERVER['HTTP_RANGE'],$idx+1));
        }

        $title = $this->input->get('title');
        $status = $this->input->get('status');
        //所有状态
        if($status == _config('all_values')){
            $status = null;
        }
        $output = $om->find_my_orders(v('order_type'),$title,$status,$end,$start);

        if(isset($_SERVER['HTTP_RANGE'])){
//                    header('Content-Range:'.$_SERVER['HTTP_RANGE'].'/'.round($totalCnt/($end+1)));
            header('Content-Range:'.$_SERVER['HTTP_RANGE'].'/'.$output['cnt']);
            $output = $output['data']['items'];
        }
        echo json_encode($output);
    }

    //投诉单结构
    function order_structure(){
        $om = new Order_model();
        echo json_encode($om->grid_structure());
    }

    //在创建之前做选择
    function choose_create(){
        $a = new Auth_model();
        //能够创建的订单列表
        $rows = $a->can_create_order_types();
        if(empty($rows)){
            //不能创建任何投诉订单，提示账号未被授权
            render_error('不能创建任何投诉订单，账号未被授权') ;
        }elseif(count($rows) > 1){
            $data['objects'] = $rows;
            //同时拥有几种订单的创建权限，显示选择页
            render_view('order/choose_create',$data);

        }else{
            //一种时，直接跳转
//            redirect(_url('order','create',array('type'=>$rows[0])));
            $_GET['order_type'] = $rows[0];
            $this->create();
        }

    }

    function create(){
        $om = new Order_model();
        $order_type = v('order_type');
        if($_POST){
            //非分类管理，默认分类设置时可默认
            if(!_config('category_control')){
                $c = $om->default_category($order_type);
                if(!is_null($c)){
                    $_POST['category'] = $c['value'];
                }
            }
            $_POST['status'] = $om->default_status($order_type);
            //验证提交
            //权限
            if(check_order_auth($order_type,v('status'),v('category'))){
                $data = _data('order_type','category','severity','frequency',
                    'title','contact','phone_number','mobile_telephone','address','full_name','status');
                $content = r(v('content'));
                $addfiles = tpost('addfiles');
                $order_id = $om->save($data,$content,$addfiles);
                if($order_id){
                    $this->load->model('status_model');
                    $sm = new Status_model();
                    $order = $om->find($order_id);
                    $s = $sm->validate_next($order['id'],default_value('status',$order['order_type']),$order['status']);
                    //如果同时拥有提交和确认权限，则自动确认
                    if($s){
                        if($s == 'confirmed'){
                            //由于confirm是定制
                            $om->confirm($order);
                        }else{
                            $d['status'] = $s;
                            if($om->do_update($order['id'],$d)){
                                message_db_success();
                            }else{
                                message_db_failure();
                            }
                        }
                    }else{
                        message_db_success();
                    }
                    redirect_to('order','show',array('id'=>$order_id));
                }else{
                    validation_error();
                }
            }else{
                message_unknown_error();
            }
        }else{
            //获取订单类型，如果没有则跳转到chose_create
            if(!$order_type){
                $this->choose_create();
            }else{
                $this->db->distinct();
                $this->db->select('contact,mobile_telephone,full_name,address,phone_number ');
                $om->order_by('creation_date','DESC');
                $os = $om->find_all_by(array('created_by'=>_sess('uid'),'order_type'=>$order_type));
                if(!empty($os)){
                    $data['contact_data'] = json_encode($os);
                }

                if(_config('category_control')){
                    $au = new Auth_model();
                    $data['categories'] = $au->can_choose_order_categories($order_type,$om->default_status($order_type));
                }
                $data['order_type'] = $order_type;

                //获取当前用户信息填充字段
                $this->load->model('user_model');
                $um = new User_model();
                $user = $um->find(_sess('uid'));
                $data['contact'] = $user['contact'];
                $data['mobile_telephone'] = $user['mobile_telephone'];
                $data['phone_number'] = $user['phone_number'];
                $data['full_name'] = $user['full_name'];
                $data['address'] = $user['address'];
                render_view('order/create',$data);
            }
        }

    }

    function show(){
        $id = p('id');
        $om = new Order_model();
        $order = $om->find($id);
        //id是否有效
        if(!empty($order)){
            //是否只能看到自己的订单
            $am = new Auth_model();
            $pass = true;
            if($am->check_auth('only_mine_control',array('ao_true_or_false'=>'TRUE')) ){
                if($order['created_by'] == _sess('uid') || $order['leader_id'] == _sess('uid') || $order['manager_id'] == _sess('uid')){
                    $pass = true;
                }else{
                    $pass = false;
                }
            }
            //检验通过
            if($pass){
                $this->load->model('status_model');
                $this->load->model('order_addfile_model');
                $this->load->model('order_content_model');
                $ocm = new Order_content_model();
                $oam = new Order_addfile_model();
                $sm = new Status_model();
                $ocm->order_by('creation_date');
                $order['contents'] = _format($ocm->find_all_by(array('order_id'=>$id)));
                $oam->order_by('creation_date');
                $order['addfiles'] = $oam->find_all_by_view(array('order_id'=>$id));
                $order['status_desc'] = $sm->get_label(default_value('status',$order['order_type']),$order['status']);
                render(_format_row($order));
            }
        }else{
            show_404();
        }
    }

    function log_data(){
        $om = new Order_model();
        $rows = _format($om->logs(v('id')),check_auth('log_display_fullname',array('ao_true_or_false'=>'TRUE')));
        $data["identifier"] = 'id';
        $data["label"] = 'log_type';
        $data['items'] = $rows;
        $data['structure'] = array();
        array_push($data['structure'],_structure('description',label('log_type'),'120px'));
        array_push($data['structure'],_structure('content',null,'300px'));
        array_push($data['structure'],_structure('reason',null,'240px'));
        if(check_auth('log_display_fullname',array('ao_true_or_false'=>'TRUE'))) {
            array_push($data['structure'], _structure('created_by', label('operator'), '120px'));
        }
        array_push($data['structure'],_structure('creation_date',label('operation_time'),'140px'));
        echo json_encode($data);
    }

    //如果日志类型需要原因，此页面用于补充
    function change_reason(){
        $this->load->model('order_log_model');
        $olm = new Order_log_model();
        $change_hash = v('change_hash');
        $l = $olm->find_by(array('change_hash'=>$change_hash));
        if(empty($l)){
            show_404();
        }else{
            if($_POST){
                $reason = v('reason');
                if($olm->update_by(array('change_hash'=>$change_hash),array('reason'=>$reason))){
                    message_db_success();
                }else{
//                    message_db_failure();
                    validation_error();
                }
            }else{
                $this->load->view('order/change_reason');
            }
        }
    }

    function confirm(){
        $om = new Order_model();
        $order = $om->find(v('id'));
        if(empty($order)){
            show_404();
        }else{
            $om->confirm($order);
        }
    }

    function upload_file(){
        $om = new Order_model();
        $order = $om->find(v('id'));
        if(empty($order)){
            show_404();
        }else{
            if($_FILES && $_POST){
                $this->load->library('upload', load_upload_config());
                if ( ! $this->upload->do_upload())
                {
                    foreach($this->upload->error_msg as $msg){
                        custz_message('E',$msg);
                    }
                }
                else
                {
                    $this->load->model('file_model');
                    $this->load->model('order_addfile_model');
                    $fm = new File_model();
                    $oam = new Order_addfile_model();
                    $this->db->trans_start();
                    $data['file_id'] = $fm->insert($this->upload->data());
                    $data['order_id'] = $order['id'];
                    $data['description'] = v('description');
                    $oam->insert($data);
                    $this->db->trans_complete();
                    if($this->db->trans_status() === TRUE){
                        custz_message('I','文件上传成功');
                    }else{
                        custz_message('E','文件上传失败');
                    }
                }
                echo '<html><body><textarea>'.json_encode(_sess('output')).'</textarea></body></html>';
                unset_sess('output');
            }else{
                $this->load->view('upload_file');
            }
        }

    }

    //选择责任人（部门经理）
    function choose_leader(){
        $om = new Order_model();
        $order = $om->find(v('id'));
        if(empty($order)){
            show_404();
        }else{
            if($_POST){
                $data['leader_id'] = v('leader_id');
                if($om->do_update($order['id'],$data)){
                    go_back();
                    message_db_success();
                }else{
                    message_db_failure();
                }
            }else{
                $am = new Auth_model();
                $ids = $am->can_choose_leaders($order);
                if(empty($ids)){
                    render_error('无对应的负责人');
                }else{
                    $order['leaders'] = array();
                    foreach($ids as $id){
                        $d['value'] = $id;
                        //可以做进一步的优化，比如根据责任人的繁忙程度排序，显示现在空闲的责任人等

                        $d['label'] = full_name($id);
                        array_push($order['leaders'],$d);
                    }
                    render($order);
                }
            }

        }
    }

    //分配任务，指定处理人
    function dispatcher(){
        $om = new Order_model();
        $order = $om->find(v('id'));
        if(empty($order)){
            show_404();
        }else{
            if($_POST){
                //重新分配的情况
                if($order['status'] == 'allocated'){
                    if($om->do_update($order['id'],_data('manager_id'))){
                        message_db_success();
                    }else{
                        message_db_failure();
                    }
                }else{
                    $_POST['status'] = 'allocated';
                    $data = _data('manager_id','status');
                    $om->do_next($order,$data);
                }
            }else{
                $am = new Auth_model();
                $ids = $am->can_choose_managers($order);
                if(empty($ids)){
                    render_error('无对应的责任人');
                }else{
                    $order['managers'] = array();
                    foreach($ids as $id){
                        $d['value'] = $id;
                        //可以做进一步的优化，比如根据责任人的繁忙程度排序，显示现在空闲的责任人等

                        $d['label'] = full_name($id);
                        array_push($order['managers'],$d);
                    }
                    render($order);
                }
            }

        }


    }

    function pcd_change(){
        $om = new Order_model();
        $order = $om->find(v('id'));
        if(empty($order)){
            show_404();
        }else{
            if($order['pcd_change_times'] - 1  < _config('pcd_change_times') ){
                if($_POST){

                    $_POST['plan_complete_date'] = strtotime($_POST['plan_complete_date']);
                    if($_POST['plan_complete_date'] < time()){
                        add_validation_error('plan_complete_date','不能选择在过去的时间');
                    }else{
                        $data = _data('plan_complete_date');
                        //如果为相同则不计算次数
                        if($data['plan_complete_date'] == $order['plan_complete_date']){
                            go_back();
                            message_db_success();
                        }else{
                            $data['pcd_change_times'] = $order['pcd_change_times'] + 1;
                            if($om->do_update($order['id'],$data,true)){
                                go_back();
                                message_db_success();
                            }else{
                                message_db_failure();
                            }
                        }
                    }

                }else{
                    if(is_null($order['plan_complete_date']) || !$order['plan_complete_date']){
                        //默认为下班时间，如果超出则默认明天的下班时间
                        $default_d = default_end_date();
                        if($default_d < time()){
                            $order['plan_complete_date'] = default_end_date('+1 day');
                        }else{
                            $order['plan_complete_date'] = $default_d;
                        }
                    }else{
                        $order['plan_complete_date'] = date('Y-m-d H:i:s',$order['plan_complete_date']);
                    }
                    render($order);
                }
            }else{
                render_error('无法继续修改计划完成日期，已超出允许修改次数！');
            }
        }

    }

    //已解决
    function done(){
        $om = new Order_model();
        $order = $om->find(v('id'));
        if(empty($order)){
            show_404();
        }else{
            $om->do_next($order,'done');
        }
    }

    function reply(){
        $om = new Order_model();
        $id = v('id');
        $order = $om->find($id);
        if(empty($order)){
            show_404();
        }else{
            if($_POST){
                $this->load->model('order_content_model');
                $ocm = new Order_content_model();
                $data['content'] = r(v('content'));
                $data['order_id'] = $id;
                $content_id = $ocm->insert($data);
                if($content_id){
                    message_db_success();
                    $r = _format_row($ocm->find($content_id));
                    $r['created_by'] = full_name($r['created_by']);
                    data('content',$r);
                    //回复之后发送消息到相关人员



                }else{
                    validation_error();
                }
            }else{
                shoe_404();
            }

        }
    }

    //关闭
    function close(){
        $this->load->model('notice_model');
        $om = new Order_model();
        $id = v('id');
        $order = $om->find($id);
        if(empty($order)){
            show_404();
        }else{
            $om->do_next($order,'closed');
        }
    }

    //问题重新开启
    function reopen(){
        $om = new Order_model();
        $id = v('id');
        $order = $om->find($id);
        if(empty($order)){
            show_404();
        }else{
            if(_config('allow_reopen') ){
                $om->do_next($order,'reopen');
            }else{
                render_error('不允许重新打开投诉单！');
            }
        }
    }

    //责任人资料
    function manager_info(){
        //符合当前订单处理权限的责任人列表
        //责任人姓名、联系方式、当前待处理订单数量
    }

    function change_content(){
        //提交后5分钟内可以修改自己刚提交的内容，提高用户体验
    }

    //用户反馈
    function feedback(){
        if(_config('feedback_control')){
            $om = new Order_model();
            $order = $om->find(v('id'));
            if(empty($order)){
                show_404();
            }else{
                $this->load->model('feedback_model');
                $this->load->model('feedback_star_model');
                $this->load->model('valuelist_line_model');
                $ofm = new Feedback_model();
                $fsm = new Feedback_star_model();
                $vlm = new Valuelist_line_model();
                if($order['created_by'] == _sess('uid')){
                    if(is_order_locked($order['status'])){
                        if($_POST){
                            if(v('feedback_id')){
                                //修改
                                $line = $ofm->find(v('feedback_id'));
                                if(empty($line)){
                                    message_db_failure();
                                }else{
                                    $this->db->trans_start();
                                    $feedback['content'] = v('content_plus');
                                    $stars = $fsm->find_all_by(array('feedback_id'=>$line['id']));
                                    $ofm->update($line['id'],$feedback);
                                    foreach($stars as $star){
                                        $s['stars'] = v('star_'.$star['feedback_type']);
                                        $fsm->update($star['id'],$s);
                                    }
                                    $this->db->trans_complete();
                                    if($this->db->trans_status() === TRUE){
                                        go_back();
                                        message_db_success();
                                    }else{
                                        message_db_failure();
                                    }
                                }

                            }else{
                                //判断是否存在
                                $line = $ofm->find_by(array('order_id'=>v('id')));
                                $total_starts = _config('feedback_star');
                                if(empty($line)){
                                    //创建
                                    $vlm->order_by('sort');
                                    $stars = $vlm->find_all_by_view(array('valuelist_name'=>'vl_feedback','inactive_flag'=>0));
                                    $this->db->trans_start();
                                    $feedback['order_id'] = v('id');
                                    $feedback['content'] = v('content_plus');
                                    $feedback_id = $ofm->insert($feedback);
                                    foreach($stars as $star){
                                        $s['feedback_id'] = $feedback_id;
                                        $s['feedback_type'] = $star['segment_value'];
                                        $s['feedback_desc'] = $star['segment_desc'];
                                        $s['total_stars'] = $total_starts;
                                        $s['stars'] = v('star_'.$star['segment_value']);
                                        $fsm->insert($s);
                                    }
                                    $this->db->trans_complete();
                                    if($this->db->trans_status() === TRUE){
                                        go_back();
                                        message_db_success();
                                    }else{
                                        message_db_failure();
                                    }
                                }else{
                                    custz_message('E','订单已反馈请勿重复提交！');
                                }


                            }
                        }else{
                            $o = $ofm->find_by(array('order_id'=>$order['id']));
                            if(empty($o)){
                                $vlm->order_by('sort');
                                $data['stars'] = $vlm->find_all_by_view(array('valuelist_name'=>'vl_feedback','inactive_flag'=>0));
                                for($i=0;$i<count($data['stars']);$i++){
                                    $data['stars'][$i]['value'] = _config('feedback_star');
                                }
                                render_view('order/feedback_create',$data);
                            }else{
                                $o['stars'] = $fsm->find_all_by(array('feedback_id'=>$o['id']));
                                $o['content_plus'] = $o['content'];
                                render_view('order/feedback_edit',$o);
                            }
                        }
                    }else{
                        show_404();
                    }
                }else{
                    $o = $ofm->find_by(array('order_id'=>$order['id']));
                    if(!empty($o)){
                        $o['stars'] = $fsm->find_all_by(array('feedback_id'=>$o['id']));
                        render_view('order/feedback_show',$o);
                    }else{
                        render_view('order/feedback_show');
                    }

                }
            }
        }else{
            render_error('必须先开启反馈功能！请联系系统管理员！') ;
        }

    }

    //自动反馈
    function auto_feedback_job(){
        //判断是否开启反馈功能
        $feedback_control = _config('feedback_control');
        $auto_feedback = _config('auto_feedback');
        $feedback_star = _config('feedback_star');
        if($feedback_control && $auto_feedback && $feedback_star){
            $this->load->model('feedback_model');
            $this->load->model('feedback_star_model');
            $this->load->model('valuelist_line_model');
            $this->load->model('order_log_model');
            $ofm = new Feedback_model();
            $fsm = new Feedback_star_model();
            $vlm = new Valuelist_line_model();
            $olm = new Order_log_model();
            $this->db->trans_start();
            //确定范围
            $this->db->where('feedback_id is null');
            $orders = $this->db->get_where('feedback_orders_v',array('status'=>'closed'))->result_array();
            //创建
            $vlm->order_by('sort');
            $stars = $vlm->find_all_by_view(array('valuelist_name'=>'vl_feedback','inactive_flag'=>0));
            foreach($orders as $order){
                //获取最后关闭时间
                $olm->order_by('last_update_date','desc');
                $log = $olm->find_by(array('order_id'=>$order['id'],'log_type'=>'order_status','new_value'=>'closed'));
                if(!empty($log)){
                    $period = (time() - $log['last_update_date'])/3600;
                    //超出时间则运行
                    if($period >= $auto_feedback){
                        $feedback['order_id'] = $order['id'];
                        $feedback_id = $ofm->insert($feedback);

                        foreach($stars as $star){
                            $s['feedback_id'] = $feedback_id;
                            $s['feedback_type'] = $star['segment_value'];
                            $s['feedback_desc'] = $star['segment_desc'];
                            $s['stars'] = $feedback_star;
                            $s['total_stars'] = $feedback_star;
                            $fsm->insert($s);
                        }
                    }
                }
            }
            $this->db->trans_complete();
            if($this->db->trans_status() === TRUE){
                message_db_success();
            }else{
                message_db_failure();
            }

        }
    }

    //发送报警信息
    function send_alarm_message_job(){

    }

    //定期清理垃圾上传文件
    function clear_upload_files_job(){

    }

}