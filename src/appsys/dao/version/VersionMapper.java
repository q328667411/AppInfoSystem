package dao.version;

import jdk.nashorn.internal.runtime.Version;
import org.apache.ibatis.annotations.Param;
import pojo.AppVersion;

import java.util.List;

public interface VersionMapper {
    public List<AppVersion> getEditionInfo(@Param("id") Integer id);
    public int addVersion(AppVersion appVersion);
    public int updateVersion(AppVersion appVersion);
    public int delVersion(@Param("id") Integer id);
    public AppVersion getVersionById(@Param("id") Integer id);
    public int updateVersionPath(@Param("id") Integer id);
}
