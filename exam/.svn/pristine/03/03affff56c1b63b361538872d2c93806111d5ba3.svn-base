package com.exam.service;

import java.util.Date;
import java.util.List;

import com.exam.pojo.Question;
import com.github.pagehelper.PageInfo;

public interface QuestionService {
	/**
	 * 查询所有的试题
	 * 
	 * @return
	 */
	public List<Question> queryAll();

	/**
	 * 查找试题
	 * 
	 * @param id
	 */
	public Question queryById(Integer id);

	/**
	 * 试题分页查询
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public PageInfo<Question> queryCurrPage(int pageNo, int pageSize);
	/**
	 * 
	 * @param type 题型
	 * @param subject 科目
	 * @param date 日期
	 * @return
	 */
	public List<Question> queryBycondition(Integer type,Integer subject,Date date,String content);
	
	/**
	 * 条件查询分页
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public PageInfo<Question> queryByconditionCurrPage(int pageNo, int pageSize,Integer type, Integer subject, Date date,String content);
	/**
	 * 添加试题
	 * @param question
	 * @return
	 */
	public int addQuestion(Question question);
	/**
	 * 修改试题
	 * @param question
	 * @return
	 */
	public int updateQuestion(Question question);
	/**
	 * 删除试题
	 * @param question
	 * @return
	 */
	public int deleteQuestion(Integer id);
	
	public List<Question> queryQuestionForExercise(Integer difficulty,Integer... subject);

}
