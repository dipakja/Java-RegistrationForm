
package com.user;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import org.apache.catalina.User;


public class FilterFile implements Filter{


    @Override
    public void doFilter(ServletRequest sr, ServletResponse sr1, FilterChain fc) throws IOException, ServletException {

// HttpServletRequest  req = (HttpServletRequest)sr;
// 
// HttpSession s = req.getSession();
//
//String user =s.getParamerter("user_name");

//String user = sr.getParameter("dipak");
//
//if((user.equals("dipak")) )
//{
    
    System.out.println("yes dipak is registered in !!");
    
//} else { 
    // chain forwarding
    fc.doFilter(sr,sr1);
    
    System.out.println("Register done!!!");
//        }
    
    
    }


    
    
    
    
    
}
