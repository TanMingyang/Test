package com.exam.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.constant.ExamConstant;
import com.exam.mapper.RoleMapper;
import com.exam.mapper.UserMapper;
import com.exam.pojo.Role;
import com.exam.pojo.User;
import com.exam.pojo.UserExample;
import com.exam.service.UserService;
import com.exam.util.PasswordHelper;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private RoleMapper roleMapper;

	public int createUser(User user) {
		// TODO Auto-generated method stub
		PasswordHelper.encryptPassword(user);
		user.setLocked(ExamConstant.USER_UNLOCKED);
		return userMapper.insert(user);
	}

	public void changePassword(String username, String newPassword) {
		// TODO Auto-generated method stub
		UserExample example = new UserExample();
		example.createCriteria().andUsernameEqualTo(username);
		User user = new User();
		user = userMapper.selectByExample(example).get(0);
		if (user != null) {
			user.setPassword(newPassword);
			PasswordHelper.encryptPassword(user);
			userMapper.updateByPrimaryKey(user);
		}
	}

	public User findByUsername(String username) {
		UserExample example = new UserExample();
		example.createCriteria().andUsernameEqualTo(username).andLockedEqualTo(ExamConstant.USER_UNLOCKED);
		List<User> users = new ArrayList<User>();
		User user = null;
		users = userMapper.selectByExample(example);
		if (users != null && users.size() != 0) {
			user = users.get(0);
		}
		return user;
	}

	public Set<String> findRoles(String username) {
		UserExample example = new UserExample();
		example.createCriteria().andUsernameEqualTo(username);
		User user = new User();
		user = userMapper.selectByExample(example).get(0);
		Role role = roleMapper.selectByPrimaryKey(user.getRoleId());
		HashSet<String> set = new HashSet<String>();
		set.add(role.getCode());
		return set;
	}

	public int changeUserInfo(User user) {
		UserExample example = new UserExample();
		example.createCriteria().andIdEqualTo(user.getId());
		return userMapper.updateByExampleSelective(user, example);
	}

	public List<User> QueryAllUser() {
		UserExample example = new UserExample();
		example.createCriteria().andRoleIdNotEqualTo(ExamConstant.ROLE_ADMIN);
		return userMapper.selectByExample(example);
	}

	public User QueryById(Integer id) {
		return userMapper.selectByPrimaryKey(id);
	}

}
