package kr.or.kmaca.relaxservice.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.kmaca.relaxservice.dao.RelaxServiceDao;
import kr.or.kmaca.relaxservice.vo.RelaxServiceVo;

@Repository
public class RelaxServiceDaoImpl extends SqlSessionDaoSupport implements RelaxServiceDao{

	@Resource(name="sqlSessionFactory")
	public void setSuperSqlSessionFactory(SqlSessionFactory sqlSessionFactory){
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public List<RelaxServiceVo> relaxServiceRosterList(RelaxServiceVo relaxServiceVo) throws Exception {
		return getSqlSession().selectList("relaxService.relaxServiceRosterList", relaxServiceVo);
	}

	public RelaxServiceVo relaxServiceDetail(RelaxServiceVo relaxServiceVo) throws Exception {
		return getSqlSession().selectOne("relaxService.relaxServiceDetail", relaxServiceVo);
	}

	public int relaxServiceRosterCnt(RelaxServiceVo relaxServiceVo) throws Exception {
		return getSqlSession().selectOne("relaxService.relaxServiceRosterCnt", relaxServiceVo);
	}

	public int updateAplcProcSt(RelaxServiceVo relaxServiceVo) throws Exception {
		return getSqlSession().update("relaxService.updateAplcProcSt", relaxServiceVo);
	}

}
