package ca.ucalgary.seng300.pojo;

import lombok.Data;

@Data
@SuppressWarnings("unused")
public class Room {

    private int number; // auto increment
    private String type;
    private Integer price;
    private boolean isEmpty;

    /*保留一个Constructor,以便之后使用*/
    /*public Room(int number, String type, double price, boolean isEmpty) {
        this.number = number;
        this.type = type;
        this.price = price;
        this.isEmpty = isEmpty;
    }*/
}
