package util;

import entity.Paper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BaseDao {
    private static final String  driver="com.mysql.cj.jdbc.Driver";
    private static final String  url="jdbc:mysql://localhost:3306/zutki?serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=utf8&useSSL=false";
    private static final String  uid="root";
    private static final String  pwd="123456";

    Connection conn = null;
    Statement prs = null;
    ResultSet rs = null;

    //建立连接
    public static Connection getConnection(){
        Connection con=null;
        try {
            Class.forName(driver);
            con= DriverManager.getConnection(url,uid,pwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    //关闭连接
    public static void closeAll(ResultSet rs, Statement st, Connection con){
        try {
            if(rs!=null){
                rs.close();
                rs=null;
            }
            if(st!=null){
                st.close();
                st=null;
            }
            if(con!=null){
                con.close();
                con=null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //判断该论文组中是否有该论文
    public static boolean isExist(ArrayList<Paper> papers, int pid){
        for (Paper paper : papers)
            if(paper.getPid() == pid)
                return false;
        return true;
    }
}
