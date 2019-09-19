package service.impl;

import dao.dictionary.DataDictionaryMapper;
import org.springframework.stereotype.Service;
import pojo.DataDictionary;
import service.DataDictionaryService;

import javax.annotation.Resource;
import java.util.List;

@Service("dataDictionaryService")
public class DataDictionaryServiceImpl implements DataDictionaryService {
    @Resource
    private DataDictionaryMapper dataDictionaryMapper;
    @Override
    public List<DataDictionary> getAppStatus() {
        try{
            return dataDictionaryMapper.getAppStatus();
        }catch (RuntimeException e){
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<DataDictionary> getAppFlatForm() {
        try{
            return dataDictionaryMapper.getAppFlatForm();
        }catch (RuntimeException e){
            e.printStackTrace();
        }

        return null;
    }
}
