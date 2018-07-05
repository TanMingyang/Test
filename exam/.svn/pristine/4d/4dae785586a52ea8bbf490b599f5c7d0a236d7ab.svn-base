package com.exam.service;

import java.util.List;

import com.exam.dto.TeaCollectDto;
import com.exam.pojo.Question;
import com.exam.pojo.TeaCollect;
import com.github.pagehelper.PageInfo;

public interface TeaCollectService {
	/**
	 * 查找用户搜藏的试题
	 * 
	 * @param userId
	 * @return
	 */
	public List<TeaCollectDto> queryByUserId(Integer userId);

	/**
	 * 收藏
	 * 
	 * @param collect
	 * @return
	 */
	public int insertTeaCollect(TeaCollect collect);

	/**
	 * 移出
	 * 
	 * @param id
	 * @return
	 */
	public int removeTeaCollect(Integer userId, Integer questId);
	/**
	 * 分页
	 * @param pageNo
	 * @param pageSize
	 * @param userId
	 * @return
	 */
	public PageInfo<TeaCollectDto> queryCurrPage(int pageNo, int pageSize, Integer userId);

}
