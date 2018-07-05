package com.exam.util;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.print.DocFlavor.STRING;

import org.apache.log4j.Logger;

import com.artofsolving.jodconverter.DocumentConverter;
import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter;
import com.artofsolving.jodconverter.openoffice.converter.StreamOpenOfficeDocumentConverter;


/**
 * 
 * doc to pdf pdf to swf
 * @author Tan Mingyang 
 * @version $Revision:$
 */
public class DocConverter {
	private int environment = 1;// 环境 1：Windows 2：Linux
	private String fileString;// (只涉及PDF2swf路径问题)
	private String outputPath = "";// 输入路径 ，如果不设置就输出在默认 的位置
	private String fileName;
	private File pdfFile;
	private File swfFile;
	private File docFile;
	Logger logger = Logger.getLogger(DocConverter.class);

	public DocConverter(String fileString) {
		ini(fileString);
		logger.info("文件路径"+fileString);
	}
	
	public DocConverter(String fileString,int environment) {
		this.environment = environment;
		ini(fileString);
		logger.info("文件路径"+fileString);
	}
	/**
	 * * 重新设置file
	 * 
	 * @param fileString
	 *            32.
	 */
	public void setFile(String fileString) {
		ini(fileString);
	}

	/**
	 *  * 初始化 
	 * 
	 * @param fileString
	 *           
	 */
	private void ini(String fileString) {
		this.fileString = fileString;
		fileName = fileString.substring(0, fileString.lastIndexOf("."));
		docFile = new File(fileString);
		pdfFile = new File(fileName+ ".pdf");
		swfFile = new File(fileName+ ".swf");
	}

	/**
	 *  转为PDF 
	 * 
	 * @param file
	 *       
	 */
	private void doc2pdf() throws Exception {
		if (docFile.exists()) {
			if (!pdfFile.exists()) {
				//创建openoffice连接
				OpenOfficeConnection connection = new SocketOpenOfficeConnection(8100);
				try {
					connection.connect();
					DocumentConverter converter = new StreamOpenOfficeDocumentConverter(
							connection);
					//将doc装换为PDF
					converter.convert(docFile, pdfFile);
					// close the connection
					connection.disconnect();
					logger.info("****pdf转换成功，PDF输出： "+ pdfFile.getPath() + "****");
				} catch (java.net.ConnectException e) {
					logger.error(e.getMessage());
					e.printStackTrace();
					logger.error("****swf转换器异常，openoffice 服务未启动！****");
					throw e;
				} catch (com.artofsolving.jodconverter.openoffice.connection.OpenOfficeException e) {
					logger.error(e.getMessage());
					e.printStackTrace();
					logger.info("****swf转换器异常，读取转换文件 失败****");
					throw e;
				} catch (Exception e) {
					logger.error(e.getMessage());
					e.printStackTrace();
					throw e;
				}
			} else {
				logger.info("****已经转换为pdf，不需要再进行转化 ****");
			}
		} else {
			logger.info("****swf转换器异常，需要转换的文档不存在， 无法转换****");
		}
	}

	/** * 转换成 swf */
	@SuppressWarnings("unused")
	private void pdf2swf() throws Exception {
		Runtime r = Runtime.getRuntime();
		if (!swfFile.exists()) {
			if (pdfFile.exists()) {
				if (environment == 1) {// windows环境处理
					try {
						String string = "D://Program Files//swf//pdf2swf.exe "+" -i "+ pdfFile.getPath() + " -o "+ swfFile.getPath();
						Process p = r.exec(string);
						logger.info(loadStream(p.getInputStream()));
						logger.info(loadStream(p.getErrorStream()));
						logger.info(loadStream(p.getInputStream()));
						logger.info("****swf转换成功，文件输出： "+swfFile.getPath() + "****");
						/*if (pdfFile.exists()){
							pdfFile.delete();
						}*/
					} catch (IOException e) {
						logger.error(e.getMessage());
						e.printStackTrace();
						throw e;
					}
				} else if (environment == 2) {// linux环境处理
					try {
						Process p = r.exec("pdf2swf" + pdfFile.getPath()+ " -o " + swfFile.getPath() + " -T 9");
						logger.info(loadStream(p.getInputStream()));
						logger.info(loadStream(p.getErrorStream()));
						logger.info("****swf转换成功，文件输出： "+ swfFile.getPath() + "****");
						if (pdfFile.exists()) {
							pdfFile.delete();
						}
					} catch (Exception e) {
						logger.error(e.getMessage());
						e.printStackTrace();
						throw e;
					}
				}
			} else {
				logger.info("****pdf不存在,无法转换****");
			}
		} else {
			logger.info("****swf已经存在不需要转换****");
		}
	}

	static String loadStream(InputStream in) throws IOException {
		int ptr = 0;
		in = new BufferedInputStream(in);
		StringBuffer buffer = new StringBuffer();
		while ((ptr = in.read()) != -1) {
			buffer.append((char) ptr);
		}
		return buffer.toString();
	}
	
	/**
	 * * 转换主方法
	 */
	@SuppressWarnings("unused")
	public boolean conver() {
		if (swfFile.exists()) {
			logger.info("****swf转换器开始工作，该文件已经转换为 swf****");
			return true;
		}
		if (environment == 1) {
			logger.info("****swf转换器开始工作，当前设置运行环境 windows****");
		} else {
			logger.info("****swf转换器开始工作，当前设置运行环境 linux****");
		}
		try {
			doc2pdf();
			pdf2swf();
		} catch (Exception e) {
			
			  e.printStackTrace();
			  return false;
		}
		if (swfFile.exists()) {
			logger.info("文件装换成功");
			return true;
		} else {
			logger.info("文件装换失败");
			return false;
		}
	}

	/**
	 *返回文件路径      
	 * @param     
	 */
	public String getswfPath(){
		if (this.swfFile.exists()){
			String tempString = swfFile.getPath();
			logger.info("getswfPath()：最后文件路径为"+tempString);
			return tempString;
		} else {
			return "getswfPath()：文件不存在";
		}
	}

	/**
	 * 设置输出路径
	 * 
	 * @param outputPath
	 */
	public void setOutputPath(String outputPath){
		this.outputPath = outputPath;
		if (!outputPath.equals("")) {
			String realName = fileString.substring(fileString.lastIndexOf(File.separator)+1,fileString.lastIndexOf("."));
			if (outputPath.charAt(outputPath.length()-1) == File.separatorChar) {
				swfFile = new File(outputPath + realName + ".swf");
			} else {
				swfFile = new File(outputPath +File.separator+ realName + ".swf");
			}
		}
	}
	
	public static void main(String[] args) {
//		String string = "E:"+File.separator+"work"+File.separator+".metadata"+File.separator+".plugins"+File.separator+"org.eclipse.wst.server.core"+File.separator+"tmp0"+File.separator+"wtpwebapps"+File.separator+"test"+File.separator+"file"+File.separator+"upload"+File.separator+"ccc.doc";
		String string = "E:"+File.separator+"file"+File.separator+"word"+File.separator+"dc41b54e-e6c4-48e5-90fe-1f292b8ec6b.doc";
		System.out.println(string);
		DocConverter docConverter = new DocConverter(string);
//		DocConverter docConverter = new DocConverter("F:"+File.separator+"file"+File.separator+"doc"+File.separator+"计算机工程学院毕业设计选题、审题表--2018年模板.doc");
		try {
			docConverter.setOutputPath("F:"+File.separator+"file"+File.separator+"swf");
			docConverter.conver();
			System.out.println("========"+docConverter.getswfPath());
			System.out.println(System.getProperty("user.dir"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

