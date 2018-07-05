package com.exam.dto;

import java.util.Date;
import java.util.Map;


import com.exam.pojo.Question;

public class TestPaperDto {

	private Integer id;

	private Integer userId;

	private String title;

	private Date createTime;
	
	private String creator;

	/**
	 * 单选题
	 */
	private Map<Integer,Question> choiceQuestions;
	
	/**
	 * 填空题
	 */
	private Map<Integer,Question> gapFillings ;
	
	/**
	 * 判断题
	 */
	private Map<Integer,Question> checkQuestions ;
	
	/**
	 * 多选题
	 */
	private Map<Integer,Question> multipleChoiceQuestions;
	
	/**
	 * 综合题
	 */
	private Map<Integer,Question> comprehensiveQuestions;
	
	private Map<Integer,Question> questions;

	@Override
	public String toString() {
		return "TestPaperDto [id=" + id + ", userId=" + userId + ", title=" + title + ", createTime=" + createTime
				+ ", choiceQuestions=" + choiceQuestions + ", gapFillings=" + gapFillings + ", checkQuestions="
				+ checkQuestions + ", multipleChoiceQuestions=" + multipleChoiceQuestions + ", comprehensiveQuestions="
				+ comprehensiveQuestions + ", Questions=" + questions + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Map<Integer, Question> getChoiceQuestions() {
		return choiceQuestions;
	}

	public void setChoiceQuestions(Map<Integer, Question> choiceQuestions) {
		this.choiceQuestions = choiceQuestions;
	}

	public Map<Integer, Question> getGapFillings() {
		return gapFillings;
	}

	public void setGapFillings(Map<Integer, Question> gapFillings) {
		this.gapFillings = gapFillings;
	}

	public Map<Integer, Question> getCheckQuestions() {
		return checkQuestions;
	}

	public void setCheckQuestions(Map<Integer, Question> checkQuestions) {
		this.checkQuestions = checkQuestions;
	}

	public Map<Integer, Question> getMultipleChoiceQuestions() {
		return multipleChoiceQuestions;
	}

	public void setMultipleChoiceQuestions(Map<Integer, Question> multipleChoiceQuestions) {
		this.multipleChoiceQuestions = multipleChoiceQuestions;
	}

	public Map<Integer, Question> getComprehensiveQuestions() {
		return comprehensiveQuestions;
	}

	public void setComprehensiveQuestions(Map<Integer, Question> comprehensiveQuestions) {
		this.comprehensiveQuestions = comprehensiveQuestions;
	}

	public Map<Integer, Question> getQuestions() {
		return questions;
	}

	public void setQuestions(Map<Integer, Question> questions) {
		this.questions = questions;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}
	
}