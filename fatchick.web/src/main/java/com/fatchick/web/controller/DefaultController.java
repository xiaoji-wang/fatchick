package com.fatchick.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fatchick.common.util.ConstantValue;
import com.fatchick.common.util.FatChickUtil;

@Controller
public class DefaultController {
	@RequestMapping("/index")
	public String index(){
		return "redirect:/user/main.page";
	}
	
	@RequestMapping("/head.page")
	public String head() {
		return "/include/head";
	}

	@RequestMapping("/foot.page")
	public String foot() {
		return "/include/foot";
	}
	
	@RequestMapping("/picture")
	public void picture(HttpServletRequest request, HttpServletResponse response, String path, String name) {
		File file = new File(FatChickUtil.getProperty(ConstantValue.USER_PATH), path + "/" + name);
		OutputStream stream = null;
		try {
			InputStream in = null;
			if (file.exists()) {
				in = new FileInputStream(file);
			} else {
				String rootPath = request.getSession().getServletContext().getRealPath("/");
				in = new FileInputStream(rootPath + FatChickUtil.getProperty(ConstantValue.DEFAULT_HEAD));
			}
			response.setContentType("image/png");
			stream = response.getOutputStream();
			stream.write(IOUtils.toByteArray(in));
			stream.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (null != stream) {
				try {
					stream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
