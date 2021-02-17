package ca.ucalgary.seng300.dao.impl;

import ca.ucalgary.seng300.dao.mapper.BookingMapper;
import ca.ucalgary.seng300.dao.mapper.ClientMapper;
import ca.ucalgary.seng300.pojo.Booking;
import ca.ucalgary.seng300.pojo.Room;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;

public class BookingMapperImpl implements BookingMapper {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public SqlSessionTemplate getSqlSession() {
        return sqlSession;
    }

    public void setSqlSession(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }


    @Override
    public void bookingARoom(Booking booking) {
        getSqlSession().getMapper(BookingMapper.class).bookingARoom(booking);
    }
}
