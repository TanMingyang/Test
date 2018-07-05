package com.exam.service.impl;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.exam.constant.ExamConstant;
import com.exam.pojo.User;
import com.exam.service.UserService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:application.xml")
public class UserServiceImplTest {
	@Autowired
	private UserService service;
	@Test
	public void testCreateUser() {
		User user = new User();
		user.setUsername("qwe");
		user.setPassword("123");
		user.setRealname("tmy");
		user.setRoleId(ExamConstant.ROLE_TEACHER);
		service.createUser(user);
	}

	@Test
	public void testChangePassword() {
		System.out.println(service.findRoles("qwe"));
	}

	@Test
	public void testFindByUsername() {
	}

	@Test
	public void testFindRoles() {
	}

}
