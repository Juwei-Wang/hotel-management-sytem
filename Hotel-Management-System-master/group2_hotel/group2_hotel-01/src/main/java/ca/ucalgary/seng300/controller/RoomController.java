package ca.ucalgary.seng300.controller;

import ca.ucalgary.seng300.service.ISearchService;
import ca.ucalgary.seng300.vo.RoomInfo;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController

public class RoomController {


    @Autowired
    private ISearchService searchRooms;

    /*@GetMapping("/room")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public String searchRoomsByDatePeriod(String check){
        System.out.println(username);
        List<RoomInfo> roomInfoList = new ArrayList<>();
        roomInfoList.add(new RoomInfo("lalala",2,300));
        roomInfoList.add(new RoomInfo("lalala1",10,100));
        roomInfoList.add(new RoomInfo("lalala2",70,340));
        roomInfoList.add(new RoomInfo("lalala3",20,250));
        String json1 = JSON.toJSONString(roomInfoList);
        return json1;
    }*/

    @GetMapping("/room")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public String searchRoomsByDatePeriod(@RequestParam(value="cid")String checkInDate, @RequestParam(value="cod")String checkOutDate){
        System.out.println("CheckInDate: " + checkInDate + "  CheckOutDate: " + checkOutDate);
        List<RoomInfo> allRooms = searchRooms.getAllRooms(checkInDate, checkOutDate);
        String jsonOfroomsInfo = JSON.toJSONString(allRooms);
        return jsonOfroomsInfo;
    }

    /*@RequestMapping(path = "/room1", method = RequestMethod.GET)
    public String searchRoomsByDatePeriod1(){
        return "redirect:index.jsp";
    }*/

//    public String search
}
