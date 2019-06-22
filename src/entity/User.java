package entity;

public class User {
    int uid;            //用户id
    String username;    //用户名
    String password;    //密码
    String major;       //专业
    String email;       //邮箱

    public User() {
    }

    public User(int uid, String username, String password, String major, String email) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.major = major;
        this.email = email;
    }

    public User(String username, String password, String major, String email) {
        this.username = username;
        this.password = password;
        this.major = major;
        this.email = email;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
