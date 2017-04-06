package kr.or.kmaca.relaxservice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.or.kmaca.relaxservice.service.RelaxService;
import kr.or.kmaca.relaxservice.vo.RelaxServiceVo;
import kr.or.kmaca.security.vo.UserInfo;

@Controller
@RequestMapping(value="/relaxService")
public class RelaxServiceController {
	
	@Autowired
	private RelaxService relaxService;

	@RequestMapping(value = "/getRelaxServiceRosterList")
	public String getRelaxServiceRosterList(ModelMap map, RelaxServiceVo relaxServiceVo) throws Exception {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserInfo userInfo = (UserInfo) authentication.getPrincipal();
		
		//전자정부프레임워크 페이징 처리
		relaxServiceVo.setCertNo(userInfo.getCertNo());
		PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(Integer.parseInt(relaxServiceVo.getPageIndex()));
        paginationInfo.setRecordCountPerPage(relaxServiceVo.getRecordCountPerPage());
        paginationInfo.setPageSize(5);
		//paginationInfo.setTotalRecordCount( relaxService.relaxServiceRosterCnt(relaxServiceVo) ); 계약사별 카운팅갯수
		
		relaxServiceVo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		relaxServiceVo.setLastIndex(paginationInfo.getLastRecordIndex());
		
		//List<RelaxServiceVo> list = relaxService.relaxServiceRosterList(relaxServiceVo);업체수
		map.put("paginationInfo", paginationInfo);
		//map.put("result", list);
		return "/relaxService/relaxServiceRosterList";
	}
	
	@RequestMapping(value = "/updateAplcProcSt")
	@ResponseBody
	public int updateAplcProcSt(RelaxServiceVo relaxServiceVo) throws Exception {
		return relaxService.updateAplcProcSt(relaxServiceVo);
	}
	
	@RequestMapping(value = "/updateAplcEtc")
	public String updateAplcEtc(ModelMap map, RelaxServiceVo relaxServiceVo) throws Exception {
		return "/relaxService/relaxServiceRosterList";
	}

	
	@RequestMapping(value = "/relaxServiceDetail")
	@ResponseBody
	public RelaxServiceVo relaxServiceDetail(RelaxServiceVo relaxServiceVo) throws Exception {
		System.out.println(relaxServiceVo);
		return relaxService.relaxServiceDetail(relaxServiceVo);
	}
	
}
