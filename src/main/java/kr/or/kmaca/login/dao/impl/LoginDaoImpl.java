package kr.or.kmaca.login.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

import kr.or.kmaca.login.dao.LoginDao;
import kr.or.kmaca.relaxservice.vo.RelaxServiceVo;
import kr.or.kmaca.security.vo.UserInfo;

@Repository
public class LoginDaoImpl extends SqlSessionDaoSupport implements LoginDao {

	 @Resource(name="sqlSessionFactory")
	  public void setSuperSqlSessionFactory(SqlSessionFactory sqlSessionFactory)
	  {
	    super.setSqlSessionFactory(sqlSessionFactory);
	  }
	
	
	@Override
	public void insertId(UserInfo userInfo) throws Exception {
		 getSqlSession().insert("userInfo.insertId", userInfo);
	}


	@Override
	public String idCheck(UserInfo userInfo) throws Exception {
		return getSqlSession().selectOne("userInfo.idCheck", userInfo);
	}


	@Override
	public List<RelaxServiceVo> ClientList(UserInfo userInfo) throws Exception {
		return getSqlSession().selectList("userInfo.ClientList", userInfo);
	}


	@Override
	public int ClientListCnt(UserInfo userInfo) throws Exception {
		return getSqlSession().selectOne("userInfo.ClientListCnt", userInfo);
	}


	@Override
	public String getPw(Map<String, Object> paramMap) throws Exception {
		return getSqlSession().selectOne("userInfo.getPw", paramMap);
	}


	@Override
	public List<UserInfo> selectExcelList(UserInfo userInfo) throws Exception {
		return getSqlSession().selectList("userInfo.selectExcelList", userInfo);
	}
	
	//회원정보 조회
	//public String userList(UserInfo userInfo) throws Exception {
		//return getSqlSession().selectList("userInfo.userList", userInfo);
	//}

}
