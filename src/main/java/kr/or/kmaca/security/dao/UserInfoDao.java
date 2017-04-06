package kr.or.kmaca.security.dao;

import kr.or.kmaca.security.vo.UserInfo;

public abstract interface UserInfoDao
{
  public abstract UserInfo loadUserByUsername(String paramString);
}
