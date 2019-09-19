package interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import pojo.BackendUser;
import pojo.DevUser;
import sun.security.pkcs11.wrapper.Constants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SysInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        BackendUser BackendUser = (BackendUser) session.getAttribute("BackendUser");
        DevUser devUser = (DevUser) session.getAttribute("devUser");
        String a1 = request.getRequestURI();
        String ss = a1.substring(a1.indexOf("/") + 1, a1.lastIndexOf("/"));
        String userName = "BackendUser";
        if (ss.equals("dev")) {
            userName = "devUser";
        }
        if (session.getAttribute(userName) == null) {
            response.sendRedirect("../error.jsp");
            return false;
        }
        return true;
    }
}
