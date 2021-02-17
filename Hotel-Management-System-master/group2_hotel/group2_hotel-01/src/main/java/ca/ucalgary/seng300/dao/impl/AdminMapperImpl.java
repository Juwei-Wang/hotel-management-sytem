package ca.ucalgary.seng300.dao.impl;

import ca.ucalgary.seng300.dao.mapper.AdminMapper;
import ca.ucalgary.seng300.pojo.Admin;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public class AdminMapperImpl implements AdminMapper {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public SqlSessionTemplate getSqlSession() {
        return sqlSession;
    }

    public void setSqlSession(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }


    @Override
    public List<Admin> getAdminList() {
        return getSqlSession().getMapper(AdminMapper.class).getAdminList();
    }

    @Override
    public void addAdmin(Map<String, Object> map) {
        getSqlSession().getMapper(AdminMapper.class).addAdmin(map);

        /*不支持手动提交*/
        /*sqlSession.commit();*/
        /*getSqlSession().commit();*/
    }

    @Override
    public void deleteAdmin(int id) {
        getSqlSession().getMapper(AdminMapper.class).deleteAdmin(id);
    }
}
