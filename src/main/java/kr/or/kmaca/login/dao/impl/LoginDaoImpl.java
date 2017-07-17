package kr.or.kmaca.login.dao.impl;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import kr.or.kmaca.login.dao.LoginDao;

@Repository
public class LoginDaoImpl extends SqlSessionDaoSupport implements LoginDao {

	 @Resource(name="sqlSessionFactory")
	  public void setSuperSqlSessionFactory(SqlSessionFactory sqlSessionFactory)
	  {
	    super.setSqlSessionFactory(sqlSessionFactory);
	  }
	
	
	@Override
	public void insertId(ModelMap map) throws Exception {
		 getSqlSession().insert("userInfo.insertId", map);
	}

}
