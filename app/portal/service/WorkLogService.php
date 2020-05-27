<?php 
namespace app\portal\service;

use think\Db;
use app\portal\service\CalenDarService;
class WorkLogService{
	private $uid;//用户id
    private $calendar;//日历对象
    private $lastMonth;//上一个月
    private $curMonth; //本月
    private $nextMonth;//下一个月
    private $monthWorkedDays = 0;//当月工作的天数
    private $workLog=null;//当前月的工作日历

    public function __construct($uid=0,$daytime=null){
        $this->uid=$uid;
        $this->calendar=new CalenDarService($daytime);

        $this->lastMonth=$this->calendar->getLastMonth();
        $this->curMonth=$this->calendar->getCurMonth();
        $this->nextMonth=$this->calendar->getNextMonth();

        $this->init();
    }
    public function init(){
        $info=$this->calendar->getCalendar();    
        $userLog=array();
        if($this->uid !=0){
            $lastMonth=explode('-', $this->lastMonth);
            $curMonth=explode('-', $this->curMonth);
            $nextMonth=explode('-', $this->nextMonth);
            //获取上一个月，当前月，下一个月的工作日志，后期使用缓存
            $where='uid='.$this->uid.' AND ((`year`='.$lastMonth[0].' AND `month`='.$lastMonth[1].' ) or (`year`='.$curMonth[0].' AND `month`='.$curMonth[1].' ) or (`year`='.$nextMonth[0].' AND `month`='.$nextMonth[1].' ))';

            $rs= Db::name('kaoqin')->field('year,month,day,status')->where($where)->select();

            foreach ($rs as $value) {
                $userLog[$value['year'].'-'.$value['month'].'-'.$value['day']]=$value['status'];
            }
        }
        $flag=1;
        foreach ($info as $key=>$value) {
            if($flag % 7 ==1 || $flag % 7 ==0){
                $cellbgtype=3;//没有工作
            }else{
                $cellbgtype=1;//没有工作
            }

            if(isset($userLog[$value['id']]) && $userLog[$value['id']] ==1){
                //判断是不是当前月份
                $str=date('Y-n',strtotime($value['id']));
                if($this->curMonth == $str){
                    $this->monthWorkedDays+=1;
                }
                $cellbgtype+=1;
            }

            $cellbgtype='daytype'.$cellbgtype.'_'.$value['info']['type'];

            $info[$key]['info']['class']=$cellbgtype;
            $flag++;
        }
        $this->workLog=$info;
    }

    public function getLastMonth(){
        return $this->lastMonth;
    }
    public function getCurMonth(){
        return $this->curMonth;
    }
    public function getNextMonth(){
        return $this->nextMonth;
    }
    /**
    *当月已经工作的天数
    */
    public function monthWorkedDays(){
        return $this->monthWorkedDays;
    }
    /**
    *当月的天数
    **/
    public function monthDays(){
        return $this->calendar->getCurDaySum();
    }
    /**
    *获取累计工作的天数
    **/
    public function workedDays(){

    }
    /**
    *当前工作日历的月份
    **/
    public function logMonth(){

    }
    /**
    *当月截止到目前可得薪水
    **/
    public function hadSalary(){

    }
    /**
    *预计可得最高薪水
    **/
    public function maxSalary(){

    }
    /**
    *当前的工作日历
    **/
    public function workInfo(){
        return $this->workLog;
    }

    function less_day()
    {
        $month_big = array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
        //现在的月份
        $date_month_old = (int)date('m',time());
        //下个月的月份
        $date_month_new = $date_month_old + 1;
        //下个月1号的时间戳
        $date_time_new = strtotime('1 '.$month_big[$date_month_new-1].' '.date('Y',time()));
        //今天的时间戳
        $date_time_old = strtotime(date('d',time()).' '.$month_big[$date_month_old-1].' '.date('Y',time()));
        //距下月剩余时间
        $time_new = ($date_time_new - $date_time_old)/24/60/60-1;
        return $time_new;
    }
}
?>