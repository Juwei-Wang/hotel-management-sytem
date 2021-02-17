package ca.ucalgary.seng300.service;

import ca.ucalgary.seng300.pojo.Booking;
import ca.ucalgary.seng300.vo.BookingInfo;

import java.util.List;

public interface IBookingService {

    /**
     * 订单业务
     * @param bInfo the booked order Info list from controller(front end)
     */
    void booking(BookingInfo bInfo) throws Exception;
}
