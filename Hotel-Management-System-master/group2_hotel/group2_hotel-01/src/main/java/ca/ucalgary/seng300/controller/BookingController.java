package ca.ucalgary.seng300.controller;

import ca.ucalgary.seng300.service.IBookingService;
import ca.ucalgary.seng300.vo.BookingInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BookingController {

    @Autowired
    public IBookingService bookingService;

    @GetMapping("/booking")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public String booking(@RequestBody BookingInfo bookingInfo){
        try {
            bookingService.booking(bookingInfo);
            return null;//准备返回success，200和成功信息（类）
        } catch (Exception e) {
            e.printStackTrace();
            //准备返回一个异常处理类型
            return null;
        }
    }
}
