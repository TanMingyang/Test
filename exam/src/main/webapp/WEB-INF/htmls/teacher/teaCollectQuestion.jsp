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
								<li class="active">收藏的题目</li>
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
								<li class="panel panel-default dropdown ">
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
											<div class="title">试题信息</div>
											
										</div>
									</div>
									<div class="card-body">
									<c:forEach items="${collectpageInfo.getList()}" var="quest">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a data-toggle="collapse" data-parent="#accordion" href="#collapse${quest.question.id}">
														<div>
														
															 <ul class="list-group">
															 <c:if test="${!empty quest.question.content }">
					                                            <li class="list-group-item">
					                                            	<p>${quest.question.content}</p>
					                                            </li>
					                                           </c:if>
					                                           <c:if test="${quest.question.questionType eq 1 or  quest.question.questionType eq 2}">
					                                            <c:if test="${!empty quest.question.option1 }">
						                                            <li class="list-group-item">
						                                            	<label>A：</label>
						                                            	${quest.question.option1}
						                                            </li>
					                                            </c:if>
					                                            
					                                           <c:if test="${!empty quest.question.option2 }">
					                                            <li class="list-group-item">
					                                            	<label>B：</label>
					                                            	${quest.question.option2}
					                                            </li>
					                                            </c:if>
					                                            <c:if test="${!empty quest.question.option3 }">
					                                             <li class="list-group-item">
					                                            	<label>C：</label>
					                                            	${quest.question.option3}
					                                            </li>
					                                            </c:if>
					                                            <c:if test="${!empty quest.question.option4}">
					                                             <li class="list-group-item">
					                                            	<label>D：</label>
					                                            	${quest.question.option4}
					                                            </li>
					                                            </c:if>
					                                            </c:if>
					                                        </ul>
					                                        
														</div>
													</a>
												</h4>
												<div class="row">
												<%-- <a id="quest${quest.question.id}" class="btn btn-sm btn-info add_collect_question ${empty collectQuestions[quest.question.id] ?'':'hidden'}"  style="margin-left: 30px" ><i class="fa fa-heart"></i></i>收藏试题</a> --%>
												<a id="quest${quest.question.id}" class="btn btn-sm btn-danger remove_collect_question " style="margin-left: 30px"><i class="fa fa-heart-o"></i>取消收藏</a>
												
												
												<c:if test="${empty paper.questions[quest.question.id] }">
													<a class="btn btn-sm btn-success pull-right add_question" id="quest${quest.question.id}" >加入试卷</a>
													<a class="btn btn-sm btn-danger pull-right remove_question hidden" id="quest${quest.question.id}" >移出试卷</a>
												</c:if>
												<c:if test="${!empty paper.questions[quest.question.id] }">
													<a class="btn btn-sm btn-success pull-right add_question hidden" id="quest${quest.question.id}" >加入试卷</a>
													<a class="btn btn-sm btn-danger pull-right remove_question " id="quest${quest.question.id}" >移出试卷</a>
												</c:if>
												
												
												</div>
											</div>
											<div id="collapse${quest.question.id}" class="panel-collapse collapse">
												<div class="panel-body">
													<div >
															 <ul class="list-group">
					                                            <li class="list-group-item">
					                                            	<label>答案：</label>
					                                            	${quest.question.answer}
					                                            </li>
					                                            <li class="list-group-item">
					                                            	<label>解析：</label>
					                                            	${quest.question.analysis}
					                                            </li>
					                                             <li class="list-group-item">
					                                            	<label>难易度：</label>
					                                            	${quest.question.difficulty}
					                                            </li>
					                                        </ul>
														</div>
												</div>
											</div>
											
										</div>
									</c:forEach>
										<!-- 分页组件 -->
										<div class="row pull-right">
													
													<ul class="pagination pagination-lg">
														<li><a
															href="${pageContext.request.contextPath}/question/page/collect/1/${collectpageInfo.pageSize}.do">
																<span aria-hidden="true">首页</span>
														</a></li>
														<li><a
															href="${pageContext.request.contextPath}/question/page/collect/${collectpageInfo.getPrePage()}/${collectpageInfo.pageSize}.do"
															aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
														</a></li>
														<c:forEach begin="${Math.floor(collectpageInfo.getPrePage()/10)*10+1}"
															end="${Math.floor(collectpageInfo.getPrePage()/10)*10+10}" var="i">
															<c:if test="${i <=collectpageInfo.getPages()}">
												
																<c:if test="${i == collectpageInfo.getPageNum()}">
																	<li><a class="label"
																		href="${pageContext.request.contextPath}/question/page/collect/${i}/${collectpageInfo.pageSize}.do">${i}</a></li>
																</c:if>
																<c:if test="${i != collectpageInfo.getPageNum()}">
																	<li><a
																		href="${pageContext.request.contextPath}/question/page/collect/${i}/${collectpageInfo.pageSize}.do">${i}</a></li>
																</c:if>
															</c:if>
												
														</c:forEach>
														<li><a
															href="${pageContext.request.contextPath}/question/page/collect/${collectpageInfo.getNextPage()}/${collectpageInfo.pageSize}.do"
															aria-label="Next"> <span aria-hidden="true">&raquo;</span>
														</a></li>
														<li><a
															href="${pageContext.request.contextPath}/question/page/collect/${collectpageInfo.getPages()}/${collectpageInfo.pageSize}.do">
																<span aria-hidden="true">尾页</span>
														</a></li>
														<li><span><input style="width: 30px; height: 20px;"
																type="text" value="${collectpageInfo.getPageNum()}" class="pageno">/${collectpageInfo.getPages()}</span></li>
														<li><a href="#" id="jump"><span>跳转</span></a></li>
														<input type="hidden" id="pagesize" value="${collectpageInfo.pageSize}" />
														<input type="hidden" id="path"
															value="${pageContext.request.contextPath}" />
														<input type="hidden" id="pages" value="${collectpageInfo.getPages()}" />
													</ul>
											</div>
												
									
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- 试题蓝 -->
				<div class="suspension">
					<div class="suspension_body">
						<a href="javascript:" class="bar"></a>
						<ul class="list-group question_bar">
							<li class="list-group-item" style="text-align: center;">
								共计 （ ）题目
							</li>
						</ul>
						<a href="${pageContext.request.contextPath}/jump/preview.do" class="btn btn-sm btn-info "style=" margin-left: 74px;">生成试卷</a>
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
				<script type="text/javascript">
		$(function() {
			/* 试题蓝 */
			$('.suspension').css('right', '-241px');
			var path = $("#path").val();
			$('.bar').css("background","url("+path+"/img/lan.png)");
			
			var expanded = true;
			$('.bar').click(function() {
				if(expanded) {
					$('.suspension').animate({
						right: '0'
					}, 500);
					$('.bar').css('background-position', '0px 0px');

				} else {
					$('.suspension').animate({
						right: '-241px'
					}, 500);
					$('.bar').css('background-position', '-0px 0px');
				}
				expanded = !expanded;
				var path = $("#path").val();
				var result ;
				 $.ajax({  
					 	type:"post",
				        url : path+"/question/questionNum.do",// 请求的URL  
				        data : {},
				        async : false, // 改异步为同步  
				        dataType : 'json',  
				        success : function(data) { 
				        	var parsedJson = eval(data);
				        	result = parsedJson;
				        }
				 });
				 var count = 0;
				 $.each(result, function (n, value) {
					 count = count + value;
	        		 console.log(n);
	        		 console.log(value);
	             });
				$(this).siblings("ul").html("")
				$(this).siblings("ul").append("<li class='list-group-item' style='text-align: center;'>共计 （ "+count+" ）题目</li>"); 
				
				$.each(result, function (n, value) {
	        		 $(".question_bar").append("<li class='list-group-item'><label>"+n+"：</label>"+value+"道</li>");
	            });
				
			});
			/* 分页的js */
			$("#jump").click(
					function() {
						var page = $(".pageno");
						var i = Number(page.val());
						var pagesize = $("#pagesize").val();
						var path = $("#path").val();
						var pages = Number($("#pages").val());
						console.log(pages);
						if (isNaN(i) || i < 0) {
							alert("请输入正确的页码!");
							return;
						} else {
							if (i > pages) {
								i = pages;
							}
							$(this).prop(
									"href",
									path + "/question/collect/page/" + i + "/" + pagesize
											+ ".do");
						}
						/* location.href = "/city/"+i+"/"+text+".do"; */
					});
			/* 筛选JS */
			$("#select_one a").click(function () {
				$(this).addClass("btn-warning").parent().siblings().children().removeClass("btn-warning");
				if ($(this).hasClass("select-all")) {
					$("#selectA").parent().remove();
				} else {
					var copyThisA = $(this).clone();
					if ($("#selectA").length > 0) {
						$("#selectA").html($(this).text());
						
					} else {
						var $li = $("<li></li>");
						$li.append(copyThisA.attr("id", "selectA"))
						$("#select_result").append($li);
					}
				}
			});
			$("#select_two a").click(function () {
				$(this).addClass("btn-warning").parent().siblings().children().removeClass("btn-warning");
				if ($(this).hasClass("select-all")) {
					$("#selectB").parent().remove();
				} else {
					var copyThisA = $(this).clone();
					if ($("#selectB").length > 0) {
						$("#selectB").html($(this).text());
					} else {
						var $li = $("<li></li>");
						$li.append(copyThisA.attr("id", "selectB"))
						$("#select_result").append($li);
					}
				}
			});
			$("#select_three a").click(function () {
				$(this).addClass("btn-warning").parent().siblings().children().removeClass("btn-warning");
				if ($(this).hasClass("select-all")) {
					$("#selectC").parent().remove();
				} else {
					var copyThisA = $(this).clone();
					if ($("#selectC").length > 0) {
						$("#selectC").html($(this).text());
					} else {
						var $li = $("<li></li>");
						$li.append(copyThisA.attr("id", "selectC"))
						$("#select_result").append($li);
					}
				}
			});
			/* 增加试题 */
			$(".add_question").click(function(){
				var str = $(this).prop("id");
				var i = "quest".length;
				var id = str.substr(i);
				var path = $("#path").val();
				var result = "false";
				 $.ajax({  
					 	type:"post",
				        url : path+"/question/addQuestion.do",// 请求的URL  
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
					$(this).addClass("hidden");
					$(this).siblings(".remove_question").removeClass("hidden")
				 }
				 /* 试题蓝 */
					var result ;
					 $.ajax({  
						 	type:"post",
					        url : path+"/question/questionNum.do",// 请求的URL  
					        data : {},
					        async : false, // 改异步为同步  
					        dataType : 'json',  
					        success : function(data) { 
					        	var parsedJson = eval(data);
					        	result = parsedJson;
					        }
					 });
					 var count = 0;
					 $.each(result, function (n, value) {
						 count = count + value;
		        		 console.log(n);
		        		 console.log(value);
		             });
					$(".question_bar").html("")
					$(".question_bar").append("<li class='list-group-item' style='text-align: center;'>共计 （ "+count+" ）题目</li>"); 
					$.each(result, function (n, value) {
		        		 $(".question_bar").append("<li class='list-group-item'><label>"+n+"：</label>"+value+"道</li>");
		            });
				
			});
			/* 移出试题 */
			$(".remove_question").click(function(){
				var str = $(this).prop("id");
				var i = "quest".length;
				var id = str.substr(i);
				var path = $("#path").val();
				var result = "false";
				 $.ajax({  
					 	type:"post",
				        url : path+"/question/removeQuestion.do",// 请求的URL  
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
					$(this).addClass("hidden");
					$(this).siblings(".add_question").removeClass("hidden")
				 }
				 /* 试题蓝 */
					var result ;
					 $.ajax({  
						 	type:"post",
					        url : path+"/question/questionNum.do",// 请求的URL  
					        data : {},
					        async : false, // 改异步为同步  
					        dataType : 'json',  
					        success : function(data) { 
					        	var parsedJson = eval(data);
					        	result = parsedJson;
					        }
					 });
					 var count = 0;
					 $.each(result, function (n, value) {
						 count = count + value;
		        		 console.log(n);
		        		 console.log(value);
		             });
					$(".question_bar").html("")
					$(".question_bar").append("<li class='list-group-item' style='text-align: center;'>共计 （ "+count+" ）题目</li>"); 
					$.each(result, function (n, value) {
		        		 $(".question_bar").append("<li class='list-group-item'><label>"+n+"：</label>"+value+"道</li>");
		            });
			});
			/* 保存搜索信息 */
			$(".questcont").blur(function(){
				var path = $("#path").val();
				var content = $(this).val();
				 $.ajax({  
					 	type:"post",
				        url : path+"/question/savecontent.do",// 请求的URL  
				        data : {"content":content},
				        async : false, // 改异步为同步  
				        dataType : 'json',  
				        success : function() { 
				        }
				 });
			});
			$(".questcont").focus(function(){
				var path = $("#path").val();
				var content = $(this).val();
				 $.ajax({  
					 	type:"post",
				        url : path+"/question/savecontent.do",// 请求的URL  
				        data : {"content":content},
				        async : false, // 改异步为同步  
				        dataType : 'json',  
				        success : function() { 
				        }
				 });
			});
			
			$(".questcont").keydown(function(e){
				var path = $("#path").val();
				var content = $(this).val();
				 $.ajax({  
					 	type:"post",
				        url : path+"/question/savecontent.do",// 请求的URL  
				        data : {"content":content},
				        async : false, // 改异步为同步  
				        dataType : 'json',  
				        success : function() { 
				        }
				 });
				 if(e.keyCode == 13){
					 location.href(path+"/question/page/1/5.do");
					}
			});
			/* 收藏试题 */
			$(".add_collect_question").click(function(){
				var str = $(this).prop("id");
				var i = "quest".length;
				var id = str.substr(i);
				var path = $("#path").val();
				var result = "false";
				 $.ajax({  
					 	type:"post",
				        url : path+"/question/addCollectQuestion.do",// 请求的URL  
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
					$(this).addClass("hidden");
					$(this).siblings(".remove_collect_question").removeClass("hidden")
				 }
			});
			/* 取消收藏 */
			$(".remove_collect_question").click(function(){
				var str = $(this).prop("id");
				var i = "quest".length;
				var id = str.substr(i);
				var path = $("#path").val();
				var result = "false";
				 $.ajax({  
					 	type:"post",
				        url : path+"/question/removeCollectQuestion.do",// 请求的URL  
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
					$(this).addClass("hidden");
					$(this).siblings(".add_collect_question").removeClass("hidden")
				 }
				 $(this).parents(".panel").remove();
			});
			
		})
	</script>
		</div>
	</div>
	</body>

</html>