package com.exam.mapper;

import com.exam.pojo.QuestionSubject;
import com.exam.pojo.QuestionSubjectExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface QuestionSubjectMapper {
    int countByExample(QuestionSubjectExample example);

    int deleteByExample(QuestionSubjectExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(QuestionSubject record);

    int insertSelective(QuestionSubject record);

    List<QuestionSubject> selectByExample(QuestionSubjectExample example);

    QuestionSubject selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") QuestionSubject record, @Param("example") QuestionSubjectExample example);

    int updateByExample(@Param("record") QuestionSubject record, @Param("example") QuestionSubjectExample example);

    int updateByPrimaryKeySelective(QuestionSubject record);

    int updateByPrimaryKey(QuestionSubject record);
}