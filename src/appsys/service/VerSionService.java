package service;


import org.apache.ibatis.annotations.Param;
import pojo.AppVersion;

import java.util.List;

public interface VerSionService {
    public List<AppVersion> getEditionInfo(Integer id);
    public int addVersion(AppVersion appVersion);
    public int updateVersion(AppVersion appVersion);
    public int delVersion(Integer id);
    public AppVersion getVersionById(Integer id);
    public int updateVersionPath(Integer id);
}
