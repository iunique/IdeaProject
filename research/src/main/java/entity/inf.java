package entity;

import java.io.UnsupportedEncodingException;

public class inf {
    int num;
    String username;
    String des;

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) throws UnsupportedEncodingException {
        this.des =des;
    }
}
