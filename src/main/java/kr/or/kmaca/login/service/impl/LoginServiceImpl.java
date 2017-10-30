package kr.or.kmaca.login.service.impl;

import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import kr.or.kmaca.login.dao.LoginDao;
import kr.or.kmaca.login.service.LoginService;
import kr.or.kmaca.relaxservice.vo.RelaxServiceVo;
import kr.or.kmaca.security.vo.UserInfo;

@Service
public class LoginServiceImpl implements LoginService{

	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
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

	@Override
	@Transactional
	public void selectExcelList(HttpServletResponse response) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		// 메모리에 100개의 행을 유지합니다. 행의 수가 넘으면 디스크에 적습니다.
		SXSSFWorkbook wb = new SXSSFWorkbook(100);
		final Sheet sheet = wb.createSheet();
		
		try {
		    sqlSession.select("selectExcelList",  new ResultHandler() {
				@Override
				public void handleResult(ResultContext context) { 
				    UserInfo vo = (UserInfo) context.getResultObject();
				    Row row = sheet.createRow(context.getResultCount() - 1);
			    	Cell cell = null;
			    	cell = row.createCell(0);
			    	cell.setCellValue(vo.getSeq().toString());
			        cell = row.createCell(1);
			        cell.setCellValue(vo.getUserId());
			        cell = row.createCell(2);
			        cell.setCellValue(vo.getName());
			    }
            }); 
		    //생성 성공시 처리부분입니다. 쿠키로 fileDownload 값을 true로 주면 jQuery File Download 플러그인 에서 성공으로 인식합니다.
		    //SXSSFWorkbook의 write 메소드를 사용해서 생성된 파일을 클라이언트에게 보냅니다.
			response.setHeader("Set-Cookie", "fileDownload=true; path=/");
			response.setHeader("Content-Disposition", String.format("attachment; filename=\"test.xlsx\""));
			wb.write(response.getOutputStream());

		} catch(Exception e) {
			//파일 생성 실패시의 처리 입니다. 쿠키로 fileDownload 의 값을 true 이외의 값을 주면 jQuery File Download 플러그인이 실패로 인식해서 에러메세지 
			//다이얼로그를 보여줍니다.
			response.setHeader("Set-Cookie", "fileDownload=false; path=/");
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Content-Type","text/html; charset=utf-8");
			
			OutputStream out = null;
			try {
				out = response.getOutputStream();
				byte[] data = new String("fail..").getBytes();
				out.write(data, 0, data.length);
			} catch(Exception ignore) {
				ignore.printStackTrace();
			} finally {
				if(out != null) try { out.close(); } catch(Exception ignore) {}
			}
		} finally {
			//SXSSFWorkbook을 dipose 하면 엑셀파일 생성을 위해서 임시로 만들어 졌던 파일을 제거합니다.
			sqlSession.close();
			wb.dispose();
			try { wb.close(); } catch(Exception ignore) {}
		}
		
	}


}
