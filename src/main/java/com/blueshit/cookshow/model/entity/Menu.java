package com.blueshit.cookshow.model.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.Set;


/**
 * The persistent class for the t_menu database table.
 * 
 */
@Entity
@Table(name="t_menu")
public class Menu implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;

    private String name;

    @Column(columnDefinition = "TEXT")
    private String title;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate;

	private int deleted;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updateDate;

	//bi-directional many-to-one association to User
	@ManyToOne
	private User User;

    @ManyToMany(mappedBy = "menus")
    private Set<Cookbook> cookbooks;

	public Menu() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Set<Cookbook> getCookbooks() {
        return cookbooks;
    }

    public void setCookbooks(Set<Cookbook> cookbooks) {
        this.cookbooks = cookbooks;
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

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public User getUser() {
		return this.User;
	}

	public void setUser(User User) {
		this.User = User;
	}

}