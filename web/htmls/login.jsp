<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>中工知网</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]>
    <script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
        html, body {

            width: 100%;

            height: 100%;

        }

        .mui-content {

            background: url(img/htmls/paper.jpg) bottom center no-repeat #efeff4;

            background-size: 100% 100%;

            width: 100%;

            height: 100%;

        }

    </style>

</head>

<body class="mui-content">
<div>
    <h1 style="border: aliceblue;text-align: center; height: 50px;"> 登录</h1>
</div>
<div class="container" style="border: blanchedalmond;width:500px;height:300px;text-align:center;>
	  
      <form class=" form-signin>

<form action="/zutki_war_exploded/LoginServlet"method= "post">
    <h2 class="form-signin-heading">请登录</h2>
    <label for="inputEmail" class="sr-only">电子邮箱</label>
    <input type="text" id="inputEmail" name="username" class="form-control" placeholder="Username" required autofocus>
    <label for="inputPassword" class="sr-only">密码</label>
    <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
    <div class="checkbox">
        <label>
            <input type="checkbox" value="remember-me"> 记住密码
        </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
    <h3>${status}</h3>
</form>

</div> <!-- /container -->


<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
