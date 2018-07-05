package com.exam.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.constant.ExamConstant;
import com.exam.dto.TestPaperDto;
import com.exam.mapper.PaperQuestionMapper;
import com.exam.mapper.QuestionMapper;
import com.exam.mapper.TestpaperMapper;
import com.exam.pojo.PaperQuestion;
import com.exam.pojo.PaperQuestionExample;
import com.exam.pojo.Question;
import com.exam.pojo.Testpaper;
import com.exam.pojo.TestpaperExample;
import com.exam.pojo.User;
import com.exam.service.PaperService;
@Service("PaperService")
public class PaperServiceImpl implements PaperService {
	@Autowired
	private TestpaperMapper paperMapper;
	@Autowired
	private PaperQuestionMapper pqmapper;
	@Autowired
	private QuestionMapper qmapper;

	public int savePaper(TestPaperDto paper) {
		if (paper.getId()!=null) {
			Integer id = paper.getId();
			PaperQuestionExample ex = new PaperQuestionExample();
			ex.createCriteria().andPaperIdEqualTo(id);
			pqmapper.deleteByExample(ex);
			paperMapper.deleteByPrimaryKey(id);
		}
		/*删除同名试卷*/
		TestpaperExample example = new TestpaperExample();
		example.createCriteria().andTitleEqualTo(paper.getTitle());
		List<Testpaper> list = paperMapper.selectByExample(example);
		if (list !=null && list.size()!=0) {
			Integer id = list.get(0).getPaperId();
			PaperQuestionExample ex = new PaperQuestionExample();
			ex.createCriteria().andPaperIdEqualTo(id);
			pqmapper.deleteByExample(ex);
			paperMapper.deleteByPrimaryKey(id);
		}
		/*保存试卷*/
		Testpaper testpaper = new Testpaper();
		testpaper.setTitle(paper.getTitle());
		testpaper.setUserId(paper.getUserId());
		testpaper.setCreator(paper.getCreator());
		testpaper.setCreateTime(new Date());
		paperMapper.insertPaper(testpaper);
		int paperId = testpaper.getPaperId();
		Map<Integer, Question> questions = paper.getQuestions();
		for (Entry<Integer, Question> question : questions.entrySet()) {
			PaperQuestion pq = new PaperQuestion();
			pq.setQuestionId(question.getValue().getId());
			pq.setPaperId(paperId);
			pqmapper.insert(pq);
		}
		return paperId;
	}

	public List<Testpaper> queryByUserId(Integer userId) {
		TestpaperExample example = new TestpaperExample();
		example.createCriteria().andUserIdEqualTo(userId);
		return paperMapper.selectByExample(example);
	}

	public TestPaperDto queryPaperDto(Integer paperId) {
		Testpaper testpaper = paperMapper.selectByPrimaryKey(paperId);
		PaperQuestionExample example = new PaperQuestionExample();
		example.createCriteria().andPaperIdEqualTo(paperId);
		List<PaperQuestion> list = pqmapper.selectByExample(example);
		TestPaperDto paper = new TestPaperDto();
		paper.setId(paperId);
		paper.setTitle(testpaper.getTitle());
		paper.setCheckQuestions(new HashMap<Integer, Question>());
		paper.setChoiceQuestions(new HashMap<Integer, Question>());
		paper.setComprehensiveQuestions(new HashMap<Integer, Question>());
		paper.setGapFillings(new HashMap<Integer, Question>());
		paper.setMultipleChoiceQuestions(new HashMap<Integer, Question>());
		paper.setQuestions(new HashMap<Integer, Question>());
		for (PaperQuestion paperQuestion : list) {
			Question question = qmapper.selectByPrimaryKey(paperQuestion.getQuestionId());
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
		}
		return paper;
	}

}
