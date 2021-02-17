package ca.ucalgary.seng300.service;

import ca.ucalgary.seng300.service.impl.SearchServiceImpl;
import ca.ucalgary.seng300.vo.RoomInfo;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class testSearchRooms {

    ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");

    @Test
    public void getAllRooms(){
        ISearchService searchRooms = context.getBean("searchRoomsImpl", SearchServiceImpl.class);
        List<RoomInfo> allRooms = searchRooms.getAllRooms("2020-03-17","2020-04-12");
        /*for (RoomInfo allRoom : allRooms) {
            System.out.println(allRoom);
        }*/
    }
}
