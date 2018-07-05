<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<head>
		<meta charset="utf-8">
		<title>登录界面</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
	</head>
	<style type="text/css">
		.error {
   			 color: red;
		}
	</style>
	<body>
		<div class="wrap login_wrap">
			<div class="content">
				<div class="logo"></div>
				<div class="login_box">
					<div class="login_form">
						<div class="login_title">
							登录
						</div>
						<form action="${pageContext.request.contextPath}/user/login.do" method="post" id="Login">

							<div class="form_text_ipt">
								<input name="username" type="text" placeholder="用户名">
							</div>
							<div class="form_text_ipt">
								<input name="password" type="password" placeholder="密码">
							</div>
							<div class="form_check_ipt" style=" margin-top: 19px;">
								<span class="error">${sessionScope['org.springframework.web.servlet.support.SessionFlashMapManager.FLASH_MAPS'][0]['loginError']}</span>
							</div>
							<div class="form_btn">
								<button type="submit" >登录</button>
							</div>
							<div class="form_reg_btn">
								<span>还没有帐号？</span>
								<a href="${pageContext.request.contextPath}/register.jsp">马上注册</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery.validate.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/additional-methods.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/messages_zh.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#Login").validate({
					rules : {
						username : "required",
						password : {
							required : true,
							minlength : 5
						}
	
					},
					messages : {
						username : "请输入您的账户",
						password : {
							required : "请输入密码",
							minlength : "密码长度不能小于 5 个字母"
						}
					}
				})
			});
		</script>
	</body>

</html>