<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>Exam By Tmy</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Fonts -->
		<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
		<!-- CSS Libs -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/animate.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/bootstrap-switch.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/checkbox3.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/jquery.dataTables.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/dataTables.bootstrap.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/select2.min.css">
		<!-- CSS App -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/themes/flat-blue.css">
	</head>

	<body class="flat-blue">
		<div class="app-container">
			<div class="row content-container">
				<nav class="navbar navbar-default navbar-fixed-top navbar-top">
					<div class="container-fluid">
						<!--左菜单-->
						<div class="navbar-header">
							<button type="button" class="navbar-expand-toggle">
                            <i class="fa fa-bars icon"></i>
                        </button>
							<ol class="breadcrumb navbar-breadcrumb">
								<li>试题中心</li>
								<li class="active">试题信息</li>
							</ol>
							<button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                            <i class="fa fa-th icon"></i>
                        </button>
						</div>
						<!--右菜单-->
						<ul class="nav navbar-nav navbar-right">
							<button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                            <i class="fa fa-times icon"></i>
                        </button>
							<li class="dropdown profile">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Logout <span class="caret"></span></a>
								<ul class="dropdown-menu animated fadeInDown">
									<li class="profile-img">
										<img src="" class="profile-img">
									</li>
									<li>
										<div class="profile-info">
											<h4 class="username">${sessionScope.user.username}</h4>
											<p>${sessionScope.user.email}</p>
											<div class="btn-group margin-bottom-2x" role="group">
												<a type="button" class="btn btn-default" href="${pageContext.request.contextPath}/user/logout.do"><i  class="fa fa-sign-out"></i> Logout</a>
											</div>
										</div>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
				<div class="side-menu sidebar-inverse">
					<!--菜单-->
					<nav class="navbar navbar-default" role="navigation">
						<div class="side-menu-container">
							<div class="navbar-header">
								<a class="navbar-brand" href="#">
									<div class="icon fa fa-paper-plane"></div>
									<div class="title">Exam</div>
								</a>
								<button type="button" class="navbar-expand-toggle pull-right visible-xs">
                                <i class="fa fa-times icon"></i>
                            </button>
							</div>
							<!--菜单-->
							<ul class="nav navbar-nav">
								<!--个人中心-->
								<li class="panel panel-default dropdown ">
									<a data-toggle="collapse" href="#dropdown-element">
										<span class="icon fa fa-desktop"></span><span class="title">个人中心</span>
									</a>
									<!-- Dropdown level 1 -->
									<div id="dropdown-element" class="panel-collapse collapse">
										<div class="panel-body">
											<ul class="nav navbar-nav">
												<li>
													<a href="${pageContext.request.contextPath}/jump/adminUserInfo.do">个人信息</a>
												</li>
												<li>
													<a href="${pageContext.request.contextPath}/admin/userrecord.do">用户信息</a>
												</li>
											</ul>
										</div>
									</div>
								</li>

								<!-- 组卷-->
								<li class="panel panel-default dropdown active">
									<a data-toggle="collapse" href="#dropdown-zujuan">
										<span class="icon fa fa-archive"></span><span class="title">试题中心</span>
									</a>
									<!-- Dropdown level 1 -->
									<div id="dropdown-zujuan" class="panel-collapse collapse">
										<div class="panel-body">
											<ul class="nav navbar-nav">
												<li>
													<a href="${pageContext.request.contextPath}/admin/questionrecord.do">试题信息</a>
												</li>
												<li>
													<a href="${pageContext.request.contextPath}/jump/uploadquestion.do">批量添加试题</a>
												</li>
											</ul>
										</div>
									</div>
								</li>
								
								<!-- 试卷库-->
								<li class="panel panel-default dropdown ">
									<a data-toggle="collapse" href="#dropdown-shijuan">
										<span class="icon fa fa-archive"></span><span class="title">试卷中心</span>
									</a>
									<!-- Dropdown level 1 -->
									<div id="dropdown-shijuan" class="panel-collapse collapse">
										<div class="panel-body">
											<ul class="nav navbar-nav">
												<li>
													<a href="${pageContext.request.contextPath}/file/allfile.do">试卷信息</a>
												</li>
												<li>
													<a href="${pageContext.request.contextPath}/jump/uploadpaper.do">上传试卷</a>
												</li>
											</ul>
										</div>
									</div>
								</li>
								
							</ul>
							
						</div>
						<!-- /.navbar-collapse -->
					</nav>
				</div>
				<!-- 主容器 -->
				<div class="container-fluid">
					<div class="side-body padding-top">

						<div class="row">
							<div class="col-xs-12">
								<div class="card">
									<div class="card-header">
										<div class="card-title">
											<div class="title">试题信息</div>
											<ul class="list-inline" id="select_one">
											  <li>编程语言：</li>
											  <li><a href="${pageContext.request.contextPath}/admin/querysubject/.do" class="btn btn-sm  select-all ${empty adminquestionsubject ?'btn-warning' : '' }">全部</a></li>
											  <li><a href="${pageContext.request.contextPath}/admin/querysubject/1.do" class="btn btn-sm ${ adminquestionsubject eq 1 ?'btn-warning' : '' }">java</a></li>
											  <li><a href="${pageContext.request.contextPath}/admin/querysubject/2.do" class="btn btn-sm ${ adminquestionsubject eq 2 ?'btn-warning' : '' }">C/C++</a></li>
											  <li><a href="${pageContext.request.contextPath}/admin/querysubject/3.do" class="btn btn-sm ${ adminquestionsubject eq 3 ?'btn-warning' : '' }">JavaScript</a></li>
											  <li><a href="${pageContext.request.contextPath}/admin/querysubject/4.do" class="btn btn-sm ${ adminquestionsubject eq 4 ?'btn-warning' : '' }">HTML</a></li>
											  <li><a href="${pageContext.request.contextPath}/admin/querysubject/5.do" class="btn btn-sm ${ adminquestionsubject eq 5 ?'btn-warning' : '' }">C#</a></li>
											</ul>
											
											<ul class="list-inline" id="select_two">
											  <li>题型：</li>
											  <li><a href="${pageContext.request.contextPath}/admin/querytype/.do" class="btn btn-sm  select-all ${empty adminquestiontype ?'btn-warning' : '' }">全部</a></li>
											  <li><a href="${pageContext.request.contextPath}/admin/querytype/1.do" class="btn btn-sm ${ adminquestiontype eq 1 ?'btn-warning' : '' }">单选题</a></li>
											  <li><a href="${pageContext.request.contextPath}/admin/querytype/3.do" class="btn btn-sm ${ adminquestiontype eq 3 ?'btn-warning' : '' }">判断题</a></li>
											  <li><a href="${pageContext.request.contextPath}/admin/querytype/2.do" class="btn btn-sm ${ adminquestiontype eq 2 ?'btn-warning' : '' }">多选题</a></li>
											  <li><a href="${pageContext.request.contextPath}/admin/querytype/4.do" class="btn btn-sm ${ adminquestiontype eq 4 ?'btn-warning' : '' }">填空题</a></li>
											  <li><a href="${pageContext.request.contextPath}/admin/querytype/5.do" class="btn btn-sm ${ adminquestiontype eq 5 ?'btn-warning' : '' }">简答题</a></li>
											</ul>
											
											<%-- <ul class="list-inline" id="select_three">
											  <li>时间：</li>
											  <li><a href="${pageContext.request.contextPath}/question/querydate/.do" class="btn btn-sm  select-all ${empty questiondatenum ?'btn-warning' : '' }">全部</a></li>
											  <li><a href="${pageContext.request.contextPath}/question/querydate/30.do" class="btn btn-sm ${ questiondatenum eq 30 ?'btn-warning' : '' }">近一个月</a></li>
											  <li><a href="${pageContext.request.contextPath}/question/querydate/90.do" class="btn btn-sm ${ questiondatenum eq 90 ?'btn-warning' : '' }">近三个月</a></li>
											  <li><a href="${pageContext.request.contextPath}/question/querydate/180.do" class="btn btn-sm ${ questiondatenum eq 180 ?'btn-warning' : '' }">近六个月</a></li>
											  <li><a href="${pageContext.request.contextPath}/question/querydate/365.do" class="btn btn-sm ${ questiondatenum eq 365 ?'btn-warning' : '' }">近一年</a></li>
											</ul> --%>
											
										</div>
									</div>
									<div class="card-body">
									
									<table class="datatable table table-striped" cellspacing="0" width="100%" id="questionRecord">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>题型</th>
                                                <th>语言</th>
                                                <th>题目内容</th>
                                                <th>上传时间</th>
                                                <th>作者</th>
                                                <th>修改</th>
                                                <th>删除</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>题型</th>
                                                <th>语言</th>
                                                <th>题目内容</th>
                                                 <th>上传时间</th>
                                                <th>作者</th>
                                                <th>修改</th>
                                                <th>删除</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                             <c:forEach items="${questionrecord}" var="quest">
	                                            <tr>
	                                                <td>${quest.id}</td>
	                                                <td>
	                                                	${ quest.questionType eq 1 ?'单选题' : '' }
	                                                	${ quest.questionType eq 2 ?'多选题' : '' }
	                                                	${ quest.questionType eq 3 ?'判断题' : '' }
	                                                	${ quest.questionType eq 4 ?'填空题' : '' }
	                                                	${ quest.questionType eq 5 ?'综合题' : '' }
	                                                </td>
	                                                <td>
	                                                	${ quest.subject eq 1 ?'Java' : '' }
	                                                	${ quest.subject eq 2 ?'C/C++' : '' }
	                                                	${ quest.subject eq 3 ?'JavaScript' : '' }
	                                                	${ quest.subject eq 4 ?'HTML' : '' }
	                                                	${ quest.subject eq 5 ?'C#' : '' }
	                                                </td>
	                                                <td>${quest.content }</td>
	                                                <td>${quest.createTime.toLocaleString()}</td>
	                                                <td>${quest.creator }</td>
	                                                <td><button id="update_quest${quest.id}" type="button" class="btn btn-primary btn-sm updateQuest" data-toggle="modal">修改
														</button></td>
													<td><button class="btn btn-warning btn-sm remove_question" id="quest_remove${quest.id}">删除试题</button></td>
	                                            	 
	                                            </tr>
                                            </c:forEach> 
                                         </tbody>
                                      
                                       </table>
                                       <input type="hidden" id="path" value="${pageContext.request.contextPath}" />
                                       <!-- Model 试卷修改 -->
                                          <div class="modal fade" id="updateQuestionModel" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
																	<h4 class="modal-title" id="myModalLabel">修改试题</h4>
																</div>
																<form class="form-horizontal" id = "automaticquestion" method="post" action="${pageContext.request.contextPath}/admin/updatequestion.do">
																	<div class="modal-body">
										                                        <div class="form-inline">
										                                            <label for="content" class=" control-label">题目</label>
										                                            <div class="quest">
										                                            	<input type="hidden" value="" name="id" id="id">
										                                            	<textarea rows="5" cols="40" id = "content" name = "content" ></textarea>
										                                            </div>
										                                        </div>
										                                         
											                                         <div class="form-inline">
											                                            <label for="option1" class="control-label">A:</label>
											                                            <div class="quest">
											                                            	<textarea rows="1" cols="30" id = "option1" name = "option1" ></textarea>
											                                            </div>
											                                        </div>
											                                        
											                                        <div class="form-inline">
											                                            <label for="option2" class="control-label">B:</label>
											                                            <div class="quest">
											                                            	<textarea rows="1" cols="30" id = "option2" name = "option2" ></textarea>
											                                            </div>
											                                        </div>
											                                        
											                                        <div class="form-inline">
											                                            <label for="option3" class=" control-label">C:</label>
											                                            <div class="quest">
											                                            	<textarea rows="1" cols="30" id = "option3" name = "option3" ></textarea>
											                                            </div>
											                                        </div>
											                                        
											                                        <div class="form-inline">
											                                            <label for="option4" class=" control-label">D:</label>
											                                            <div class="quest">
											                                            	<textarea rows="1" cols="30" id = "option4" name = "option4" ></textarea>
											                                            </div>
											                                        </div>
											                                        
											                                        <div class="form-inline">
											                                            <label for="option5" class="control-label">E:</label>
											                                            <div class="quest">
											                                            	<textarea rows="1" cols="30" id = "option5" name = "option5" ></textarea>
											                                            </div>
											                                        </div>
											                                       
											                                        
											                                        
												                                        <div class="form-inline">
												                                            <label for="option6" class=" control-label">F:</label>
												                                            <div class="quest">
												                                            	<textarea rows="1" cols="30" id = "option6" name = "option6" ></textarea>
												                                            </div>
												                                        </div>
											                                        <div class="form-inline">
												                                            <label for="answer" class="control-label">答案:</label>
												                                            <div class="quest">
												                                            	<textarea rows="1" cols="30" id = "answer" name = "answer" value="">${quest.answer}</textarea>
												                                            </div>
												                                       </div>
												                                       
												                                       <div class="form-inline">
												                                            <label for="analysis" class="control-label">解析:</label>
												                                            <div class="quest">
												                                            	<textarea rows="1" cols="30" id = "analysis" name = "analysis" value="">${quest.analysis}</textarea>
												                                            </div>
												                                       </div>
												                            
												                                       
																	</div>
																	<div class="modal-footer">
																		 <button type="button" class="btn btn-info question_update">修改</button>
																		 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
																	</div>
																</form>
															</div>
														</div>
													</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- Javascript Libs -->
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery.min.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/bootstrap.min.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/Chart.min.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/bootstrap-switch.min.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery.matchHeight-min.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery.dataTables.min.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/dataTables.bootstrap.min.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/select2.full.min.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/ace/ace.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/ace/mode-html.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/ace/theme-github.js"></script>
				<!-- flexpaper -->
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/flexpaper_flash.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/flexpaper_flash_debug.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/flexpaper.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/flexpaper_handlers.js"></script>
				<!-- Javascript -->
				<script type="text/javascript" src="${pageContext.request.contextPath}/js/app.js"></script>
			</div>
		</div>
	</body>
	<script type="text/javascript">
			$(function() {
				var Dtable = $('.table').DataTable();
				/* 删除试题 */
				$('.table tbody').on('click',".remove_question" ,function () {
					var str = $(this).prop("id");
					var i = "quest_remove".length;
					var id = str.substr(i);
					var path = $("#path").val();
					var result = "false";
					 if(confirm('确定删除本题吗?')) {
						 console.log(id);
						 $.ajax({  
							 	type:"post",
						        url : path+"/admin/removeQuestion.do",// 请求的URL  
						        data : {  
						        	"id" : id  
						        },
						        async : false, // 改异步为同步  
						        dataType : 'json',  
						        success : function(data) { 
						        	var parsedJson = eval(data);
									result = parsedJson.result
						        } ,
						        error : function(){
						        	console.log("error");
						        }
						    }); 
						 if(result == "true"){
							 $(this).parent().parent("tr").toggleClass("rowselected");
							  Dtable.row('.rowselected').remove().draw(false);
						 }
					 }
					 
				});
				/* 试题预览 */
				$('.table tbody').on('click',".updateQuest" ,function () {
					
					$("#updateQuestionModel").modal('toggle');
					var str = $(this).prop("id");
					var i = "update_quest".length;
					var id = str.substr(i);
					var path = $("#path").val();
					$(".quest>#id").val(id);
					
					$.ajax({  
					 	type:"post",
				        url : path+"/admin/queryQuestion.do",// 请求的URL  
				        data : {  
				        	"id" : id  
				        },
				        async : false, // 改异步为同步  
				        dataType : 'json',  
				        success : function(data) { 
				        	var question = eval(data);
				        	console.log(question);
				        	$(".quest>#content").val(question.content);
				        	$(".quest>#answer").val(question.answer);
				        	$(".quest>#analysis").val(question.analysis);
				        	if (question.option1 == null|| question.option1 == "") {
				        		$(".quest>#option1").val("");
				        		$(".quest>#option1").parent().parent(".form-inline").addClass("hidden");
							}else{
								$(".quest>#option1").parent().parent(".form-inline").removeClass("hidden");
								$(".quest>#option1").val(question.option1);
							}
				        	if (question.option2 == null|| question.option2 == "") {
				        		$(".quest>#option2").val("");
				        		$(".quest>#option2").parent().parent(".form-inline").addClass("hidden");
							}else{
								$(".quest>#option2").parent().parent(".form-inline").removeClass("hidden");
								$(".quest>#option2").val(question.option2);
							}
				        	if (question.option3 == null|| question.option3 == "") {
				        		$(".quest>#option3").val("");
				        		$(".quest>#option3").parent().parent(".form-inline").addClass("hidden");
							}else{
								$(".quest>#option3").parent().parent(".form-inline").removeClass("hidden");
								$(".quest>#option3").val(question.option3);
							}
				        	if (question.option4 == null|| question.option4 == "") {
				        		$(".quest>#option4").val("");
				        		$(".quest>#option4").parent().parent(".form-inline").addClass("hidden");
							}else{
								$(".quest>#option4").parent().parent(".form-inline").removeClass("hidden");
								$(".quest>#option4").val(question.option4);
							}
				        	if (question.option5 == null|| question.option5 == "") {
				        		$(".quest>#option5").val("");
				        		$(".quest>#option5").parent().parent(".form-inline").addClass("hidden");
							}else{
								$(".quest>#option5").parent().parent(".form-inline").removeClass("hidden");
								$(".quest>#option5").val(question.option5);
							}
				        	if (question.option6 == null || question.option6 == "") {
				        		$(".quest>#option6").val("");
				        		$(".quest>#option6").parent().parent(".form-inline").addClass("hidden");
							}else{
								$(".quest>#option6").parent().parent(".form-inline").removeClass("hidden");
								$(".quest>#option6").val(question.option6);
							}
				        } ,
				        error : function(){
				        	console.log("error");
				        }
				    }); 
					
				})
				$.fn.serializeObject = function()
				{
				    var o = {};
				    var a = this.serializeArray();
				    $.each(a, function() {
				        if (o[this.name] !== undefined) {
				            if (!o[this.name].push) {
				                o[this.name] = [o[this.name]];
				            }
				            o[this.name].push(this.value || '');
				        } else {
				            o[this.name] = this.value || '';
				        }
				    });
				    return o;
				};
				/*更新试题*/
				$(".question_update").click(function(){
					var id = $(this).parent().parent("form").attr("id");
					console.log(id );
					var data = $("#"+id).serializeObject();
					var targetUrl = $("#"+id).attr("action");
					console.log(targetUrl);
					console.log(JSON.stringify(data));
					console.log(data.content);
					if (data.content.trim() == "") {
						alert("题目内容不能为空！！")
						return;
					}
					if (data.answer.trim() == "") {
						alert("题目答案不能为空！！")
						return;
					}
					 $.ajax({ 
						    type:'post',  
						    contentType : "application/json ; charset=utf-8",
						    url:targetUrl, 
						    cache: false,
						    data:JSON.stringify(data),  
						    dataType:'json', 
						    success:function(data){ 
						    	console.log(data)
						    	if (data == true) {
									alert("修改成功");
									$("#updateQuestionModel").modal('hide');
								}else{
									alert("修改失败");
								}
						    },
						    error:function(){ 
						     alert("请求失败")
						    }
						   })
				});
			})
	
	</script>

</html>