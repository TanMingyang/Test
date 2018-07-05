package com.exam.mapper;

import com.exam.pojo.PaperQuestion;
import com.exam.pojo.PaperQuestionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PaperQuestionMapper {
    int countByExample(PaperQuestionExample example);

    int deleteByExample(PaperQuestionExample example);

    int insert(PaperQuestion record);

    int insertSelective(PaperQuestion record);

    List<PaperQuestion> selectByExample(PaperQuestionExample example);

    int updateByExampleSelective(@Param("record") PaperQuestion record, @Param("example") PaperQuestionExample example);

    int updateByExample(@Param("record") PaperQuestion record, @Param("example") PaperQuestionExample example);
}