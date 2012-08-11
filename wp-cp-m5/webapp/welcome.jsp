<!doctype html public "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Message</title>
<style>
body {
	background-color: #003366;
	margin-left: auto;
	margin-right: auto;
	margin-top: 15%;
	margin-bottom: 25%;
	height: 240px;
	width: 400px;
}

.box {
	background-color: #C0C0C0;
	height: 100px;
	width: 400px;
	border-top: 20px solid blue;
	padding: 20px;
}

.message {
	float: right;
	width: 80%;
	line-height: 30px;
}
</style>
</head>

<body>
	<img class="img_logo" src="<%=request.getContextPath()%>/themes/200501/images/logo_CP01.gif" border="0" alt="" />
	<div class="box">
		<img src="<%=request.getContextPath()%>/themes/200501/images/stop.gif" border="0" alt="" align="left" />
		<div class="message">
			对不起,我们网站的内容不对您所在的地区开放. 谢谢您对我们的惠顾.<br />
			Sorry, the contents on our website aren’t accessible from your region. Thank you very much for your visit. 
		</div>
	</div>
</body>
</html>
