package com.example.ecommerce.Filters;

import com.example.ecommerce.Common.Enum.Accessible;
import com.example.ecommerce.Common.LogObj;
import com.example.ecommerce.service.UserService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(urlPatterns = {"/admin/*"})
public class AdFilter implements Filter {
    LogObj log;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
        log = new LogObj();
        log.setName("AdFilter");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        log.info("Running through filter...");

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        HttpSession s = request.getSession(false);

        Accessible a = UserService.getInstance().isAccessible(s);
//        Accessible a = Accessible.ADMINISTRATOR;

        if (a == Accessible.CLIENT || a == Accessible.NOT_LOGGED_IN) {
            log.warn("User does not have access to this resource");
            response.sendRedirect("/404");
            return;
        } else {
            log.info("User logged in and accessible");
//            request.setAttribute("role", a);
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
