<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>中工知网</title>
    <link rel="stylesheet" type="text/css">


    <style>

    </style>

</head>

<body>
<div id="example">
    <div class="wrap">
        <header class="top-header">


        </header>
        <main class="form">
            <h3>注册申请</h3>
            <p>注：<span class="red">*</span>为必填内容</p>
            <form action="/zutki_war_exploded/RegistServlet" method="post">
                <fieldset>
                    <legend>账号信息</legend>

                    <label for="username" class="left">用户名：<span class="red">*</span></label>
                    <input type="username" id="username" name="username" class="right" required><br>

                    <label for="password" class="left">密&nbsp;&nbsp;码<span class="red">*</span></label>
                    <input type="password" id="password" name="password" class="right" required><br>

                    <label for="major" class="left">专&nbsp;&nbsp;业<span class="red"></span></label>
                    <select name="major" id="major" class="right">
                        <option value="economics">经济</option>
                        <option value="society">社科</option>
                        <option value="technology">工程</option>
                        <option value="information">信息</option>
                        <option value="others">其他</option>
                    </select><br>


                    <label for="email" class="left"> 邮&nbsp;&nbsp;箱<span class="red">*</span></label>
                    <input type="email" id="email" name="email" class="right" required><br>


                </fieldset>
                <fieldset>

                    <div align="center">
                        <input name="yes" type="checkbox" id="yes"/><label for="yes">已阅读并同意上述条款</label>

                    </div>
                </fieldset>
                <input type="reset" class="btn" value="重 填">
                <input type="submit" class="btn" value="注 册">
                <h3>${message}</h3>
            </form>
        </main>
    </div>
</div>
</body>
</html>