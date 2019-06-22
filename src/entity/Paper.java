package entity;


import java.util.Date;

public class Paper {
    int pid;        //论文id
    String author;  //作者
    Date date;      //发表日期
    String place;   //发表机构
    String title;   //论文题目
    String digest;  //摘要
    String source;  //论文来源
    int cnt;        //喜欢该论文的用户数量
    int downCnt;    //下载量
    double w;       //相似度(只在推荐时调用)

    public Paper() {
    }

    public Paper(int pid, String author, Date date, String place, String title, String digest, String source, int cnt, int downCnt) {
        this.pid = pid;
        this.author = author;
        this.date = date;
        this.place = place;
        this.title = title;
        this.digest = digest;
        this.source = source;
        this.cnt = cnt;
        this.downCnt = downCnt;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDigest() {
        return digest;
    }

    public void setDigest(String digest) {
        this.digest = digest;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

    public int getDownCnt() {
        return downCnt;
    }

    public void setDownCnt(int downCnt) {
        this.downCnt = downCnt;
    }

    public double getW() {
        return w;
    }

    public void setW(double w) {
        this.w = w;
    }

    @Override
    public String toString() {
        return "Paper{" +
                "pid=" + pid +
                ", author='" + author + '\'' +
                ", date=" + date +
                ", place='" + place + '\'' +
                ", title='" + title + '\'' +
                ", degest='" + digest + '\'' +
                ", source='" + source + '\'' +
                ", cnt=" + cnt +
                ", downCnt=" + downCnt +
                '}';
    }
}

