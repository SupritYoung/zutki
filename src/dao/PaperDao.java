package dao;

import entity.Like;
import entity.Paper;
import util.BaseDao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class PaperDao {
    public Paper findPaperById(int pid){
        Connection con=null;
        ResultSet rs=null;
        Statement st=null;

        Paper paper = new Paper();
        try {
            String sql="SELECT * FROM zutki.papers where pid = "+pid+";";
            System.out.println(sql);
            con= BaseDao.getConnection();
            st=con.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next()){
                paper.setPid(rs.getInt("pid"));
                paper.setAuthor(rs.getString("author"));
                paper.setCnt(rs.getInt("downCnt"));
                paper.setDate(rs.getDate("date"));
                paper.setDigest(rs.getString("digest"));
                paper.setPlace(rs.getString("place"));
                paper.setSource(rs.getString("source"));
                paper.setTitle(rs.getString("title"));
            }
        }catch(Exception e) {
            e.printStackTrace();
        }finally{
            BaseDao.closeAll(rs, st, con);
        }
        return paper;
    }

    public ArrayList<Paper> findTopNPapers(ArrayList<Paper> papers){
        //将喜欢人数最多的论文补入推荐列表, 直至满五篇(考虑重复)
        Connection con=null;
        ResultSet rs=null;
        Statement st=null;

        try {
            String sql = "SELECT * FROM zutki.papers order by likeCnt desc;";
            System.out.println(sql);
            con= BaseDao.getConnection();
            st=con.createStatement();
            rs = st.executeQuery(sql);

            while(rs.next() && papers.size() < 5){
                Paper paper = new Paper();
                paper.setPid(rs.getInt("pid"));
                paper.setAuthor(rs.getString("author"));
                paper.setCnt(rs.getInt("downCnt"));
                paper.setDate(rs.getDate("date"));
                paper.setDigest(rs.getString("digest"));
                paper.setPlace(rs.getString("place"));
                paper.setSource(rs.getString("source"));
                paper.setTitle(rs.getString("title"));

                if(BaseDao.isExist(papers, paper.getPid()))
                    papers.add(paper);
            }
        }catch(Exception e) {
            e.printStackTrace();
        }finally{
            BaseDao.closeAll(rs, st, con);
        }
        return papers;
    }

    public ArrayList<Paper> SearchPapers(String classify, String search){
        ArrayList<Paper> result = null;
        Connection con=null;
        ResultSet rs=null;
        Statement st=null;

        try {
            String sql="select * from zutki.papers where "+classify+" like '%"+search+"%'";
            System.out.println(sql);
            con= BaseDao.getConnection();
            st=con.createStatement();
            result = new ArrayList<Paper>();
            rs = st.executeQuery(sql);

            while(rs.next()){
                Paper paper = new Paper();
                paper.setPid(rs.getInt("pid"));
                paper.setAuthor(rs.getString("author"));
                paper.setCnt(rs.getInt("downCnt"));
                paper.setDate(rs.getDate("date"));
                paper.setDigest(rs.getString("digest"));
                paper.setPlace(rs.getString("place"));
                paper.setSource(rs.getString("source"));
                paper.setTitle(rs.getString("title"));

                result.add(paper);
            }

        }catch(Exception e) {
            e.printStackTrace();
        }finally{
            BaseDao.closeAll(rs, st, con);
        }
        return result;
    }

    public ArrayList<Paper> getAllPapers(){
        ArrayList<Paper> result = null;
        Connection con=null;
        ResultSet rs=null;
        Statement st=null;

        try {
            String sql = "SELECT * FROM zutki.papers;";
            System.out.println(sql);
            con= BaseDao.getConnection();
            st=con.createStatement();
            result = new ArrayList<Paper>();
            rs = st.executeQuery(sql);

            while(rs.next()){
                Paper paper = new Paper();
                paper.setPid(rs.getInt("pid"));
                paper.setAuthor(rs.getString("author"));
                paper.setCnt(rs.getInt("downCnt"));
                paper.setDate(rs.getDate("date"));
                paper.setDigest(rs.getString("digest"));
                paper.setPlace(rs.getString("place"));
                paper.setSource(rs.getString("source"));
                paper.setTitle(rs.getString("title"));
                result.add(paper);
            }

        }catch(Exception e) {
            e.printStackTrace();
        }finally{
            BaseDao.closeAll(rs, st, con);
        }
        return result;
    }

    public void addLikeCnt(int pid){
        Connection con=null;
        ResultSet rs=null;
        Statement st=null;

        try {
            String sql = "UPDATE `zutki`.`papers` SET `likeCnt` = likeCnt+'1' WHERE (`pid` = '"+pid+"');";
            System.out.println(sql);
            con= BaseDao.getConnection();
            st=con.createStatement();
            st.execute(sql);
        }catch(Exception e) {
            e.printStackTrace();
        }finally{
            BaseDao.closeAll(rs, st, con);
        }
    }
}
