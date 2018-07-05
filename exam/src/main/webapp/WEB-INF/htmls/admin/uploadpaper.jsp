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
								<li>试卷中心</li>
								<li class="active">上传试卷</li>
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
								<li class="panel panel-default dropdown">
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
								<li class="panel panel-default dropdown active">
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
											<div class="title">试卷信息</div>
										</div>
									</div>
									<div class="card-body">
									<form class="form-horizontal" id="paper"
										action="${pageContext.request.contextPath}/file/upload.do"
										method="post"
										enctype="multipart/form-data"
										>
										<div class="form-group">
											<label for="keyword" class="col-sm-2 control-label">输入关键词</label>
											<div class="col-sm-5">
												<input type="text" id="keyword" name="keyword">
											</div>
										</div>
										<div class="form-group">
											<label for="File" class="col-sm-2 control-label">File</label>
											<div class="col-sm-5">
												<input type="file" id="File" name="file">
											</div>
										</div>
								
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-5">
												<button type="submit" class="btn btn-default paper_submit">提交</button>
											</div>
										</div>
									</form>
                                       <input type="hidden" id="path" value="${pageContext.request.contextPath}" />
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
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery.validate.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/additional-methods.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/messages_zh.js"></script>
			</div>
		</div>
	</body>
	<script type="text/javascript">
			$(function() {
				$(".paper_submit").click(function(){
					 if(confirm('确定提交试卷吗?')) {
						 $("#paper").submit();
					 }
				})
				jQuery.validator.addMethod("checkDoc", function(value, element) {
					var filepath = $("#File").val();
					//获得上传文件名
					var fileArr = filepath.split("\\");
					var fileTArr = fileArr[fileArr.length - 1].toLowerCase().split(
							".");
					var filetype = fileTArr[fileTArr.length - 1];
					//切割出后缀文件名
					if (filetype != "doc") {
						return false;
					} else {
						return true;
					}
				}, "上传文件格式不适合");
				$("#paper").validate({
					rules : {
						file : {
							required : true,
							checkDoc : true
						}
					},
					messages : {
						file : {
							required : "请选择上传文件",
							checkDoc : "上传文件格式不适合"
						}
					}
				})
			})
	
	</script>

</html>