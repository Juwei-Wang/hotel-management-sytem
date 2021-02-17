package ca.ucalgary.seng300.pojo;

import lombok.Data;

@Data
@SuppressWarnings("unused")
public class Client {

    private String id;  // 15 digit of random numbers
    private String name;
    private Character gender;
    private String phoneNumber;
    private String address;
    private String emailAddress;

    /*保留一个Constructor,以便之后使用*/
    /*public Client(String id, String name, Character gender, String phoneNumber, String address, String emailAddress) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.emailAddress = emailAddress;
    }*/
}
