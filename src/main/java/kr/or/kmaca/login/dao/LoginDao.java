package kr.or.kmaca.login.dao;

import java.util.List;
import java.util.Map;

import org.springframework.ui.ModelMap;

import kr.or.kmaca.relaxservice.vo.RelaxServiceVo;
import kr.or.kmaca.security.vo.UserInfo;

public interface LoginDao {

	public void insertId(UserInfo userInfo)throws Exception;

	public String idCheck(UserInfo userInfo)throws Exception;

	public List<RelaxServiceVo> ClientList(UserInfo userInfo)throws Exception;

	public int ClientListCnt(UserInfo userInfo)throws Exception;

	public String getPw(Map<String, Object> paramMap)throws Exception;

}
