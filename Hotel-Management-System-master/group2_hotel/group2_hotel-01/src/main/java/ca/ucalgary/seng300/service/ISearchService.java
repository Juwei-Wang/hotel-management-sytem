package ca.ucalgary.seng300.service;

import ca.ucalgary.seng300.pojo.Booking;
import ca.ucalgary.seng300.pojo.Room;
import ca.ucalgary.seng300.vo.RoomInfo;

import java.util.List;

/**
 *
 * @author kevinj
 *
 * 处理房间查找的业务接口
 * 类名后加 implement ISearchRooms 实现此接口
 */
public interface ISearchService {

    /**
     * 指定日期区间内，按类型返回房间的一系列信息（房型，剩余间数，房间价格）
     *（客户页面显示）
     *
     * @return List contains information of rooms
     */
    List<RoomInfo> getAllRooms(String checkInDate, String checkOutDate);

    /**
     * 无条件返回所有房间（管理员用）
     * @return
     */
    List<Room> getAllRooms();

    /**
     * 条件查询：返回空房间
     * @return
     */
    List<Room> getEmptyRooms();

    /**
     * 条件查询：返回对应类型的房间
     * @return
     */
    List<Room> getRoomsByType();

    /**
     *
     * @param from 最低价格
     * @param to   最高价格
     * @return
     */
    List<Room> getRoomsByPrice(Integer from, Integer to);

    /**
     * 按价格降序(升序)返回所有(空)房间（可以做再点一下升序，前端做还是后端再说）
     */

    List<Room> getRoomByDeptPrice(Integer isEmpty);
}
