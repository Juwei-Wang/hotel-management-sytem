package ca.ucalgary.seng300.service;

import ca.ucalgary.seng300.dao.CheckinMapperTest;
import ca.ucalgary.seng300.dao.mapper.BookingMapper;
import ca.ucalgary.seng300.service.impl.BookingServiceImpl;
import ca.ucalgary.seng300.service.impl.SearchServiceImpl;
import ca.ucalgary.seng300.vo.BookingInfo;
import ca.ucalgary.seng300.vo.RoomInfo;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class testBookingRooms {

    static Logger logger = Logger.getLogger(testBookingRooms.class);

    ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");

    @Test
    public void testBooking() {
        IBookingService bookingRooms = context.getBean("bookingImpl", BookingServiceImpl.class);
        BookingInfo   bookingInfo = new BookingInfo();
        bookingInfo.setCheckInDate("2020-04-01");
        bookingInfo.setCheckOutDate("2020-04-05");
        bookingInfo.setClientName("Jason Lee");
        bookingInfo.setEmail("jason_lee@a.com");
        //bookingInfo.setQuantityOfrooms("1");
        bookingInfo.setPhoneNumber("1-471-139-1384");
        bookingInfo.setRoomType("Deluxe");
        try {
            bookingRooms.booking(bookingInfo);
            logger.info("testBooking test OK!");
        } catch (Exception e) {
            logger.error("testBooking test FAILED!");
            e.printStackTrace();
        }
    }
}
