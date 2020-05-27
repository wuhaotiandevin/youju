<?php
require_once "./agora/Agora.php";

class Rule extends Agora
{
    /**
     * 创建规则
     *
     * @param string $appid
     * @param array  $optional
     *
     * @return array
     */
    public function create(array $optional)
    {
        $appid = static::$appid;

        return $this->request('POST', '/kicking-rule', array_merge(compact('appid'), $optional));
    }

    /**
     * 获取规则列表
     *
     * @param string $appid
     *
     * @return array
     */
    public function all()
    {
        return $this->request('GET', '/kicking-rule', ['appid'=>static::$appid]);
    }

    /**
     * 更新规则时间
     *
     * @param string $appid
     * @param string $id
     * @param string $time
     *
     * @return array
     */
    public function update($id,$time)
    {
        $appid = static::$appid;
        return $this->request('PUT', '/kicking-rule', compact('appid', 'id', 'time'));
    }

    /**
     * 删除规则
     *
     * @param string $appid
     * @param string $id
     *
     * @return array
     */
    public function delete($id)
    {
        $appid = static::$appid;
        return $this->request('DELETE', '/kicking-rule', compact('appid', 'id'));
    }


}