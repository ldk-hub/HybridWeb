package kr.or.kmaca.login.service;

import org.springframework.ui.ModelMap;

import kr.or.kmaca.security.vo.UserInfo;

public interface LoginService {


	public void insertId(UserInfo userInfo)throws Exception;

	public String idCheck(UserInfo userInfo)throws Exception;

}
