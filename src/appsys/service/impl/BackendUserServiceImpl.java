package service.impl;

import dao.backendUser.BackendUserMapper;
import org.springframework.stereotype.Service;
import pojo.BackendUser;
import service.BackendUserService;

import javax.annotation.Resource;

@Service("backendUserService")
public class BackendUserServiceImpl implements BackendUserService {
    @Resource
    private BackendUserMapper backendUserMapper;
    @Override
    public BackendUser getCodeAndNameBy(String userCode, String userPassword) {
        try{
            return backendUserMapper.getCodeAndNameBy(userCode, userPassword);
        }catch (RuntimeException e){
            e.printStackTrace();
        }
        return null;
    }
}
