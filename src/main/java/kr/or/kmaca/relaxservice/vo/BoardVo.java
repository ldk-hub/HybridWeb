package kr.or.kmaca.relaxservice.vo;

public class BoardVo {
	
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
