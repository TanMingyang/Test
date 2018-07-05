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
								<li>个人中心</li>
								<li class="active">个人信息</li>
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
								<li class="panel panel-default dropdown active">
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
											</ul>
										</div>
									</div>
								</li>

								<!-- 组卷-->
								<li class="panel panel-default dropdown">
									<a data-toggle="collapse" href="#dropdown-zujuan">
										<span class="icon fa fa-archive"></span><span class="title">试题中心</span>
									</a>
									<!-- Dropdown level 1 -->
									<div id="dropdown-zujuan" class="panel-collapse collapse">
										<div class="panel-body">
											<ul class="nav navbar-nav">
												<li>
													<a href="${pageContext.request.contextPath}/jump/ecerciseBefore.do">在线答题</a>
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
											<div class="title">在线练习</div>
										</div>
									</div>
									<div class="card-body">
										<c:forEach items="${sessionScope.exercise}" var="quest"  varStatus="stauts">
										<div class="col-sm-12 ">
												<div class="panel panel-info ">
													<div class="panel-body ">
													<p>${stauts.index+1} 、 ${quest.value.question.content }</p>
													  <div class="radio3">
				                                          <input class="exercise" type="radio" id="radioA${quest.value.question.id }" name="radio${quest.value.question.id }" value="A">
				                                          <label for="radioA${quest.value.question.id }">
				                                          	A: ${quest.value.question.option1 }
				                                          </label>
				                                        </div>
				                                         <div class="radio3">
				                                          <input class="exercise"  type="radio" id="radioB${quest.value.question.id }" name="radio${quest.value.question.id }" value="B">
				                                          <label for="radioB${quest.value.question.id }">
				                                          	B:  ${quest.value.question.option2 }
				                                          </label>
				                                        </div>
				                                         <div class="radio3">
				                                          <input class="exercise"  type="radio" id="radioC${quest.value.question.id }" name="radio${quest.value.question.id }" value="C">
				                                          <label for="radioC${quest.value.question.id }">
				                                          	C:  ${quest.value.question.option3 }
				                                          </label>
				                                        </div>
				                                         <div class="radio3">
				                                          <input class="exercise"  type="radio" id="radioD${quest.value.question.id }" name="radio${quest.value.question.id }" value="D">
				                                          <label for="radioD${quest.value.question.id }">
				                                          	D:  ${quest.value.question.option4 }
				                                          </label>
				                                        </div>
													</div>
												</div>

											</div>
											</c:forEach>
											<input type="hidden" id="path" value="${pageContext.request.contextPath}" />
									
									<div class="col-sm-12 ">
											<div class="panel ">
												<div class="panel-body ">
													<a href="${pageContext.request.contextPath}/student/ecerciseResult.do" class="btn btn-group-lg btn-info">提交练习</a>
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
				<script type="text/javascript" src="${pageContext.request.contextPath}/css/error.css"></script>
				<script type="text/javascript">
					$(function() {
						$(".exercise").click(function(){
							var answer = $(this).val();
							var name =  $(this).attr("name");
							var i = "radio".length;
							var id = name.substr(i);
							console.log(id) ;
							console.log(answer);
							var path = $("#path").val();
							var result = "false";
							 $.ajax({  
								 	type:"post",
							        url : path+"/student/saveAnswer.do",// 请求的URL  
							        data : {  
							        	"id" : id  ,
							        	"answer" : answer
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
							 if(result == "false"){
								 alert("系统错误！");
							 }
						})
						
					});
	</script>

	</body>

</html>