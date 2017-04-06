package kr.or.kmaca.security.vo;

import org.springframework.security.core.GrantedAuthority;

public class UserRole
  implements GrantedAuthority
{
  private static final long serialVersionUID = 1L;
  private String authority;
  
  public String getAuthority()
  {
    return this.authority;
  }
  
  public void setAuthority(String authority)
  {
    this.authority = authority;
  }
}
