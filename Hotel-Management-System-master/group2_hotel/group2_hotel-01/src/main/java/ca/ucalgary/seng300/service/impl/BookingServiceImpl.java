package ca.ucalgary.seng300.service.impl;

import ca.ucalgary.seng300.dao.mapper.BookingMapper;
import ca.ucalgary.seng300.dao.mapper.RoomMapper;
import ca.ucalgary.seng300.pojo.Booking;
import ca.ucalgary.seng300.pojo.Room;
import ca.ucalgary.seng300.service.IBookingService;
import ca.ucalgary.seng300.vo.BookingInfo;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Timestamp;
import java.util.Date;
import java.util.UUID;

public class BookingServiceImpl implements IBookingService {

    @Autowired
    private BookingMapper bookingMapper;

    @Autowired
    private RoomMapper roomMapper;

    @Override
    public void booking(BookingInfo bInfo) throws Exception {

        //分配一个roomNumber，这需要getRoomByType()
        // 之后在RoomNumber中随机挑选一间room
        //List<Booking> bookings = new ArrayList<>();

        Booking booking = new Booking();
        booking.setBookingId(UUID.randomUUID().toString());
        //分配一个roomNumber，这需要getRoomByType()
        // 之后在RoomNumber中随机挑选一间room
        booking.setBookingDatetime(new Timestamp(new Date().getTime()));
        booking.setCheckinDate(bInfo.getCheckInDate());
        booking.setCheckoutDate(bInfo.getCheckOutDate());
        booking.setPhoneNumber(bInfo.getPhoneNumber());
        booking.setClientName(bInfo.getClientName());
        booking.setEmail(bInfo.getEmail());

        Room               room       = roomMapper.selectARoomNumber(bInfo.getRoomType(), booking.getCheckinDate());
        booking.setRoomNumber(room.getNumber());

        //持久层方法 Working By Haohu
        System.out.println(booking);
        bookingMapper.bookingARoom(booking);
        System.out.println("Success!!!");
    }
}
