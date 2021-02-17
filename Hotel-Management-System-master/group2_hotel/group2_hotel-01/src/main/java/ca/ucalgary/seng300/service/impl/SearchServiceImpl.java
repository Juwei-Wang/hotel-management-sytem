package ca.ucalgary.seng300.service.impl;

import ca.ucalgary.seng300.dao.mapper.RoomMapper;
import ca.ucalgary.seng300.pojo.Room;
import ca.ucalgary.seng300.service.ISearchService;
import ca.ucalgary.seng300.vo.RoomInfo;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class SearchServiceImpl implements ISearchService {

    @Autowired
    private RoomMapper roomMapper;


    /*@Override
    public List<RoomInfo> getAllRooms(int a) {
        List<Room> roomList = roomMapper.getRoomList();
        List<RoomInfo> roomInfoList = new ArrayList<>();
        for (Room room: roomList) {
            RoomInfo roomInfo = new RoomInfo();
            roomInfo.setPrice(room.getPrice());
            roomInfo.setEmptyRoomsLeft(room.getNumber());
            roomInfoList.add(roomInfo);
        }
        return roomInfoList;
    }*/

    @Override
    public List<RoomInfo> getAllRooms(String checkInDate, String checkOutDate) {
        List<Room> roomList = roomMapper.selectAllAvailableRooms(checkInDate);
        List<RoomInfo> roomInfoList = new ArrayList<>();
        //System.out.println(roomList);

        for (Room room : roomList) {
            if(!room.isEmpty()){
                continue;
            }

            if (roomInfoList.isEmpty()){
                roomInfoList.add(new RoomInfo(room.getType(),1,room.getPrice()));
                continue;
            }

            for (int i = 0;i<roomInfoList.size();i++) {
                if(roomInfoList.get(i).getRoomType().equals(room.getType())) {
                    roomInfoList.get(i).setEmptyRoomsLeft(roomInfoList.get(i).getEmptyRoomsLeft()+1);
                    break;
                }
                if(i==roomInfoList.size()-1)
                    roomInfoList.add(new RoomInfo(room.getType(),1,room.getPrice()));
            }
        }
        //System.out.println();
        System.out.println(roomInfoList);
        return roomInfoList;
    }

    @Override
    public List<Room> getAllRooms() {
        return null;
    }

    @Override
    public List<Room> getEmptyRooms() {
        return null;
    }

    @Override
    public List<Room> getRoomsByType() {
        return null;
    }

    @Override
    public List<Room> getRoomsByPrice(Integer from, Integer to) {
        return null;
    }

    @Override
    public List<Room> getRoomByDeptPrice(Integer isEmpty) {
        return null;
    }
}
