package com.exam.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.DocumentEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.constant.ExamConstant;
import com.exam.dto.AutomaticPaper;
import com.exam.dto.TeaCollectDto;
import com.exam.dto.TestPaperDto;
import com.exam.pojo.Question;
import com.exam.pojo.TeaCollect;
import com.exam.pojo.User;
import com.exam.service.PaperService;
import com.exam.service.QuestionService;
import com.exam.service.TeaCollectService;
import com.exam.util.HtmlToDoc;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/question")
public class QuestionController {
	private Logger logger = Logger.getLogger(UserController.class);
	@Autowired
	private QuestionService service;
	@Autowired
	private TeaCollectService teaservice;
	@Autowired
	private PaperService paperservice;

	/**
	 * 试题分页
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @param md
	 * @return
	 */
	@RequestMapping(value = "/page/{pageNo}/{pageSize}", method = RequestMethod.GET)
	public String queryAllQuestion(@PathVariable("pageNo") int pageNo, @PathVariable int pageSize, Model md,
			HttpSession session) {
		Integer type = (Integer) session.getAttribute("questiontype");
		Integer subject = (Integer) session.getAttribute("questionsubject");
		Date date = (Date) session.getAttribute("questiondate");
		String content = (String) session.getAttribute("questioncontent");

		Integer userId = ((User) session.getAttribute("user")).getId();
		List<TeaCollectDto> list = teaservice.queryByUserId(userId);
		HashMap<Integer, Question> collectQuestions = new HashMap<Integer, Question>();
		for (TeaCollectDto teaCollectDto : list) {
			collectQuestions.put(teaCollectDto.getQuestion().getId(), teaCollectDto.getQuestion());
		}
		session.setAttribute("collectQuestions", collectQuestions);

		PageInfo<Question> pageInfo = service.queryByconditionCurrPage(pageNo, pageSize, type, subject, date, content);
		md.addAttribute("pageInfo", pageInfo);
		logger.info(pageInfo.getPageNum());
		return "/teacher/manualQuestion";
	}

	/**
	 * 收藏试题分页
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @param md
	 * @return
	 */
	@RequestMapping(value = "/page/collect/{pageNo}/{pageSize}", method = RequestMethod.GET)
	public String queryAllCollectQuestion(@PathVariable("pageNo") int pageNo, @PathVariable int pageSize, Model md,
			HttpSession session) {
		Integer userId = ((User) session.getAttribute("user")).getId();

		PageInfo<TeaCollectDto> collectpageInfo = teaservice.queryCurrPage(pageNo, pageSize, userId);
		md.addAttribute("collectpageInfo", collectpageInfo);
		logger.info(collectpageInfo.getPageNum());

		return "/teacher/teaCollectQuestion";
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
		session.setAttribute("questiontype", type);

		Integer questiontype = (Integer) session.getAttribute("questiontype");
		Integer questionsubject = (Integer) session.getAttribute("questionsubject");
		Date questiondate = (Date) session.getAttribute("questiondate");
		String content = (String) session.getAttribute("questioncontent");

		PageInfo<Question> pageInfo = service.queryByconditionCurrPage(1, 5, questiontype, questionsubject,
				questiondate, content);
		md.addAttribute("pageInfo", pageInfo);
		logger.info(pageInfo.getPageNum());
		return "/teacher/manualQuestion";
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
		session.setAttribute("questionsubject", subject);
		logger.info("===== > subject" + subject);
		Integer questiontype = (Integer) session.getAttribute("questiontype");
		Integer questionsubject = (Integer) session.getAttribute("questionsubject");
		Date questiondate = (Date) session.getAttribute("questiondate");
		String content = (String) session.getAttribute("questioncontent");

		PageInfo<Question> pageInfo = service.queryByconditionCurrPage(1, 5, questiontype, questionsubject,
				questiondate, content);
		md.addAttribute("pageInfo", pageInfo);
		logger.info(pageInfo.getPageNum());
		return "/teacher/manualQuestion";
	}

	/**
	 * 日期
	 * 
	 * @param date
	 * @param session
	 * @param md
	 * @return
	 */
	@RequestMapping(value = "/querydate/{date}", method = RequestMethod.GET)
	public String queryDateFile(@PathVariable("date") Integer date, HttpSession session, Model md) {

		session.setAttribute("questiondate", getDateBefore(new Date(), date));
		session.setAttribute("questiondatenum", date);

		logger.info("===== > questiondate" + getDateBefore(new Date(), date));

		Integer questiontype = (Integer) session.getAttribute("questiontype");
		Integer questionsubject = (Integer) session.getAttribute("questionsubject");
		Date questiondate = (Date) session.getAttribute("questiondate");
		String content = (String) session.getAttribute("questioncontent");

		PageInfo<Question> pageInfo = service.queryByconditionCurrPage(1, 5, questiontype, questionsubject,
				questiondate, content);
		md.addAttribute("pageInfo", pageInfo);
		logger.info(pageInfo.getPageNum());
		return "/teacher/manualQuestion";
	}

	/**
	 * 计算日期
	 * 
	 * @param d
	 * @param day
	 * @return
	 */
	@SuppressWarnings("unused")
	private static Date getDateBefore(Date d, Integer day) {
		if (day == null) {
			return null;
		}
		Calendar now = Calendar.getInstance();
		now.setTime(d);
		now.set(Calendar.DATE, now.get(Calendar.DATE) - day.intValue());
		return now.getTime();
	}

	/**
	 * 存取查询信息
	 * 
	 * @param map
	 * @param session
	 */
	@RequestMapping(value = "/savecontent", method = RequestMethod.POST)
	public @ResponseBody void savecontent(@RequestParam Map<String, String> map, HttpSession session) {
		session.setAttribute("questioncontent", map.get("content"));
		logger.info(map.get("content"));
	}

	/**
	 * 增加试题
	 * 
	 * @param map
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/addQuestion", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> addQuestion(@RequestParam Map<String, String> map, HttpSession session) {
		Map<String, String> rmap = new HashMap<String, String>();
		TestPaperDto paper = (TestPaperDto) session.getAttribute("paper");
		if (paper == null) {
			paper = new TestPaperDto();
			paper.setCreateTime(new Date());
			paper.setUserId(((User) session.getAttribute("user")).getId());
			paper.setCheckQuestions(new HashMap<Integer, Question>());
			paper.setChoiceQuestions(new HashMap<Integer, Question>());
			paper.setComprehensiveQuestions(new HashMap<Integer, Question>());
			paper.setGapFillings(new HashMap<Integer, Question>());
			paper.setMultipleChoiceQuestions(new HashMap<Integer, Question>());
			paper.setQuestions(new HashMap<Integer, Question>());
			session.setAttribute("paper", paper);
		}
		logger.info("===paper:===" + paper);
		/* 获取试题信息 */
		Integer id = new Integer(map.get("id"));
		Question question = null;
		try {
			question = service.queryById(id);
		} catch (Exception e) {
			logger.error("添加试题错误！！");
			rmap.put("result", "false");
			return rmap;
		}
		if (question == null) {
			rmap.put("result", "false");
			return rmap;
		}
		logger.info("======question:======" + question);
		paper.getQuestions().put(question.getId(), question);

		Integer type = question.getQuestionType();
		/* 判断题 */
		if (type.equals(ExamConstant.CHECKQUESTIONS)) {
			paper.getCheckQuestions().put(question.getId(), question);
		}
		/* 单选题 */
		if (type.equals(ExamConstant.CHOICEQUESTION)) {
			paper.getChoiceQuestions().put(question.getId(), question);
		}
		/* 综合题 */
		if (type.equals(ExamConstant.COMPREHENSIVEQUESTIONS)) {
			paper.getComprehensiveQuestions().put(question.getId(), question);
		}
		/* 填空题 */
		if (type.equals(ExamConstant.GAPFILLING)) {
			paper.getGapFillings().put(question.getId(), question);
		}
		/* 多选题 */
		if (type.equals(ExamConstant.MULTIPLECHOICEQUESTIONS)) {
			paper.getMultipleChoiceQuestions().put(question.getId(), question);
		}
		rmap.put("result", "true");
		return rmap;

	}

	/**
	 * 删除试题
	 * 
	 * @param map
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/removeQuestion", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> removeQuestion(@RequestParam Map<String, String> map,
			HttpSession session) {
		Map<String, String> rmap = new HashMap<String, String>();
		TestPaperDto paper = (TestPaperDto) session.getAttribute("paper");
		if (paper == null) {
			rmap.put("result", "false");
			return rmap;
		}
		logger.info("===paper:===" + paper);
		/* 获取试题信息 */
		Integer id = new Integer(map.get("id"));
		Question question = null;
		try {
			question = service.queryById(id);
		} catch (Exception e) {
			logger.error("添加试题错误！！");
			rmap.put("result", "false");
			return rmap;
		}
		if (question == null) {
			rmap.put("result", "false");
			return rmap;
		}
		logger.info("======question:======" + question);
		paper.getQuestions().remove(id);
		Integer type = question.getQuestionType();
		/* 判断题 */
		if (type.equals(ExamConstant.CHECKQUESTIONS)) {
			paper.getCheckQuestions().remove(id);
		}
		/* 单选题 */
		if (type.equals(ExamConstant.CHOICEQUESTION)) {
			paper.getChoiceQuestions().remove(id);
		}
		/* 综合题 */
		if (type.equals(ExamConstant.COMPREHENSIVEQUESTIONS)) {
			paper.getComprehensiveQuestions().remove(id);
		}
		/* 填空题 */
		if (type.equals(ExamConstant.GAPFILLING)) {
			paper.getGapFillings().remove(id);
		}
		/* 多选题 */
		if (type.equals(ExamConstant.MULTIPLECHOICEQUESTIONS)) {
			paper.getMultipleChoiceQuestions().remove(id);
		}
		rmap.put("result", "true");
		return rmap;

	}

	/**
	 * 获取选题的数目
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/questionNum", method = RequestMethod.POST)
	public @ResponseBody Map<String, Integer> questionNum(HttpSession session) {
		Map<String, Integer> rmap = new HashMap<String, Integer>();
		TestPaperDto paper = (TestPaperDto) session.getAttribute("paper");
		if (paper == null) {
			return rmap;
		}
		/* 判断题 */
		if (paper.getCheckQuestions() != null && paper.getCheckQuestions().size() != 0) {
			rmap.put("判断题", paper.getCheckQuestions().size());
		}
		/* 单选题 */
		if (paper.getChoiceQuestions() != null && paper.getChoiceQuestions().size() != 0) {
			rmap.put("单选题", paper.getChoiceQuestions().size());
		}
		/* 综合题 */
		if (paper.getComprehensiveQuestions() != null && paper.getComprehensiveQuestions().size() != 0) {
			rmap.put("综合题", paper.getComprehensiveQuestions().size());
		}
		/* 填空题 */
		if (paper.getGapFillings() != null && paper.getGapFillings().size() != 0) {
			rmap.put("填空题", paper.getGapFillings().size());
		}
		/* 多选题 */
		if (paper.getMultipleChoiceQuestions() != null && paper.getMultipleChoiceQuestions().size() != 0) {
			rmap.put("多选题", paper.getMultipleChoiceQuestions().size());
		}
		return rmap;

	}

	/**
	 * 收藏试题
	 * 
	 * @param map
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/addCollectQuestion", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> addCollectQuestion(@RequestParam Map<String, String> map,
			HttpSession session) {
		Map<String, String> rmap = new HashMap<String, String>();
		Integer questId = new Integer(map.get("id"));
		Integer userId = ((User) session.getAttribute("user")).getId();
		TeaCollect collect = new TeaCollect();
		collect.setUserId(userId);
		collect.setQuestionId(questId);
		collect.setCollectTime(new Date());
		try {
			teaservice.insertTeaCollect(collect);
		} catch (Exception e) {
			rmap.put("result", "false");
			return rmap;
		}

		logger.info("===collect:===" + collect);

		rmap.put("result", "true");
		return rmap;
	}

	/**
	 * 取消收藏
	 * 
	 * @param map
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/removeCollectQuestion", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> removeCollectQuestion(@RequestParam Map<String, String> map,
			HttpSession session) {
		Map<String, String> rmap = new HashMap<String, String>();
		Integer questId = new Integer(map.get("id"));
		Integer userId = ((User) session.getAttribute("user")).getId();
		try {
			teaservice.removeTeaCollect(userId, questId);
		} catch (Exception e) {
			rmap.put("result", "false");
			return rmap;
		}
		rmap.put("result", "true");
		return rmap;
	}

	/**
	 * 换题目
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/change/{pageNo}/{pageSize}", method = RequestMethod.POST)
	public @ResponseBody Map<String, PageInfo<Question>> changeQuestion(@PathVariable("pageNo") int pageNo,
			@PathVariable int pageSize, @RequestParam Map<String, String> map) {
		Map<String, PageInfo<Question>> rmap = new HashMap<String, PageInfo<Question>>();
		Integer questId = new Integer(map.get("id"));
		Question question = service.queryById(questId);
		PageInfo<Question> pageInfo = service.queryByconditionCurrPage(pageNo, pageSize, question.getQuestionType(),
				question.getSubject(), null, null);
		rmap.put("pageInfo", pageInfo);
		return rmap;
	}

	/**
	 * 下载试卷
	 * 
	 * @param response
	 * @param session
	 * @param title
	 * @return
	 */
	@RequestMapping(value = "/downloadPaper", method = RequestMethod.POST)
	public String downloadPaper(HttpServletResponse response, HttpSession session, String title,Model md) {

		/* 保存paper */
		TestPaperDto paper = (TestPaperDto) session.getAttribute("paper");
		if (paper == null) {
			paper = new TestPaperDto();
			paper.setCreateTime(new Date());
			paper.setUserId(((User) session.getAttribute("user")).getId());
			paper.setCheckQuestions(new HashMap<Integer, Question>());
			paper.setChoiceQuestions(new HashMap<Integer, Question>());
			paper.setComprehensiveQuestions(new HashMap<Integer, Question>());
			paper.setGapFillings(new HashMap<Integer, Question>());
			paper.setMultipleChoiceQuestions(new HashMap<Integer, Question>());
			paper.setQuestions(new HashMap<Integer, Question>());
			session.setAttribute("paper", paper);
		}

		Integer userId = ((User) session.getAttribute("user")).getId();
		paper.setTitle(title);
		paper.setUserId(userId);
		paper.setCreator(((User) session.getAttribute("user")).getUsername());
		logger.info("===paper:===" + paper);
		paperservice.savePaper(paper);
		/* 转换为word */
		StringBuffer sb = HtmlToDoc.createPaper(paper);
		ByteArrayInputStream bais = null;

		byte b[] = sb.toString().getBytes();
		logger.info("=======》word" + sb.toString());
		bais = new ByteArrayInputStream(b);
		//
		try {
			POIFSFileSystem poifs = new POIFSFileSystem();
			DirectoryEntry directory = poifs.getRoot();
			DocumentEntry documentEntry = directory.createDocument("WordDocument", bais);

			/* 写入 */
			// 设置响应头和客户端保存文件名
			response.setCharacterEncoding("utf-8");
			// 多部分，字节流
			// response.setContentType("multipart/form-data");
			// response.setContentType("application/vnd.ms-excel") ;
			response.setContentType("application/msword");
			// application/msword
			// application/zip

			// 处理中文文件名
			String downloadFielName = new String((paper.getTitle() + ".doc").getBytes("UTF-8"), "iso-8859-1");
			response.setHeader("Content-Disposition", "attachment;fileName=" + downloadFielName);
			// 激活下载操作(response响应，响应字节流)
			OutputStream os = response.getOutputStream();
			// 循环写入输出流(创建buffer 2KB)

			poifs.writeFilesystem(os);
			// 清空管道缓存
			os.flush();
			// 流关闭，释放资源
			os.close();
			bais.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*清除session信息*/
		session.removeAttribute("paper");
		session.removeAttribute("questiontype");
		session.removeAttribute("questionsubject");
		session.removeAttribute("questiondate");
		session.removeAttribute("questioncontent");
		
		PageInfo<Question> pageInfo = service.queryByconditionCurrPage(1, 5, null, null, null, null);
		md.addAttribute("pageInfo", pageInfo);
		logger.info(pageInfo.getPageNum());
		return null;

	}
	/**
	 * 重新组卷/保存试卷
	 * @param session
	 * @param title
	 * @param md
	 * @return
	 */
	@RequestMapping(value = "/afreshPaper", method = RequestMethod.POST)
	public String afreshPaper(HttpSession session, String title,Model md) {
		logger.info(title);
		TestPaperDto paper = (TestPaperDto) session.getAttribute("paper");
		if (paper != null) {
			Integer userId = ((User) session.getAttribute("user")).getId();
			paper.setTitle(title);
			paper.setUserId(userId);
			paper.setCreator(((User) session.getAttribute("user")).getUsername());
			logger.info("===paper:===" + paper);
			paperservice.savePaper(paper);
		}
		/*清除session信息*/
		session.removeAttribute("paper");
		session.removeAttribute("questiontype");
		session.removeAttribute("questionsubject");
		session.removeAttribute("questiondate");
		session.removeAttribute("questioncontent");
		PageInfo<Question> pageInfo = service.queryByconditionCurrPage(1, 5, null, null, null, null);
		md.addAttribute("pageInfo", pageInfo);
		logger.info(pageInfo.getPageNum());
		return "/teacher/manualQuestion";
	}
	
	/**
	 * 重新组卷/不保存试卷
	 * @param session
	 * @param title
	 * @param md
	 * @return
	 */
	@RequestMapping(value = "/unsavePaper", method = RequestMethod.GET)
	public String unsavePaper(HttpSession session, String title,Model md) {
		/*清除session信息*/
		session.removeAttribute("paper");
		session.removeAttribute("questiontype");
		session.removeAttribute("questionsubject");
		session.removeAttribute("questiondate");
		session.removeAttribute("questioncontent");
		PageInfo<Question> pageInfo = service.queryByconditionCurrPage(1, 5, null, null, null, null);
		md.addAttribute("pageInfo", pageInfo);
		logger.info(pageInfo.getPageNum());
		return "/teacher/manualQuestion";
	}
	/**
	 * 保存试卷
	 * @param session
	 * @param title
	 * @param md
	 */
	@RequestMapping(value = "/savePaper", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> savePaper(HttpSession session, @RequestParam Map<String, String> map,Model md) {
		logger.info(map);
		String title = map.get("title");
		Map<String, String> rmap = new HashMap<String, String>();
		TestPaperDto paper = (TestPaperDto) session.getAttribute("paper");
		if (paper != null) {
			Integer userId = ((User) session.getAttribute("user")).getId();
			paper.setTitle(title);
			paper.setUserId(userId);
			paper.setCreator(((User) session.getAttribute("user")).getUsername());
			logger.info("===paper:===" + paper);
			paperservice.savePaper(paper);
			
		}
		rmap.put("result", "true");
		return rmap;
	}
	/**
	 * 试卷编辑
	 * @param paperId
	 * @param session
	 * @param md
	 * @return
	 */
	@RequestMapping(value = "/compile/{paperId}", method = RequestMethod.GET)
	public String compilePaper(@PathVariable("paperId") Integer paperId, HttpSession session, Model md) {
		logger.info(paperId);
		TestPaperDto paper = paperservice.queryPaperDto(paperId);
		logger.info(paper);
		session.removeAttribute("paper");
		session.setAttribute("paper", paper);
		Integer userId = ((User) session.getAttribute("user")).getId();
		List<TeaCollectDto> list = teaservice.queryByUserId(userId);
		HashMap<Integer, Question> collectQuestions = new HashMap<Integer, Question>();
		for (TeaCollectDto teaCollectDto : list) {
			collectQuestions.put(teaCollectDto.getQuestion().getId(), teaCollectDto.getQuestion());
		}
		session.setAttribute("collectQuestions", collectQuestions);
		return "/teacher/preview";
	}
	/**
	 * 自动组卷
	 * 
	 * @param session
	 * @param automaticPaper
	 * @return
	 */
	@RequestMapping(value = "/automaticpaper", method = RequestMethod.POST)
	public String automaticpaper(HttpSession session, AutomaticPaper automaticPaper) {
		logger.info("--------------->automaticPaper" + automaticPaper);
		/*清空试题蓝*/
		TestPaperDto paper = (TestPaperDto) session.getAttribute("paper");
		paper = new TestPaperDto();
		paper.setCreateTime(new Date());
		paper.setUserId(((User) session.getAttribute("user")).getId());
		paper.setCheckQuestions(new HashMap<Integer, Question>());
		paper.setChoiceQuestions(new HashMap<Integer, Question>());
		paper.setComprehensiveQuestions(new HashMap<Integer, Question>());
		paper.setGapFillings(new HashMap<Integer, Question>());
		paper.setMultipleChoiceQuestions(new HashMap<Integer, Question>());
		paper.setQuestions(new HashMap<Integer, Question>());
		session.setAttribute("paper", paper);
		Integer subject = automaticPaper.getSubject();
		/* 单选题 */
		List<Question> questions = service.queryBycondition(ExamConstant.CHOICEQUESTION, subject, null, null);
		automaticquestion(questions, automaticPaper.getChoiceQuestions(), paper.getChoiceQuestions(), paper.getQuestions());
		/* 单选题 */
		questions = service.queryBycondition(ExamConstant.GAPFILLING, subject, null, null);
		automaticquestion(questions, automaticPaper.getGapFillings(), paper.getGapFillings(), paper.getQuestions());
		/* 判断题 */
		questions = service.queryBycondition(ExamConstant.CHECKQUESTIONS, subject, null, null);
		automaticquestion(questions, automaticPaper.getCheckQuestions(), paper.getCheckQuestions(), paper.getQuestions());
		/* 多选题 */
		questions = service.queryBycondition(ExamConstant.MULTIPLECHOICEQUESTIONS, subject, null, null);
		automaticquestion(questions, automaticPaper.getMultipleChoiceQuestions(), paper.getMultipleChoiceQuestions(), paper.getQuestions());
		/* 综合题 */
		questions = service.queryBycondition(ExamConstant.COMPREHENSIVEQUESTIONS, subject, null, null);
		automaticquestion(questions, automaticPaper.getComprehensiveQuestions(), paper.getComprehensiveQuestions(), paper.getQuestions());
		
		return "/teacher/preview";

	}

	public void automaticquestion(List<Question> questions, int num, Map<Integer, Question> questionType,
			Map<Integer, Question> question) {
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
			System.out.println(t + "->" + intRet[t]);
			Question q = questions.get(intRet[t]);
			questionType.put(q.getId(), q);
			question.put(q.getId(), q);
		}

	}
	
}
