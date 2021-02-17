package ca.ucalgary.seng300.dao;

import ca.ucalgary.seng300.dao.mapper.RoomMapper;
import ca.ucalgary.seng300.pojo.Booking;
import ca.ucalgary.seng300.pojo.Room;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public class RoomMapperTest {

    static Logger logger = Logger.getLogger(RoomMapperTest.class);

    ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");

    RoomMapper roomMapper = context.getBean("roomMapper", RoomMapper.class);

    @Test
    public void testGetAllRooms() {
        try {
            List<Room> roomList   = roomMapper.getRoomList();
            for (Room room : roomList) {
                System.out.println(room);
            }
            logger.info("testGetAllRooms test OK!");
        } catch (Exception e) {
            logger.error("testGetAllRooms test FAILED!");
            e.printStackTrace();
        }
    }
    @Test
    public void testGetEmptyRoomList() {
        try {
            List<Room> roomList   = roomMapper.getEmptyRoomList();
            for (Room room : roomList) {
                System.out.println(room);
            }
            logger.info("testGetEmptyRoomList test OK!");
        } catch (Exception e) {
            logger.error("testGetEmptyRoomList test FAILED!");
            e.printStackTrace();
        }
    }
    @Test
    public void testGetEmptyRoomListRankByPrice() {
        try {
            List<Room> roomList   = roomMapper.getEmptyRoomListRankByPrice();
            for (Room room : roomList) {
                System.out.println(room);
            }
            logger.info("testGetEmptyRoomListByPrice test OK!");
        } catch (Exception e) {
            logger.error("testGetEmptyRoomListByPrice test FAILED!");
            e.printStackTrace();
        }
    }
    @Test
    public void testGetEmptyRoomListByRoomType() {
        try {
            List<Room> roomList   = roomMapper.getEmptyRoomListByRoomType();
            for (Room room : roomList) {
                System.out.println(room);
            }logger.info("testGetEmptyRoomListByRoomType test OK!");
        } catch (Exception e) {
            logger.error("testGetEmptyRoomListByRoomType test FAILED!");
            e.printStackTrace();
        }
    }
    @Test
    public void testSelectARoomNumber() {
        try {
            // Define a random room type
            String roomType = "Deluxe";
            // Define a Booking object
            Booking booking = new Booking();
            booking.setBookingId(UUID.randomUUID().toString());
            // 之后在RoomNumber中随机挑选一间room
            booking.setBookingDatetime(new Timestamp(new Date().getTime()));
            booking.setCheckinDate("2020-04-01");
            booking.setCheckoutDate("2020-04-02");
            booking.setPhoneNumber("1-388-708-9228");
            booking.setClientName("Shannon Lee");
            booking.setEmail("shannon_lee@a.com");

            Room room = roomMapper.selectARoomNumber(roomType, booking.getCheckinDate());
            System.out.println(room.getNumber());

            logger.info("testSelectARoomNumber test OK!");
        } catch (Exception e) {
            logger.error("testSelectARoomNumber test FAILED!");
            e.printStackTrace();
        }
    }
    @Test
    public void testSelectAllAvailableRooms() {
        try {
            String checkinDate = "2020-03-25";
            List<Room> rooms = roomMapper.selectAllAvailableRooms(checkinDate);
            for (Room room : rooms) {
                System.out.println(room);
            }
            logger.info("testSelectAllAvailableRooms test OK!");
        } catch (Exception e) {
            logger.error("testSelectAllAvailableRooms test FAILED!");
            e.printStackTrace();
        }
    }
}
