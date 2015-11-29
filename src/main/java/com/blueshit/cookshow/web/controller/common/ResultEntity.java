package com.blueshit.cookshow.web.controller.common;

import com.fasterxml.jackson.annotation.JsonInclude;

/**
 * Created by Seven on 2015/11/27.
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ResultEntity {

    private int result = 0; //0失败1成功-1异常

    private String msg = "FAILURE"; //返回信息

    private Object Data;//封装数据

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return Data;
    }

    public void setData(Object data) {
        Data = data;
    }

    public void setFailureMsg(String msg){
        this.result = 0;
        this.msg = msg;
    }

    public void setSuccessMsg(String msg){
        this.result = 1;
        this.msg = msg;
    }

    public void setExceptionMsg(String msg){
        this.result = -1;
        this.msg = msg;
    }

    public void setSuccessResult(){
        this.msg = "SUCCESS";
        this.result = 1;
    }


}
