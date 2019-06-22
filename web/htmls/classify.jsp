<%@ page import="entity.Paper" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Vector" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <!-- Bootstrap theme -->
    <link href="../../dist/css/bootstrap-theme.min.css" rel="stylesheet">
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="theme.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]>
    <script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>


<!-- Fixed navbar -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/zutki_war_exploded/IndexServlet">首页</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="#">经济</a></li>
                <li><a href="#">信息</a></li>
                <li><a href="#">医药</a></li>
                <li><a href="#">社科</a></li>
                <li><a href="#">理工</a></li>
                <li><a href="#">工程</a></li>
                <li><a href="#">高级检索</a></li>
                <li><a href="/zutki_war_exploded/htmls/login.jsp">登陆</a></li>
                <li><a href="/zutki_war_exploded/htmls/regist.jsp">注册</a></li>
                <li><a href="/zutki_war_exploded/LogoutServlet">退出登陆</a></li>

            </ul>
            <div class="col-lg-6" style="width: 300px;">
                <div class="input-group">
                    <input type="text" class="form-control">
                    <span class="input-group-btn">
								<button class="btn btn-default" type="button">
									Go!
								</button>
							</span>
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container theme-showcase" role="main">

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
        <h1>欢迎来到中国知网</h1>
        <p>在这里希望你能找到您想要的一切</p>
    </div>

    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="img/htmls/pic-1.jpg" width="100%" height="100%" alt="First slide">
            </div>
            <div class="item">
                <img src="img/htmls/pic-2.jpg" width="100%" height="100%" alt="Second slide">
            </div>
            <div class="item">
                <img src="img/htmls/pic-3.jpg" width="100%" height="100%" alt="Third slide">
            </div>

        </div>
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="page-header">
        <h1>${origin}的搜索结果</h1>
    </div>
    <div class="row">
        <!--div class="col-md-6"-->
        <!--table class="table"-->

        <div class="table-responsive">
            <table class="table table-striped">
                <tr>
                    <th>论文编号</th>
                    <th>题目</th>
                    <th>作者</th>
                    <th>来源</th>
                    <th>发表时间</th>
                    <th>下载量</th>
                </tr>
                <%
                    ArrayList<Paper> papers = (ArrayList<Paper>) request.getAttribute("papers");
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


</div> <!-- /container -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../../assets/js/docs.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
