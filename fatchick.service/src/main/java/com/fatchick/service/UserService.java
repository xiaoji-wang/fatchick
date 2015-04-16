package com.fatchick.service;

import java.util.Map;

import com.fatchick.model.User;

public interface UserService {
	User get(Map<String, Object> params);

	void doCreate(User user);
	
	void doUpdate(User user);
}
