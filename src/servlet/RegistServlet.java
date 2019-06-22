package servlet;

import dao.UserDao;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        UserDao dao = new UserDao();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String major = request.getParameter("major");

        if(dao.isExist(username)){
            request.setAttribute("message", "该用户已存在!");
        }else{
            User user = new User(username, password, major, email);
            dao.userAdd(user);
            request.setAttribute("message", "注册成功!");
        }

        response.setHeader("refresh", "3;url=/zutki_war_exploded/index.html");   //3秒后跳转到主页
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
