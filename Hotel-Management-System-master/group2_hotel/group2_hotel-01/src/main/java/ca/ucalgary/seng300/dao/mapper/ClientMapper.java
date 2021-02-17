package ca.ucalgary.seng300.dao.mapper;

import ca.ucalgary.seng300.pojo.Client;

import java.util.List;
import java.util.Map;

public interface ClientMapper {

    // query
    List<Client> getClientList();
    List<Client> getClientListLimit(Map<String, Object> map);
    Client getClientById(String id);
    List<Client> getClientByName(String name);
    List<Client> getClientByPhoneNumber(String phoneNumber);
    List<Client> getClientByAddress(String address);
    List<Client> getClientByEmailAddress(String emailAddress);
    // insert
    // update
    // delete
}
