package com.fatchick.service.impl;

import static com.fatchick.common.util.FatChickUtil.md5;

import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Service;

import com.fatchick.common.exception.GeneralException;
import com.fatchick.dao.UserWebPageRecordDao;
import com.fatchick.dao.WebPageDao;
import com.fatchick.model.User;
import com.fatchick.model.UserWebPageRecord;
import com.fatchick.model.WebPage;
import com.fatchick.service.WebPageService;

@Service("webPageService")
public class WebPageServiceImpl implements WebPageService {

	@Resource(name = "webPageDao")
	private WebPageDao webPageDao;
	@Resource(name = "userWebPageRecordDao")
	private UserWebPageRecordDao userWebPageRecordDao;

	@Override
	public List<Map<String, Object>> getWebPage(User user) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("user", user);
		return userWebPageRecordDao.getWebPages(params);
	}

	@Override
	public WebPage doCreate(User user, String url) {
		WebPage webPage = webPageDao.getByUrlMd5(md5(url));
		if (webPage == null) {
			try {
				webPage = createWebPage(url);
			} catch (GeneralException e) {
				throw e;
			} catch (MalformedURLException e) {
				throw new GeneralException("无法识别链接格式！");
			} catch (Exception e) {
				e.printStackTrace();
				throw new GeneralException("无法访问该链接！");
			}
		}
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("user", user);
		List<UserWebPageRecord> records = userWebPageRecordDao.get(params);
		boolean hasWebPage = false;
		for (UserWebPageRecord record : records) {
			if (record.getWebPage().equals(webPage)) {
				hasWebPage = true;
				break;
			}
		}
		if (hasWebPage) {
			throw new GeneralException("已添加该网址！");
		} else {
			UserWebPageRecord record = new UserWebPageRecord();
			record.setUser(user);
			record.setWebPage(webPage);
			record.setCreateDate(new Date());
			record.setLastAccessDate(new Date());
			userWebPageRecordDao.save(record);
			return webPage;
		}
	}

	private WebPage createWebPage(String hyperlink) throws Exception {
		URL url = null;
		try {
			url = new URL(hyperlink);
		} catch (MalformedURLException e) {
			if (e.getMessage().startsWith("no protocol: ")) {
				url = new URL("http://" + hyperlink);
			}
		}
		if (!"http".equals(url.getProtocol()) && !"https".equals(url.getProtocol())) {
			throw new GeneralException("不支持" + url.getProtocol() + "协议！");
		}
		WebPage page = createWebPage(url);
		// page.setParentWebPage(getParentWebPage(url));
		page.setUrlMd5(md5(hyperlink));
		webPageDao.save(page);
		return page;
	}

	private WebPage createWebPage(URL url) throws Exception {
		WebPage page = new WebPage();
		page.setProtocol(url.getProtocol());
		page.setHost(url.getHost());
		page.setPort(url.getPort());
		page.setPath(url.getPath());
		page.setQuery(url.getQuery());
		page.setTitle(getTitle(url));
		return page;
	}

	@SuppressWarnings("unused")
	private WebPage getParentWebPage(URL url) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("host", url.getHost());
		List<WebPage> webPages = webPageDao.get(params);
		if (webPages.isEmpty()) {
			return null;
		} else {
			for (WebPage p : webPages) {
				if (null == p.getParentWebPage()) {
					return p;
				}
			}
		}
		return null;
	}

	private String getTitle(URL url) throws Exception {
		String hyperlink = url.toString();
		if ("https".equals(url.getProtocol())) {
			hyperlink = hyperlink.replaceFirst("https", "http");
		}
		HttpGet httpget = new HttpGet(hyperlink);
		CloseableHttpClient httpclient = HttpClients.createDefault();
		CloseableHttpResponse response = httpclient.execute(httpget);
		try {
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				InputStream instream = entity.getContent();
				String charset = entity.getContentType().getValue();
				int index = charset.indexOf("charset=");
				if (index >= 0) {
					charset = charset.substring(index + 8);
				} else {
					charset = "gb2312";
				}
				try {
					Document doc = Jsoup.parse(instream, charset, url.toString());
					return doc.select("title").text();
				} finally {
					instream.close();
				}
			}
		} finally {
			response.close();
		}
		return null;
	}

}
