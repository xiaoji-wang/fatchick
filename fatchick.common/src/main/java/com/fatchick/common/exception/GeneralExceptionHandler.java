package com.fatchick.common.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

@Component("exceptionResolver")
public class GeneralExceptionHandler implements HandlerExceptionResolver {

	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object obj, Exception ex) {
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("message", ex.getMessage());
		return mv;
	}
}
