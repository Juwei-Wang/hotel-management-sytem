package ca.ucalgary.seng300.pojo;

import lombok.Data;

@Data
@SuppressWarnings("unused")
public class Admin {
    private int id;
    private String username;
    private String password;

    /*保留一个Constructor,以便之后使用*/
    /*public Admin(int id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }*/
}

