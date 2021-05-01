package com.mySpring.springEx.common.interceptor;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Retention(RUNTIME)
@Target(METHOD)
public @interface Auth {
public enum Role {ADMIN, USER, PARTNER, PA, CREW, NON_PA} //ADMIN, USER, PARNER, PA(PARTNER + ADMIN), CREW Authorization check
	
	// 이와 같이 작성하면 메서드 위에 @Auth(role=Role.ADMIN)과 같이 작성 가능
	public Role role() default Role.USER;

}
