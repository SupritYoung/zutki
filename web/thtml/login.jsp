<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 

<title>中工知网</title>

</head>
<body>
<form action="/zutki_war_exploded/LoginServlet"method= "post">
      账号:<input type="text" name="username"><br/>
     密码:<input type="password" name="password"><br/>
     <input  type="submit"  value="登陆">
     <h3>${status}</h3>
</form>
</body>
</html>    