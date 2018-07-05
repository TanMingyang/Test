package com.exam.mapper;

import com.exam.pojo.QuestionType;
import com.exam.pojo.QuestionTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface QuestionTypeMapper {
    int countByExample(QuestionTypeExample example);

    int deleteByExample(QuestionTypeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QuestionType record);

    int insertSelective(QuestionType record);

    List<QuestionType> selectByExample(QuestionTypeExample example);

    QuestionType selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QuestionType record, @Param("example") QuestionTypeExample example);

    int updateByExample(@Param("record") QuestionType record, @Param("example") QuestionTypeExample example);

    int updateByPrimaryKeySelective(QuestionType record);

    int updateByPrimaryKey(QuestionType record);
}