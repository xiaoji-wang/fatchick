package com.fatchick.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fatchick.common.util.StringUtils;

@Entity
@Table(name = "fc_web_page")
public class WebPage {
	private int id;
	private String protocol;
	private String host;
	private int port;
	private String path;
	private String query;
	private String title;
	private String urlMd5;
	private WebPage parentWebPage;
	private List<WebPage> subWebPage;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "web_page_id", nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "title", length = 255)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@OneToMany(mappedBy = "parentWebPage", fetch = FetchType.LAZY)
	public List<WebPage> getSubWebPage() {
		return subWebPage;
	}

	public void setSubWebPage(List<WebPage> subWebPage) {
		this.subWebPage = subWebPage;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parent_id")
	public WebPage getParentWebPage() {
		return parentWebPage;
	}

	public void setParentWebPage(WebPage parentWebPage) {
		this.parentWebPage = parentWebPage;
	}

	@Column(name = "url_md5", nullable = false, length = 32, unique = true)
	public String getUrlMd5() {
		return urlMd5;
	}

	public void setUrlMd5(String urlMd5) {
		this.urlMd5 = urlMd5;
	}

	@Column(name = "protocol", nullable = false, length = 10)
	public String getProtocol() {
		return protocol;
	}

	public void setProtocol(String protocol) {
		this.protocol = protocol;
	}

	@Column(name = "host", nullable = false, length = 255)
	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	@Column(name = "port", length = 10)
	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
	}

	@Column(name = "path")
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Column(name = "query")
	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	@Override
	public String toString() {
		StringBuffer url = new StringBuffer();
		url.append(protocol);
		url.append("://");
		url.append(host);
		if (port >= 0) {
			url.append(":");
			url.append(port);
		}
		if (!StringUtils.isBlank(path)) {
			url.append(path);
		}
		if (!StringUtils.isBlank(query)) {
			url.append("?");
			url.append(query);
		}
		return url.toString();
	}

	@Override
	public int hashCode() {
		return id;
	}

	@Override
	public boolean equals(Object o) {
		if (o instanceof WebPage) {
			return ((WebPage) o).id == this.id;
		}
		return false;
	}
}
