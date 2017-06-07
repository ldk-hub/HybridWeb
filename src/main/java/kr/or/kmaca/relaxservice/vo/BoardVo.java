package kr.or.kmaca.relaxservice.vo;

public class BoardVo {
	private String certNo;
	private String title;
	private String content;
	private String usrCnt;
	private String payDt;
	private String usr;
	
	public String getCertNo() {
		return certNo;
	}
	public void setCertNo(String certNo) {
		this.certNo = certNo;
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
	public String getUsrCnt() {
		return usrCnt;
	}
	public void setUsrCnt(String usrCnt) {
		this.usrCnt = usrCnt;
	}
	public String getPayDt() {
		return payDt;
	}
	public void setPayDt(String payDt) {
		this.payDt = payDt;
	}
	public String getUsr() {
		return usr;
	}
	public void setUsr(String usr) {
		this.usr = usr;
	}
}
