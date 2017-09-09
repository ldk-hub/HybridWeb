package kr.or.kmaca.security.vo;

import java.util.Collection;
import java.util.List;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class UserInfo
  implements UserDetails
{
  private static final long serialVersionUID = 1L;
  private String username;
  private String password;
  private String name;
  private String fstdate;
  private String userStCd;
  private String email;
  private String certNo;
  private String seq;
  private String pageIndex = "1";
  private int recordCountPerPage = 10;
  private int firstIndex;
  private int lastIndex;
  
  public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(String pageIndex) {
		this.pageIndex = pageIndex;
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

  
  public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getUserId() {
	return userId;
}

public void setUserId(String userId) {
	this.userId = userId;
}

private String userId;
  private List<UserRole> authorities;
  
  public Collection<? extends GrantedAuthority> getAuthorities()
  {
    return this.authorities;
  }
  
  public String getPassword()
  {
    return this.password;
  }
  
  public String getUsername()
  {
    return this.username;
  }
  
  public boolean isAccountNonExpired()
  {
    return true;
  }
  
  public boolean isAccountNonLocked()
  {
    return true;
  }
  
  public boolean isCredentialsNonExpired()
  {
    return true;
  }
  
  public boolean isEnabled()
  {
    return true;
  }
  
  public String getName()
  {
    return this.name;
  }
  
  public void setName(String name)
  {
    this.name = name;
  }
  
  public String getCertNo()
  {
    return this.certNo;
  }
  
  public void setCertNo(String certNo)
  {
    this.certNo = certNo;
  }
  
  public String getUserStCd()
  {
    return this.userStCd;
  }
  
  public void setUserStCd(String userStCd)
  {
    this.userStCd = userStCd;
  }
  
  public void setUsername(String username)
  {
    this.username = username;
  }
  
  public void setPassword(String password)
  {
    this.password = password;
  }
  
  public String getFstdate() {
		return fstdate;
	}

  public void setFstdate(String fstdate) {
		this.fstdate = fstdate;
	}

  
  public void setAuthorities(List<UserRole> authorities)
  {
    this.authorities = authorities;
  }
}
