package controller;

import com.alibaba.fastjson.JSONArray;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pojo.*;
import service.*;
import tools.Page;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/dev")
public class DevController {
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

    @RequestMapping("/login")       //前台登陆操作
    public String isLogin(String devCode, String devPassword, HttpSession session){
        DevUser devUser=devUserService.getCodeAndPwdByUser(devCode, devPassword);
        if(devUser!=null){
            session.setAttribute("devUser",devUser);
            return "developer/main";
        }
        return "devlogin";
    }
    @RequestMapping("/exit")    //退出
    public String exit(HttpSession session){
        session.removeAttribute("devUser");
        return "../index";
    }

    @RequestMapping("/list")      //APP维护
    public String list( AppInfo appInfo,
                       Integer parendId,
                       Integer pageIndex,
                       Model model){
        List<DataDictionary> forms=dataDictionaryService.getAppFlatForm();
        List<DataDictionary> statusList=dataDictionaryService.getAppStatus();
        List<AppCategory> queryCategoryLevel1=appCategoryService.getCategoryByparentId(parendId);   //1级菜单
        int count=appInfoService.getCount(appInfo.getSoftwareName(),appInfo.getStatus(),appInfo.getFlatformId(),appInfo.getCategoryLevel1(),appInfo.getCategoryLevel2(),appInfo.getCategoryLevel3());
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

        appInfoLIst=appInfoService.getInfoByName(appInfo.getSoftwareName(),appInfo.getStatus(),appInfo.getFlatformId(),appInfo.getCategoryLevel1(),appInfo.getCategoryLevel2(),appInfo.getCategoryLevel3(),pageNo,page.getPageSize());
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
        return "developer/appinfolist";
    }

    @RequestMapping("/categorylevellist.json")
    @ResponseBody
    public Object view(Integer pid){    //查询1-3级菜单
        List<AppCategory> queryCategoryLevel1=appCategoryService.getCategoryByparentId(pid);
        return JSONArray.toJSONString(queryCategoryLevel1);
    }

    @RequestMapping("/add") //新增版本信息
    public String toadd(Model model,Integer id){
        model.addAttribute("appId",id);
        List<AppVersion> VersionList=verSionService.getEditionInfo(id);  //历史版本信息



        model.addAttribute("VersionList",VersionList);
       return "developer/devAddEditionInfo";
    }
    @RequestMapping(value = "/add",method = RequestMethod.POST)  //文件上传APK
    public String add(AppVersion appVersion, HttpServletRequest request, @RequestParam(value = "a_downloadLink",required = false) MultipartFile attach, HttpServletResponse response) throws IOException {
        String idPicPach=null;
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        //判断文件是否为空
        if(!attach.isEmpty())
        {
            String path="E:\\xz";
            String oldFileName=attach.getOriginalFilename();//原文件名
            String prefix= FilenameUtils.getExtension(oldFileName); //原文件后缀
            if(prefix.equalsIgnoreCase("apk")){
                String fileName=System.currentTimeMillis()+ RandomUtils.nextInt(1000000)+".apk";
                File targetFile=new File(path,fileName);
                if(!targetFile.exists()){
                    targetFile.mkdirs();
                }
                //保存
                try{
                    attach.transferTo(targetFile);
                }catch (Exception e){
                    e.printStackTrace();
                }
                idPicPach=path+File.separator+fileName;
                appVersion.setDownloadLink(idPicPach);
                appVersion.setApkFileName(oldFileName);
                if(verSionService.addVersion(appVersion)>0){
                    appInfoService.updateAppInfoVersionId(appVersion.getAppId(),appVersion.getId());
                    return "redirect:/dev/list";
                }
            }else{

                out.print("<script language=\"javascript\">alert('文件格式不正确！');window.location.href='/AppInfoSystem/dev/add'</script>");

            }

        }
        return "redirect:/dev/add";
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


    @RequestMapping("/basics")
    public String toBasics(){   //新增APP基础信息

        return "developer/appbasicsinfo";
    }

    @RequestMapping("datadictionarylist.json")
    @ResponseBody   //查询所属平台
    public Object viewform(){
        List<DataDictionary> forms=dataDictionaryService.getAppFlatForm();
        return JSONArray.toJSONString(forms);
    }

    @RequestMapping("apkexist.json")
    @ResponseBody   //查询软件名是否重复
    public Object viewName(String apkName){
        HashMap<String ,String> resultMap=new HashMap<>();
        int count=appInfoService.getNameByName(apkName);
        if(apkName!=null&& apkName!=""){
            if(count>0){
                resultMap.put("APKName","exist");
            }else {
                resultMap.put("APKName","noexist");
            }
        }else {
            resultMap.put("APKName","empty");
        }


        return JSONArray.toJSONString(resultMap);
    }

    @RequestMapping("/addAppInfo")  //新增APP基础信息上传图片
    public String addAppInfo(AppInfo appInfo,@RequestParam(value = "a_logoPicPath",required = false) MultipartFile attach){
        String idPicPath=null;
        //判断文件是否为空
        if(!attach.isEmpty()){
            String path="E:\\xz\\";
            String oldFileName=attach.getOriginalFilename();    //原文件名
            String prefix=FilenameUtils.getExtension(oldFileName);  //原文件后缀

            if(prefix.equalsIgnoreCase("jpg")||prefix.equalsIgnoreCase("png")||prefix.equalsIgnoreCase("gif")){
                String fileName=System.currentTimeMillis()+RandomUtils.nextInt(1000000)+".jpg";
                File targetFile=new File(path,fileName);
                if(!targetFile.exists()){
                    targetFile.mkdirs();
                }
                //保存
                try{
                    attach.transferTo(targetFile);
                }catch (Exception e){
                    e.printStackTrace();
                }
               /* idPicPath=path+File.separator+fileName;*/
                appInfo.setLogoPicPath(fileName);
                appInfo.setLogoLocPath(path+fileName);
                int sum=appInfoService.addAppInfo(appInfo);
                System.out.println(sum);
                if(sum>0){
                    return "redirect:/dev/list";
                }

            }
        }
            return "/developer/appbasicsinfo";

    }

    @RequestMapping("/appversionmodify")    //修改APP最新版本页面
    public String tomodifversions(Integer vid,Integer aid,Model model){

        List<AppVersion> VersionList=verSionService.getEditionInfo(aid);  //历史版本信息

        model.addAttribute("VersionList",VersionList);
        AppVersion appVersion=VersionList.get(VersionList.size()-1);
        model.addAttribute("appVersion",appVersion);
        model.addAttribute("vid",vid);
        return "/developer/modifyAppversions";
    }


    @RequestMapping(value = "/appversionmodify",method = RequestMethod.POST)    //修改App版本信息
    public String modifversions(HttpSession session,AppVersion appVersion,@RequestParam(value = "attach",required = false) MultipartFile attach){
        String idPicPath=null;
        //判断文件是否为空
        if(!attach.isEmpty()){
            String path="E:\\xz\\";
            String oldFileName=attach.getOriginalFilename();    //原文件名
            String prefix=FilenameUtils.getExtension(oldFileName);  //原文件后缀

            if(prefix.equalsIgnoreCase("apk")) {
                String fileName = System.currentTimeMillis() + RandomUtils.nextInt(1000000) + ".apk";
                File targetFile = new File(path, fileName);
                if (!targetFile.exists()) {
                    targetFile.mkdirs();
                }
                //保存
                try {
                    attach.transferTo(targetFile);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                appVersion.setDownloadLink(path+fileName);
                appVersion.setApkLocPath(path+File.separator+fileName);
                appVersion.setApkFileName(oldFileName);
            }
        }
        DevUser devUser=(DevUser) session.getAttribute("devUser");
       appVersion.setModifyBy(devUser.getId());


        if(verSionService.updateVersion(appVersion)>0){
            return "redirect:/dev/list";
        }
        return "developer/modifyAppversions";
    }


    @RequestMapping("appinfomodify")    //修改app基础版本页面
    public String tomodifybasicsinfo(Integer id,Model model){
        AppInfo appInfo=appInfoService.getAppInfoById(id);
        model.addAttribute("appInfo",appInfo);
        return "/developer/modifyAddbasics";
    }

    @RequestMapping("addappinfomodify")     //修改app基础版本操作
    public String appinfomodify(HttpSession session,AppInfo appInfo,String statuss,@RequestParam(value = "attach",required = false) MultipartFile attach){
        String idPicPath=null;
        if(statuss!=null){
            appInfo.setStatus(1);

        }
        //判断文件是否为空
        if(!attach.isEmpty()){
            String path="E:\\xz\\";
            String oldFileName=attach.getOriginalFilename();    //原文件名
            String prefix=FilenameUtils.getExtension(oldFileName);  //原文件后缀

            if(prefix.equalsIgnoreCase("jpg")||prefix.equalsIgnoreCase("png")||prefix.equalsIgnoreCase("gif")) {
                String fileName = System.currentTimeMillis() + RandomUtils.nextInt(1000000) + ".jpg";
                File targetFile = new File(path, fileName);
                if (!targetFile.exists()) {
                    targetFile.mkdirs();
                }
                //保存
                try {
                    attach.transferTo(targetFile);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                /* idPicPath=path+File.separator+fileName;*/
                appInfo.setLogoPicPath(fileName);
                appInfo.setLogoLocPath(path + fileName);
            }

        }
        DevUser devUser=(DevUser) session.getAttribute("devUser");
        appInfo.setModifyBy(devUser.getId());
        if(appInfoService.updateAppInfomodify(appInfo)>0){
            return "redirect:/dev/list";
        }

        return "developer/modifyAddbasics";

    }




    @RequestMapping("delfile.json")     //删除————修改APP基础信息图片
    @ResponseBody
    public Object modifyFile(Integer id,String flag){
        HashMap<String ,String> resultMap=new HashMap<>();
        if(flag.equals("apk")){
            if(verSionService.updateVersionPath(id)>0){
                resultMap.put("result","success");
            }else{
                resultMap.put("result","failed");
            }

        }else{
            if(appInfoService.updateFilePath(id)>0){
                resultMap.put("result","success");
            }else{
                resultMap.put("result","failed");
            }

        }
        return JSONArray.toJSONString(resultMap);
    }

    @RequestMapping("/appview")     //查看app信息
    public String appview(Integer id,Model model){
        List<AppVersion> VersionList=verSionService.getEditionInfo(id);  //历史版本信息
        AppInfo appInfo=appInfoService.getAppInfoById(id);
        model.addAttribute("appInfo",appInfo);
        model.addAttribute("VersionList",VersionList);
        return "developer/AppviewInfo";
    }

    @RequestMapping("delapp.json")
    @ResponseBody
    public Object delapp(Integer id){
        HashMap<String,String> resultMap=new HashMap<>();
            if(appInfoService.delAppInfo(id)>0){
                verSionService.delVersion(id);
                resultMap.put("delResult","true");
        }else {
            resultMap.put("delResult","false");
        }
        if(id==null){
            resultMap.put("delResult","notexist");
        }
        return JSONArray.toJSONString(resultMap);
    }

    @RequestMapping(value = "{appId}/sale.json")    //上架操作
    @ResponseBody
    public Object sj(@PathVariable Integer appId,HttpSession session){
        DevUser devUser=(DevUser)session.getAttribute("devUser");
        HashMap<String,String> resultMap=new HashMap<>();

        resultMap.put("errorCode","0");
        if(appInfoService.updateAppstatus(appId,devUser.getId())>0){
            resultMap.put("resultMsg","success");
        }
        return JSONArray.toJSONString(resultMap);
    }
    @RequestMapping("error")   //错误页面
    public String error(){
        return "error/index";
    }
}
