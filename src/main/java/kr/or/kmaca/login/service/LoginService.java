package kr.or.kmaca.login.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.ModelMap;

import kr.or.kmaca.relaxservice.vo.RelaxServiceVo;
import kr.or.kmaca.security.vo.UserInfo;

public interface LoginService {


	public void insertId(UserInfo userInfo)throws Exception;

	public String idCheck(UserInfo userInfo)throws Exception;
	
	//회원정보 리스트
	public List<RelaxServiceVo> ClientList(UserInfo userInfo)throws Exception;
	//회원정보 페이징
	public int ClientListCnt(UserInfo userInfo)throws Exception;
	//비밀번호 분실 이메일 인증
	public String getPw(Map<String, Object> paramMap)throws Exception;

}
