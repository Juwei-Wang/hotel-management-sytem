package ca.ucalgary.seng300.dao.mapper;

import ca.ucalgary.seng300.pojo.Booking;
import ca.ucalgary.seng300.pojo.Room;

import java.util.Map;

public interface BookingMapper {

    // insert
    void bookingARoom(Booking booking);

}
