package com.fatchick.common.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.fatchick.common.type.PermissionReturnType;
import com.fatchick.common.type.PermissionType;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Permission {
	PermissionType[] value();

	String returnValue();

	PermissionReturnType returnType() default PermissionReturnType.PAGE;
}
