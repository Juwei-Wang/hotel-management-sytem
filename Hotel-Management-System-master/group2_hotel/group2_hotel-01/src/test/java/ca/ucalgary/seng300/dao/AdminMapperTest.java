package ca.ucalgary.seng300.dao;

import ca.ucalgary.seng300.dao.mapper.AdminMapper;
import ca.ucalgary.seng300.pojo.Admin;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.List;

public class AdminMapperTest {

    static Logger logger = Logger.getLogger(AdminMapperTest.class);

    ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");

    AdminMapper adminMapper = context.getBean("adminMapper", AdminMapper.class);

    @Test
    public void testGetAdminList() {
        try {
            List<Admin> adminList  = adminMapper.getAdminList();
            for (Admin admin : adminList) {
                System.out.println(admin);
            }
            logger.info("testGetAdminList test OK!");
        } catch (Exception e) {
            logger.info("testGetAdminList test FAILED");
            e.printStackTrace();
        }
    }
    @Test
    public void testAddAdmin() {
        try {
            HashMap<String, Object> map = new HashMap<>();
            map.put("username", "username4");
            map.put("password", "password4");
            adminMapper.addAdmin(map);
            logger.info("testAddAdminList test OK!");
        } catch (Exception e) {
            logger.info("testAddAdminList test FAILED");
            e.printStackTrace();
        }
    }
    @Test
    public void testDeleteAdmin() {
        try {
            adminMapper.deleteAdmin(4);
            logger.info("testDeleteAnAdmin test OK!");
        } catch (Exception e) {
            logger.info("testDeleteAdminList test FAILED");
            e.printStackTrace();
        }
    }
}
