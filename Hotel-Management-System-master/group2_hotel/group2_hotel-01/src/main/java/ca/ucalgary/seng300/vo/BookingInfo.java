package ca.ucalgary.seng300.vo;

import lombok.Data;

@Data
public class BookingInfo {
    private String checkInDate;
    private String checkOutDate;
    private String roomType;
    private String clientName;
    private String phoneNumber;
    private String email;
    //private String quantityOfrooms;
}
