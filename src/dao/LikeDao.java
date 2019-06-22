package dao;

import entity.Like;
import util.BaseDao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

public class LikeDao {
    public ArrayList<Like> findLikesByUser(int uid){
        ArrayList<Like> result = null;
        Connection con=null;
        ResultSet rs=null;
        Statement st=null;

        try {
            String sql="SELECT * FROM zutki.likes where uid = "+uid+";";
            System.out.println(sql);
            con= BaseDao.getConnection();
            st=con.createStatement();
            result = new ArrayList<Like>();
            rs = st.executeQuery(sql);

            while(rs.next()){
                Like like = new Like();
                like.setLid(rs.getInt("lid"));
                like.setPid(rs.getInt("pid"));
                like.setUid(rs.getInt("uid"));

                result.add(like);
            }

        }catch(Exception e) {
            e.printStackTrace();
        }finally{
            BaseDao.closeAll(rs, st, con);
        }
        return result;
    }

    public static void addLike(int uid, int pid){
        Vector<Like> result = null;
        Connection con=null;
        ResultSet rs=null;
        Statement st=null;

        try {
            String sql="INSERT INTO `zutki`.`likes` (`uid`, `pid`) VALUES ('"+uid+"', '"+pid+"');";
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
