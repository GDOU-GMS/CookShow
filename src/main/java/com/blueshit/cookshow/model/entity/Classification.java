package com.blueshit.cookshow.model.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the t_classification database table.
 * 
 */
@Entity
@Table(name="t_classification")
public class Classification implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;

	private String code;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate;

	private int deleted;

	@Column(name="parent_code")
	private String parentCode;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updateDate;

    private String name;

	public Classification() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getDeleted() {
		return this.deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

	public String getParentCode() {
		return this.parentCode;
	}

	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}