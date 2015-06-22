<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Valuelist_line_model extends MY_Model{

    function __construct(){
        parent::__construct();
        $this->_validate_for_insert();
        //设置钩子
        array_unshift($this->before_update,'before_update');
    }

    function before_update($data){
        $this->clear_validate();
        $this->_validate();
        return $data;
    }

    private  function _validate_for_insert(){
        $this->clear_validate();
        //服务端插入数据库之前验证
        $this->add_validate('segment','required|max_length[20]|numeric');
        $this->add_validate('valuelist_id','required|numeric');
        $this->_validate();
    }

    //公用验证
    function _validate(){
        //服务端插入数据库之前验证
        $this->add_validate('segment_value','required|max_length[255]|alpha_dash');
        $this->add_validate('segment_desc','required|max_length[255]');
        $this->add_validate('sort','required|numeric');
    }
}