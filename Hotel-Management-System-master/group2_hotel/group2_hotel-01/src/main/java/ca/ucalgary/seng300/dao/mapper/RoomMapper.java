package ca.ucalgary.seng300.dao.mapper;

import ca.ucalgary.seng300.pojo.Booking;
import ca.ucalgary.seng300.pojo.Room;
import org.apache.ibatis.annotations.Param;


import java.util.List;
import java.util.Map;

public interface RoomMapper {
    //query
    List<Room> getRoomList();
    List<Room> getEmptyRoomList();
    List<Room> getEmptyRoomListRankByPrice();
    List<Room> getEmptyRoomListByRoomType();

    // select a random room number base on the current room type
    // and the room is empty
    Room selectARoomNumber(@Param("roomType") String roomType, @Param("checkinDate") String checkinDate);

    // select all available rooms <= checkinDate
    List<Room> selectAllAvailableRooms(String checkinDate);
}
