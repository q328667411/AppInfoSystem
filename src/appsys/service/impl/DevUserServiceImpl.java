package service.impl;

import dao.devUser.DevUserMapper;
import org.springframework.stereotype.Service;
import pojo.DevUser;
import service.DevUserService;

import javax.annotation.Resource;

@Service("devUserService")
public class DevUserServiceImpl implements DevUserService {
    @Resource
    private DevUserMapper devUserMapper;
    @Override
    public DevUser getCodeAndPwdByUser(String devCode, String devPassword) {
        try{
            return devUserMapper.getCodeAndPwdByUser(devCode, devPassword);
        }catch (RuntimeException e){
            e.printStackTrace();
        }
        return null;
    }
}
