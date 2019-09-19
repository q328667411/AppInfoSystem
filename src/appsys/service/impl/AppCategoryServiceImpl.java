package service.impl;

import dao.appcategory.AppCategoryMapper;
import org.springframework.stereotype.Service;
import pojo.AppCategory;
import service.AppCategoryService;

import javax.annotation.Resource;
import java.util.List;
@Service("appCategoryService")
public class AppCategoryServiceImpl implements AppCategoryService {

    @Resource
    private AppCategoryMapper appCategoryMapper;

    @Override
    public List<AppCategory> getCategoryByparentId(Integer parentId) {
        try{
            return appCategoryMapper.getCategoryByparentId(parentId);
        }catch (RuntimeException e){
            e.printStackTrace();
        }
        return null;
    }
}
