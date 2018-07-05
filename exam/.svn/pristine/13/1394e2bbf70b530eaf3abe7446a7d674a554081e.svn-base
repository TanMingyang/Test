<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
		<!--试题篮-->
		<style type="text/css">
			.suspension {
				width: 240px;
				height: 280px;
				position: fixed;
				top: 200px;
				border: 1px solid #ccc;
			}
			
			.suspension_body {
				width: 240px;
				height: 180px;
				position: relative;
				padding: 10px;
			}
			
			.bar {
				width: 35px;
				height: 101px;
				position: absolute;
				left: -35px;
				top: -1px;
				display: block;
				background: no-repeat;
			}
		</style>
		<style type="text/css">
		.panel-heading {
			position: relative;
			top: -40px;
			float: right;
			margin-right: 17px;
		}
	</style>
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
								<li>组卷</li>
								<li class="active">试卷预览</li>
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
								<!--首页-->
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
													<a href="${pageContext.request.contextPath}/jump/teaUserInfo.do">个人信息</a>
												</li>
												<li>
													<a href="${pageContext.request.contextPath}/question/page/collect/1/5.do">收藏的题目</a>
												</li>
												<li>
													<a href="${pageContext.request.contextPath}/jump/paperrecord.do">组卷记录</a>
												</li>
											</ul>
										</div>
									</div>
								</li>

								<!-- 组卷-->
								<li class="panel panel-default dropdown active">
									<a data-toggle="collapse" href="#dropdown-zujuan">
										<span class="icon fa fa-archive"></span><span class="title">组卷</span>
									</a>
									<!-- Dropdown level 1 -->
									<div id="dropdown-zujuan" class="panel-collapse collapse">
										<div class="panel-body">
											<ul class="nav navbar-nav">
												<li>
													<a href="${pageContext.request.contextPath}/question/page/1/5.do">手动组卷</a>
												</li>
												<li>
													<a href="${pageContext.request.contextPath}/jump/automaticpaper.do">自动组卷</a>
												</li>
											</ul>
										</div>
									</div>
								</li>
								
								<!-- 试卷库-->
								<li class="panel panel-default dropdown">
									<a data-toggle="collapse" href="#dropdown-shijuan">
										<span class="icon fa fa-archive"></span><span class="title">试卷库</span>
									</a>
									<!-- Dropdown level 1 -->
									<div id="dropdown-shijuan" class="panel-collapse collapse">
										<div class="panel-body">
											<ul class="nav navbar-nav">
												<li>
													<a href="${pageContext.request.contextPath}/file/allfile.do">模拟卷</a>
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
											<div class="title">试卷预览</div>
											<a class="btn btn-sm btn-danger chongxin" data-toggle="modal">重新组卷</a>
											<!-- model 重新组卷 -->
											<div class="modal fade" id="chongxinzujuan" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
													<form action="${pageContext.request.contextPath}/question/afreshPaper.do" method="post" id="cxtitle">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
															<h4 class="modal-title" id="myModalLabel">保存试卷</h4>
														</div>
														<div class="modal-body">
															<span>标题:</span><input id="chongxinTitle" type="text" name = "title" value="${paper.title }">
															
														</div>
														<div class="modal-footer">
															<input type="submit" class="btn btn-default chongxin_submit" value = "保存" >
															<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
														</div>
													</form>
													</div>
												</div>
											</div>
											
											<a href="${pageContext.request.contextPath}/question/page/1/5.do" class="btn btn-sm btn-success "  >继续选题</a>
											<a href="" class="btn btn-sm btn-warning"  data-toggle="modal" data-target="#savepapermodel">保存试卷</a>
											<!-- model 保存试卷 -->
											<div class="modal fade" id="savepapermodel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
													<form action="${pageContext.request.contextPath}/question/savePaper.do" method="post" id="savepaper">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
															<h4 class="modal-title" id="myModalLabel">保存试卷</h4>
														</div>
														<div class="modal-body">
															<span>标题:</span><input type="text" id="saveTitle" name = "title" value="${paper.title }">
															
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default save_submit">保存</button>
															<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
														</div>
													</form>
													</div>
												</div>
											</div>
											
											<a class="btn btn-sm btn-info" data-toggle="modal" data-target="#download" >下载试卷</a>
											<!-- model 下载 -->
											<div class="modal fade" id="download" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
													<form action="${pageContext.request.contextPath}/question/downloadPaper.do" method="post" id="title">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
															<h4 class="modal-title" id="myModalLabel">下载</h4>
														</div>
														<div class="modal-body">
															<span>标题:</span><input type="text" id = "downloadTitle" name = "title" value="${paper.title }">
															
														</div>
														<div class="modal-footer">
															<input type="button" class="btn btn-default download_submit" value = "确认" >
															<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
														</div>
													</form>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="card-body">
										<!--选择题-->
										<div class="choice">
											<!--标题-->
											<div class="col-sm-12 ">
												<div class="panel panel-info question_title">
													<div class="panel-body choice_question">
														<span>选择题</span> (共<span class="num">${sessionScope.paper.choiceQuestions.size()}</span>题)
													</div>
												</div>

											</div>
										<c:forEach items="${sessionScope.paper.choiceQuestions}" var="quest">
											<!-- 第一个选择题-->
											<div class="col-sm-12 ">
												<div class="panel panel-default question">
													<div class="panel-heading hidden">
														<ul class="nav nav-tabs ">
															<li>
																<a data-toggle="modal" data-target="#jeixi${quest.value.id}">答案解析 </a>
															</li>
															<li>
																<input type="hidden" value="${quest.value.id}"/>
																<a href="#" data-toggle="modal" class="change_question">换题</a>
															</li>
															<li>
																<input type="hidden" value="${quest.value.id}"/>
																<a href="#" class="question_remove">删除</a>
															</li>
														</ul>
													</div>
													<!--model 答案解析-->
													<div class="modal fade" id="jeixi${quest.value.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
																	<h4 class="modal-title" id="myModalLabel">答案解析</h4>
																</div>
																<div class="modal-body">
																	<div >
																		 <ul class="list-group">
								                                            <li class="list-group-item">
								                                            	<label>答案：</label>
								                                            	${quest.value.answer}
								                                            </li>
								                                            <li class="list-group-item">
								                                            	<label>解析：</label>
								                                            	${quest.value.analysis}
								                                            </li>
								                                             <li class="list-group-item">
								                                            	<label>难易度：</label>
								                                            	${quest.value.difficulty}
								                                            </li>
								                                        </ul>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
																</div>
															</div>
														</div>
													</div>
													<div class="panel-body ">

														<div class="bg content_${quest.value.id}">
															 <ul class="list-group">
															 <c:if test="${!empty quest.value.content }">
					                                            <li class="list-group-item">
					                                            	<p>${quest.value.content}</p>
					                                            </li>
					                                           </c:if>
					                                            <c:if test="${!empty quest.value.option1 }">
						                                            <li class="list-group-item">
						                                            	<label>A：</label>
						                                            	${quest.value.option1}
						                                            </li>
					                                            </c:if>
					                                            
					                                           <c:if test="${!empty quest.value.option2 }">
					                                            <li class="list-group-item">
					                                            	<label>B：</label>
					                                            	${quest.value.option2}
					                                            </li>
					                                            </c:if>
					                                            <c:if test="${!empty quest.value.option3 }">
					                                             <li class="list-group-item">
					                                            	<label>C：</label>
					                                            	${quest.value.option3}
					                                            </li>
					                                            </c:if>
					                                            <c:if test="${!empty quest.value.option4}">
					                                             <li class="list-group-item">
					                                            	<label>D：</label>
					                                            	${quest.value.option4}
					                                            </li>
					                                            </c:if>
					                                        </ul>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										</div>
										<!--end 选择题-->
										
										<!--填空题-->
										<div class="choice">
											<!--标题-->
											<div class="col-sm-12 ">
												<div class="panel panel-info question_title">
													<div class="panel-body choice_question">
														<span>填空题</span> (共<span class="num">${sessionScope.paper.gapFillings.size()}</span>题)
													</div>
												</div>

											</div>
										<c:forEach items="${sessionScope.paper.gapFillings}" var="quest">
											<!-- 第一个填空题-->
											<div class="col-sm-12 ">
												<div class="panel panel-default question">
													<div class="panel-heading hidden">
														<ul class="nav nav-tabs ">
															<li>
																<a data-toggle="modal" data-target="#jeixi${quest.value.id}">答案解析 </a>
															</li>
															<li>
																<input type="hidden" value="${quest.value.id}"/>
																<a href="#" data-toggle="modal" class="change_question">换题</a>
															</li>
															<li>
																<input type="hidden" value="${quest.value.id}"/>
																<a href="#" class="question_remove">删除</a>
															</li>
														</ul>
													</div>
													<!--model 答案解析-->
													<div class="modal fade" id="jeixi${quest.value.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
																	<h4 class="modal-title" id="myModalLabel">答案解析</h4>
																</div>
																<div class="modal-body">
																	<div >
																		 <ul class="list-group">
								                                            <li class="list-group-item">
								                                            	<label>答案：</label>
								                                            	${quest.value.answer}
								                                            </li>
								                                            <li class="list-group-item">
								                                            	<label>解析：</label>
								                                            	${quest.value.analysis}
								                                            </li>
								                                             <li class="list-group-item">
								                                            	<label>难易度：</label>
								                                            	${quest.value.difficulty}
								                                            </li>
								                                        </ul>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
																</div>
															</div>
														</div>
													</div>
													<div class="panel-body ">

														<div class="bg content_${quest.value.id}">
															 <ul class="list-group">
															 <c:if test="${!empty quest.value.content }">
					                                            <li class="list-group-item">
					                                            	<p>${quest.value.content}</p>
					                                            </li>
					                                           </c:if>
					                                            <%-- <c:if test="${!empty quest.value.option1 }">
						                                            <li class="list-group-item">
						                                            	<label>A：</label>
						                                            	${quest.value.option1}
						                                            </li>
					                                            </c:if>
					                                            
					                                           <c:if test="${!empty quest.value.option2 }">
					                                            <li class="list-group-item">
					                                            	<label>B：</label>
					                                            	${quest.value.option2}
					                                            </li>
					                                            </c:if>
					                                            <c:if test="${!empty quest.value.option3 }">
					                                             <li class="list-group-item">
					                                            	<label>C：</label>
					                                            	${quest.value.option3}
					                                            </li>
					                                            </c:if>
					                                            <c:if test="${!empty quest.value.option4}">
					                                             <li class="list-group-item">
					                                            	<label>D：</label>
					                                            	${quest.value.option4}
					                                            </li>
					                                            </c:if> --%>
					                                        </ul>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										</div>
										<!--end 填空题-->
										
										<!--判断题-->
										<div class="choice">
											<!--标题-->
											<div class="col-sm-12 ">
												<div class="panel panel-info question_title">
													<div class="panel-body choice_question">
														<span>判断题</span> (共<span class="num">${sessionScope.paper.checkQuestions.size()}</span>题)
													</div>
												</div>

											</div>
										<c:forEach items="${sessionScope.paper.checkQuestions}" var="quest">
											<!-- 第一个判断题-->
											<div class="col-sm-12 ">
												<div class="panel panel-default question">
													<div class="panel-heading hidden">
														<ul class="nav nav-tabs ">
															<li>
																<a data-toggle="modal" data-target="#jeixi${quest.value.id}">答案解析 </a>
															</li>
															<li>
																<input type="hidden" value="${quest.value.id}"/>
																<a href="#" data-toggle="modal" class="change_question">换题</a>
															</li>
															<li>
																<input type="hidden" value="${quest.value.id}"/>
																<a href="#" class="question_remove">删除</a>
															</li>
														</ul>
													</div>
													<!--model 答案解析-->
													<div class="modal fade" id="jeixi${quest.value.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
																	<h4 class="modal-title" id="myModalLabel">答案解析</h4>
																</div>
																<div class="modal-body">
																	<div >
																		 <ul class="list-group">
								                                            <li class="list-group-item">
								                                            	<label>答案：</label>
								                                            	${quest.value.answer}
								                                            </li>
								                                            <li class="list-group-item">
								                                            	<label>解析：</label>
								                                            	${quest.value.analysis}
								                                            </li>
								                                             <li class="list-group-item">
								                                            	<label>难易度：</label>
								                                            	${quest.value.difficulty}
								                                            </li>
								                                        </ul>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
																</div>
															</div>
														</div>
													</div>
													<div class="panel-body ">

														<div class="bg content_${quest.value.id}">
															 <ul class="list-group">
															 <c:if test="${!empty quest.value.content }">
					                                            <li class="list-group-item">
					                                            	<p>${quest.value.content}</p>
					                                            </li>
					                                           </c:if>
					                                            <%-- <c:if test="${!empty quest.value.option1 }">
						                                            <li class="list-group-item">
						                                            	<label>A：</label>
						                                            	${quest.value.option1}
						                                            </li>
					                                            </c:if>
					                                            
					                                           <c:if test="${!empty quest.value.option2 }">
					                                            <li class="list-group-item">
					                                            	<label>B：</label>
					                                            	${quest.value.option2}
					                                            </li>
					                                            </c:if>
					                                            <c:if test="${!empty quest.value.option3 }">
					                                             <li class="list-group-item">
					                                            	<label>C：</label>
					                                            	${quest.value.option3}
					                                            </li>
					                                            </c:if>
					                                            <c:if test="${!empty quest.value.option4}">
					                                             <li class="list-group-item">
					                                            	<label>D：</label>
					                                            	${quest.value.option4}
					                                            </li>
					                                            </c:if> --%>
					                                        </ul>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										</div>
										<!--end 判断题-->
										
										<!--多选题-->
										<div class="choice">
											<!--标题-->
											<div class="col-sm-12 ">
												<div class="panel panel-info question_title">
													<div class="panel-body choice_question">
														<span>多选题</span> (共<span class="num">${sessionScope.paper.multipleChoiceQuestions.size()}</span>题)
													</div>
												</div>

											</div>
										<c:forEach items="${sessionScope.paper.multipleChoiceQuestions}" var="quest">
											<!-- 第一个多选题-->
											<div class="col-sm-12 ">
												<div class="panel panel-default question">
													<div class="panel-heading hidden">
														<ul class="nav nav-tabs ">
															<li>
																<a data-toggle="modal" data-target="#jeixi${quest.value.id}">答案解析 </a>
															</li>
															<li>
																<input type="hidden" value="${quest.value.id}"/>
																<a href="#" data-toggle="modal" class="change_question">换题</a>
															</li>
															<li>
																<input type="hidden" value="${quest.value.id}"/>
																<a href="#" class="question_remove">删除</a>
															</li>
														</ul>
													</div>
													<!--model 答案解析-->
													<div class="modal fade" id="jeixi${quest.value.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
																	<h4 class="modal-title" id="myModalLabel">答案解析</h4>
																</div>
																<div class="modal-body">
																	<div >
																		 <ul class="list-group">
								                                            <li class="list-group-item">
								                                            	<label>答案：</label>
								                                            	${quest.value.answer}
								                                            </li>
								                                            <li class="list-group-item">
								                                            	<label>解析：</label>
								                                            	${quest.value.analysis}
								                                            </li>
								                                             <li class="list-group-item">
								                                            	<label>难易度：</label>
								                                            	${quest.value.difficulty}
								                                            </li>
								                                        </ul>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
																</div>
															</div>
														</div>
													</div>
													<div class="panel-body ">

														<div class="bg content_${quest.value.id}">
															 <ul class="list-group">
															 <c:if test="${!empty quest.value.content }">
					                                            <li class="list-group-item">
					                                            	<p>${quest.value.content}</p>
					                                            </li>
					                                           </c:if>
					                                            <c:if test="${!empty quest.value.option1 }">
						                                            <li class="list-group-item">
						                                            	<label>A：</label>
						                                            	${quest.value.option1}
						                                            </li>
					                                            </c:if>
					                                            
					                                           <c:if test="${!empty quest.value.option2 }">
					                                            <li class="list-group-item">
					                                            	<label>B：</label>
					                                            	${quest.value.option2}
					                                            </li>
					                                            </c:if>
					                                            <c:if test="${!empty quest.value.option3 }">
					                                             <li class="list-group-item">
					                                            	<label>C：</label>
					                                            	${quest.value.option3}
					                                            </li>
					                                            </c:if>
					                                            <c:if test="${!empty quest.value.option4}">
					                                             <li class="list-group-item">
					                                            	<label>D：</label>
					                                            	${quest.value.option4}
					                                            </li>
					                                            </c:if>
					                                             <c:if test="${!empty quest.value.option5}">
					                                             <li class="list-group-item">
					                                            	<label>D：</label>
					                                            	${quest.value.option4}
					                                            </li>
					                                            </c:if>
					                                             <c:if test="${!empty quest.value.option6}">
					                                             <li class="list-group-item">
					                                            	<label>D：</label>
					                                            	${quest.value.option4}
					                                            </li>
					                                            </c:if>
					                                        </ul>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										</div>
										<!--end 多选题-->
										
										<!--综合题-->
										<div class="choice">
											<!--标题-->
											<div class="col-sm-12 ">
												<div class="panel panel-info question_title">
													<div class="panel-body choice_question">
														<span>综合题</span> (共<span class="num">${sessionScope.paper.comprehensiveQuestions.size()}</span>题)
													</div>
												</div>

											</div>
										<c:forEach items="${sessionScope.paper.comprehensiveQuestions}" var="quest">
											<!-- 第一个综合题-->
											<div class="col-sm-12 ">
												<div class="panel panel-default question">
													<div class="panel-heading hidden">
														<ul class="nav nav-tabs ">
															<li>
																<a data-toggle="modal" data-target="#jeixi${quest.value.id}">答案解析 </a>
															</li>
															<li>
																<input type="hidden" value="${quest.value.id}"/>
																<a href="#" data-toggle="modal" class="change_question">换题</a>
															</li>
															<li>
																<input type="hidden" value="${quest.value.id}"/>
																<a href="#" class="question_remove">删除</a>
															</li>
														</ul>
													</div>
													<!--model 答案解析-->
													<div class="modal fade" id="jeixi${quest.value.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
																	<h4 class="modal-title" id="myModalLabel">答案解析</h4>
																</div>
																<div class="modal-body">
																	<div >
																		 <ul class="list-group">
								                                            <li class="list-group-item">
								                                            	<label>答案：</label>
								                                            	${quest.value.answer}
								                                            </li>
								                                            <li class="list-group-item">
								                                            	<label>解析：</label>
								                                            	${quest.value.analysis}
								                                            </li>
								                                             <li class="list-group-item">
								                                            	<label>难易度：</label>
								                                            	${quest.value.difficulty}
								                                            </li>
								                                        </ul>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
																</div>
															</div>
														</div>
													</div>
													<div class="panel-body ">

														<div class="bg content_${quest.value.id}">
															 <ul class="list-group">
															 <c:if test="${!empty quest.value.content }">
					                                            <li class="list-group-item">
					                                            	<p>${quest.value.content}</p>
					                                            </li>
					                                           </c:if>
					                                           <%--  <c:if test="${!empty quest.value.option1 }">
						                                            <li class="list-group-item">
						                                            	<label>A：</label>
						                                            	${quest.value.option1}
						                                            </li>
					                                            </c:if>
					                                            
					                                           <c:if test="${!empty quest.value.option2 }">
					                                            <li class="list-group-item">
					                                            	<label>B：</label>
					                                            	${quest.value.option2}
					                                            </li>
					                                            </c:if>
					                                            <c:if test="${!empty quest.value.option3 }">
					                                             <li class="list-group-item">
					                                            	<label>C：</label>
					                                            	${quest.value.option3}
					                                            </li>
					                                            </c:if>
					                                            <c:if test="${!empty quest.value.option4}">
					                                             <li class="list-group-item">
					                                            	<label>D：</label>
					                                            	${quest.value.option4}
					                                            </li>
					                                            </c:if> --%>
					                                        </ul>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										</div>
										<!--end 综合题-->
										
										<!--model 换题-->
											<div class="modal fade" id="huanti" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
															<h4 class="modal-title" id="myModalLabel">换题</h4>
														</div>
														<div class="modal-body">
															
														</div>
														<div class="modal-footer">
															<input type="hidden" id="now"/>
															<input type="hidden" id="change" />	
															<input type="hidden" id="path" value="${pageContext.request.contextPath}" />
															<button type="button" class="btn btn-info next_question" >换一题</button>
															<button type="button" class="btn btn-default change_question_submit" data-dismiss="modal">确认</button>
															<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
														</div>
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
				<!-- Javascript -->
				<script type="text/javascript" src="${pageContext.request.contextPath}/js/app.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery.validate.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/additional-methods.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/messages_zh.js"></script>
				<script type="text/javascript">
		$(function() {
			$(".question ").mouseover(function() {
				$(this).children(".panel-heading").removeClass("hidden");
			});
			$(".question").mouseout(function() {
				$(this).children(".panel-heading").addClass("hidden");
			});

			$(".panel-heading .nav li").mouseover(function() {
				$(this).addClass("active");
			})
			$(".panel-heading .nav li").mouseout(function() {
				$(this).removeClass("active");
			})
			/*删除试题*/
			$(".question_remove").click(function() {
				var now = $(this).siblings("input").val();
				$.ajax({  
				 	type:"post",
			        url : path+"/question/removeQuestion.do",// 请求的URL  
			        data : {  
			        	"id" : now  
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
				
				$(this).parents(".question").remove();
			});
			
			/*跟换试题*/
			var path = $("#path").val();
			var nextPage = 1;
			$(".change_question").click(function(){
				nextPage = 1;
				var id = $(this).siblings("input").val();
				$(".modal-footer").children("#now").val($(this).siblings("input").val())
				$("#huanti").children().children().children(".modal-body").empty();
				$.ajax({  
				 	type:"post",
			        url : path+"/question/change/"+nextPage+"/1.do",// 请求的URL  
			        data : {"id" : id},
			        async : false, // 改异步为同步  
			        dataType : 'json',  
			        success : function(data) { 
			        	var parsedJson = eval(data);
			        	pageinfo = parsedJson.pageInfo;
			        	nextPage = pageinfo.nextPage;
			        	var qurstion = pageinfo.list[0];
			        	var str = '<div class="bg"> <ul class="list-group "><li class="list-group-item"><p>'+qurstion.content+'</p></li>';
			        	if(qurstion.option1 != null && qurstion.option1.trim() != ""){
			        		str += '<li class="list-group-item"> <label>A：</label> '+qurstion.option1+'</li>';
			        	}
			        	if(qurstion.option2 != null && qurstion.option2.trim() != ""){
			        		str += '<li class="list-group-item"> <label>B：</label> '+qurstion.option2+'</li>';
			        	}
			        	if(qurstion.option3 != null && qurstion.option3.trim() != ""){
			        		str += '<li class="list-group-item"> <label>C：</label> '+qurstion.option3+'</li>';
			        	}
			        	if(qurstion.option4 != null && qurstion.option4.trim() != ""){
			        		str += '<li class="list-group-item"> <label>D：</label> '+qurstion.option4+'</li>';
			        	}
			        	if(qurstion.option5 != null && qurstion.option5.trim() != ""){
			        		str += '<li class="list-group-item"> <label>E：</label> '+qurstion.option5+'</li>';
			        	}
			        	if(qurstion.option6 != null && qurstion.option6.trim() != ""){
			        		str += '<li class="list-group-item"> <label>F：</label> '+qurstion.option6+'</li>';
			        	}
			        	str += '</ul></div>';
			        	$("#huanti").children().children().children(".modal-body").append(str);
			        	$(".modal-footer").children("#change").val(qurstion.id);
			        }
				 });
				$("#huanti").modal("toggle");
			});
			
			$(".change_question_submit").click(function(){
				var now = $(this).siblings("#now").val();
				var change = $(this).siblings("#change").val(); 
				var quest = $(this).parent().siblings(".modal-body").children(".bg").clone();
				quest.addClass("content_"+change);
				if(now == change){
					return true;
				}
				$(".content_"+now).parent().append(quest);
				$(".content_"+now).remove();
				
				/* 删减原试题 */
				 $.ajax({  
					 	type:"post",
				        url : path+"/question/removeQuestion.do",// 请求的URL  
				        data : {  
				        	"id" : now  
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
				 /* 增加试题 */
				 $.ajax({  
					 	type:"post",
				        url : path+"/question/addQuestion.do",// 请求的URL  
				        data : {  
				        	"id" : change  
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
			});
			/* 下一题 */
			$(".next_question").click(function(){
				var now = $(this).siblings("#now").val();
				$("#huanti").children().children().children(".modal-body").empty();
				$.ajax({  
				 	type:"post",
			        url : path+"/question/change/"+nextPage+"/1.do",// 请求的URL  
			        data : {"id" : now},
			        async : false, // 改异步为同步  
			        dataType : 'json',  
			        success : function(data) { 
			        	var parsedJson = eval(data);
			        	pageinfo = parsedJson.pageInfo;
			        	nextPage = pageinfo.nextPage;
			        	var qurstion = pageinfo.list[0];
			        	var str = '<div class="bg"> <ul class="list-group "><li class="list-group-item"><p>'+qurstion.content+'</p></li>';
			        	if(qurstion.questionType == 1 || qurstion.questionType == 2)
			        		{
					        	if(qurstion.option1 != null && qurstion.option1.trim() != ""){
					        		str += '<li class="list-group-item"> <label>A：</label> '+qurstion.option1+'</li>';
					        	}
					        	if(qurstion.option2 != null && qurstion.option2.trim() != ""){
					        		str += '<li class="list-group-item"> <label>B：</label> '+qurstion.option2+'</li>';
					        	}
					        	if(qurstion.option3 != null && qurstion.option3.trim() != ""){
					        		str += '<li class="list-group-item"> <label>C：</label> '+qurstion.option3+'</li>';
					        	}
					        	if(qurstion.option4 != null && qurstion.option4.trim() != ""){
					        		str += '<li class="list-group-item"> <label>D：</label> '+qurstion.option4+'</li>';
					        	}
					        	if(qurstion.option5 != null && qurstion.option5.trim() != ""){
					        		str += '<li class="list-group-item"> <label>E：</label> '+qurstion.option5+'</li>';
					        	}
					        	if(qurstion.option6 != null && qurstion.option6.trim() != ""){
					        		str += '<li class="list-group-item"> <label>F：</label> '+qurstion.option6+'</li>';
					        	}
			        		}
			        	str += '</ul></div>';
			        	$(".modal-footer").children("#change").val(qurstion.id);
			        	$("#huanti").children().children().children(".modal-body").append(str);
			        }
				 });
				
			});
			
			jQuery.validator.addMethod("checktitle", function(value, element) {
				 var pattern = new RegExp("[~'!@#$%^&*()-+_=:.]");
                if(pattern.test(value)){
                    console.log("非法字符！");
                    return false;
                }else{
                	return true;
                }
		            
			}, "不能输入非法字符！");
			/* 验证 */
			$("#title").validate({
				rules : {
					title : {
						required : true,
						checktitle : true
					}
				},
				messages : {
					title : {
						required : "请输入标题",
						checktitle : "不能输入非法字符！"
					}
				}
			});
			/* 验证 */
			$("#cxtitle").validate({
				rules : {
					title : {
						required : true,
						checktitle : true
					}
				},
				messages : {
					title : {
						required : "请输入标题",
						checktitle : "不能输入非法字符！"
					}
				}
			});
			/* 验证 */
			$("#savepaper").validate({
				rules : {
					title : {
						required : true,
						checktitle : true
					}
				},
				messages : {
					title : {
						required : "请输入标题",
						checktitle : "不能输入非法字符！"
					}
				}
			});
			
			$(".chongxin").click(function(){
				 if(confirm('是否保存试卷?')) {
					 $('#chongxinzujuan').modal('toggle');
				 }else{
					 window.location.href=path+"/question/unsavePaper.do"; 
				 }
			})
			/* 下载提交检验 */
			$(".download_submit").click(function(){
				$("#title").submit();
				var text = $("#title #downloadTitle").val();
				var pattern = new RegExp("[~'!@#$%^&*()-+_=:.]");
				if (text != ""&& !pattern.test(text)) {
					$('#download').modal('hide');
					 var timer = setInterval(function(){ 
						 window.location.href=path+"/question/unsavePaper.do"; 
					},2000) 
				}
				
			});
			/* 重新组卷提交检验 */
			$(".chongxin_submit").click(function(){
				$("#cxtitle").submit();
				var text = $("#cxtitle #chongxinTitle").val();
				var pattern = new RegExp("[~'!@#$%^&*()-+_=:.]");
				if (text != "" && !pattern.test(text)) {
					$('#chongxinzujuan').modal('hide');
				}
				
			});
			
			/* 保存试卷提交检验 */
			$(".save_submit").click(function(){
				/* $("#savepaper").submit(); */
				var text = $("#savepaper #saveTitle").val();
				console.log(text)
				if (text == ""){
					$("#savepaper #saveTitle").siblings(".error").remove();
					$("#savepaper #saveTitle").after("<span class='error'>请输入标题</span>") ;
				}
				var pattern = new RegExp("[~'!@#$%^&*()-+_=:.]");
	            if(pattern.test(text)){
	                $("#savepaper #saveTitle").siblings(".error").remove();
	                $("#savepaper #saveTitle").after("<span class='error'>请输入正确的标题</span>") ;
	            }
	            var targetUrl = $("#savepaper").attr("action");
				 $.ajax({ 
					    type:'post',  
					    url:targetUrl, 
					    data: {"title":$("#savepaper #saveTitle").val()},  
					    dataType:'json', 
					    async : false, // 改异步为同步  
					    success:function(data){ 
					    	var parsedJson = eval(data);
							result = parsedJson.result
					    	if (result == "true") {
								alert("保存成功");
								$('#savepapermodel').modal('hide');
							}else{
								alert("保存失败");
							}
					    },
					    error:function(){ 
					     alert("请求失败")
					    }
					   })
					   
			});
			
		})
	</script>
		</div>
	</body>

</html>