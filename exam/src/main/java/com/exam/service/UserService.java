package com.exam.service;


import java.util.List;
import java.util.Set;

import com.exam.pojo.User;

/**
 * UserService 
 * @author tmy
 *
 */
public interface UserService {

    /**
     * 创建用户
     * @param user
     */
    public int createUser(User user);

    /**
     * 修改密码
     * @param userId
     * @param newPassword
     */
    public void changePassword(String username, String newPassword);
    
    /**
     * 修改用户信息
     * @param user
     */
    public int changeUserInfo(User user);

    /**
     * 根据用户名查找用户
     * @param username
     * @return
     */
    public User findByUsername(String username);
    /**
     * 根据用户名查找其角色
     * @param username
     * @return
     */
    public Set<String> findRoles(String username);
    /**
     * 查找用户信息
     * @return
     */
    public List<User> QueryAllUser();
    /**
     * 根据ID查找用户信息
     * @param id
     * @return
     */
    public User QueryById(Integer id);

}
