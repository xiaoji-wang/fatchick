package com.fatchick.service;

import java.util.List;
import java.util.Map;

import com.fatchick.model.User;
import com.fatchick.model.WebPage;

public interface WebPageService {

	List<Map<String, Object>> getWebPage(User user);

	WebPage doCreate(User user, String url);
}
