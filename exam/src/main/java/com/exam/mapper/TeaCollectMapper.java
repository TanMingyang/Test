package com.exam.mapper;

import com.exam.dto.TeaCollectDto;
import com.exam.pojo.TeaCollect;
import com.exam.pojo.TeaCollectExample;
import com.exam.pojo.TeaCollectKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TeaCollectMapper {
    int countByExample(TeaCollectExample example);

    int deleteByExample(TeaCollectExample example);

    int deleteByPrimaryKey(TeaCollectKey key);

    int insert(TeaCollect record);

    int insertSelective(TeaCollect record);

    List<TeaCollect> selectByExample(TeaCollectExample example);
    
    List<TeaCollectDto> selectByUserId(Integer userId);

    TeaCollect selectByPrimaryKey(TeaCollectKey key);

    int updateByExampleSelective(@Param("record") TeaCollect record, @Param("example") TeaCollectExample example);

    int updateByExample(@Param("record") TeaCollect record, @Param("example") TeaCollectExample example);

    int updateByPrimaryKeySelective(TeaCollect record);

    int updateByPrimaryKey(TeaCollect record);
}