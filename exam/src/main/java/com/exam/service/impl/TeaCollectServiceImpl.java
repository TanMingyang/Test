package com.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.dto.TeaCollectDto;
import com.exam.mapper.TeaCollectMapper;
import com.exam.pojo.Question;
import com.exam.pojo.TeaCollect;
import com.exam.pojo.TeaCollectExample;
import com.exam.service.TeaCollectService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service("TeaCollectService")
public class TeaCollectServiceImpl implements TeaCollectService{

	@Autowired
	private TeaCollectMapper mapper;
	
	public List<TeaCollectDto> queryByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return mapper.selectByUserId(userId);
	}

	public int insertTeaCollect(TeaCollect collect) {
		
		return mapper.insert(collect);
	}

	public int removeTeaCollect(Integer userId, Integer questId) {
		TeaCollectExample example = new TeaCollectExample();
		example.createCriteria().andUserIdEqualTo(userId).andQuestionIdEqualTo(questId);
		return mapper.deleteByExample(example);
	}

	public PageInfo<TeaCollectDto> queryCurrPage(int pageNo, int pageSize, Integer userId) {
		PageHelper.startPage(pageNo,pageSize);
		List<TeaCollectDto> list = this.queryByUserId(userId);
		return new PageInfo<TeaCollectDto>(list);
	}

}
