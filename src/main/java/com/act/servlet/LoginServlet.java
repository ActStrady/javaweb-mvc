package com.act.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final String REMEMBER = "remember";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String verCode = request.getParameter("ver_code");
        String remember = request.getParameter("remember");


        // cookie 记住我
        if (REMEMBER.equals(remember)) {
            rememberMe(request, response, username, password);
        }

        // 验证码校验
        String text = (String)request.getSession().getAttribute("text");
        if (!text.equalsIgnoreCase(verCode)){
            request.setAttribute("error", "验证码输入错误");
            request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
            return;
        }
        request.getSession().setAttribute("user", username);
        request.getRequestDispatcher("jsp/main.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
    }

    /**
     * 记住我功能
     * 使用cookie 储存用户账号和密码
     *
     * @param request  request 对象
     * @param response respond 对象
     * @param username 用户名
     * @param password 密码
     */
    private void rememberMe(HttpServletRequest request, HttpServletResponse response, String username,
                            String password) {
        // 创建cookie
        Cookie usernameCookie = new Cookie("username", username);
        Cookie passwordCookie = new Cookie("password", password);
        // 设置路径
        usernameCookie.setPath(request.getContextPath() + "/");
        passwordCookie.setPath(request.getContextPath() + "/");
        // 设置生效时间 秒为单位
        usernameCookie.setMaxAge(7 * 24 * 60 * 60);
        passwordCookie.setMaxAge(7 * 24 * 60 * 60);
        // 添加cookie
        response.addCookie(usernameCookie);
        response.addCookie(passwordCookie);
    }

}
