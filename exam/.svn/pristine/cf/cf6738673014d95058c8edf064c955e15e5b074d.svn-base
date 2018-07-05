package com.exam.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.pojo.User;
import com.exam.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	private Logger logger = Logger.getLogger(UserController.class);
	@Autowired
	private UserService userService;

	/**
	 * 登录
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String username, String password, HttpSession session,RedirectAttributes ra) {
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		token.setRememberMe(true);
		/*清除session信息*/
		session.removeAttribute("paper");
		session.removeAttribute("questiontype");
		session.removeAttribute("questionsubject");
		session.removeAttribute("questiondate");
		session.removeAttribute("questioncontent");
		try {
			subject.login(token);
		} catch (Exception e) {
			ra.addFlashAttribute("loginError", "用户名或密码错误！");
			return "redirect:/login.jsp";
		}
		logger.info("=============>登录成功");
		User user = userService.findByUsername(username);
		session.setAttribute("user", user);
		logger.info("=============>user:" + user);
		if (subject.hasRole("student")) {
			return "/student/UserInfo";
		}
		if (subject.hasRole("teacher")) {
			return "/teacher/UserInfo";
		}
		if (subject.hasRole("admin")) {
			return "/admin/UserInfo";
		}
		ra.addFlashAttribute("loginError", "用户名或密码错误！");
		return "redirect:/login.jsp";
	}

	/**
	 * 登出
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		Subject subject = SecurityUtils.getSubject();
		try {
			subject.logout();
			session.removeAttribute("paper");
			session.removeAttribute("questiontype");
			session.removeAttribute("questionsubject");
			session.removeAttribute("questiondate");
			session.removeAttribute("questioncontent");
		} catch (Exception e) {
			logger.info("《=============登出失败");
		}
		logger.info("《=============登出成功");
		return "redirect:/login.jsp";
	}

	/**
	 * 修改用户信息
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/changeUserInfo", method = RequestMethod.POST)
	public String changeUserInfo(User user,HttpSession session) {
		userService.changeUserInfo(user);
		User user1 = userService.findByUsername(((User)session.getAttribute("user")).getUsername());
		session.setAttribute("user", user1);
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole("student")) {
			return "/student/UserInfo";
		}
		if (subject.hasRole("teacher")) {
			return "/teacher/UserInfo";
		}
		if (subject.hasRole("admin")) {
			return "/admin/UserInfo";
		}
		return null;
	}
	/**
	 * 校验原密码
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/checkUserPwd", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> checkUserPwd(@RequestParam Map<String, String> map, HttpSession session) {
		Map<String, String> rmap = new HashMap<String, String>();
		logger.info("=============>" + map);
		String oldpassword = map.get("oldpassword");
		logger.info("================"+oldpassword);
		
		User user = (User) session.getAttribute("user");
		String pwd = new SimpleHash("md5", oldpassword, ByteSource.Util.bytes(user.getSalt()), 2)
				.toHex();
		if(pwd.equals(user.getPassword())){
			rmap.put("result", "true");
		}else{
			rmap.put("result", "false");
		}
		return rmap;
	}
	/**
	 * 修改用户密码
	 * 
	 * @param oldpassword
	 * @param newpassword
	 * @return
	 */
	@RequestMapping(value = "/changeUserPwd", method = RequestMethod.POST)
	public String changeUserPwd(String oldpassword, String newpassword, HttpSession session) {
		User user = (User) session.getAttribute("user");
		logger.info("================changeUserPwd:user" + user);
		String pwd = new SimpleHash("md5", oldpassword, ByteSource.Util.bytes(user.getSalt()), 2)
				.toHex();
		if(pwd.equals(user.getPassword())){
			try {
				userService.changePassword(user.getUsername(), newpassword);
			} catch (Exception e) {
				logger.error("修改用户密码失败！！");
			}
		}else{
			logger.info("原密码错误！！");
		}
		
		Subject subject = SecurityUtils.getSubject();
		try {
			subject.logout();
		} catch (Exception e) {
			logger.info("《=============登出失败");
		}
		logger.info("《=============登出成功");
		
		return "redirect:/login.jsp";
	}

	/**
	 * 注册
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(User user) {
		logger.info(user);
		userService.createUser(user);
		return "redirect:/login.jsp";
	}

	/**
	 * 检查用户名
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/checkUsername", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> checkUsername(@RequestParam Map<String, String> map) {
		Map<String, String> rmap = new HashMap<String, String>();
		logger.info("=============>" + map);
		String username = map.get("username");
		logger.info(username);
		User user = userService.findByUsername(username);
		if (user != null) {
			rmap.put("result", "false");
		} else {
			rmap.put("result", "true");
		}
		return rmap;
	}
	
	
}
