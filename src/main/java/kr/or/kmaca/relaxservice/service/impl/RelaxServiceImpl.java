package kr.or.kmaca.relaxservice.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.kmaca.relaxservice.dao.RelaxServiceDao;
import kr.or.kmaca.relaxservice.service.RelaxService;
import kr.or.kmaca.relaxservice.vo.BoardVo;
import kr.or.kmaca.relaxservice.vo.RelaxServiceVo;



@Service
public class RelaxServiceImpl implements RelaxService{

	
	@Autowired
	private RelaxServiceDao relaxServiceDao;
	
	
	public List<RelaxServiceVo> relaxServiceRosterList(RelaxServiceVo relaxServiceVo) throws Exception {
		return relaxServiceDao.relaxServiceRosterList(relaxServiceVo);
	}


	public RelaxServiceVo relaxServiceDetail(RelaxServiceVo relaxServiceVo) throws Exception {
				//조회수 증가
				relaxServiceDao.relaxUpdateViewCnt(relaxServiceVo);
		return relaxServiceDao.relaxServiceDetail(relaxServiceVo);
	}


	public int relaxServiceRosterCnt(RelaxServiceVo relaxServiceVo) throws Exception {
		return relaxServiceDao.relaxServiceRosterCnt(relaxServiceVo);
	}


	public int updateAplcProcSt(RelaxServiceVo relaxServiceVo) throws Exception {
		return relaxServiceDao.updateAplcProcSt(relaxServiceVo);
	}

	public List<BoardVo> main(BoardVo boardVo) throws Exception {
		return relaxServiceDao.main(boardVo);
	}


	@Override
	public List<RelaxServiceVo> relaxServiceSearch(RelaxServiceVo relaxServiceVo) throws Exception {
		return relaxServiceDao.relaxServiceSearch(relaxServiceVo);
	}

		//게시판 삽입 반복 insert 추가개발
	@Override
	public List<RelaxServiceVo> relaxServiceInsert(RelaxServiceVo relaxServiceVo) throws Exception {
		
		System.out.println("@@@@@@@@@@@@@@2"+relaxServiceVo.toString());
		/*for(i=0;i<relaxServiceVo.length; i++;){
			
		}*/
		
		
		return relaxServiceDao.relaxServiceInsert(relaxServiceVo);
	}


	@Override
	public void relaxServiceDelete(RelaxServiceVo relaxServiceVo) throws Exception {
		relaxServiceDao.relaxServiceDelete(relaxServiceVo);
	}


	@Override
	public void selectExcelList(HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	

}
