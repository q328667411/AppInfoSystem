package service.impl;

import dao.version.VersionMapper;
import jdk.nashorn.internal.runtime.Version;
import org.springframework.stereotype.Service;
import pojo.AppVersion;
import service.VerSionService;

import javax.annotation.Resource;
import java.util.List;

@Service("verSionService")
public class VerSionServiceImpl implements VerSionService {
    @Resource
    private VersionMapper versionMapper;
    @Override
    public List<AppVersion> getEditionInfo(Integer id) {
        try{
            return versionMapper.getEditionInfo(id);
        }catch (RuntimeException e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int addVersion(AppVersion appVersion) {
        try{
            return versionMapper.addVersion(appVersion);
        }catch (RuntimeException e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int updateVersion(AppVersion appVersion) {
        try{
            return versionMapper.updateVersion(appVersion);
        }catch (RuntimeException e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int delVersion(Integer id) {
        return versionMapper.delVersion(id);
    }

    @Override
    public AppVersion getVersionById(Integer id) {
        return versionMapper.getVersionById(id);
    }

    @Override
    public int updateVersionPath(Integer id) {
        return versionMapper.updateVersionPath(id);
    }


}
