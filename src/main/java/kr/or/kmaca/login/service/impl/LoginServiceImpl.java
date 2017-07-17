package kr.or.kmaca.login.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import kr.or.kmaca.login.dao.LoginDao;
import kr.or.kmaca.login.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDao loginDao;
	
	
	@Override
	public void insertId(ModelMap map) throws Exception {
		 loginDao.insertId(map);
	}

}
