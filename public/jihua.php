<?php
$db = new MySQLi("localhost","root","root123456","pw");
!mysqli_connect_error() or die("连接失败");


//执行刷新简历程序
$sql="select * from  cmf_order  WHERE add_time<(unix_timestamp(now())-600) and status =1";  
$result = $db->query($sql);
$attr = $result->fetch_all();
$time = time();
foreach($attr as $v)
{
  $sql = "update cmf_order set status=0 where id=".$v[0];
  $db->query($sql);  
}

//执行刷新简历程序
$sql5="select * from  cmf_order  WHERE pay_time<(unix_timestamp(now())-1800) and status =2";  
$result5 = $db->query($sql5);
$attr5 = $result5->fetch_all();
foreach($attr5 as $v2)
{
  $sql6 = "update cmf_order set status=0 where id=".$v2[0];
  $db->query($sql6);  
  $sql7="update cmf_user_moneyinfo set yue=yue+".$v2[15]." WHERE user_id=".$v2[2]; 
  $db->query($sql7);
  $sql8="insert into cmf_user_moneyrecord(`money`, `user_id`,`style`,`pay_time`,`status`) values('".$v2[15]."','".$v2[2]."','收入','".$time."','1')";
  $db->query($sql8); 
}

$sql1="select * from  cmf_order  WHERE jiesu_time<(unix_timestamp(now())-86400) and status =4";  
$result1 = $db->query($sql1);
$attr1 = $result1->fetch_all();
foreach($attr1 as $v1)
{
	  $sql2 = "update cmf_order set status=5 where id=".$v1[0];
	  $db->query($sql2); 
	  $sql3="update cmf_user_moneyinfo set yue=yue+".$v1[15]." WHERE user_id=".$v1[8]; 
	  $db->query($sql3);
	  $sql4="insert into cmf_user_moneyrecord(`money`, `user_id`,`style`,`pay_time`,`status`) values('".$v1[15]."','".$v1[8]."','收入','".$time."','1')";
	  $db->query($sql4); 
    $sql9="update cmf_user_jineng set shichang=shichang+".$v1[10]." WHERE id=".$v1[9]; 
    $db->query($sql9);
}


$fp = @fopen("test.txt", "a+");
date_default_timezone_set(PRC);
$data = date("Y-m-d H:i:s",time()); 
fwrite($fp , "程序执行时间：".$data. "\r\n");fclose($fp);  
?>