package com.africaapps.league.web.server.template;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.WebContext;

public class HomeController implements TemplateController {

  public void process(HttpServletRequest request, 
  										HttpServletResponse response,
  										ServletContext servletContext, 
  										TemplateEngine templateEngine) throws IOException {
      
  	SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy");
    Calendar cal = Calendar.getInstance();
        
    WebContext ctx = new WebContext(request, response, servletContext);
    ctx.setVariable("today", dateFormat.format(cal.getTime()));
        
    templateEngine.process("home", ctx, response.getWriter());      
  }
  
  /*
    ProductService productService = new ProductService();
    List<Product> allProducts = productService.findAll(); 

    WebContext ctx = new WebContext(request, servletContext, request.getLocale());
    ctx.setVariable("prods", allProducts);

    templateEngine.process("product/list", ctx, response.getWriter());
   */

}