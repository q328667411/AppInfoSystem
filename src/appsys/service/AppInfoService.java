package service;

import org.apache.ibatis.annotations.Param;
import pojo.AppInfo;

import java.util.List;

public interface AppInfoService {
    public List<AppInfo> getInfoByName( String softwareName,
                                        Integer status,
                                        Integer flatformId,
                                        Integer categoryLevel1,
                                        Integer categoryLevel2,
                                        Integer categoryLevel3,
                                       Integer pageNo,
                                       Integer pageSize);     //模糊查询游戏名
    public int getCount(String softwareName,
                        Integer status,
                        Integer flatformId,
                        Integer categoryLevel1,
                        Integer categoryLevel2,
                        Integer categoryLevel3); //游戏总数
    public int getNameByName(String APKName);
    public int addAppInfo(AppInfo appInfo);
    public AppInfo getAppInfoById(Integer id);
    public int updateFilePath(Integer id);
    public int updateAppInfomodify(AppInfo appInfo);
    public int updateAppInfoVersionId(Integer id,Integer versionId);
    public int delAppInfo(Integer id);
    public int updateAppstatus(Integer id,Integer appid);
    public List<AppInfo> getbackInfo( String softwareName,
                                     Integer flatformId,
                                      Integer categoryLevel1,
                                      Integer categoryLevel2,
                                      Integer categoryLevel3,
                                    Integer pageNo,Integer pageSize);

    public int getCount1(String softwareName,
                         Integer flatformId,
                         Integer categoryLevel1,
                         Integer categoryLevel2,
                         Integer categoryLevel3); //游戏总数
    public int updateStatus(Integer status,Integer id,Integer bckid); //审核通过
}
