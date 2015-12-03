package com.blueshit.cookshow.model.enums;

/**
 * Created by Seven on 2015/12/3.
 */
public enum FavourEnum {

    COOKBOOK(0),MENU(1);

    private int code;

    FavourEnum(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
