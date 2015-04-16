package fatchick.web;

import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.fatchick.model.User;
import com.fatchick.model.WebPage;
import com.fatchick.service.UserService;
import com.fatchick.service.WebPageService;

public class WebPageTest {

	private static ApplicationContext context;

	@BeforeClass
	public static void init() {
		context = new ClassPathXmlApplicationContext("applicationContext.xml");
	}

	@Test
	public void test() throws Exception {
		UserService userService = (UserService) context.getBean("userService");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("code", "wxjivm@163.com");
		User user = userService.get(params);

		WebPageService webPageService = (WebPageService) context.getBean("webPageService");

		webPageService.doCreate(user, "http://baidu.com/");
	}
}
