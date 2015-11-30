package com.blueshit.cookshow.model.vo;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Seven on 2015/11/29.
 */
public class ClassificationVo {

    private Long id;

    private String code;

    private Date createDate;

    private int deleted;

    private String parentCode;

    private Date updateDate;

    private String name;

    private List<ClassificationVo> list = new ArrayList<ClassificationVo>();


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    public String getParentCode() {
        return parentCode;
    }

    public void setParentCode(String parentCode) {
        this.parentCode = parentCode;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public List<ClassificationVo> getList() {
        return list;
    }

    public void setList(List<ClassificationVo> list) {
        this.list = list;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
