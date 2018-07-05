package com.exam.service;

import java.util.List;

import com.exam.pojo.File;
import com.github.pagehelper.PageInfo;

public interface FileService {
	public List<File> queryAll();
	
	public File queryById(Integer id);
	
	public PageInfo<File> queryCurrPage(int pageNo, int pageSize);
	
	public int save(File file);
	
	public int removeFile(Integer id);

}
