package kr.or.kmaca.relaxservice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.kmaca.relaxservice.dao.RelaxServiceDao;
import kr.or.kmaca.relaxservice.service.RelaxService;
import kr.or.kmaca.relaxservice.vo.RelaxServiceVo;

@Service
public class RelaxServiceImpl implements RelaxService{

	@Autowired
	private RelaxServiceDao relaxServiceDao;
	
	
	public List<RelaxServiceVo> relaxServiceRosterList(RelaxServiceVo relaxServiceVo) throws Exception {
		return relaxServiceDao.relaxServiceRosterList(relaxServiceVo);
	}


	public RelaxServiceVo relaxServiceDetail(RelaxServiceVo relaxServiceVo) throws Exception {
		return relaxServiceDao.relaxServiceDetail(relaxServiceVo);
	}


	public int relaxServiceRosterCnt(RelaxServiceVo relaxServiceVo) throws Exception {
		return relaxServiceDao.relaxServiceRosterCnt(relaxServiceVo);
	}


	public int updateAplcProcSt(RelaxServiceVo relaxServiceVo) throws Exception {
		return relaxServiceDao.updateAplcProcSt(relaxServiceVo);
	}

}
