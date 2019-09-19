package dao.backendUser;

import org.apache.ibatis.annotations.Param;
import pojo.BackendUser;

public interface BackendUserMapper {
    public BackendUser getCodeAndNameBy(@Param("userCode") String userCode,@Param("userPassword") String userPassword); //后台用户登录
}
