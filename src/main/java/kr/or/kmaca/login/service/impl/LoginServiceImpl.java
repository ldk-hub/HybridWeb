package kr.or.kmaca.login.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import kr.or.kmaca.login.dao.LoginDao;
import kr.or.kmaca.login.service.LoginService;
import kr.or.kmaca.security.vo.UserInfo;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDao loginDao;
	
	
	@Override
	public void insertId(UserInfo userInfo) throws Exception {
		 loginDao.insertId(userInfo);
	}


	@Override
	public String idCheck(UserInfo userInfo) throws Exception {
		
		return loginDao.idCheck(userInfo);
	}



}
