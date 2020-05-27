<?php
require_once "./agora/Client.php";

class Agora
{
    protected static $ins;
    protected static $appid;
    protected static $secret;
    protected static $API_DOMAIN = 'https://api.agora.io/dev/v1';
    protected $client;

    public function __construct()
    {
        static::$appid  = '347306e49245484598ff96b3f641188b';//获取Agora配置 appid
        //static::$secret = '';//获取Agora配置 secret
        $this->client   = new Client(['userpwd'=>static::$appid.':'.static::$secret]);
    }

    private function __clone(){}

    /**
     * 单例
     */
    public static function getIns()
    {
        $class = get_called_class();
        if (!isset(static::$ins[$class])) {
            if (class_exists($class)) {
                static::$ins[$class] = new $class();
            }
        }

        return static::$ins[$class];
    }

    /**
     * 发送请求
     * @param string $method
     * @param string $uri
     * @param array  $params
     *
     * @return array
     */
    public function request($method,$uri,$params = [])
    {

        $url = static::$API_DOMAIN.$uri;


        switch ($method) {
            case 'GET':
                $res = $this->client->get($url,$params);
                break;
            case 'POST':
                $res = $this->client->post($url,$params);
                break;
            case 'DELETE':
                $res = $this->client->delete($url,$params);
                break;
            default:
                $res = $this->client->put($url,$params);
                break;
        }
        return json_decode($res, true);
    }
}