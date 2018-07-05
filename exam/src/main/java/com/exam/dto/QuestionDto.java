package com.exam.dto;

import com.exam.pojo.Question;

public class QuestionDto {
	
	private Question question;
	
	private String stuAnswer;

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public String getStuAnswer() {
		return stuAnswer;
	}

	public void setStuAnswer(String stuAnswer) {
		this.stuAnswer = stuAnswer;
	}

	@Override
	public String toString() {
		return "QuestionDto [question=" + question + ", stuAnswer=" + stuAnswer + "]";
	}

}
