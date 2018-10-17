package entity;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.persistence.Entity;
import java.util.Date;
@Component
@Entity
public class User {
    private String id;
    private String code;
    private String mail;
    private Date time;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
    public boolean equals(Object o) {
        if (o == this) return true;
        if (!(o instanceof User)) {
            return false;
        }
        User user = (User)o;
        return (user.getId().equals(this.id)) && (user.getCode().equals(this.code)) && (user.getMail().equals(this.mail));
    }
}
