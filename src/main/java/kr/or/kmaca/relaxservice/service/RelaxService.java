package kr.or.kmaca.relaxservice.service;

import java.util.List;

import kr.or.kmaca.relaxservice.vo.BoardVo;
import kr.or.kmaca.relaxservice.vo.RelaxServiceVo;

public interface RelaxService {

	public List<RelaxServiceVo> relaxServiceRosterList(RelaxServiceVo relaxServiceVo) throws Exception;
	
	public int relaxServiceRosterCnt(RelaxServiceVo relaxServiceVo) throws Exception;
	
	public RelaxServiceVo relaxServiceDetail(RelaxServiceVo relaxServiceVo) throws Exception;

	public int updateAplcProcSt(RelaxServiceVo relaxServiceVo) throws Exception;
	
	public List<BoardVo> main(BoardVo boardVo) throws Exception;
	
}
