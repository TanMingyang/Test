package com.exam.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exam.pojo.Testpaper;
import com.exam.pojo.User;
import com.exam.service.PaperService;

@Controller
@RequestMapping("/jump")
public class JumpController {
	@Autowired
	private PaperService service;
	/**
	 * 跳转页面到教师信息
	 * @return
	 */
	@RequestMapping(value = "/teaUserInfo", method = RequestMethod.GET )
	public String teaUserInfo(){
		return "/teacher/UserInfo";
	}
	/**
	 * 跳转页面到学生信息
	 * @return
	 */
	@RequestMapping(value = "/stuUserInfo", method = RequestMethod.GET)
	public String stuUserInfo(){
		return "/student/UserInfo";
	}
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value = "/adminUserInfo", method = RequestMethod.GET)
	public String adminUserInfo(){
		return "/admin/UserInfo";
	}
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(){
		return "redirect:/login.jsp";
	}
	/**
	 * 试卷预览
	 * @return
	 */
	@RequestMapping(value = "/preview", method = RequestMethod.GET)
	public String preview(){
		return "/teacher/preview";
	}
	/**
	 * 组卷记录
	 * @param md
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/paperrecord", method = RequestMethod.GET)
	public String paperrecord(Model md,HttpSession session){
		Integer userId = ((User)session.getAttribute("user")).getId();
		List<Testpaper> paperrecord = service.queryByUserId(userId);
		md.addAttribute("paperrecord", paperrecord);
		return "/teacher/paperrecord";
	}
	/**
	 * 自动组卷
	 * @return
	 */
	@RequestMapping(value = "/automaticpaper", method = RequestMethod.GET)
	public String automaticpaper(){
		return "/teacher/automaticpaper";
	}
	/**
	 * 上传试卷
	 * @return
	 */
	@RequestMapping(value = "/uploadpaper", method = RequestMethod.GET)
	public String uploadpaper(){
		return "/admin/uploadpaper";
	}
	/**
	 * 上传试题
	 * @return
	 */
	@RequestMapping(value = "/uploadquestion", method = RequestMethod.GET)
	public String uploadquestion(){
		return "/admin/uploadquestion";
	}
	/**
	 * 选择练习
	 * @return
	 */
	@RequestMapping(value = "/ecerciseBefore", method = RequestMethod.GET)
	public String ecerciseBefore(){
		return "/student/ecerciseBefore";
	}
}
