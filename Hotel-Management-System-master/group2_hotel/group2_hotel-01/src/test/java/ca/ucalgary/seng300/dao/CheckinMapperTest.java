package ca.ucalgary.seng300.dao;

import ca.ucalgary.seng300.dao.mapper.BookingMapper;
import ca.ucalgary.seng300.dao.mapper.CheckinMapper;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CheckinMapperTest {

    static Logger logger = Logger.getLogger(CheckinMapperTest.class);

    ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");

    CheckinMapper checkinMapper = context.getBean("checkinMapper", CheckinMapper.class);
}
