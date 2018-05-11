package entity;

import java.io.UnsupportedEncodingException;

public class det {
    String opt;
    int id;
    int num;
    int value;
    String username;

    public String getOpt() throws UnsupportedEncodingException {
        return opt;
    }

    public void setOpt(String opt) throws UnsupportedEncodingException {
        this.opt =opt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
