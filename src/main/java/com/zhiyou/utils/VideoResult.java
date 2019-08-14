package com.zhiyou.utils;

import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 淘淘商城自定义响应结构
 */
public class VideoResult {

    // 响应业务状态
    private Integer status;

    // 响应消息
    private String msg;

    // 响应中的数据
    private Object data;

    public static VideoResult build(Integer status, String msg, Object data) {
        return new VideoResult(status, msg, data);
    }

    public static VideoResult ok(Object data) {
        return new VideoResult(data);
    }

    public static VideoResult ok() {
        return new VideoResult(null);
    }

    public VideoResult() {

    }

    public static VideoResult build(Integer status, String msg) {
        return new VideoResult(status, msg, null);
    }

    public VideoResult(Integer status, String msg, Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public VideoResult(Object data) {
        this.status = 200;
        this.msg = "OK";
        this.data = data;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

}
