package com.exam.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.dto.QuestionDto;
import com.exam.pojo.Question;
import com.exam.service.QuestionService;
import com.exam.service.UserService;

@Controller
@RequestMapping("/student")
public class StudentController {
	private Logger logger = Logger.getLogger(StudentController.class);
	@Autowired
	private UserService userService;
	@Autowired
	private QuestionService questionService;
	
	/**
	 * 在线练习选题
	 * @param md
	 * @param subject
	 * @param questionNum
	 * @param difficult
	 * @return
	 */
	@RequestMapping(value = "/ecercisequestion", method = RequestMethod.POST)
	public String ecercisequestion(HttpSession session, Integer[] subject, Integer questionNum, Integer difficult) {
		List<Question> list = questionService.queryQuestionForExercise(difficult, subject);
		Map<Integer, QuestionDto> map = new HashMap<Integer, QuestionDto>();
		automaticquestion(list, questionNum, map);
		logger.info("===========>map"+map);
		session.setAttribute("exercise", map);
		return "/student/ecerciseOnline";
	}
	/**
	 * 保存答案
	 * @param map
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/saveAnswer")
	public @ResponseBody Map<String, Object> saveAnswer(@RequestParam Map<String, String> map,HttpSession session){
		Integer qid = new Integer(map.get("id"));
		String answer = map.get("answer");
		logger.info("=================>map"+map);
		Map<String, Object> rmap = new HashMap<String, Object>();
		Map<Integer, QuestionDto> exercise = (Map<Integer, QuestionDto>) session.getAttribute("exercise");
		if (exercise == null || exercise.isEmpty()) {
			rmap.put("result", "false");
			return rmap;
		}
		QuestionDto dto = exercise.get(qid);
		dto.setStuAnswer(answer);
		logger.info("=================>exercise"+exercise);
		rmap.put("result", "true");
		return rmap;
	}
	/**
	 * 
	 * 练习结果
	 * @param session
	 * @param md
	 * @return
	 */
	@RequestMapping(value = "/ecerciseResult", method = RequestMethod.GET)
	public String ecerciseResult(HttpSession session,Model md) {
		Map<Integer, QuestionDto> exercise = (Map<Integer, QuestionDto>) session.getAttribute("exercise");
		if (exercise == null || exercise.isEmpty()) {
			return "/student/ecerciseBefore";
		}
		md.addAttribute("countQuestion", exercise.size());
		int result = 0;
		for (Entry<Integer, QuestionDto> ele : exercise.entrySet()) {
			QuestionDto dto = ele.getValue();
			String stuAnswer = dto.getStuAnswer();
			String trueAnswer = dto.getQuestion().getAnswer();
			if (stuAnswer!=null && !stuAnswer.isEmpty()) {
				if (stuAnswer.trim().equals(trueAnswer.trim())) {
					result++;
				}
			}
		}
		md.addAttribute("result",result);
		return "/student/ecerciseResult";
	}
	
	@RequestMapping(value = "/ecercisejiexi", method = RequestMethod.GET)
	public String ecerciseBefore(){
		return "/student/ecercisejiexi";
	}
	
	
	public void automaticquestion(List<Question> questions, int num, Map<Integer, QuestionDto> question) {
		if (questions == null || questions.isEmpty()) {
			return ;
		}
		if(questions !=null && num > questions.size()){
			num = questions.size();
		}
		int[] intRet = new int[num];
		int intRd = 0; // 存放随机数
		int count = 0; // 记录生成的随机数个数
		int flag = 0; // 是否已经生成过标志
		while (count < num) {
			java.util.Random rdm = new java.util.Random(System.currentTimeMillis());
			intRd = Math.abs(rdm.nextInt()) % (questions.size() - 1);
			for (int i = 0; i < count; i++) {
				if (intRet[i] == intRd) {
					flag = 1;
					break;
				} else {
					flag = 0;
				}
			}
			if (flag == 0) {
				intRet[count] = intRd;
				count++;
			}
		}
		for (int t = 0; t < num; t++) {
			Question q = questions.get(intRet[t]);
			QuestionDto qd = new QuestionDto();
			qd.setQuestion(q);
			question.put(q.getId(), qd);
		}

	}

}
