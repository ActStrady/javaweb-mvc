package com.act.filter;

import com.act.pojo.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * /* 拦截所有的请求
 */
@WebFilter(filterName = "LoginFilter", value = "/*")
public class LoginFilter implements Filter {

    @Override
    public void destroy() {
    }


    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException,
            IOException {
        // 强转为HttpServletRequest
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        // 设置全局的编码
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // 拦截请求的处理
        String uri = request.getRequestURI();
        User user = (User) request.getSession().getAttribute("user");
        // 拦截除了验证码和登录界面以外的请求
        if (!(uri.contains("/VerifyCodeServlet") || uri.contains("/LoginServlet"))) {
            // 不允许用户直接访问jsp
            if (uri.endsWith(".jsp")) {
                // 用户没有登录就在登录页面显示无权限
                if (user == null) {
                    request.setAttribute("error", "您无权访问该页面");
                    request.getRequestDispatcher("/LoginServlet").forward(request, response);
                    return;
                } else {
                    // TODO 对于已经登录的用户来说就应该跳到一个页面 暂时跳到其主页面
                    request.getRequestDispatcher("main.jsp").forward(request, response);
                    return;
                }
            }
        }
        // 用户session不失效的话就访问登录页面提交到主页面
        if (uri.contains("/LoginServlet") && user != null) {
            request.getRequestDispatcher("jsp/main.jsp").forward(request, response);
            return;
        }
        chain.doFilter(req, resp);
    }

    @Override
    public void init(FilterConfig config) throws ServletException {

    }

}
