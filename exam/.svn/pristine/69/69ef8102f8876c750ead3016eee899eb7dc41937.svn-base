package com.exam.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.exam.constant.ExamConstant;
import com.exam.pojo.Question;
import com.exam.pojo.User;
import com.exam.service.QuestionService;
import com.exam.service.UserService;
import com.exam.util.ExcelUtil;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private Logger logger = Logger.getLogger(AdminController.class);
	@Autowired
	private UserService userService;
	@Autowired
	private QuestionService questionService;
	/**
	 * 用户信息查询
	 * @param md
	 * @return
	 */
	@RequestMapping(value = "/userrecord", method = RequestMethod.GET)
	public String userrecord(Model md){
		List<User> list = userService.QueryAllUser();
		md.addAttribute("userrecord", list);
		return "/admin/UsersInfo";
	 }
	/**
	 * 禁用用户
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/lockedUser", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> lockedUser(@RequestParam Map<String, String> map){
		Map<String, String> rmap = new HashMap<String, String>();
		Integer id = new Integer(map.get("id"));
		User user = null;
		try {
			user = userService.QueryById(id);
			user.setLocked(ExamConstant.USER_LOCKED);
			userService.changeUserInfo(user);
		} catch (Exception e) {
			logger.error("禁用用户错误！！");
			rmap.put("result", "false");
			return rmap;
		}
		rmap.put("result", "true");
		return rmap;
		
	}
	/**
	 * 启用用户
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/unlockedUser", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> unlockedUser(@RequestParam Map<String, String> map){
		Map<String, String> rmap = new HashMap<String, String>();
		Integer id = new Integer(map.get("id"));
		User user = null;
		try {
			user = userService.QueryById(id);
			user.setLocked(ExamConstant.USER_UNLOCKED);
			userService.changeUserInfo(user);
		} catch (Exception e) {
			logger.error("禁用用户错误！！");
			rmap.put("result", "false");
			return rmap;
		}
		rmap.put("result", "true");
		return rmap;
		
	}
	
	/**
	 * 文件上传
	 * @param md
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/uploadquestion", method = RequestMethod.POST)
	public String uploadquestion(Model md, @RequestParam("file") MultipartFile file, HttpSession session,HttpServletRequest request) {
		logger.info("========uploadquestion start!===============");
		if (!file.isEmpty()) {
			// 获得图片 字节数组，通过 流 写到服务器
			// byte[] data = headPic.getBytes() ;
			// 获得项目部署的路径
			String path = "E:"+File.separator+"file"+File.separator+"word";
			logger.info("=======路径：=========" + path);
			String fileName = file.getOriginalFilename();
			logger.info("=======文件名：=========" + fileName);
			String username = ((User) session.getAttribute("user")).getUsername();
			try {
				logger.info("=======上传文件名：=========" + fileName);
				String prefix=fileName.substring(fileName.lastIndexOf("."));
				File targetFile = new File(path,UUID.randomUUID().toString()+prefix);
				file.transferTo(targetFile);
				List<Map<String, String>> list = ExcelUtil.ExcelToList(targetFile);
				logger.info("===========>list"+list);
				addQuestions(list, username);
				deleteFile(targetFile);
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		 return "/admin/uploadquestion";
	}
	
	private void addQuestions(List<Map<String, String>> list,String username) { 
		for (Map<String, String> map : list) {
			Question question = new Question();
			question.setAnalysis(map.get("解析"));
			question.setAnswer(map.get("答案"));
			if (map.get("内容") == null || "".equals(map.get("内容").trim())) {
				continue;
			}
			question.setContent(map.get("内容"));
			question.setCreateTime(new Date());
			question.setCreator(username);
			if (map.get("难度")!=null && !map.get("难度").isEmpty()) {
				question.setDifficulty(new Integer(map.get("难度")));
			}
			question.setOption1(map.get("选项A"));
			question.setOption2(map.get("选项B"));
			question.setOption3(map.get("选项C"));
			question.setOption4(map.get("选项D"));
			question.setOption5(map.get("选项E"));
			question.setOption6(map.get("选项F"));
			if (map.get("类型")!=null && !map.get("类型").isEmpty()) {
				question.setQuestionType(new Integer(map.get("类型")));
			}
			if (map.get("学科")!=null && !map.get("学科").isEmpty()) {
				question.setSubject(new Integer(map.get("学科")));
			}
			question.setTitle(map.get("内容"));
			questionService.addQuestion(question);
		}
		
	}
	
	/**  
     * 删除  
     * @param files  
     */  
    private void deleteFile(File... files) {  
        for (File file : files) {  
            if (file.exists()) {  
                file.delete();  
            }  
        }  
    }
    
    /**
     * 试题管理
     * @param md
     * @return
     */
    @RequestMapping(value = "/questionrecord", method = RequestMethod.GET)
	public String questionrecord(Model md, HttpSession session){
		Integer questiontype = (Integer) session.getAttribute("adminquestiontype");
		Integer questionsubject = (Integer) session.getAttribute("adminquestionsubject");
		List<Question> list = questionService.queryBycondition(questiontype, questionsubject,null, null);
		md.addAttribute("questionrecord", list);
		return "/admin/questionrecord";
	 }
    
    /**
	 * 题型
	 * 
	 * @param type
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/querytype/{type}", method = RequestMethod.GET)
	public String queryTypeFile(@PathVariable("type") Integer type, HttpSession session, Model md) {
		logger.info("===== > type==" + type);
		session.setAttribute("adminquestiontype", type);

		Integer questiontype = (Integer) session.getAttribute("adminquestiontype");
		Integer questionsubject = (Integer) session.getAttribute("adminquestionsubject");

		List<Question> pageInfo = questionService.queryBycondition(questiontype, questionsubject,null, null);
		md.addAttribute("questionrecord", pageInfo);
		
		return "/admin/questionrecord";
	}

	/**
	 * 学科
	 * 
	 * @param subject
	 * @param session
	 * @param md
	 * @return
	 */
	@RequestMapping(value = "/querysubject/{subject}", method = RequestMethod.GET)
	public String querySubjectFile(@PathVariable("subject") Integer subject, HttpSession session, Model md) {
		session.setAttribute("adminquestionsubject", subject);
		logger.info("===== > subject" + subject);
		Integer questiontype = (Integer) session.getAttribute("adminquestiontype");
		Integer questionsubject = (Integer) session.getAttribute("adminquestionsubject");

		List<Question> pageInfo = questionService.queryBycondition(questiontype, questionsubject,null, null);
		md.addAttribute("questionrecord", pageInfo);
		
		return "/admin/questionrecord";
	}
    
    
    /**
     * 更新试题
     * @param question
     * @return
     */
    @RequestMapping(value = "/updatequestion", method = RequestMethod.POST)
    public @ResponseBody String updatequestion(@RequestBody Question question){
    	logger.info(question);
    	try {
    		questionService.updateQuestion(question);
		} catch (Exception e) {
			return "false";
		}
		return "true";
    }
    
    @RequestMapping(value = "/queryQuestion", method = RequestMethod.POST)
    public @ResponseBody Question queryQuestion(String id){
    	logger.info(id);
    	Question question = null;
    	try {
    		Integer qId = new Integer(id);
    		logger.info(qId);
    		question = questionService.queryById(qId);
		} catch (Exception e) {
			return null;
		}
    	logger.info(question);
		return question ;
    }
    /**
     * 删除题目
     * @param map
     * @return
     */
    @RequestMapping(value = "/removeQuestion", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> removeQuestion(@RequestParam Map<String, String> map){
		Map<String, Object> rmap = new HashMap<String, Object>();
		Integer id = new Integer(map.get("id"));
		try {
			questionService.deleteQuestion(id);
		} catch (Exception e) {
			logger.error("删除试题错误！！");
			rmap.put("result", "false");
			return rmap;
		}
		rmap.put("result", "true");
		return rmap;
	}
}
