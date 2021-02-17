package ca.ucalgary.seng300.pojo;

import lombok.Data;

import java.sql.Timestamp;

@Data
@SuppressWarnings("unused")
public class Checkin {
    private String checkinId;   // Use UUID() here!
    private int    roomNumber;
    private String clientId;
    private Timestamp checkinDate;
    private Timestamp checkoutDate;

    /*保留一个Constructor,以便之后使用*/
    /*public Checkin(String checkinId, int roomNumber, String clientId, Timestamp checkinDate, Timestamp checkoutDate) {
        this.checkinId = checkinId;
        this.roomNumber = roomNumber;
        this.clientId = clientId;
        this.checkinDate = checkinDate;
        this.checkoutDate = checkoutDate;
    }*/
}
