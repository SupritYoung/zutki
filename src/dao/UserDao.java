package dao;

import entity.Paper;
import entity.User;
import util.BaseDao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

public class UserDao {
    public boolean userAdd(User user) {
        //添加用户
        int result=0;
        Connection con=null;
        ResultSet rt=null;
        Statement st=null;

        try {
            String sql = "INSERT INTO `zutki`.`users` (`username`, `password`, `major`, `email`) VALUES ('"+user.getUsername()+"', '"+user.getPassword()+"'," +
                    " '"+user.getMajor()+"', '"+user.getEmail()+"');\n";

            System.out.println(sql);
            con= BaseDao.getConnection();
            st= con.createStatement();
            result=st.executeUpdate(sql);

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }finally{
            BaseDao.closeAll(rt, st, con);
        }

        if(result>=0)
            return true;
        else
            return false;
    }

    public User findByName(String username) {
        //通过用户名来查找该用户
        Connection conn=null;
        Statement st=null;
        ResultSet rs=null;

        try {
            String sql="select * from zutki.users where username='"+username+"'";
            conn=BaseDao.getConnection();
            st=conn.createStatement();
            rs=st.executeQuery(sql);
            if (rs.next()){
                User target = new User(rs.getInt("uid"), rs.getString("username"),
                        rs.getString("password"), rs.getString("major"), rs.getString("email"));
                return target;
            }else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            BaseDao.closeAll(rs, st, conn);
        }
        return null;
    }

    public boolean isExist(String username){
        //通过用户名查找该用户是否存在
        Connection conn=null;
        Statement st=null;
        ResultSet rs=null;

        try {
            String sql = "select count(*) from users where uid = '"+username+"';";
            System.out.println(sql);
            conn = BaseDao.getConnection();
            st = conn.createStatement();
            rs = st.executeQuery(sql);

            //如果找到该用户返回true
            while (rs.next()){
                if(rs.getBoolean(1))
                    return true;
                else
                    return false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            BaseDao.closeAll(rs, st, conn);
        }
        return false;
    }



    public ArrayList<User> getAllUsers(){
        ArrayList<User> result = null;
        Connection con=null;
        ResultSet rs=null;
        Statement st=null;

        try {
            String sql = "SELECT * FROM zutki.users;";
            System.out.println(sql);
            con= BaseDao.getConnection();
            st=con.createStatement();
            result = new ArrayList<User>();
            rs = st.executeQuery(sql);

            while(rs.next()){
                User user = new User();
                user.setEmail(rs.getString("email"));
                user.setMajor(rs.getString("major"));
                user.setPassword(rs.getString("password"));
                user.setUsername(rs.getString("username"));
                user.setUid(rs.getInt("uid"));

                result.add(user);
            }

        }catch(Exception e) {
            e.printStackTrace();
        }finally{
            BaseDao.closeAll(rs, st, con);
        }
        return result;


    }
}
