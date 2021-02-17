package ca.ucalgary.seng300.dao;

import ca.ucalgary.seng300.dao.mapper.AdminMapper;
import ca.ucalgary.seng300.dao.mapper.BookingMapper;
import ca.ucalgary.seng300.dao.mapper.RoomMapper;
import ca.ucalgary.seng300.pojo.Booking;
import ca.ucalgary.seng300.pojo.Room;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.Timestamp;
import java.util.Date;
import java.util.UUID;

public class BookingMapperTest {

    static Logger logger = Logger.getLogger(BookingMapperTest.class);

    ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");

    BookingMapper bookingMapper = context.getBean("bookingMapper", BookingMapper.class);

    @Test
    public void testBookingARoom() {

        try {
            Booking booking = new Booking();
            booking.setBookingId(UUID.randomUUID().toString());
            booking.setBookingDatetime(new Timestamp(new Date().getTime()));
            booking.setEmail("jimmy_samuel@test.com");
            booking.setClientName("Jimmy Samuel");
            booking.setPhoneNumber("1-439-028-9135");
            booking.setCheckinDate("2020-03-24");
            booking.setCheckoutDate("2020-04-01");

            // 假设用户选择Deluxe
            String roomType = "Deluxe";

            // 随机获取一间Deluxe空房
            RoomMapper roomMapper = context.getBean("roomMapper", RoomMapper.class);
            Room       room       = roomMapper.selectARoomNumber(roomType, booking.getCheckinDate());
            booking.setRoomNumber(room.getNumber());
            bookingMapper.bookingARoom(booking);
            logger.info("testBookingARoom test OK!");
        } catch (Exception e) {
            logger.error("testBookingARoom test FAILED!");
            e.printStackTrace();
        }
    }
}
