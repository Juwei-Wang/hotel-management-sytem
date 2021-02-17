package ca.ucalgary.seng300.dao.impl;

import ca.ucalgary.seng300.dao.mapper.ClientMapper;
import ca.ucalgary.seng300.pojo.Client;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public class ClientMapperImpl implements ClientMapper {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public SqlSessionTemplate getSqlSession() {
        return sqlSession;
    }

    public void setSqlSession(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<Client> getClientList() {
        return getSqlSession().getMapper(ClientMapper.class).getClientList();
    }

    @Override
    public List<Client> getClientListLimit(Map<String, Object> map) {
        return getSqlSession().getMapper(ClientMapper.class).getClientListLimit(map);
    }

    @Override
    public Client getClientById(String id) {
        return getSqlSession().getMapper(ClientMapper.class).getClientById(id);
    }

    @Override
    public List<Client> getClientByName(String name) {
        return getSqlSession().getMapper(ClientMapper.class).getClientByName(name);
    }

    @Override
    public List<Client> getClientByPhoneNumber(String phoneNumber) {
        return getSqlSession().getMapper(ClientMapper.class).getClientByPhoneNumber(phoneNumber);
    }

    @Override
    public List<Client> getClientByAddress(String address) {
        return getSqlSession().getMapper(ClientMapper.class).getClientByAddress(address);
    }

    @Override
    public List<Client> getClientByEmailAddress(String emailAddress) {
        return getSqlSession().getMapper(ClientMapper.class).getClientByEmailAddress(emailAddress);
    }
}
