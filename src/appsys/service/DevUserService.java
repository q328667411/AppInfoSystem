package service;

import pojo.DevUser;

public interface DevUserService {
    public DevUser getCodeAndPwdByUser(String devCode, String devPassword);     //前台登录
}
