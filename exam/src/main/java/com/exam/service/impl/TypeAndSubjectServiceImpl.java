package com.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.exam.mapper.QuestionSubjectMapper;
import com.exam.mapper.QuestionTypeMapper;
import com.exam.pojo.QuestionSubject;
import com.exam.pojo.QuestionSubjectExample;
import com.exam.pojo.QuestionType;
import com.exam.pojo.QuestionTypeExample;
import com.exam.service.TypeAndSubjectService;

public class TypeAndSubjectServiceImpl implements TypeAndSubjectService{

	@Autowired
	private QuestionTypeMapper qtmapper;
	@Autowired
	private QuestionSubjectMapper qsmapper;
	public List<QuestionType> queryAllType() {
		QuestionTypeExample example = new QuestionTypeExample();
		example.createCriteria().andStateEqualTo("1");
		return qtmapper.selectByExample(example);
	}

	public List<QuestionSubject> queryAllSubject() {
		QuestionSubjectExample example = new QuestionSubjectExample();
		example.createCriteria().andStateEqualTo("1");
		return qsmapper.selectByExample(example);
	}

}
