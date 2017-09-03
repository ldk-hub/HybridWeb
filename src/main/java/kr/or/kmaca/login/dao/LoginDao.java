package kr.or.kmaca.login.dao;

import org.springframework.ui.ModelMap;

import kr.or.kmaca.security.vo.UserInfo;

public interface LoginDao {

	public void insertId(UserInfo userInfo)throws Exception;

	public String idCheck(UserInfo userInfo)throws Exception;

}
