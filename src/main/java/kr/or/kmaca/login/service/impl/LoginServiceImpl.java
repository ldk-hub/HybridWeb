package kr.or.kmaca.login.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import kr.or.kmaca.login.dao.LoginDao;
import kr.or.kmaca.login.service.LoginService;
import kr.or.kmaca.relaxservice.vo.RelaxServiceVo;
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


	@Override
	public List<RelaxServiceVo> ClientList(UserInfo userInfo) throws Exception {
		return loginDao.ClientList(userInfo);
	}


	@Override
	public int ClientListCnt(UserInfo userInfo) throws Exception {
		return loginDao.ClientListCnt(userInfo);
	}


	@Override
	public String getPw(Map<String, Object> paramMap) throws Exception {
		return loginDao.getPw(paramMap);
	}



}
