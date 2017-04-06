package kr.or.kmaca.security.dao.impl;


import java.io.PrintStream;
import javax.annotation.Resource;
import kr.or.kmaca.security.dao.UserInfoDao;
import kr.or.kmaca.security.vo.UserInfo;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class UserInfoDaoImpl
  extends SqlSessionDaoSupport
  implements UserInfoDao
{
  @Resource(name="sqlSessionFactory")
  public void setSuperSqlSessionFactory(SqlSessionFactory sqlSessionFactory)
  {
    super.setSqlSessionFactory(sqlSessionFactory);
  }
  
  public UserInfo loadUserByUsername(String username)
  {
    System.out.println(username);
    return (UserInfo)super.getSqlSession().selectOne("userInfo.loadUserByUsername", username);
  }
}
