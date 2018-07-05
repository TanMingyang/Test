package com.exam.service;

import java.util.List;

import com.exam.pojo.QuestionSubject;
import com.exam.pojo.QuestionType;

public interface TypeAndSubjectService {
	List<QuestionType> queryAllType();
	
	List<QuestionSubject> queryAllSubject();
}
