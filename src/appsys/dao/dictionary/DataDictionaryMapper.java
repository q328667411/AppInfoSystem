package dao.dictionary;

import org.apache.ibatis.annotations.Param;
import pojo.DataDictionary;

import java.util.List;

/**
 * 字典接口
 */
public interface DataDictionaryMapper {
    public List<DataDictionary> getAppStatus(); /*app状态查询*/
    public List<DataDictionary> getAppFlatForm(); /*所属平台*/
}
