package com.blueshit.cookshow.model.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.Set;


/**
 * The persistent class for the t_user database table.
 * 
 */
@Entity
@Table(name="t_user")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;

	@Temporal(TemporalType.DATE)
	private Date birthday;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate;

	private int deleted;

	private String email;

	private String face;

	private String gender;

	@Column(columnDefinition = "TEXT")
	private String intro;

	private String password;

	private String phone;

	private String realName;

	private String salt;

    private int authentication;

	@Temporal(TemporalType.TIMESTAMP)
	private Date updateDate;

	private String username;

	//bi-directional many-to-one association to Collection
	@OneToMany(mappedBy="User")
	private Set<Collection> Collections;

	//bi-directional many-to-one association to CommentCookbook
	@OneToMany(mappedBy="User")
	private Set<CommentCookbook> CommentCookbooks;

	//bi-directional many-to-one association to CommentProduction
	@OneToMany(mappedBy="User")
	private Set<CommentProduction> CommentProductions;

	//bi-directional many-to-one association to Cookbook
	@OneToMany(mappedBy="User")
	private Set<Cookbook> Cookbooks;

	//bi-directional many-to-one association to Menu
	@OneToMany(mappedBy="User")
	private Set<Menu> Menus;

	//bi-directional many-to-one association to Production
	@OneToMany(mappedBy="User")
	private Set<Production> Productions;

	//bi-directional many-to-one association to Relation
	@OneToMany(mappedBy="Follower")
	private Set<Relation> FollowerRelations;

	//bi-directional many-to-one association to Relation
	@OneToMany(mappedBy="ByFollower")
	private Set<Relation> ByFollowerRelations;

	public User() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
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

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFace() {
		return this.face;
	}

	public void setFace(String face) {
		this.face = face;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getIntro() {
		return this.intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Set<Collection> getCollections() {
		return this.Collections;
	}

	public void setCollections(Set<Collection> Collections) {
		this.Collections = Collections;
	}

	public Collection addCollection(Collection Collection) {
		getCollections().add(Collection);
		Collection.setUser(this);

		return Collection;
	}

	public Collection removeCollection(Collection Collection) {
		getCollections().remove(Collection);
		Collection.setUser(null);

		return Collection;
	}

	public Set<CommentCookbook> getCommentCookbooks() {
		return this.CommentCookbooks;
	}

	public void setCommentCookbooks(Set<CommentCookbook> CommentCookbooks) {
		this.CommentCookbooks = CommentCookbooks;
	}

	public CommentCookbook addCommentCookbook(CommentCookbook CommentCookbook) {
		getCommentCookbooks().add(CommentCookbook);
		CommentCookbook.setUser(this);

		return CommentCookbook;
	}

	public CommentCookbook removeCommentCookbook(CommentCookbook CommentCookbook) {
		getCommentCookbooks().remove(CommentCookbook);
		CommentCookbook.setUser(null);

		return CommentCookbook;
	}

	public Set<CommentProduction> getCommentProductions() {
		return this.CommentProductions;
	}

	public void setCommentProductions(Set<CommentProduction> CommentProductions) {
		this.CommentProductions = CommentProductions;
	}

	public CommentProduction addCommentProduction(CommentProduction CommentProduction) {
		getCommentProductions().add(CommentProduction);
		CommentProduction.setUser(this);

		return CommentProduction;
	}

	public CommentProduction removeCommentProduction(CommentProduction CommentProduction) {
		getCommentProductions().remove(CommentProduction);
		CommentProduction.setUser(null);

		return CommentProduction;
	}

	public Set<Cookbook> getCookbooks() {
		return this.Cookbooks;
	}

	public void setCookbooks(Set<Cookbook> Cookbooks) {
		this.Cookbooks = Cookbooks;
	}

	public Cookbook addCookbook(Cookbook Cookbook) {
		getCookbooks().add(Cookbook);
		Cookbook.setUser(this);

		return Cookbook;
	}

	public Cookbook removeCookbook(Cookbook Cookbook) {
		getCookbooks().remove(Cookbook);
		Cookbook.setUser(null);

		return Cookbook;
	}

	public Set<Menu> getMenus() {
		return this.Menus;
	}

	public void setMenus(Set<Menu> Menus) {
		this.Menus = Menus;
	}

	public Menu addMenus(Menu Menus) {
		getMenus().add(Menus);
		Menus.setUser(this);

		return Menus;
	}

	public Menu removeMenus(Menu Menus) {
		getMenus().remove(Menus);
		Menus.setUser(null);

		return Menus;
	}

	public Set<Production> getProductions() {
		return this.Productions;
	}

	public void setProductions(Set<Production> Productions) {
		this.Productions = Productions;
	}

	public Production addProduction(Production Production) {
		getProductions().add(Production);
		Production.setUser(this);

		return Production;
	}

	public Production removeProduction(Production Production) {
		getProductions().remove(Production);
		Production.setUser(null);

		return Production;
	}

	public Set<Relation> getFollowerRelations() {
		return this.FollowerRelations;
	}

	public void setFollowerRelations(Set<Relation> FollowerRelations) {
		this.FollowerRelations = FollowerRelations;
	}

	public Relation addFollowerRelation(Relation FollowerRelation) {
		getFollowerRelations().add(FollowerRelation);
		FollowerRelation.setFollower(this);

		return FollowerRelation;
	}

	public Relation removeFollowerRelation(Relation FollowerRelation) {
		getFollowerRelations().remove(FollowerRelation);
		FollowerRelation.setFollower(null);

		return FollowerRelation;
	}

	public Set<Relation> getByFollowerRelations() {
		return this.ByFollowerRelations;
	}

	public void setByFollowerRelations(Set<Relation> ByFollowerRelations) {
		this.ByFollowerRelations = ByFollowerRelations;
	}

	public Relation addByFollowerRelation(Relation ByFollowerRelation) {
		getByFollowerRelations().add(ByFollowerRelation);
		ByFollowerRelation.setByFollower(this);

		return ByFollowerRelation;
	}

	public Relation removeByFollowerRelation(Relation ByFollowerRelation) {
		getByFollowerRelations().remove(ByFollowerRelation);
		ByFollowerRelation.setByFollower(null);

		return ByFollowerRelation;
	}

    public int getAuthentication() {
        return authentication;
    }

    public void setAuthentication(int authentication) {
        this.authentication = authentication;
    }
}