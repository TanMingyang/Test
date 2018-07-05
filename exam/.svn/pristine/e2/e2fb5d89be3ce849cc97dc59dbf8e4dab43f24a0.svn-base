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
								<li>试卷库</li>
								<li class="active">模拟卷</li>
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
								<li class="panel panel-default dropdown">
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
								<li class="panel panel-default dropdown active">
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
											<div class="title">试卷信息</div>
										</div>
									</div>
									<div class="card-body">
									
									<table class="datatable table table-striped" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>标题</th>
                                                <th>作者</th>
                                                <th>类型</th>
                                                <th>上传时间</th>
                                                <th>预览</th>
                                                <th>下载</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>标题</th>
                                                <th>作者</th>
                                                <th>类型</th>
                                                <th>上传时间</th>
                                                <th>预览</th>
                                                <th>下载</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                             <c:forEach items="${flist}" var="file">
	                                            <tr>
	                                                <td>${file.title}</td>
	                                                <td>${file.creator }</td>
	                                                <td>${file.keyword }</td>
	                                                <td>${file.createTime }</td>
	                                                <td><button id="file${file.id}" type="button" class="btn btn-primary btn-sm swfload" data-toggle="modal">预览
														</button></td>
													<td><a href="${pageContext.request.contextPath}/file/download/${file.id}.do" class="btn btn-warning btn-sm"><span class="glyphicon glyphicon-save" aria-hidden="true"></span>下载</a></td>
	                                            </tr>
                                            </c:forEach> 
                                         </tbody>
                                         
                                       </table>
                                       <input type="hidden" id="path" value="${pageContext.request.contextPath}" />
                                       <!-- 预览的模态框 -->
										<!-- Modal -->
										<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											<div class="modal-dialog" style="width: 800px; height: 500px;">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
														<h4 class="modal-title" id="myModalLabel">文档预览</h4>
													</div>
													<div class="modal-body">
									
														<div id="documentViewer" class="flexpaper_viewer"
															style="height: 550px"></div>
									
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
														<button type="button" class="btn btn-primary">Save changes</button>
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
				/* 项目路径  */
				function getContentPath() {
					var pathName = document.location.pathname;
					var index = pathName.substr(1).indexOf("/");
					var path = pathName.substr(0, index + 1);
					return path;
				}
				$(".swfload").click(function() {
					var str = $(this).prop("id");
					var i = "file".length;
					var fid = str.substr(i);
					console.log(fid);
					var path = $("#path").val();
					console.log(path);
					$.post(path + "/file/yulan.do", {
						"fid" : fid
					}, function(data) {
						var parsedJson = eval(data);
						console.log(parsedJson.swf);
						/* 模态框中的swf：FlexPaperViewer */
						var fp = $('#documentViewer').FlexPaperViewer({
							config : {
								SwfFile : getContentPath() + parsedJson.swf,
								Scale : 0.6,
								ZoomTransition : 'easeOut',
								ZoomTime : 0.5,
								ZoomInterval : 0.2,
								FitPageOnLoad : true,
								FitWidthOnLoad : true,
								FullScreenAsMaxWindow : true,
								ProgressiveLoading : true,
								MinZoomSize : 0.2,
								MaxZoomSize : 5,
								SearchMatchAll : false,
								InitViewMode : 'Portrait',
								ViewModeToolsVisible : true,
								ZoomToolsVisible : true,
								NavToolsVisible : true,
								CursorToolsVisible : true,
								SearchToolsVisible : true,
								localeChain : 'zh_CN',
							}
						});
						$('#myModal').modal();
					})
		
				});
		
			})
	
	</script>

</html>