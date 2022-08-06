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
//cookie time setting
	
@WebServlet("/cookie03")
public class Cookie03 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response)
					throws IOException, ServletException{
		//Expired time, = -1 only alive in memory of browser. When browser closed, cookie will gone
		Cookie cookie01 = new Cookie("uname1","zhangsan");
		cookie01.setMaxAge(-1);
		response.addCookie(cookie01);
		
		//Expired time, < 0 When browser closed, cookie will exist in hard drive
		Cookie cookie02 = new Cookie("uname2","lisi");
		cookie02.setMaxAge(30);//alive 30 seconds
		response.addCookie(cookie02);
		
		//Expired time, = 0 delete cookie
		Cookie cookie03 = new Cookie("uname3","wangwu");
		cookie03.setMaxAge(0);//delete
		response.addCookie(cookie03);
	}
}
