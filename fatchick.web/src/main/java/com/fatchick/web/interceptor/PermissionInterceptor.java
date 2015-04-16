package com.fatchick.web.interceptor;

import java.lang.reflect.Method;
import java.text.MessageFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.fatchick.model.User;
import com.fatchick.common.annotation.Permission;
import com.fatchick.common.type.PermissionReturnType;
import com.fatchick.common.type.PermissionType;
import com.fatchick.common.util.ConstantValue;

public class PermissionInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if (!(handler instanceof HandlerMethod)) {
			return super.preHandle(request, response, handler);
		}
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		Method method = handlerMethod.getMethod();
		Permission permission = method.getAnnotation(Permission.class);
		if (null != permission) {
			User user = (User) WebUtils.getSessionAttribute(request, ConstantValue.USER);
			String path = request.getContextPath();
			for (PermissionType permissionType : permission.value()) {
				if (vaild(user, permissionType)) {
					continue;
				}
				if (PermissionReturnType.PAGE.equals(permission.returnType())) {
					String page = permission.returnValue();
					response.sendRedirect(path + page);
				} else {
					String value = permission.returnValue();
					response.setContentType("application/json; charset=UTF-8");
					response.getWriter().print(MessageFormat.format("'{'\"success\":false,\"message\":\"{0}\"'}'", value));
					response.getWriter().flush();
				}
				return false;
			}
		}
		return super.preHandle(request, response, handler);
	}

	private boolean vaild(User user, PermissionType permissionType) {
		if (PermissionType.LOGOUT.equals(permissionType)) {
			if (null == user) {
				return true;
			}
		}
		if (PermissionType.LOGIN.equals(permissionType)) {
			if (null != user) {
				return true;
			}
		}
		return false;
	}
}
