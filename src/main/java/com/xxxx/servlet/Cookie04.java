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
	
@WebServlet("/cookie04")
public class Cookie04 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response)
					throws IOException, ServletException{
	
	}
}
