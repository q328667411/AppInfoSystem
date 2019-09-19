package service;

import pojo.AppCategory;

import java.util.List;

public interface AppCategoryService {
    public List<AppCategory> getCategoryByparentId(Integer parentId); //三级分类
}
