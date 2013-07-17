<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - How to Play</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        body { color: #005A31; background: #A8CD1B; }
        a { color: #F3FAB6;  }
        a:hover { color: #005A31; }
        .heading { color: #005A31; font-weight: bold; }
        .list { margin: 0; margin-bottom: 5px; margin-left: 15px;}
        .message { color: #FF6423 ; font-weight: bold; padding: 2px; }
        .navigation { }
        .button-box { margin-top: 5px; margin-bottom: 7px; }
        .button { color: #F3FAB6; background: #005A31; padding: 5px;}
        a:hover.button { color: #F3FAB6; background: #327a5a; text-decoration: none; }
    </style>
  </head>

  <body>  
  
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <span class="heading">How to Play</span><br/>
    
    
    <p class="navigation">          
          <a href='${contextPath}/team/list?userid=${param["userid"]}'>Home</a>
      </p>
    
  </body>

</html>