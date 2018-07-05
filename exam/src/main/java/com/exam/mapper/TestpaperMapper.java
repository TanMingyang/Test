package com.exam.mapper;

import com.exam.pojo.Testpaper;
import com.exam.pojo.TestpaperExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TestpaperMapper {
    int countByExample(TestpaperExample example);

    int deleteByExample(TestpaperExample example);

    int deleteByPrimaryKey(Integer paperId);

    int insert(Testpaper record);

    int insertSelective(Testpaper record);

    List<Testpaper> selectByExample(TestpaperExample example);

    Testpaper selectByPrimaryKey(Integer paperId);

    int updateByExampleSelective(@Param("record") Testpaper record, @Param("example") TestpaperExample example);

    int updateByExample(@Param("record") Testpaper record, @Param("example") TestpaperExample example);

    int updateByPrimaryKeySelective(Testpaper record);

    int updateByPrimaryKey(Testpaper record);

	int insertPaper(Testpaper testpaper);
}