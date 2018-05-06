package com.example.vip.web.handler;

import com.example.common.ThisSystemException;
import com.example.vip.entity.UserEntity;
import com.example.vip.function.UserFunction;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginHandler {
    @Autowired
    private UserFunction function;

    @RequestMapping("/login.do")
    public String login(String account, String password, HttpServletRequest request) {
        try {
            UserEntity userEntity = function.login(account, password);
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("currentUser", userEntity);
        } catch (Exception e) {
            request.setAttribute("message", e.getMessage());
            return "forward:/login.jsp";
        }
        return "redirect:/index.do";
    }

    @RequestMapping("/index.do")
    public String index() {
        return "index";
    }

    @RequestMapping("/welcome.do")
    public String welcome() {
        return "welcome";
    }

    @RequestMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login.jsp";
    }

    @RequestMapping(value = "/updatePassword.do", method = RequestMethod.GET)
    public String updatePasswordView() {
        return null;
    }

    @RequestMapping(value = "/updatePassword.do", method = RequestMethod.POST)
    public String updatePassword(String oldPassword, String newPassword, String newPasswordConfirm, HttpServletRequest request) throws Exception {
        HttpSession httpSession = request.getSession();
        UserEntity user = (UserEntity) httpSession.getAttribute("currentUser");
        try {
            function.updatePassword(user.getId(), oldPassword, newPassword, newPasswordConfirm);
        } catch (ThisSystemException e) {
            request.setAttribute("message", e.getMessage());
            e.printStackTrace();
            return "updatePassword";
        }
        httpSession.setAttribute("message", "修改成功，请重新登陆！");
        return "redirect:/login.jsp";
    }


}
