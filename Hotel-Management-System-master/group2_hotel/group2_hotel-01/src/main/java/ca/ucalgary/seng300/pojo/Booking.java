package ca.ucalgary.seng300.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.sql.Timestamp;
import java.util.UUID;

@Data
@SuppressWarnings("unused")
public class Booking {

    private String bookingId;
    private int roomNumber; //目前先随意分配一个roomNumber
    private Timestamp bookingDatetime;
    private String checkinDate;
    private String checkoutDate;
    private String phoneNumber;
    private String clientName;
    private String email;

    /*保留一个Constructor,以便之后使用*/
    /*public Booking(String bookingId, int roomNumber, Timestamp bookingDate, Timestamp checkinDate, Timestamp checkoutDate, String phoneNumber) {
        this.bookingId = bookingId;
        this.roomNumber = roomNumber;
        this.bookingDate = bookingDate;
        this.checkinDate = checkinDate;
        this.checkoutDate = checkoutDate;
        this.phoneNumber = phoneNumber;
    }*/
}
