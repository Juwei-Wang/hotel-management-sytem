package ca.ucalgary.seng300.dao.utils;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

/*不再需要此类*/
@Deprecated

public class MybatisUtils {

    private SqlSessionTemplate sqlSession;

    public void setSqlSession(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }

    // （由Mapper实现类调用）生成sqlSession对象
    public SqlSession getSqlSession() {
        return sqlSession;
    }
}
