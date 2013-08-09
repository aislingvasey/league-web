package com.africaapps.league.web.server.helper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

@Component
public class SpringBeanFactory implements ApplicationContextAware {

	private static ApplicationContext context;
	
	private static final Logger LOG = LoggerFactory.getLogger(SpringBeanFactory.class);
	
	public void setApplicationContext(ApplicationContext inContext) 
		throws BeansException {
	  context = inContext;		
		LOG.info("Bean factory was set.");
	}
	
	public static boolean isBeanFactorySet() {
	  if (context == null) {
	    return false;
	  } else {
	    return true;
	  }
	}

  public static Object getBean(String beanId) {
    if (context != null) {
      LOG.debug("Getting bean:"+beanId);    
      return context.getBean(beanId);
    } else {
      LOG.error("Bean factory has not been created yet, unable to get bean:"+beanId, new Exception("Not created bean factory..."));
      return null;
    }
  }
  
  public static Object getFirstBeanOfType(Class<?> clazz) {
    if (context != null) {
      LOG.debug("Getting bean of class:"+clazz);    
      return context.getBeansOfType(clazz).values().iterator().next();
    } else {
      LOG.error("Bean factory has not been created yet, unable to get bean of type:"+clazz, new Exception("Not created bean factory..."));
      return null;
    }
  }
  
  public static synchronized void createApplicationContext(String[] springConfigLocations) {
    if (context == null) {
      LOG.info("Creating a new bean factory...");
      ApplicationContext appContext = new ClassPathXmlApplicationContext(springConfigLocations);
      LOG.info("Loaded Spring context with "+appContext.getBeanDefinitionCount()+" beans");
      context = appContext;
    } else {
      LOG.error("Bean factory exists, not creating a new application context.");
    }
  }
  
  public static ApplicationContext getContext() {
    return context;
  }
  
  public static void closeApplicationContext() {
    if (context != null) {
      if (context instanceof AbstractApplicationContext) {
        AbstractApplicationContext xmlContext = (AbstractApplicationContext) context;
        xmlContext.close();
        LOG.info("Closed the application context");
      } else {
        LOG.info("Unable to close the application context as context is of type: "+context.getClass().getName());
      }
    } else {
      LOG.info("No context to close");
    }
  }
}

