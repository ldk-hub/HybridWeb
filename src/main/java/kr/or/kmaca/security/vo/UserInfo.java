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
  private String certNo;
  private String userStCd;
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
  
  public void setAuthorities(List<UserRole> authorities)
  {
    this.authorities = authorities;
  }
}
