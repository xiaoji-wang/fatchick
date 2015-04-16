package com.fatchick.common.util;

public class StringUtils extends org.springframework.util.StringUtils {
	public static boolean isBlank(String str) {
		return (str == null || "".equals(str.trim()));
	}
}
