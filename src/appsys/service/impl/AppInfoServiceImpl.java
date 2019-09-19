package service.impl;

import dao.appInfo.AppInfoMapper;
import dao.appcategory.AppCategoryMapper;
import org.springframework.stereotype.Service;
import pojo.AppInfo;
import service.AppInfoService;

import javax.annotation.Resource;
import java.util.List;

@Service("appInfoService")
public class AppInfoServiceImpl implements AppInfoService {
    @Resource
    private AppInfoMapper appInfoMapper;

    @Override
    public List<AppInfo> getInfoByName(String softwareName, Integer status, Integer flatformId, Integer categoryLevel1, Integer categoryLevel2, Integer categoryLevel3, Integer pageNo, Integer pageSize) {
        try{
            return appInfoMapper.getInfoByName(softwareName, status, flatformId, categoryLevel1, categoryLevel2, categoryLevel3, pageNo, pageSize);
        }catch (RuntimeException e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int getCount(String softwareName,
                        Integer status,
                        Integer flatformId,
                        Integer categoryLevel1,
                        Integer categoryLevel2,
                        Integer categoryLevel3) {
        try{
            return appInfoMapper.getCount(softwareName, status, flatformId, categoryLevel1, categoryLevel2, categoryLevel3);
        }catch (RuntimeException e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int getNameByName(String APKName) {
        try{
            return appInfoMapper.getNameByName(APKName);
        }catch (RuntimeException e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int addAppInfo(AppInfo appInfo) {
        try{
            return appInfoMapper.addAppInfo(appInfo);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public AppInfo getAppInfoById(Integer id) {
        try{
           return appInfoMapper.getAppInfoById(id);
        }catch (RuntimeException e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int updateFilePath(Integer id) {
        return appInfoMapper.updateFilePath(id);
    }

    @Override
    public int updateAppInfomodify(AppInfo appInfo) {
        return appInfoMapper.updateAppInfomodify(appInfo);
    }

    @Override
    public int updateAppInfoVersionId(Integer id, Integer versionId) {
        return appInfoMapper.updateAppInfoVersionId(id, versionId);
    }

    @Override
    public int delAppInfo(Integer id) {
        return appInfoMapper.delAppInfo(id);
    }

    @Override
    public int updateAppstatus(Integer id,Integer appid) {
        return appInfoMapper.updateAppstatus(id,appid);
    }

    @Override
    public List<AppInfo> getbackInfo(String softwareName, Integer flatformId, Integer categoryLevel1, Integer categoryLevel2, Integer categoryLevel3, Integer pageNo, Integer pageSize) {
        return appInfoMapper.getbackInfo(softwareName, flatformId, categoryLevel1, categoryLevel2, categoryLevel3, pageNo, pageSize);
    }

    @Override
    public int getCount1(String softwareName, Integer flatformId, Integer categoryLevel1, Integer categoryLevel2, Integer categoryLevel3) {
        return appInfoMapper.getCount1(softwareName, flatformId, categoryLevel1, categoryLevel2, categoryLevel3);
    }

    @Override
    public int updateStatus(Integer status,Integer id, Integer bckid) {
        return appInfoMapper.updateStatus(status,id,bckid);
    }

}
