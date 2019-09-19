package dao.appcategory;

import org.apache.ibatis.annotations.Param;
import pojo.AppCategory;

import java.util.List;

public interface AppCategoryMapper {
    public List<AppCategory> getCategoryByparentId(@Param("parentId") Integer parentId);
}
