package service;

import pojo.BackendUser;

public interface BackendUserService {
    public BackendUser getCodeAndNameBy(String userCode,String userPassword); //后台用户登录
}
