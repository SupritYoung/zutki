package entity;

public class Like {
    int uid; //发起喜欢的用户
    int pid; //被喜欢的文章
    int lid; //该喜欢行为的id

    public Like(int uid, int pid, int lid) {
        this.uid = uid;
        this.pid = pid;
        this.lid = lid;
    }

    public Like(){

    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    @Override
    public String toString() {
        return "Like{" +
                "uid=" + uid +
                ", pid=" + pid +
                ", lid=" + lid +
                '}';
    }
}
