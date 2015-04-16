package com.fatchick.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "fc_user_web_page_record")
public class UserWebPageRecord {
	private int id;
	private User user;
	private WebPage webPage;
	private Date createDate;
	private Date lastAccessDate;
	private int accessCount;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_web_page_record_id", nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id", nullable = false)
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "web_page_id", nullable = false)
	public WebPage getWebPage() {
		return webPage;
	}

	public void setWebPage(WebPage webPage) {
		this.webPage = webPage;
	}

	@Column(name = "last_access_date")
	public Date getLastAccessDate() {
		return lastAccessDate;
	}

	public void setLastAccessDate(Date lastAccessDate) {
		this.lastAccessDate = lastAccessDate;
	}

	@Column(name = "access_count")
	public int getAccessCount() {
		return accessCount;
	}

	public void setAccessCount(int accessCount) {
		this.accessCount = accessCount;
	}

	@Column(name = "create_date")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	@Override
	public int hashCode() {
		return id;
	}

	@Override
	public boolean equals(Object o) {
		if (o instanceof UserWebPageRecord) {
			return ((UserWebPageRecord) o).id == this.id;
		}
		return false;
	}

}
