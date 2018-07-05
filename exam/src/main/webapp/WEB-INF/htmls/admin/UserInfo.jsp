<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<style type="text/css">
		.error {
   			 color: red;
		}
	</style>
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
								<li class="panel panel-default dropdown">
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
											<div class="title">用户信息</div>
										</div>
									</div>
									<div class="card-body">
										<div class="step">
											<ul class="nav nav-tabs nav-justified" role="tablist">
												<li role="step" class="active">
													<a href="#step1" id="step1-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">
														<div class="icon fa fa-truck"></div>
														<div class="step-title">
															<div class="title">修改信息</div>
														</div>
													</a>
												</li>
												<li role="step">
													<a href="#step2" role="tab" id="step2-tab" data-toggle="tab" aria-controls="profile">
														<div class="icon fa fa-credit-card"></div>
														<div class="step-title">
															<div class="title">修改密码</div>
														</div>
													</a>
												</li>
											</ul>
											<div class="tab-content">
												<div role="tabpanel" class="tab-pane fade in active" id="step1" aria-labelledby="home-tab">
													<div class="row">
														<div class="col-xs-12">
															<div class="card">
																<div class="card-header">
																	<div class="card-title">
																		<div class="title">个人信息</div>
																	</div>
																</div>
																<div class="card-body">
																	<form action="${pageContext.request.contextPath}/user/changeUserInfo.do" method="post" id="userInfo">
																		<div class="form-group">
																			<input type="hidden" class="form-control" id="id" name="id" value="${sessionScope.user.id}">
																		</div>
																	
																		<div class="form-group">
																			<label for="username">用户名</label>
																			<input type="text" class="form-control" id="username" name="username" placeholder="用户名" value="${sessionScope.user.username}" disabled>
																		</div>
																		<div class="form-group">
																			<label for="email">邮箱</label>
																			<input type="email" class="form-control" id="email" name="email" placeholder="邮箱" value="${sessionScope.user.email}">
																		</div>
																		<div class="form-group">
																			<label for="realname">姓名</label>
																			<input type="text" class="form-control" id="realname" name="realname" placeholder="姓名" value="${sessionScope.user.realname}">
																		</div>
																		<div class="form-group">
																			<label for="phone">电话</label>
																			<input type="text" class="form-control" id="phone" name="phone" placeholder="电话" value="${sessionScope.user.phone}">
																		</div>
																		<!-- <div class="form-group">
																			<label for="photo">头像</label>
																			<input type="file" id="photo" name="photo">
																		</div> -->
																		<button type="submit" class="btn btn-default">提交</button>
																	</form>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div role="tabpanel" class="tab-pane fade" id="step2" aria-labelledby="profile-tab">
													<div class="row">
														<div class="col-xs-12">
															<div class="card">
																<div class="card-header">
																	<div class="card-title">
																		<div class="title">修改密码</div>
																	</div>
																</div>
																<div class="card-body">
																	<form action="${pageContext.request.contextPath}/user/changeUserPwd.do" method="post" id="changeUserPwd">
																		<div class="form-group">
																		<input type="hidden" id="path" value="${pageContext.request.contextPath}" />
																			<label for="oldpassword">原密码</label>
																			<input type="password" class="form-control" id="oldpassword" name="oldpassword" placeholder="原密码">
																		</div>
																		<div class="form-group">
																			<label for="newpassword">新密码</label>
																			<input type="password" class="form-control" id="newpassword" name="newpassword" placeholder="x新密码">
																		</div>
																		<div class="form-group">
																			<label for="renewpassword">重复密码</label>
																			<input type="password" class="form-control" id="renewpassword" name="renewpassword" placeholder="重复密码">
																		</div>
																		
																		<button type="submit" class="btn btn-default">提交</button>
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
						jQuery.validator.addMethod("changeUserPwd", function(value, element) {
							var path = $("#path").val();
							var oldpassword = $("#oldpassword").val();
							var result = "false";
							console.log(path);
							 $.ajax({  
								 	type:"post",
							        url : path+"/user/checkUserPwd.do",// 请求的URL  
							        data : {  
							            "oldpassword" : oldpassword  
							        },
							        async : false, // 改异步为同步  
							        dataType : 'json',  
							        success : function(data) { 
							        	console.log(data);
							        	var parsedJson = eval(data);
										console.log(parsedJson.result);
										result = parsedJson.result
							        } ,
							        error : function(){
							        	console.log("error");
							        }
							    });  
							 if(result == "true"){
								 return true;
							 }else {
								 return false;
							 }
						}, "原密码不正确！");
						$("#changeUserPwd").validate({
							rules : {
								oldpassword : {
									required : true,
									changeUserPwd : true
								},
								newpassword : {
									required : true,
									minlength : 5
								},
								renewpassword : {
									required : true,
									minlength : 5,
									equalTo:'#newpassword'
								}
			
							},
							messages : {
								oldpassword : {
									required : "请输入您的密码",
									changeUserPwd : "原密码不正确！"
								},
								newpassword : {
									required : "请输入密码",
									minlength : "密码长度不能小于 5 个字母"
								},
								renewpassword : {
									required : "请输入密码",
									minlength : "密码长度不能小于 5 个字母",
									equalTo:"密码不一致"
								}
							}
						});
						// 手机号码验证  
						jQuery.validator.addMethod("isMobile", function(value, element) {  
						    var length = value.length;  
						    var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;  
						    return this.optional(element) || (length == 11 && mobile.test(value));  
						}, "请正确填写您的手机号码");  
						
						$("#userInfo").validate({
							rules : {
								email : {
									email : true
								},
								phone : {
									isMobile:true
								}
			
							},
							messages : {
								email : {
								},
								phone : {
								}
							}
						});
					});
	</script>

	</body>

</html>