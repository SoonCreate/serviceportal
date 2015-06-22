<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Report extends CI_Controller {

    //提供给客户，优化后的界面，并非高级配置

    function __construct(){
        parent::__construct();
        header('Content-Type: text/html; charset=utf-8');
    }

    //状态统计
    function status_statistics(){
        render();
    }

    function status_statistics_data(){
        $this->load->model('order_model');
        $this->load->model('status_model');
        $om = new Order_model();
        $sm = new Status_model();
        $order_type = v('order_type');
        if(!$order_type){
            $ts = get_options('vl_order_type');
            $order_type = $ts[0]['value'];
        }
        $this->db->select('status,count(id) as status_count');
        $this->db->group_by('status');
        $rs = $om->find_all_by(array('order_type'=>$order_type));
        $all_count = $om->count_by(array('order_type'=>$order_type));
        for($i=0;$i<count($rs);$i++){
            $rs[$i]['percent'] = round($rs[$i]['status_count'] * 100 / $all_count,2) . '%' ;
            $rs[$i]['text'] = $sm->get_label(default_value('status',$order_type),$rs[$i]['status']);
        }
        $data["items"] = $rs;
        $data["identifier"] = 'status';
        $data["label"] = 'text';
        $data["structure"] = build_structure('text','status_count','percent');
        $data["detail_structure"] = $om->grid_structure();
        echo json_encode($data);
    }

    //处理时间统计
    function time_statistics(){
        $data['time_span'] = 1;
        render($data);
    }

    //耗时分析
    function time_statistics_data(){
        if($_POST){
            $data = $this->_time_data();
            if(!is_null($data)){
                echo json_encode($data);
            }

        }else{
            //默认为结构和空数据
            $data["structure"] = build_structure('id','title','status','leader','manager','creation_date','release_to_confirm',
                'confirm_to_allocate','allocate_to_done','done_to_close','total_time');
            $data["items"] = array();
            $data["identifier"] = 'id';
            echo json_encode($data);
        }
    }

    //验证表单
    function time_statistics_validate(){
        validate_required('from_date','to_date');
    }

    function time_statistics_export(){
        if($_POST){
            $data = $this->_time_data();
            if(!is_null($data)){

                $fields = array('id','title','status','leader','manager','creation_date','release_to_confirm',
                    'confirm_to_allocate','allocate_to_done','done_to_close','total_time');

                export_to_excel($data['items'],'time_statistics_export_'.date('ymd'),$fields);
            }

        }else{
            show_404();
        }
    }

    //效率分析
    function efficiency_statistics(){
        //评为效率差的订单，规定各个阶段的报警时长
    }

    //单个用户的处理情况
    function user_statistics(){
        //平均用时
    }

    private function _time_data(){
        $data = null;
//        if(validate_required('from_date','from_time','to_date','to_time')){
        if(validate_required('from_date','to_date')){
            //格式化提交的日期
//            $start_date = strtotime(str_replace('T',' ',$_POST['from_date'] . $_POST['from_time']));
//            $end_date = strtotime(str_replace('T',' ',$_POST['to_date'] . $_POST['to_time']));
            $start_date = strtotime(v('from_date'));
            $end_date = strtotime(v('to_date'));
            if($start_date >= $end_date ){
                add_validation_error('from_date','开始日期大于结束日期！') ;
            }else{
                $this->load->model('order_model');
                $this->load->model('order_log_model');
                $this->load->model('status_model');
                $om = new Order_model();
                $olm = new Order_log_model();
                $sm = new Status_model();
                //输出数据
                $order_type = v('order_type');

                $this->db->where('creation_date >= ',$start_date);
                $this->db->where('creation_date <= ',$end_date);
                $this->db->where('order_type',$order_type);
                $orders = $om->find_all();
                $sort = array();
                $total_count = count($orders);
                for($i=0;$i<$total_count;$i++){
                    //为了排除重复项
                    $olm->order_by('creation_date');
                    $logs = $olm->find_all_by(array('order_id'=>$orders[$i]['id'],'log_type'=>'order_status'));
                    $total_time = 0;
                    $release_to_confirm = 0;
                    $confirm_to_allocate = 0;
                    $allocate_to_done = 0;
                    $done_to_close = 0;
                    $release_time = $orders[$i]['creation_date'];
                    $confirm_time = time();
                    $allocate_time = time();
                    $done_time = time();
                    $close_time = time();
                    if(empty($logs)){
                        //一直未被处理
                        $total_time = time() - $release_time;
                    }else{
                        foreach($logs as $log){
                            //排除重复操作
                            if($release_to_confirm == 0 || $confirm_to_allocate == 0 || $allocate_to_done == 0 || $done_to_close == 0){
                                if($log['old_value'] == 'released' && $log['new_value'] == 'confirmed'){
                                    $confirm_time = $log['creation_date'];
                                    $release_to_confirm = $confirm_time - $release_time;
                                }
                                if($log['old_value'] == 'confirmed' && $log['new_value'] == 'allocated'){
                                    $allocate_time = $log['creation_date'];
                                    $confirm_to_allocate = $allocate_time - $confirm_time;
                                }
                                if($log['old_value'] == 'allocated' && $log['new_value'] == 'done'){
                                    $done_time = $log['creation_date'];
                                    $allocate_to_done = $done_time - $allocate_time;
                                }
                                if($log['old_value'] == 'done' && $log['new_value'] == 'closed'){
                                    $close_time = $log['creation_date'];
                                    $done_to_close = $close_time - $done_time;
                                }
                                $total_time = $close_time - $release_time;
                            }
                        }
                    }
                    $orders[$i]['release_to_confirm'] = round($release_to_confirm/3600/24);
                    $orders[$i]['confirm_to_allocate'] = round($confirm_to_allocate/3600/24);
                    $orders[$i]['allocate_to_done'] = round($allocate_to_done/3600/24);
                    $orders[$i]['done_to_close'] = round($done_to_close/3600/24);
                    $orders[$i]['total_time'] = round($total_time/3600/24);
                    //排序用
                    $sort[] = $orders[$i]['total_time'];

                    $orders[$i]['status'] = $sm->get_label(default_value('status',$order_type),$orders[$i]['status']);
                    $orders[$i]['manager'] = full_name($orders[$i]['manager_id']);
                    $orders[$i]['leader'] = full_name($orders[$i]['leader_id']);
                    $orders[$i]['creation_date'] = date('Y-m-d H:i:s',$orders[$i]['creation_date']);
                    $orders[$i]['confirm_date'] = date('Y-m-d H:i:s',$confirm_time);
                    $orders[$i]['allocate_date'] = date('Y-m-d H:i:s',$allocate_time);
                    $orders[$i]['done_date'] = date('Y-m-d H:i:s',$done_time);
                    $orders[$i]['close_date'] = date('Y-m-d H:i:s',$close_time);

                }
                array_multisort($sort,SORT_DESC,$orders);
                $data["identifier"] = 'id';
                $data["label"] = 'title';
                $data['items'] = $orders;
            }
        }
        return $data;
    }

}