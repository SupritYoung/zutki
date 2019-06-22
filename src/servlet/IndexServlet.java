package servlet;

import dao.PaperDao;
import entity.Paper;
import entity.User;
import util.ItemSimilarity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Vector;

@WebServlet(name = "IndexServlet", urlPatterns = "/IndexServlet")
public class IndexServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");

        PaperDao dao = new PaperDao();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        //生成推荐
        ArrayList<Paper> recomends = new ArrayList<>();

        if(user!=null)
            recomends = ItemSimilarity.recommend(user.getUid());
        else
            recomends = dao.findTopNPapers(recomends);

        request.setAttribute("recomends", recomends);

        System.out.println("推荐列表为: ");
        for(Paper paper: recomends)
            System.out.println("推荐题目为: "+paper.getTitle());

        request.getRequestDispatcher("htmls/index.jsp").forward(request, response);
    }
}
