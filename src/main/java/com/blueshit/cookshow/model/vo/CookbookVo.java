package com.blueshit.cookshow.model.vo;


import com.blueshit.cookshow.common.helper.entity.Material;
import com.blueshit.cookshow.common.helper.entity.Step;

import java.util.List;

/**
 * Created by Seven on 2015/12/2.
 */
public class CookbookVo {

    private String          id;
    private String          classificationCode;
    private String          clickNum;
    private String          createDate;
    private String          updateDate;
    private String          deleted;
    private String          favourNum;
    private String          material;
    private String          publicState;
    private String          remind;
    private String          step;
    private String          intro;
    private String          title;
    private String          titleImage;
    private List<Step>      stepList;
    private List<Material>  materialList;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getClassificationCode() {
        return classificationCode;
    }

    public void setClassificationCode(String classificationCode) {
        this.classificationCode = classificationCode;
    }

    public String getClickNum() {
        return clickNum;
    }

    public void setClickNum(String clickNum) {
        this.clickNum = clickNum;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public String getDeleted() {
        return deleted;
    }

    public void setDeleted(String deleted) {
        this.deleted = deleted;
    }

    public String getFavourNum() {
        return favourNum;
    }

    public void setFavourNum(String favourNum) {
        this.favourNum = favourNum;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getPublicState() {
        return publicState;
    }

    public void setPublicState(String publicState) {
        this.publicState = publicState;
    }

    public String getRemind() {
        return remind;
    }

    public void setRemind(String remind) {
        this.remind = remind;
    }

    public String getStep() {
        return step;
    }

    public void setStep(String step) {
        this.step = step;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitleImage() {
        return titleImage;
    }

    public void setTitleImage(String titleImage) {
        this.titleImage = titleImage;
    }

    public List<Step> getStepList() {
        return stepList;
    }

    public void setStepList(List<Step> stepList) {
        this.stepList = stepList;
    }

    public List<Material> getMaterialList() {
        return materialList;
    }

    public void setMaterialList(List<Material> materialList) {
        this.materialList = materialList;
    }
}
