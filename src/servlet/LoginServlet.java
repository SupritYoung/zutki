package servlet;

import dao.UserDao;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", urlPatterns = "/LoginServlet")
public class LoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDao dao = new UserDao();

        //查看数据库中是否有该用户
        User qUser = dao.findByName(username);
        if(qUser==null){
            request.setAttribute("status", "该用户不存在");
            System.out.println("该用户不存在");
        }else if(qUser.getPassword().equals(password)){
            request.setAttribute("status", "登录成功, 等待跳转...");
            System.out.println("登录成功, 等待跳转...");
            request.getSession().setAttribute("user",qUser);
        }else {
            System.out.println("账号或密码输入错误");
            request.setAttribute("status", "账号或密码输入错误");
        }
        response.sendRedirect("/zutki_war_exploded/IndexServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
