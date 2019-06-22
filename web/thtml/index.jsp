<%@ page import="entity.Paper" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Vector" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <title>中工知网</title>


    <style type="text/css">
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

        #welcome {
            display: none;
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

    <div>

        <form action="/zutki_war_exploded/SearchServlet" method="post">
            <select name="classify">
                <option value="author">作者</option>
                <option value="title">篇名</option>

            </select> <input type="search" name="search"/>
            <input type="submit" value="搜索"/>

        </form>


        <div id="container">
            <div id="list" style="left: -600px;">
                <img src="htmls/5.jpg" alt="1"/>
                <img src="htmls/1.jpg" alt="1"/>
                <img src="htmls/2.jpg" alt="2"/>
                <img src="htmls/3.jpg" alt="3"/>
                <img src="htmls/4.jpg" alt="4"/>
                <img src="htmls/5.jpg" alt="5"/>
                <img src="htmls/1.jpg" alt="5"/>
            </div>
            <div id="buttons">
                <span index="1" class="on"></span>
                <span index="2"></span>
                <span index="3"></span>
                <span index="4"></span>
                <span index="5"></span>
            </div>
            <a href="javascript:;" id="prev" class="arrow">&lt;</a>
            <a href="javascript:;" id="next" class="arrow">&gt;</a>
        </div>
        <script type="text/javascript">
            /* 知识点：        */
            /*       this用法 */
            /*       DOM事件 */

            window.onload = function () {
                var container = document.getElementById('container');
                var list = document.getElementById('list');
                var buttons = document.getElementById('buttons').getElementsByTagName('span');
                var prev = document.getElementById('prev');
                var next = document.getElementById('next');
                var index = 1;
                var timer;

                function animate(offset) {
                    var newLeft = parseInt(list.style.left) + offset;
                    list.style.left = newLeft + 'px';
                    if (newLeft > -600) {
                        list.style.left = -3000 + 'px';
                    }
                    if (newLeft < -3000) {
                        list.style.left = -600 + 'px';
                    }
                }

                function play() {
                    //重复执行的定时器
                    timer = setInterval(function () {
                        next.onclick();
                    }, 2000)
                }

                function stop() {
                    clearInterval(timer);
                }

                function buttonsShow() {
                    //将之前的小圆点的样式清除
                    for (var i = 0; i < buttons.length; i++) {
                        if (buttons[i].className == "on") {
                            buttons[i].className = "";
                        }
                    }
                    //数组从0开始，故index需要-1
                    buttons[index - 1].className = "on";
                }

                prev.onclick = function () {
                    index -= 1;
                    if (index < 1) {
                        index = 5
                    }
                    buttonsShow();
                    animate(600);
                };
                next.onclick = function () {
                    index += 1;
                    if (index > 5) {
                        index = 1
                    }
                    animate(-600);
                    buttonsShow();
                };

                for (var i = 0; i < buttons.length; i++) {
                    (function (i) {
                        buttons[i].onclick = function () {

                            /*   这里获得鼠标移动到小圆点的位置，用this把index绑定到对象buttons[i]上，去谷歌this的用法  */
                            /*   由于这里的index是自定义属性，需要用到getAttribute()这个DOM2级方法，去获取自定义index的属性*/
                            var clickIndex = parseInt(this.getAttribute('index'));
                            var offset = 600 * (index - clickIndex); //这个index是当前图片停留时的index
                            animate(offset);
                            index = clickIndex; //存放鼠标点击后的位置，用于小圆点的正常显示
                            buttonsShow();
                        }
                    })(i)
                }

                container.onmouseover = stop;
                container.onmouseout = play;
                play();

            }
        </script>

        　　　

        <div>
            <h3>为您推荐</h3>
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
                    ArrayList<Paper> recomends = (ArrayList<Paper>) request.getAttribute("recomends");
                %>
                <c:forEach items="${recomends}" var="recomend">
                    <tr>
                        <td><a href="/zutki_war_exploded/PaperServlet?pid=${recomend.pid}">${recomend.pid}</a></td>
                        <td><a href="/zutki_war_exploded/PaperServlet?pid=${recomend.pid}">${recomend.title}</a></td>
                        <td>${recomend.author}</td>
                        <td>${recomend.source}</td>
                        <td>${recomend.date}</td>
                        <td>${recomend.downCnt}</td>
                    </tr>
                </c:forEach>


            </table>
        </div>

        <div>
            <h3>最新发表</h3>
            <table>
                <tr>
                    <th>论文编号</th>
                    <th>题名</th>
                    <th>作者</th>
                    <th>来源</th>
                    <th>作者</th>
                    <th>下载量</th>
                </tr>
                <%
                    Vector<Paper> papers = (Vector<Paper>) request.getAttribute("papers");
                %>
                <c:forEach items="${papers}" var="paper">
                    <tr>
                        <td><a href="/zutki_war_exploded/PaperServlet?pid=${paper.pid}">${paper.pid}</a></td>
                        <td><a href="/zutki_war_exploded/PaperServlet?pid=${paper.pid}">${paper.title}</a></td>
                        <td>${paper.author}</td>
                        <td>${paper.source}</td>
                        <td>${paper.date}</td>
                        <td>${paper.downCnt}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</div>
</body>
</html>
