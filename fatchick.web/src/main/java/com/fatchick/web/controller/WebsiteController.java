package com.fatchick.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fatchick.common.annotation.Permission;
import com.fatchick.common.exception.GeneralException;
import com.fatchick.common.type.PermissionType;
import com.fatchick.common.util.ConstantValue;
import com.fatchick.model.User;
import com.fatchick.model.WebPage;
import com.fatchick.service.WebPageService;

@Controller
@RequestMapping("/website")
public class WebsiteController {

	@Resource(name = "webPageService")
	private WebPageService webPageService;

	@Permission(value = PermissionType.LOGIN, returnValue = "/user/login.page")
	@RequestMapping("/addWebsite.data")
	public @ResponseBody Map<String, Object> addWebsiteData(String url, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		try {
			WebPage webPage = webPageService.doCreate((User) session.getAttribute(ConstantValue.USER), url);
			Map<String, String> data = new HashMap<String, String>();
			data.put("url", webPage.toString());
			data.put("title", webPage.getTitle());
			map.put("data", data);
		} catch (GeneralException e) {
			map.put("success", false);
			map.put("message", e.getMessage());
		}
		return map;
	}

}
