package controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/login")   //入口
public class LoginController{
    @RequestMapping("/index")
    public String toindex(){
        return "../index";
    }
    @RequestMapping("/backLojin")   //后台登陆入口
    public String tobackeLogin(){
        return "backendlogin";
    }
    @RequestMapping("/devLojin")   //前台登陆入口
    public String todevLogin(){
        return "devlogin";
    }


}
