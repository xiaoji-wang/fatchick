package com.fatchick.common.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.springframework.util.DigestUtils;

public class FatChickUtil {

	private static Properties properties;

	static {
		properties = new Properties();
		InputStream is = null;
		try {
			is = FatChickUtil.class.getResourceAsStream("/fatchick.properties");
			properties.load(is);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public static String getProperty(String key) {
		return properties.getProperty(key);
	}

	public static String md5(String s) {
		return DigestUtils.md5DigestAsHex(s.getBytes());
	}
}
