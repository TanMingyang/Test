package com.exam.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.exam.pojo.User;
import com.exam.service.FileService;
import com.exam.util.DocConverter;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/file")
public class FileController {
	private Logger logger = Logger.getLogger(FileController.class);
	@Autowired
	private FileService fileService;
	/**
	 * 初始化
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/allfile", method = RequestMethod.GET)
	public String queryAllFile(Model model) {
		List<com.exam.pojo.File> list = fileService.queryAll();
		model.addAttribute("flist", list);
		logger.info("===>file"+list);
		Subject subject = SecurityUtils.getSubject();
		
		if (subject.hasRole("teacher")) {
			return "/teacher/testpaperbank";
		}
		if (subject.hasRole("admin")) {
			return "/admin/testpaperrecord";
		}
		return null;
	}
	/**
	 * 文件分页
	 * @param pageNo
	 * @param pageSize
	 * @param md
	 * @return
	 */
	@RequestMapping(value = "/{pageNo}/{pageSize}", method = RequestMethod.GET)
	public String queryAllFile(@PathVariable("pageNo") int pageNo, @PathVariable int pageSize, Model md) {
		PageInfo<com.exam.pojo.File> pageInfo = fileService.queryCurrPage(pageNo, pageSize);
		md.addAttribute("fpageInfo", pageInfo);
		return "";
	}
	/**
	 * 文件上传
	 * @param md
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String fupload(Model md, @RequestParam("file") MultipartFile file, HttpSession session,Model model,String keyword) {
		logger.info("========upload start!===============");
		if (!file.isEmpty()) {
			// 获得图片 字节数组，通过 流 写到服务器
			// byte[] data = headPic.getBytes() ;
			// 获得项目部署的路径
			String path = "E:"+File.separator+"file"+File.separator+"word";
			logger.info("=======路径：=========" + path);
			String filename = file.getOriginalFilename();
			String prefix=filename.substring(filename.lastIndexOf("."));
			String fileName = UUID.randomUUID().toString()+prefix;
			logger.info("=======文件名：=========" + fileName);
			String username = ((User) session.getAttribute("user")).getUsername();
			com.exam.pojo.File file2 = new com.exam.pojo.File();
			file2.setPath(path);
			file2.setFilename(fileName);
			file2.setCreateTime(new Date());
			file2.setKeyword(keyword);
			logger.info(fileName.substring(0, fileName.indexOf(".")));
			file2.setTitle(filename.substring(0, filename.indexOf(".")));
			
			file2.setCreator(username);
			fileService.save(file2);
			try {
				logger.info("=======上传文件名：=========" + fileName);
				File targetFile = new File(path, fileName);
				file.transferTo(targetFile);
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		 return "/admin/uploadpaper";
	}
	/**
	 * 文件下载
	 * @param request
	 * @param response
	 * @param fid
	 * @throws IOException
	 */
	@RequestMapping(value = "/download/{fid}", method = RequestMethod.GET)
	public void downloadFile(HttpServletRequest request, HttpServletResponse response, @PathVariable("fid")String fid) throws IOException {
		// 获得tomcat 路径
		logger.info("======download start==============");
		com.exam.pojo.File fileword = fileService.queryById(Integer.parseInt(fid));
		String path = fileword.getPath();
		final String fileName = fileword.getFilename();
		File file = new File(path + File.separator + fileName);
		logger.info("=========路径：============" + path);
		logger.info("=========文件名：============" + file);
		// 设置响应头和客户端保存文件名
		response.setCharacterEncoding("utf-8");
		// 多部分，字节流
		// response.setContentType("multipart/form-data");
		// response.setContentType("application/vnd.ms-excel") ;
		response.setContentType("application/msword");
		// application/msword
		// application/zip

		// 处理中文文件名
		String downloadFielName = new String(fileName.getBytes("UTF-8"), "iso-8859-1");
		response.setHeader("Content-Disposition", "attachment;fileName=" + downloadFielName);
		// 打开本地文件流(获得输入流，从本地服务器读取文件)
		InputStream is = new FileInputStream(file);
		// 激活下载操作(response响应，响应字节流)
		OutputStream os = response.getOutputStream();
		// 循环写入输出流(创建buffer 2KB)
		byte[] b = new byte[2048];
		int length = 0;
		// 读到文件结尾
		while ((length = is.read(b)) != -1) {
			// 输出流 输出（响应）
			os.write(b, 0, length);
		}
		// 清空管道缓存
		os.flush();
		// 流关闭，释放资源
		os.close();
		is.close();
	}
	/**
	 * 文件预览
	 * @param map
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/yulan")
	public @ResponseBody Map<String, Object> FileAjax(@RequestParam Map<String, String> map,HttpServletRequest request){
		Map<String, Object> rmap = new HashMap<String, Object>();
		logger.info("======ajax start======");
		String fid = map.get("fid");
		//获取文档来源
		com.exam.pojo.File fileword = fileService.queryById(Integer.parseInt(fid));
		String inpath = fileword.getPath()+File.separator+fileword.getFilename();
		logger.info("======inpath======"+inpath);
		//设置转换后的目录
		String outpath = request.getServletContext().getRealPath("/")+"swf" ;
		logger.info("======outpath======"+outpath);
		//开始转换为swf文件，并将其保存在发布项目路径下
		DocConverter docConverter = new DocConverter(inpath);
		docConverter.setOutputPath(outpath);
		docConverter.conver();
		//装换为相对路径
		String filename = fileword.getFilename().substring(0, fileword.getFilename().lastIndexOf("."));
		String swf = "/swf/"+filename+".swf";
		rmap.put("swf",swf );
		logger.info("======swf======"+swf);
		return rmap;
		
	}
	/**
	 * 删除文件
	 * @param map
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/removefile", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> removefile(@RequestParam Map<String, String> map){
		Map<String, Object> rmap = new HashMap<String, Object>();
		Integer id = new Integer(map.get("id"));
		try {
			fileService.removeFile(id);
		} catch (Exception e) {
			logger.error("禁用用户错误！！");
			rmap.put("result", "false");
			return rmap;
		}
		rmap.put("result", "true");
		return rmap;
	}
	
	
}
