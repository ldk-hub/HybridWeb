package kr.or.kmaca.relaxservice.dao;

import java.util.List;

import kr.or.kmaca.relaxservice.vo.RelaxServiceVo;

public interface RelaxServiceDao {

	public List<RelaxServiceVo> relaxServiceRosterList(RelaxServiceVo relaxServiceVo) throws Exception;
	
	public int relaxServiceRosterCnt(RelaxServiceVo relaxServiceVo) throws Exception;
	
	public RelaxServiceVo relaxServiceDetail(RelaxServiceVo relaxServiceVo) throws Exception;
	
	public int updateAplcProcSt(RelaxServiceVo relaxServiceVo) throws Exception;
}
