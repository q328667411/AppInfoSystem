package controller;

import com.alibaba.fastjson.JSONArray;
import dao.backendUser.BackendUserMapper;
import jdk.nashorn.internal.runtime.Version;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.*;
import service.*;
import tools.Page;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/backend")
public class BackendController {
    @Resource
    private BackendUserMapper backendUserMapper;

    @Resource
    private DevUserService devUserService;

    @Resource
    private AppInfoService appInfoService;

    @Resource
    private DataDictionaryService dataDictionaryService;

    @Resource
    private AppCategoryService appCategoryService;

    @Resource
    private VerSionService verSionService;

    @RequestMapping("/login")       //后台登陆
    public String backendLogin(String userCode, String userPassword, HttpSession session){

        BackendUser user=backendUserMapper.getCodeAndNameBy(userCode,userPassword);
        if(user!=null){
            session.setAttribute("BackendUser",user);
            return "backend/main";
        }
        return "redirect:/login/backLojin";
    }

    @RequestMapping("/exit")    //退出
    public String exit(HttpSession session){
        session.removeAttribute("backendUser");
        return "backendlogin";
    }

    @RequestMapping("/list")      //APP维护
    public String list( AppInfo appInfo,
                        Integer parendId,
                        Integer pageIndex,
                        Model model){
        List<DataDictionary> forms=dataDictionaryService.getAppFlatForm();
        List<DataDictionary> statusList=dataDictionaryService.getAppStatus();
        List<AppCategory> queryCategoryLevel1=appCategoryService.getCategoryByparentId(parendId);   //1级菜单
        int count=appInfoService.getCount1(appInfo.getSoftwareName(),appInfo.getFlatformId(),appInfo.getCategoryLevel1(),appInfo.getCategoryLevel2(),appInfo.getCategoryLevel3());
        Page page=new Page();
        page.setTotalCount(count);
        if(pageIndex==null){
            pageIndex=1;
        }
        if(pageIndex<1){
            pageIndex=0;
        }
        List<AppInfo> appInfoLIst=null;
        int pageNo=(pageIndex-1)*page.getPageSize();

        appInfoLIst=appInfoService.getbackInfo(appInfo.getSoftwareName(),appInfo.getFlatformId(),appInfo.getCategoryLevel1(),appInfo.getCategoryLevel2(),appInfo.getCategoryLevel3(),pageNo,page.getPageSize());
        if(appInfoLIst.size()==0){
            pageIndex=0;
        }
        model.addAttribute("pageNo",pageIndex);
        model.addAttribute("totalPageCount",page.getTotalPageCount());
        model.addAttribute("pageSize",page.getPageSize());
        model.addAttribute("appInfoLIst",appInfoLIst);
        model.addAttribute("count",count); //游戏总数
        model.addAttribute("forms",forms);  //所属平台
        model.addAttribute("statusList",statusList);    //APP状态
        model.addAttribute("queryCategoryLevel1",queryCategoryLevel1);  //一级分类
        model.addAttribute("appInfo",appInfo);
        return "backend/backApp";
    }
    @RequestMapping("/categorylevellist.json")
    @ResponseBody
    public Object view(Integer pid){    //查询1-3级菜单
        List<AppCategory> queryCategoryLevel1=appCategoryService.getCategoryByparentId(pid);
        return JSONArray.toJSONString(queryCategoryLevel1);
    }

    @RequestMapping("check")
    public String check(Integer aid,Integer vid,Model model){
        AppInfo appInfo=appInfoService.getAppInfoById(aid); //获得app信息
        AppVersion version=verSionService.getVersionById(vid);
        model.addAttribute("appInfo",appInfo);
        model.addAttribute("version",version);
        return "backend/backauditApp";
        /*BackendUser backendUser=(BackendUser)session.getAttribute("BackendUser");
        if(appInfoService.updateStatus(aid,backendUser.getId())>0){

        }*/
    }
    @RequestMapping("checks")
    public String checks(Integer status,Integer id,HttpSession session){
        BackendUser backendUser=(BackendUser)session.getAttribute("BackendUser");
        if(appInfoService.updateStatus(status, id,backendUser.getId())>0){
            return "redirect:/backend/list";
        }
        return "backend/backauditApp";
    }

    //上传文件会自动绑定到MultipartFile中   //下载APK
    @RequestMapping(value="/download",method={RequestMethod.POST,RequestMethod.GET})
    public ResponseEntity<byte[]> download(HttpServletRequest request,
                                           @RequestParam("filename") String filename, Model model) throws Exception{

        //下载文件路径
        String path = "E:\\xz";
        File file = new File(path + File.separator + filename);
        HttpHeaders headers = new HttpHeaders();
        //下载显示的文件名，解决中文名称乱码问题
        String downloadFileName = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
        //通知浏览器以attachment（下载方式）打开图片
        headers.setContentDispositionFormData("attachment",downloadFileName);
        //application/octet-stream:二进制流数据（最常见的文件下载）
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        //201HttpStatus.CREATED
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.CREATED);
    }
}

