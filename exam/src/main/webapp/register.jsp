<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>注册页面</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/register.css">
</head>
<style type="text/css">
		.error {
   			 color: #bf9257;
		}
	</style>
<body>
	<div class="container">
		<div class="wrapper">
			<ul class="steps">
				<li class="is-active">Step 1</li>
				<li>Step 2</li>
			</ul>
			<form class="form-wrapper" action="${pageContext.request.contextPath}/user/register.do" method="post" id="register">
				<fieldset class="section is-active">
					<h3>用户类型</h3>
					<div class="row cf">
						<div class="six col">
							<input type="radio" name="roleId" id="r1" value = "3" checked> <label
								for="r1">
								<h4>学生</h4>
							</label>
						</div>
						<div class="six col">
							<input type="radio" name="roleId" value = "2" id="r2"><label for="r2">
								<h4>教师</h4>
							</label>
						</div>
					</div>
					<div class="button">下一步</div>
					<a href="${pageContext.request.contextPath}/jump/login.do"><div class="back">已有账号,登录</div></a>
				</fieldset>
				<fieldset class="section">
					<h3>注册</h3>
					<input type="hidden" id="path"
			value="${pageContext.request.contextPath}" />
					<input type="text" name="username" id="username" placeholder="用户名">
					<input type="text" name="email" id="email" placeholder="邮箱">
					<input type="password" name="password" id="password"
						placeholder="密码"> <input type="password" name="repassword"
						id="repassword" placeholder="重复密码"> 
						<input class="submit" type="submit" value="注册">
						<div class="back">上一步</div>
				</fieldset>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery-1.7.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/register.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery.validate.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/js/additional-methods.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/lib/js/messages_zh.js"></script>
	<script type="text/javascript">
		$(function() {
			jQuery.validator.addMethod("checkUsername", function(value, element) {
				var path = $("#path").val();
				var username = $("#username").val();
				var result = "false";
				console.log(path);
				 $.ajax({  
					 	type:"post",
				        url : path+"/user/checkUsername.do",// 请求的URL  
				        data : {  
				            "username" : username  
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
			}, "用户名已存在");
			$("#register").validate({
				rules : {
					username : {
						required : true,
						checkUsername : true
					},
					email : "required",
					password : {
						required : true,
						minlength : 5
					},
					repassword : {
						required : true,
						minlength : 5,
						equalTo:'#password'
					}

				},
				messages : {
					username : {
						required : "请输入您的账户",
						checkUsername : "用户名已存在"
					},
					email : "请输入您的账户",
					password : {
						required : "请输入密码",
						minlength : "密码长度不能小于 5 个字母"
					},
					repassword : {
						required : "请输入密码",
						minlength : "密码长度不能小于 5 个字母",
						equalTo:"密码不一致"
					}
				}
			})
		});
	</script>
</body>
</html>
