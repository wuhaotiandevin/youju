<?php
/**
 * Created by PhpStorm.
 * User: lhl
 * Date: 2019/4/10
 * Time: 17:31
 */

namespace app\api\controller;


class LiveController
{
    public function index()
    {
        $video =new VideoController();

        halt($video->channel_delete("b3c0a15e717f41518ed65b330873a873"));
    }
}