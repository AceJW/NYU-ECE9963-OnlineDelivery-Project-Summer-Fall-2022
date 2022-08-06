package com.xxxx.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpServlet;
/**
 * 
 * @param requset
 * @param response
 * @throws IOException
 * @throws ServletException
 */
//cookie get cookie array
	
@WebServlet("/cookie02")
public class Cookie02 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response)
					throws IOException, ServletException{
		// get cookie array
		Cookie[] cookies = request.getCookies();
		if(cookies !=null && cookies.length > 0) {
			for(Cookie cookie: cookies) {
				String name = cookie.getName();
				String value = cookie.getValue();
				System.out.println("Cookie name:"+name+", value:"+value);
			}
		}
	}
}
