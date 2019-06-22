package servlet;

import dao.PaperDao;
import entity.Paper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchServlet", urlPatterns = "/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PaperDao dao = new PaperDao();

        String classify = request.getParameter("classify");
        String search = request.getParameter("search");

        List<Paper> papers = dao.SearchPapers(classify, search);

        System.out.println(papers.get(0).toString());
        if(papers!=null){
            Paper paper = papers.get(0);
            request.setAttribute("title", paper.getTitle());
            request.setAttribute("author", paper.getAuthor());
            request.setAttribute("digest", paper.getDigest());
            request.setAttribute("cnt", paper.getCnt());
            request.setAttribute("date", paper.getDate());
            request.setAttribute("downCnt", paper.getDownCnt());
            request.setAttribute("place", paper.getPlace());
            request.setAttribute("source", paper.getSource());
        }else {
            request.setAttribute("message", "找不到您输入的结果! 请重新查找");
        }

        request.setAttribute("papers", papers);
        request.setAttribute("origin", search);
        request.getRequestDispatcher("htmls/classify.jsp").forward(request, response);
        return;
    }
}
