package com.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exam.mapper.FileMapper;
import com.exam.pojo.File;
import com.exam.pojo.FileExample;
import com.exam.service.FileService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("FileService")
public class FileServiceImpl implements FileService {

	@Autowired
	private FileMapper mapper;

	public List<File> queryAll() {
		FileExample fileExample = new FileExample();
		fileExample.createCriteria().andIdIsNotNull().andTitleIsNotNull();
		return mapper.selectByExample(fileExample);
	}

	public File queryById(Integer id) {
		return mapper.selectByPrimaryKey(id);
	}

	public PageInfo<File> queryCurrPage(int pageNo, int pageSize) {
		PageHelper.startPage(pageNo,pageSize);
		List<File> list = this.queryAll();
		return new PageInfo<File>(list);
	}

	public int save(File file) {
		return mapper.insert(file);
	}

	public int removeFile(Integer id) {
		// TODO Auto-generated method stub
		return mapper.deleteByPrimaryKey(id);
	}

}
