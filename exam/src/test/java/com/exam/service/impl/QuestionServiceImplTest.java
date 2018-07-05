package com.exam.service.impl;

import static org.junit.Assert.fail;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.exam.pojo.Question;
import com.exam.pojo.TeaCollect;
import com.exam.service.PaperService;
import com.exam.service.QuestionService;
import com.exam.service.TeaCollectService;
import com.github.pagehelper.PageInfo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:application.xml")
public class QuestionServiceImplTest {
	@Autowired
	QuestionService service;
	@Autowired
	TeaCollectService ser;
	@Autowired
	PaperService serv;
	@Test
	public void testQueryAll() {
		System.out.println(serv.queryPaperDto(new Integer(30)));
	}

	@Test
	public void testQueryById() {
		TeaCollect  collect= new TeaCollect();
		collect.setUserId(1);
		collect.setQuestionId(4);
		collect.setCollectTime(new Date());
		ser.insertTeaCollect(collect);
		System.out.println(ser.queryByUserId(1));
		ser.removeTeaCollect(1, 1);
	}

	@Test
	public void testQueryCurrPage() {
		PageInfo<Question> page = service.queryCurrPage(1, 3);
		System.out.println("======>"+page.getList().get(0));
		
	}

}
