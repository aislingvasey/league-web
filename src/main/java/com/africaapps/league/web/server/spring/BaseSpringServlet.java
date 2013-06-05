package com.africaapps.league.web.server.spring;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class BaseSpringServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected AutowireCapableBeanFactory beanFactory;
  
  @Override
  public void init(ServletConfig config) throws ServletException {
    super.init(config);
    setAttributes(config);
    setBeanFactory();
  }
  
  //Override this if your servlet has specific attributes that need to be set
  protected void setAttributes(ServletConfig config) {
    
  }
  
  protected void setBeanFactory() {
    //Prevent errors when testing outside the container
    if (getServletContext() != null) {
      WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
      beanFactory = ctx.getAutowireCapableBeanFactory();
    }
  }
  
  protected void writeResponse(HttpServletResponse response, String message) throws IOException {
    response.getOutputStream().write(message.getBytes());
    response.getOutputStream().close();
  }
  
  //For testing, etc
  public void setBeanFactory(AutowireCapableBeanFactory beanFactory) {
    this.beanFactory = beanFactory;
  }
}
