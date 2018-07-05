package com.exam.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.constant.ExamConstant;
import com.exam.mapper.QuestionMapper;
import com.exam.pojo.Question;
import com.exam.pojo.QuestionExample;
import com.exam.pojo.QuestionExample.Criteria;
import com.exam.service.QuestionService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("QuestionService")
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	private QuestionMapper service;

	public List<Question> queryAll() {
		QuestionExample example = new QuestionExample();
		example.createCriteria().andIdIsNotNull();
		return service.selectByExample(example);
	}

	public Question queryById(Integer id) {
		
		return service.selectByPrimaryKey(id);
		
	}

	public PageInfo<Question> queryCurrPage(int pageNo, int pageSize) {
		PageHelper.startPage(pageNo,pageSize);
		List<Question> list = this.queryAll();
		return new PageInfo<Question>(list);
	}

	public List<Question> queryBycondition(Integer type, Integer subject, Date date,String content) {
		QuestionExample example = new QuestionExample();
		Criteria quest = example.createCriteria();
		if(type != null){
			quest.andQuestionTypeEqualTo(type);
		}
		if(subject != null){
			quest.andSubjectEqualTo(subject);
		}
		if (date != null) {
			quest.andCreateTimeGreaterThanOrEqualTo(date);
		}
		if (content != null) {
			quest.andContentLike("%"+content+"%");
		}
		return service.selectByExample(example);
	}

	public PageInfo<Question> queryByconditionCurrPage(int pageNo, int pageSize,Integer type, Integer subject, Date date ,String content) {
		PageHelper.startPage(pageNo,pageSize);
		List<Question> list = this.queryBycondition(type,subject,date,content);
		return new PageInfo<Question>(list);
	}

	public int addQuestion(Question question) {
		// TODO Auto-generated method stub
		return service.insert(question);
	}

	public int updateQuestion(Question question) {
		// TODO Auto-generated method stub
		return service.updateByPrimaryKeySelective(question);
	}

	public int deleteQuestion(Integer id) {
		// TODO Auto-generated method stub
		return service.deleteByPrimaryKey(id);
	}

	public List<Question> queryQuestionForExercise(Integer difficulty, Integer... subject) {
		QuestionExample example = new QuestionExample();
		for (Integer integer : subject) {
			example.or().andDifficultyEqualTo(difficulty).andQuestionTypeEqualTo(ExamConstant.CHOICEQUESTION).andSubjectEqualTo(integer);
		}
		return service.selectByExample(example);
	}



}
