package dao.devUser;

import org.apache.ibatis.annotations.Param;
import pojo.DevUser;

public interface DevUserMapper {
    public DevUser getCodeAndPwdByUser(@Param("devCode") String devCode, @Param("devPassword") String devPassword);
}
