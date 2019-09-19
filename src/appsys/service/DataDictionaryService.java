package service;

import pojo.DataDictionary;

import java.util.List;

public interface DataDictionaryService {
    public List<DataDictionary> getAppStatus(); /*app状态查询*/
    public List<DataDictionary> getAppFlatForm(); /*所属平台*/
}
