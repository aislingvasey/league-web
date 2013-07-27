<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - How to Play</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        body { color: #D3CBBD; background: #1C1919; }
        .heading { color: #FF0000; font-weight: bold; }
        a { color: #70BDC6;  }
        a:hover { color: #A4E9F0; }
        .list { margin: 0; margin-bottom: 5px; margin-left: 15px;}
        .label { margin-right: 5px; font-weight: bold; }
        .count { font-weight: 100; }
        .message-box { padding-top: 5px; padding-bottom: 5px; }
        .message { background: #FF0000; color:#1C1919;  font-weight: bold; padding: 2px; }
        .notification { background: #D3CBBD; color: #1C1919; font-weight: bold; padding: 2px; }
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