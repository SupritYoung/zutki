<%@ page import="entity.Paper" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
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

table,td,th
{
	
}
table
{

	width:100%;
}
th
{
    border-top-style:solid;
    border-left-style:solid;
 
	height:50px;
}
td{
  border-top-style:solid;
    border-left-style:solid;
  
}

* {
            margin: 0;
            padding: 0;
            text-decoration: none;
        }
        
     body {
            padding: 20px;
        }
   
        #container {
            position: relative;
            width: 600px;
            height: 400px;
            border: 3px solid #333;
            overflow: hidden;
        }
        
        #list {
            position: absolute;
            z-index: 1;
            width: 4200px;
            height: 400px;
        }
        
        #list img {
            float: left;
            width: 600px;
            height: 400px;
        }
        
        #buttons {
            position: absolute;
            left: 250px;
            bottom: 20px;
            z-index: 2;
            height: 10px;
            width: 100px;
        }
        
        #buttons span {
            float: left;
            margin-right: 5px;
            width: 10px;
            height: 10px;
            border: 1px solid #fff;
            border-radius: 50%;
            background: #333;
            cursor: pointer;
          }
  
        #buttons .on {
            background: orangered;
        }
        
        .arrow {
            position: absolute;
            top: 180px;
            z-index: 2;
            display: none;
            width: 40px;
            height: 40px;
            font-size: 36px;
            font-weight: bold;
            line-height: 39px;
            text-align: center;
            color: #fff;
            background-color: RGBA(0, 0, 0, .3);
            cursor: pointer;
        }
        
        .arrow:hover {
            background-color: RGBA(0, 0, 0, .7);
        }
        
        #container:hover .arrow {
            display: block;
        }
        
        #prev {
            left: 20px;
        }
        
        #next {
            right: 20px;
        }

</style>
</head>


<body>

		<div class="class1">

			<div class="class2">
				<img src="htmls/header.png"/>
			</div>
			<div class="class2">
				<ul class="ul1">
					<li class="ul1"><a href="/zutki_war_exploded/IndexServlet>首页</a></li>
					<li class="ul1"><a href="">经济</a></li>
					<li class="ul1"><a href="">信息</a></li>
					<li class="ul1"><a href="">医药</a></li>
					<li class="ul1"><a href="">社科</a></li>
					<li class="ul1"><a href="">农业</a></li>
					<li class="ul1"><a href="">理工</a></li>
					<li class="ul1"><a href="">人文</a></li>
					<li class="ul1"><a href="">工程</a></li>
					<li class="ul1"><a href="">高级检索</a></li>
					<li  id="t1" class="ul1"><a href="/zutki_war_exploded/htmls/login.jsp">登录</a></li>
					<li id="t2"  class="ul1"><a href="/zutki_war_exploded/htmls/regist.jsp">注册</a></li>
					<li id="welcome"> 欢迎登录</li>

					<script>
						var temp='<%=request.getParameter("a")%>';
						var id1=document.getElementById("t1");
						var id2=document.getElementById("t2");
						var id3=document.getElementById("welcome");
						if(temp==0){
							id1.style.display="none";
							id2.style.display="none";
							id3.style.display="";
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


			<div><h3>搜索结果</h3>
				<table>
					<tr>
						<th>论文编号</th>
						<th>题名</th>
						<th>作者</th>
						<th>来源</th>
						<th>发表时间</th>
						<th>下载量</th>
					</tr>
					<%
						List<Paper> papers = (List<Paper>) request.getAttribute("papers");
					%>
					<c:forEach items="${papers}" var="papers">
						<tr>
							<td><a href="/zutki_war_exploded/PaperServlet?pid=${papers.pid}">${papers.pid}</a></td>
							<td><a href="/zutki_war_exploded/PaperServlet?pid=${papers.pid}">${papers.title}</a></td>
							<td>${papers.author}</td>
							<td>${papers.source}</td>
							<td>${papers.date}</td>
							<td>${papers.downCnt}</td>
						</tr>
					</c:forEach>
				</table>
			</div>

 		 </div>
  </div>
  </body>
  </html>
 