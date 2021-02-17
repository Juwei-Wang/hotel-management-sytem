package ca.ucalgary.seng300.dao.mapper;

import ca.ucalgary.seng300.pojo.Admin;

import java.util.List;
import java.util.Map;

public interface AdminMapper {

    // query
    List<Admin> getAdminList();
    // insert
    void addAdmin(Map<String, Object> map);
    // delete
    void deleteAdmin(int id);
}
