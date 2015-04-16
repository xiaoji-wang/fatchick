package com.fatchick.service.impl;

import static com.fatchick.common.util.FatChickUtil.md5;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fatchick.common.exception.GeneralException;
import com.fatchick.common.util.ConstantValue;
import com.fatchick.common.util.FatChickUtil;
import com.fatchick.common.util.StringUtils;
import com.fatchick.dao.UserDao;
import com.fatchick.model.User;
import com.fatchick.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource(name = "userDao")
	private UserDao userDao;

	@Override
	public void doUpdate(User user) {
		// TODO
		userDao.update(user);
	}

	@Override
	public User get(Map<String, Object> params) {
		List<User> users = userDao.get(params);
		if (users.isEmpty()) {
			return null;
		}
		return users.get(0);
	}

	@Override
	public void doCreate(User user) {
		verify(user);
		if (StringUtils.isBlank(user.getNickName())) {
			user.setNickName(user.getCode());
		}
		user.setPassword(md5(user.getPassword()));
		userDao.save(user);
		createUserFolder(user);
	}

	private void createUserFolder(User user) {
		String path = FatChickUtil.getProperty(ConstantValue.USER_PATH);
		File file = new File(path, Integer.toString(user.getId()));
		file.mkdir();
	}

	private void verify(User user) {
		if (null == user) {
			throw new GeneralException("账号不能为空");
		} else if (StringUtils.isBlank(user.getCode())) {
			throw new GeneralException("账号不能为空");
		} else if (StringUtils.isBlank(user.getPassword())) {
			throw new GeneralException("密码不能为空");
		} else {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("code", user.getCode());
			long count = userDao.getCount(params);
			if (count > 0) {
				throw new GeneralException("账号已存在");
			}
		}
	}

}
