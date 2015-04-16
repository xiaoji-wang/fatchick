package fatchick.web;

import java.util.HashMap;
import java.util.Map;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.fatchick.common.util.FatChickUtil;
import com.fatchick.service.UserService;

public class UserTest {

	private static ApplicationContext context;

	@BeforeClass
	public static void init() {
		context = new ClassPathXmlApplicationContext("applicationContext.xml");
	}

	@Test
	public void testLogin() {
		UserService userService = (UserService) context.getBean("userService");
		Map<String, Object> params = new HashMap<String,Object>();
		params.put("code", "wxjivm@163.com");
		//System.out.println(userService.get(params).getWebPages());
	
	}

	@Test
	public void testRegister(){
		//System.out.println(FatChickUtil.instance().getProperty(ConstantValue.USER_PATH));
		System.out.println(FatChickUtil.md5("1"));
	}
	
}
