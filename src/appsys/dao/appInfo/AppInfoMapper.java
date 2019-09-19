package dao.appInfo;

import org.apache.ibatis.annotations.Param;
import pojo.AppInfo;

import java.util.List;

public interface AppInfoMapper {
    public List<AppInfo> getInfoByName(@Param("softwareName") String softwareName,
                                       @Param("status") Integer status,
                                       @Param("flatformId") Integer flatformId,
                                       @Param("categoryLevel1") Integer categoryLevel1,
                                       @Param("categoryLevel2") Integer categoryLevel2,
                                       @Param("categoryLevel3") Integer categoryLevel3,
                                       @Param("pageNo")Integer pageNo,@Param("pageSize")Integer pageSize);     //模糊查询游戏名
    public int getCount(@Param("softwareName") String softwareName,
                        @Param("status") Integer status,
                        @Param("flatformId") Integer flatformId,
                        @Param("categoryLevel1") Integer categoryLevel1,
                        @Param("categoryLevel2") Integer categoryLevel2,
                        @Param("categoryLevel3") Integer categoryLevel3); //游戏总数
    public int getNameByName(@Param("APKName") String APKName);
    public int addAppInfo(AppInfo appInfo);
    public AppInfo getAppInfoById(@Param("id") Integer id);
    public int updateFilePath(@Param("id") Integer id);
    public int updateAppInfomodify(AppInfo appInfo);
    public int updateAppInfoVersionId(@Param("id") Integer id,@Param("versionId") Integer versionId);
    public int delAppInfo(@Param("id") Integer id);
    public int updateAppstatus(@Param("id") Integer id,@Param("appid") Integer appid);

    public List<AppInfo> getbackInfo(@Param("softwareName") String softwareName,
                                     @Param("flatformId") Integer flatformId,
                                     @Param("categoryLevel1") Integer categoryLevel1,
                                     @Param("categoryLevel2") Integer categoryLevel2,
                                     @Param("categoryLevel3") Integer categoryLevel3,
                                     @Param("pageNo")Integer pageNo,@Param("pageSize")Integer pageSize);

    public int getCount1(@Param("softwareName") String softwareName,
                        @Param("flatformId") Integer flatformId,
                        @Param("categoryLevel1") Integer categoryLevel1,
                        @Param("categoryLevel2") Integer categoryLevel2,
                        @Param("categoryLevel3") Integer categoryLevel3); //游戏总数

    public int updateStatus(@Param("status")Integer status,@Param("id") Integer id,@Param("bckid") Integer bckid); //审核通过

}
