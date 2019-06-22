<%@ page import="entity.Paper" %>
<%@ page import="java.util.Vector" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">

<title>中工知网</title>


<style type="text/css">
.class1{
margin:0px 250px 0px 250px; 


}

.class1 {
	margin: 0px 250px 0px 250px;


}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover {
	background-color: #111;
}

table, td, th {

}

table {

	width: 100%;
}

th {
	border-top-style: solid;
	border-left-style: solid;

	height: 50px;
}

td {
	border-top-style: solid;
	border-left-style: solid;

}

* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}



</style>


</head>





<body>

		<div class="class1">	
	
	<div class="class2">	
		<img src="htmls/header.png" />
	</div>
	<div class="class2"  >
		<ul class="ul1">
			<li class="ul1"><a href="/zutki_war_exploded/IndexServlet">首页</a></li>
			<li class="ul1"><a href="">经济</a></li>
			<li class="ul1"><a href="">信息</a></li>
			<li class="ul1"><a href="">医药</a></li>
			<li class="ul1"><a href="">社科</a></li>
			<li class="ul1"><a href="">农业</a></li>
			<li class="ul1"><a href="">理工</a></li>
			<li class="ul1"><a href="">人文</a></li>
			<li class="ul1"><a href="">工程</a></li>
			<li class="ul1"><a href="">高级检索</a></li>
			<li id="t1" class="ul1"><a href="/zutki_war_exploded/htmls/login.jsp">登录</a></li>
			<li id="t2" class="ul1"><a href="/zutki_war_exploded/htmls/regist.jsp">注册</a></li>
			<li id="welcome"> 欢迎登录</li>

			<script>
				var temp = '<%=request.getParameter("a")%>';
				var id1 = document.getElementById("t1");
				var id2 = document.getElementById("t2");
				var id3 = document.getElementById("welcome");
				if (temp == 0) {
					id1.style.display = "none";
					id2.style.display = "none";
					id3.style.display = "";
				}
			</script>
		</ul>
	</div>
	
		<div >
		
			<form action="/zutki_war_exploded/SearchServlet" method="post">
				<select name="classify">
					<option value="author">作者</option>
					<option value="title">篇名</option>
					
				</select> <input type="search" name="search" /> 
				<input type="submit" value="搜索" />
					
			</form>
</div>
		<div>
		<h2>${paper.title}</h2>
		<h4>摘要:</h4><br/>
		
		${paper.digest}
		
		<h4>论文id:</h4>
		 ${paper.pid}
		
		<h4>下载量：</h4>
		 ${paper.downCnt}
		
		<h4>喜欢人数：</h4>
		${paper.cnt}
			<br>

		<input type="button" value="喜欢" onclick="fun()">
			<script>
				function fun()
				{
					<%
						Paper paper = (Paper)request.getAttribute("paper");
						request.setAttribute("lid", paper.getPid());
					%>
				}
			</script>
		<br>
		<input type="button" value="收藏">
		<input type="button" value="PDF下载">
		</div>
		</div>

</body>
</html>