package kr.or.kmaca.security.service.impl;

import java.util.ArrayList;
import java.util.List;
import kr.or.kmaca.security.dao.UserInfoDao;
import kr.or.kmaca.security.vo.UserInfo;
import kr.or.kmaca.security.vo.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserInfoServiceImpl
  implements UserDetailsService
{
  @Autowired
  private UserInfoDao userInfoDao;
  
  public UserDetails loadUserByUsername(String username)
    throws UsernameNotFoundException
  {
    UserInfo userInfo = new UserInfo();
    userInfo.setUsername(username);
    
    UserInfo loginUserInfo = this.userInfoDao.loadUserByUsername(username);
    System.out.println(username);
    setRoles(loginUserInfo);
    return loginUserInfo;
  }
  
  private void setRoles(UserInfo userInfo)
  {
    List<UserRole> roles = new ArrayList();
    
    UserRole userRole = new UserRole();
    userRole.setAuthority("ROLE_USER");
    roles.add(userRole);
    userInfo.setAuthorities(roles);
  }
}
