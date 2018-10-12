package entity;

public class Info implements Comparable<Info>{
    private int tab_no;
    private int info_no;
    private String id;
    private String tab_name;
    private double amount;
    private String dat;
    private String detail;

    public int getTab_no() {
        return tab_no;
    }

    public void setTab_no(int tab_no) {
        this.tab_no = tab_no;
    }

    public int getInfo_no() {
        return info_no;
    }

    public void setInfo_no(int info_no) {
        this.info_no = info_no;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTab_name() {
        return tab_name;
    }

    public void setTab_name(String tab_name) {
        this.tab_name = tab_name;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getDat() {
        return dat;
    }

    public void setDat(String dat) {
        this.dat = dat;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
    public int compareTo(Info info) {
        String s1=dat;
        String s2=info.getDat();
        if(s1.compareTo(s2)<0)
        {
            return -1;
        }
        return 0;
    }
}
