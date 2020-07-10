<?php
/**
 * Created by PhpStorm.
 * User: lhl
 * Date: 2019/4/10
 * Time: 17:31
 */

namespace app\api\controller;


class VideoController
{
    private $Nonce;
    private $CurTime;
    private $CheckSum;
    const HEX_DIGITS = "0123456789abcdef";
    public function __construct()
    {
        $this->AppKey = 'd55bb51eadd3f63c82047e002c6909d6';
        $this->AppSecret = '6c3572d95b18';
    }

    /**生成验证码**/
    public function checkSumBuilder()
    {
        //此部分生成随机字符串
        $hex_digits = self::HEX_DIGITS;
        $this->Nonce;
        for ($i = 0; $i < 128; $i++) {
//随机字符串最大128个字符，也可以小于该数
            $this->Nonce .= $hex_digits[rand(0, 15)];
        }
        $this->CurTime = (string)(time());//当前时间戳，以秒为单位
        $join_string = $this->AppSecret . $this->Nonce . $this->CurTime;
        $this->CheckSum = sha1($join_string);
    }

    /*****file_get_contents()post请求******/
    public function postDataCurl($url = 'https://vcloud.163.com/app/channellist', $data = array())
    {
        $this->checkSumBuilder();//发送请求前需先生成checkSum

        if (!empty($data)) {
            $data = json_encode($data);
        } else {
            $data = "";
        }

        $options = array(
            'http' => array(
                'method' => 'POST',
                'header' => "Content-Type: application/json;charset=utf-8\r\n" . "AppKey:" . $this->AppKey . "\r\n" . "Nonce:" . $this->Nonce . "\r\n" .
                    "CurTime:" . $this->CurTime . "\r\n" . "CheckSum:" . $this->CheckSum . "",
                'content' => $data,
                'timeout' => 500,
            )
        );
        $context = stream_context_create($options);

        $result = file_get_contents($url, false, $context);

        return json_decode($result, true);
    }


    /***创建频道***/
    public function channel_add($name, $type = 0)
    {
        $url = "https://vcloud.163.com/app/channel/create";
        $data = $this->postDataCurl($url, array("name" => $name, "type" => $type));
//        var_dump($data);
        return json($data);
    }


    /****修改频道*****/
    public function channel_update($name, $cid, $type = 0)
    {
        $url = "https://vcloud.163.com/app/channel/update";
        return $data = $this->postDataCurl($url, array("name" => $name, "cid" => $cid, "type" => $type));
    }


    /****删除频道******/
    public function channel_delete($cid)
    {
        $url = "https://vcloud.163.com/app/channel/delete";
        return $data = $this->postDataCurl($url, array("cid" => $cid));
    }


    /****获取频道状态******/
    public function channel_get($cid)
    {
        $url = "https://vcloud.163.com/app/channelstats";
        return $data = $this->postDataCurl($url, array("cid" => $cid));
    }


    /***
     *     获取频道列表
     *     records int 单页记录数，默认值为10    否
     *     pnum    int 要取第几页，默认值为1 否
     *     ofield  String  排序的域，支持的排序域为：ctime（默认）  否
     *     sort    int 升序还是降序，1升序，0降序，默认为desc  否
     *     **/
    public function channel_list($option = array("records" => 10, "pnum" => 1, "ofield" => "ctime", "sort" => 1))
    {
        $url = "https://vcloud.163.com/app/channellist";
        return $data = $this->postDataCurl($url, $option);
    }


    /**重新获取推流地址***/
    public function channel_reset($cid)
    {
        $url = "https://vcloud.163.com/app/address";
        return $data = $this->postDataCurl($url, array("cid" => $cid));
    }


    /*****
     *     设置频道为录制状态
     *     cid String  频道ID    是
     *     needRecord  int 1-开启录制； 0-关闭录制  是
     *     format  int 1-flv； 0-mp4    是
     *     duration    int 录制切片时长(分钟)，默认120分钟  否
     *     filename    String  录制后文件名，格式为filename_YYYYMMDD-HHmmssYYYYMMDD-HHmmss,
     *     文件名录制起始时间（年月日时分秒) -录制结束时间（年月日时分秒)   否
     *     ****/
    public function channel_setRecord($cid, $option = array())
    {
        $url = "https://vcloud.163.com/app/channel/setAlwaysRecord";
        return $data = $this->postDataCurl($url, $option);
    }


    /****禁用频道*****/
    public function channel_pause($cid)
    {
        $url = "https://vcloud.163.com/app/channel/pause";
        return $data = $this->postDataCurl($url, array("cid" => $cid));
    }


    /****批量禁用频道****/
    public function channel_pauselist($cidList)
    {
        $url = "https://vcloud.163.com/app/channellist/pause";
        return $data = $this->postDataCurl($url, array("cidList" => $cidList));
    }

    /****恢复频道*****/
    public function channel_resume($cid)
    {
        $url = "https://vcloud.163.com/app/channel/resume";
        return $data = $this->postDataCurl($url, array("cid" => $cid));
    }


    /****批量恢复频道****/
    public function channel_resumelist($cidList)
    {
        $url = "https://vcloud.163.com/app/channellist/resume";
        return $data = $this->postDataCurl($url, array("cidList" => $cidList));
    }


    /****获取录制视频文件列表*****/
    public function channel_videolist($cid)
    {
        $url = "https://vcloud.163.com/app/videolist";
        return $data = $this->postDataCurl($url, array("cid" => $cid));
    }

    /****获取某一时间范围的录制视频文件列表*****/
    public function app_vodvideolist($cid, $beginTime, $endTime)
    {
        $url = "https://vcloud.163.com/app/vodvideolist";
        return $data = $this->postDataCurl($url, array("cid" => $cid, "beginTime" => $beginTime,                "endTime" => $endTime));
    }


    /****设置视频录制回调地址*****/
    public function record_setcallback($recordClk)
    {
        $url = "https://vcloud.163.com/app/record/setcallback";
        return $data = $this->postDataCurl($url, array("recordClk" => $recordClk));
    }


    /****设置回调的加签秘钥*****/
    public function callback_setSignKey($signKey)
    {
        $url = "https://vcloud.163.com/app/callback/setSignKey";
        return $data = $this->postDataCurl($url, array("signKey" => $signKey));
    }
    /****录制文件合并*****/
    public function video_merge($outputName, $vidList)
    {
        $url = "https://vcloud.163.com/app/video/merge";
        return $data = $this->postDataCurl($url, array("outputName" => $outputName, "vidList" => $vidList));
    }
}