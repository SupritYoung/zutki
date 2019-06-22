package util;

import dao.LikeDao;
import dao.PaperDao;
import dao.UserDao;
import entity.Like;
import entity.Paper;
import entity.User;
import java.util.*;

public class ItemSimilarity {
    public static void main(String[] args) {
        //测试小Demo
        System.out.println("请输入用户希望推荐的用户id : ");
        Scanner input = new Scanner(System.in);
        int uid = input.nextInt();
        ArrayList<Paper> v = recommend(uid);

        System.out.println("正在生成针对用户id为"+uid+"的推荐...");
        for(int i = 0; i < v.size(); i++)
            System.out.println("第"+(i+1)+"个推荐: 题目:"+v.get(i).getTitle()+"");
    }

    //通过计算余弦相似度并取TopN, 返回为uid的用户生成的5个推荐文章
    public static ArrayList<Paper> recommend(int uid){
        UserDao userdao = new UserDao();
        PaperDao paperdao = new PaperDao();
        LikeDao likedao = new LikeDao();

        ArrayList<Like> likeLists;                                       //其他用户喜欢的论文列表

        ArrayList<User> users = userdao.getAllUsers();                   //所有用户列表
        ArrayList<Paper> papers = paperdao.getAllPapers();               //所有论文列表
        int[][] curMatrix = new int[papers.size()+5][papers.size()+5];   //当前矩阵
        int[][] comMatrix = new int[papers.size()+5][papers.size()+5];   //共现矩阵
        int[] N = new int[papers.size()+5];                              //喜欢每个物品的人数

        for(User user: users){
            if(user.getUid()==uid) continue;                    //当前用户则跳过

            likeLists = likedao.findLikesByUser(user.getUid()); //当前用户的喜欢列表

            for(int i = 0; i < papers.size(); i++)
                for(int j = 0; j < papers.size(); j++)
                    curMatrix[i][j] = 0;                               //清空矩阵

            for(int i = 0; i < likeLists.size(); i++){
                int pid1 = likeLists.get(i).getPid();
                ++N[pid1];
                for(int j = i+1; j < likeLists.size(); j++){
                    int pid2 = likeLists.get(j).getPid();
                    ++curMatrix[pid1][pid2];
                    ++curMatrix[pid2][pid1]; //两两加一
                }
            }
            //累加所有矩阵, 得到共现矩阵
            for(int i = 0; i < papers.size(); i++){
                for(int j = 0; j < papers.size(); j++){
                    int pid1 = papers.get(i).getPid(), pid2 = papers.get(j).getPid();
                    comMatrix[pid1][pid2] += curMatrix[pid1][pid2];
                    comMatrix[pid1][pid2] += curMatrix[pid1][pid2];
                }
            }
        }


        TreeSet<Paper> preList = new TreeSet<Paper>(new Comparator<Paper>() {
            @Override
            public int compare(Paper o1, Paper o2) {
                if(o1.getW()!=o2.getW())
                    return (int) (o1.getW()-o2.getW())*100;
                else
                    return o1.getCnt()-o2.getCnt();
            }
        }); //预处理的列表

        likeLists = likedao.findLikesByUser(uid);       //当前用户喜欢的论文列表
        boolean[] used = new boolean[papers.size()+5];  //判重数组
        for(Like like: likeLists){
            int Nij = 0;                         //既喜欢i又喜欢j的人数
            double Wij;                          //相似度
            Paper tmp;                           //当前的论文

            int i = like.getPid();
            for(Paper paper: papers){
                if(like.getPid() == paper.getPid()) continue;
                int j = paper.getPid();

                Nij = comMatrix[i][j];
                Wij = (double)Nij/Math.sqrt(N[i]*N[j]); //计算余弦相似度

                tmp = paperdao.findPaperById(paper.getPid());
                tmp.setW(Wij);

                if(used[tmp.getPid()]) continue;
                preList.add(tmp);
                used[tmp.getPid()] = true;
            }
        }

        ArrayList<Paper> recomLists = new ArrayList<>();      //生成的推荐结果
        for(int i = 0; preList.size()>0 && i<5; i++){
            recomLists.add(preList.pollLast());
            preList.pollLast();
        }
        if(recomLists.size()<5){
            //推荐数量不满5个, 补足喜欢数最高的文章
            recomLists = paperdao.findTopNPapers(recomLists);
        }

        return recomLists;
    }
}