package com.fatchick.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fatchick.common.annotation.Permission;
import com.fatchick.common.exception.GeneralException;
import com.fatchick.common.type.PermissionType;
import com.fatchick.common.util.ConstantValue;
import com.fatchick.common.util.FatChickUtil;
import com.fatchick.model.User;
import com.fatchick.service.UserService;
import com.fatchick.service.WebPageService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "webPageService")
	private WebPageService webPageService;

	@Permission(value = PermissionType.LOGIN, returnValue = "/user/login.page")
	@RequestMapping("/main.page")
	public ModelAndView mainPage(HttpSession session, ModelAndView mv) {
		User user = (User) session.getAttribute(ConstantValue.USER);
		mv.addObject("pages", webPageService.getWebPage(user));
		mv.setViewName("user/main");
		return mv;
	}

	@Permission(value = PermissionType.LOGIN, returnValue = "/user/login.page")
	@RequestMapping("/setting.page")
	public String settingPage() {
		return "user/setting";
	}

	@Permission(value = PermissionType.LOGOUT, returnValue = "/user/main.page")
	@RequestMapping("/register.page")
	public String registerPage() {
		return "user/register";
	}

	@Permission(value = PermissionType.LOGOUT, returnValue = "/user/main.page")
	@RequestMapping("/register.data")
	public ModelAndView registerData(HttpSession session, User user) {
		ModelAndView mv = new ModelAndView();
		try {
			userService.doCreate(user);
			session.setAttribute(ConstantValue.USER, user);
			session.setAttribute(ConstantValue.USER_PATH, FatChickUtil.getProperty(ConstantValue.USER_PATH));
			mv.setViewName("redirect:/user/main.page");
		} catch (GeneralException e) {
			mv.addObject("error", e.getMessage());
			mv.setViewName("user/register");
		}
		return mv;
	}

	@Permission(value = PermissionType.LOGOUT, returnValue = "/user/main.page")
	@RequestMapping("/login.page")
	public String loginPage() {
		return "user/login";
	}

	@Permission(value = PermissionType.LOGOUT, returnValue = "/user/main.page")
	@RequestMapping("/login.data")
	public ModelAndView loginData(HttpSession session, String code, String password) {
		Map<String, Object> params = new HashMap<String, Object>();
		ModelAndView mv = new ModelAndView();
		params.put("code", code);
		params.put("password", FatChickUtil.md5(password));
		User user = userService.get(params);
		if (null == user) {
			mv.addObject("error", "账号或密码错误。");
			mv.setViewName("user/login");
		} else {
			session.setAttribute(ConstantValue.USER, user);
			mv.setViewName("redirect:/user/main.page");
		}
		return mv;
	}

	@Permission(value = PermissionType.LOGIN, returnValue = "/user/login.page")
	@RequestMapping("/logout.data")
	public String logoutData(HttpSession session) {
		session.setAttribute(ConstantValue.USER, null);
		return "index";
	}

}
