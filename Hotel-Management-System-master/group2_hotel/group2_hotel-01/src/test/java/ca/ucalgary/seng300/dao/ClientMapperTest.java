package ca.ucalgary.seng300.dao;

import ca.ucalgary.seng300.dao.mapper.ClientMapper;
import ca.ucalgary.seng300.pojo.Client;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.List;

public class ClientMapperTest {

    static Logger logger = Logger.getLogger(ClientMapperTest.class);

    ApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");

    ClientMapper clientMapper = context.getBean("clientMapper", ClientMapper.class);

    @Test
    public void testGetAllClients() {
        try {
            List<Client> clientList = clientMapper.getClientList();
            for (Client client : clientList) {
                System.out.println(client);
            }
            logger.info("testGetAllClients test OK!");
        } catch (Exception e) {
            logger.error("testGetAllClients test FAILED!");
            e.printStackTrace();
        }
    }
    @Test
    public void testGetClientListLimit() {
        try {
            HashMap<String, Object> map = new HashMap<>();
            map.put("startIndex", 0);
            map.put("pageSize", 10);
            List<Client> clientList = clientMapper.getClientListLimit(map);
            for (Client client : clientList) {
                System.out.println(client);
            }
            logger.info("testGetClientListLimit test OK!");
        } catch (Exception e) {
            logger.error("testGetClientListLimit test FAILED!");
            e.printStackTrace();
        }
    }

    @Test
    public void testGetClientById() {
        try {
            Client client = clientMapper.getClientById("170658971466876");
            System.out.println(client);
            logger.info("testGetClientById test OK!");
        } catch (Exception e) {
            logger.error("testGetClientById test FAILED!");
            e.printStackTrace();
        }
    }
    @Test
    public void testGetClientByName() {
        try {
            List<Client> clientList = clientMapper.getClientByName("Carrie Payne");
            for (Client client : clientList) {
                System.out.println(client);
            }
            logger.info("testGetClientByName test OK!");
        } catch (Exception e) {
            logger.error("testGetClientByName test FAILED!");
            e.printStackTrace();
        }
    }
    @Test
    public void testGetClientByPhoneNumber() {
        try {
            List<Client> clientList = clientMapper.getClientByPhoneNumber("1-810-793-0129");
            for (Client client : clientList) {
                System.out.println(client);
            }
            logger.info("testGetClientByPhoneNumber test OK!");
        } catch (Exception e) {
            logger.error("testGetClientByPhoneNumber test FAILED!");
            e.printStackTrace();
        }
    }
    @Test
    public void testGetClientByAddress() {
        try {
            List<Client> clientList = clientMapper.getClientByAddress("9420 Tyler Tunnel\n" +
                    "Lake Emily, AK 66272");
            for (Client client : clientList) {
                System.out.println(client);
            }
            logger.info("testGetClientByAddress test OK!");
        } catch (Exception e) {
            logger.error("testGetClientByAddress test FAILED!");
            e.printStackTrace();
        }
    }
    @Test
    public void testGetClientByEmailAddress() {
        try {
            List<Client> clientList = clientMapper.getClientByEmailAddress("brandoncharles@gmail.com");
            for (Client client : clientList) {
                System.out.println(client);
            }
            logger.info("testGetClientByEmailAddress test OK!");
        } catch (Exception e) {
            logger.error("testGetClientByEmailAddress test FAILED!");
            e.printStackTrace();
        }
    }
}
