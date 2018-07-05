package com.exam.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;
import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.DocumentEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.stereotype.Service;

import com.exam.dto.TestPaperDto;
import com.exam.pojo.Question;

/**
 * @ClassName: HtmlToWord
 * @Description: TODO(将html文件导出为word)
 * @author tmy
 */
@Service
public class HtmlToDoc {
	private Logger logger = Logger.getLogger(HtmlToDoc.class);

	/**
	 * 
	 * (srcPath html文件 fileName保存的doc文件)
	 * 
	 * @param TODO
	 * @return void 返回类型
	 * @author tmy
	 */
	public static void htmlToWord(String inputHtml, String outputDoc) throws Exception {
		ByteArrayInputStream bais = null;
		FileOutputStream fos = null;
		try {
			if (!"".equals(outputDoc)) {
				File fileDir = new File(outputDoc);
				if (!fileDir.exists()) {
					fileDir.createNewFile();
				}
				//读取HTML字符串
				byte b[] = inputHtml.getBytes();
				bais = new ByteArrayInputStream(b);
				//
				POIFSFileSystem poifs = new POIFSFileSystem();
				DirectoryEntry directory = poifs.getRoot();
				DocumentEntry documentEntry = directory.createDocument("WordDocument", bais);
				
				fos = new FileOutputStream(outputDoc);
				poifs.writeFilesystem(fos);
				bais.close();
				fos.close();

			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (fos != null)
				fos.close();
			if (bais != null)
				bais.close();
		}
	}

	/**
	 * 读取html文件到字符串
	 * 
	 * @param inputHtml
	 * @return
	 * @throws Exception
	 */
	public static String readFile(String inputHtml) throws Exception {
		StringBuffer buffer = new StringBuffer("");
		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader(new FileInputStream(inputHtml),"GBK"));
			buffer = new StringBuffer();
			while (br.ready())
				buffer.append((char) br.read());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (br != null)
				br.close();
		}
		return buffer.toString();
	}
	
	public static StringBuffer createPaper(TestPaperDto paper){
		StringBuffer sb = new StringBuffer();
		int i = 1 ;/*记录题号*/
		int j = 1 ;/*记录题号*/
		sb.append("<html xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" xmlns:m=\"http://schemas.microsoft.com/office/2004/12/omml\"xmlns=\"http://www.w3.org/TR/REC-html40\">");
		/*选择题*/
		Map<Integer,Question> choiceQuestions = paper.getChoiceQuestions();
		if(choiceQuestions != null && !choiceQuestions.isEmpty()){
			sb.append("<h3>"+j+"、选择题</h3>");
			j++;
		}
		i = appendQuestion(sb, i, choiceQuestions);
		
		/*填空题*/
		Map<Integer,Question> gapFillings = paper.getGapFillings();
		if(gapFillings != null && !gapFillings.isEmpty()){
			sb.append("<h3>"+j+"、填空题</h3>");
			j++;
		}
		i = appendQuestion(sb, i, gapFillings);
		
		/*判断题*/
		Map<Integer,Question> checkQuestions = paper.getCheckQuestions();
		if(checkQuestions != null && !checkQuestions.isEmpty()){
			sb.append("<h3>"+j+"、判断题</h3>");
			j++;
		}
		i = appendQuestion(sb, i, checkQuestions);
		
		/*多选题*/
		Map<Integer,Question> multipleChoiceQuestions = paper.getMultipleChoiceQuestions();
		if(multipleChoiceQuestions != null && !multipleChoiceQuestions.isEmpty()){
			sb.append("<h3>"+j+"、多选题</h3>");
			j++;
		}
		i = appendQuestion(sb, i, multipleChoiceQuestions);
		
		/*综合题*/
		Map<Integer,Question> comprehensiveQuestions = paper.getComprehensiveQuestions();
		if(comprehensiveQuestions != null && !comprehensiveQuestions.isEmpty()){
			sb.append("<h3>"+j+"、综合题</h3>");
			j++;
		}
		i = appendQuestion(sb, i, comprehensiveQuestions);
		
		return sb;
		
	}

	private static int appendQuestion(StringBuffer sb, int i, Map<Integer, Question> choiceQuestions) {
		for (Entry<Integer, Question> ele : choiceQuestions.entrySet()) {
			Question question = ele.getValue();
			sb.append("<p>"+i+"、"+question.getContent()+"</p>");
			i++;
			if (question.getOption1()!=null && !question.getOption1().isEmpty()) {
				sb.append("<label>A：</label>"+question.getOption1()+"<br/>");
			}
			if (question.getOption2()!=null && !question.getOption2().isEmpty()) {
				sb.append("<label>B：</label>"+question.getOption2()+"<br/>");
			}
			if (question.getOption3()!=null && !question.getOption3().isEmpty()) {
				sb.append("<label>C：</label>"+question.getOption3()+"<br/>");
			}
			if (question.getOption4()!=null && !question.getOption4().isEmpty()) {
				sb.append("<label>D：</label>"+question.getOption4()+"<br/>");
			}
			if (question.getOption5()!=null && !question.getOption5().isEmpty()) {
				sb.append("<label>E：</label>"+question.getOption5()+"<br/>");
			}
		}
		return i;
	}
	 

	public static void main(String[] args) throws Exception {
		String string = "<h3>填空题</h3><p>一批设备价值<i>a</i>万元，由于使用磨损，每年比上一年价值降低<i>b</i>%，则<i>n</i>年后这批设备的价值为(　　)</p>"
				       +"<label>A：</label> AAA<br/>"+"<label>A：</label> AAA<br/>"+"<label>A：</label> AAA<br/>"+"<label>A：</label> AAA<br/>";
		String string2 = "E:"+File.separator+"file"+File.separator+"word"+File.separator+"2.doc";
		System.out.println(string);
		HtmlToDoc.htmlToWord(string, string2);
	}
}