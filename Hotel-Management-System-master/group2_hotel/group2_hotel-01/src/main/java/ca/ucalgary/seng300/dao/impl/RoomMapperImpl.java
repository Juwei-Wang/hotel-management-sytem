package ca.ucalgary.seng300.dao.impl;

import ca.ucalgary.seng300.dao.mapper.BookingMapper;
import ca.ucalgary.seng300.dao.mapper.RoomMapper;
import ca.ucalgary.seng300.pojo.Booking;
import ca.ucalgary.seng300.pojo.Room;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public class RoomMapperImpl implements RoomMapper {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public SqlSessionTemplate getSqlSession() {
        return sqlSession;
    }

    public void setSqlSession(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }


    @Override
    public List<Room> getRoomList() {
        return getSqlSession().getMapper(RoomMapper.class).getRoomList();
    }

    @Override
    public List<Room> getEmptyRoomList() {
        return getSqlSession().getMapper(RoomMapper.class).getEmptyRoomList();
    }

    @Override
    public List<Room> getEmptyRoomListRankByPrice() {
        return getSqlSession().getMapper(RoomMapper.class).getEmptyRoomListRankByPrice();
    }

    @Override
    public List<Room> getEmptyRoomListByRoomType() {
        return getSqlSession().getMapper(RoomMapper.class).getEmptyRoomListByRoomType();
    }

    @Override
    public Room selectARoomNumber(String roomType, String checkinDate) {
        return getSqlSession().getMapper(RoomMapper.class).selectARoomNumber(roomType, checkinDate);
    }

    @Override
    public List<Room> selectAllAvailableRooms(String checkinDate) {
        return getSqlSession().getMapper(RoomMapper.class).selectAllAvailableRooms(checkinDate);
    }
}
