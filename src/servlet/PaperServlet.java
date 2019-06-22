package servlet;

import com.mysql.cj.Session;
import dao.LikeDao;
import dao.PaperDao;
import entity.Paper;
import entity.User;

import javax.persistence.metamodel.SetAttribute;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "PaperServlet", urlPatterns = "/PaperServlet")
public class PaperServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PaperDao dao = new PaperDao();

        //展示论文信息
        int pid = Integer.parseInt(request.getParameter("pid"));
        Paper paper = dao.findPaperById(pid);
        request.setAttribute("paper", paper);
        request.getRequestDispatcher("htmls/paper.jsp").forward(request, response);

        //添加一次喜欢
        int lid = (Integer) request.getAttribute("lid");
        dao.addLikeCnt(lid);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        System.out.println(user.toString() +" : " +lid);
        LikeDao.addLike(user.getUid(), lid);
    }
}
