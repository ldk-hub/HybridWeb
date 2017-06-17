package kr.or.kmaca.relaxservice.vo;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class RelaxServiceVo {
	
	private int rnum;
	
	private String pageIndex = "1";
	
	private int recordCountPerPage = 10;
	
	private int firstIndex;
	
	private int lastIndex;
	
	private String certNo;
	
	private String cnsmContNo;
	
	private String aplcPsnNm;
	
	private String bthDay;
	
	private String aplcMgmtNo;
	
	private String aplcPsnTel;
	
	private String insuContAmt;
	
	private String serviceGood;
	
	private String aplcProcStNm;
	
	private String factCmpnAmt;
	
	private String addr;
	
	private String payDt;
	
	private String etc;
	
	private String searchBox;
	
	private String searchCategory;
	
	
	
	public String getSearchBox() {
		return searchBox;
	}

	public void setSearchBox(String searchBox) {
		this.searchBox = searchBox;
	}

	public String getSearchCategory() {
		return searchCategory;
	}

	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public String getPageIndex() {
		if(pageIndex == null || pageIndex.equals("")){
			pageIndex = "1";
		}
		return pageIndex;
	}

	public void setPageIndex(String pageIndex) {
		this.pageIndex = pageIndex;
	}

	public String getAplcPsnTel() {
		return aplcPsnTel;
	}

	public void setAplcPsnTel(String aplcPsnTel) {
		this.aplcPsnTel = aplcPsnTel;
	}

	public String getInsuContAmt() {
		return insuContAmt;
	}

	public void setInsuContAmt(String insuContAmt) {
		this.insuContAmt = insuContAmt;
	}

	public String getServiceGood() {
		return serviceGood;
	}

	public void setServiceGood(String serviceGood) {
		this.serviceGood = serviceGood;
	}

	public String getAplcProcStNm() {
		return aplcProcStNm;
	}

	public void setAplcProcStNm(String aplcProcStNm) {
		this.aplcProcStNm = aplcProcStNm;
	}

	public String getFactCmpnAmt() {
		return factCmpnAmt;
	}

	public void setFactCmpnAmt(String factCmpnAmt) {
		this.factCmpnAmt = factCmpnAmt;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPayDt() {
		return payDt;
	}

	public void setPayDt(String payDt) {
		this.payDt = payDt;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getAplcMgmtNo() {
		return aplcMgmtNo;
	}

	public void setAplcMgmtNo(String aplcMgmtNo) {
		this.aplcMgmtNo = aplcMgmtNo;
	}

	public String getCertNo() {
		return certNo;
	}

	public void setCertNo(String certNo) {
		this.certNo = certNo;
	}

	public String getCnsmContNo() {
		return cnsmContNo;
	}

	public void setCnsmContNo(String cnsmContNo) {
		this.cnsmContNo = cnsmContNo;
	}

	public String getAplcPsnNm() {
		return aplcPsnNm;
	}

	public void setAplcPsnNm(String aplcPsnNm) {
		this.aplcPsnNm = aplcPsnNm;
	}

	public String getBthDay() {
		return bthDay;
	}

	public void setBthDay(String bthDay) {
		this.bthDay = bthDay;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
	
	
	private int seq;
	private String title;
	private String content;
	private String intDate;
	private String uptDate;
	private int usrCnt;
	private String usr;
	
	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getIntDate() {
		return intDate;
	}

	public void setIntDate(String intDate) {
		this.intDate = intDate;
	}

	public String getUptDate() {
		return uptDate;
	}

	public void setUptDate(String uptDate) {
		this.uptDate = uptDate;
	}

	public int getUsrCnt() {
		return usrCnt;
	}

	public void setUsrCnt(int usrCnt) {
		this.usrCnt = usrCnt;
	}

	public String getUsr() {
		return usr;
	}

	public void setUsr(String usr) {
		this.usr = usr;
	}

	
	
}
