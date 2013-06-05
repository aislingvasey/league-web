package com.africaapps.league.web.server.template;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.thymeleaf.TemplateEngine;

public interface TemplateController {

    public void process(HttpServletRequest request, 
    											HttpServletResponse response,
    											ServletContext servletContext, 
    											TemplateEngine templateEngine) throws IOException;        
}
