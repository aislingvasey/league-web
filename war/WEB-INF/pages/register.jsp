<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>League - Register</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        body {color: #ffffff; background-color: #202020; }
        a {color: #FF6600; }
        a:visited {color: #FF6600; }
        a:hover {color: #FF6600; }
        .message { color: #FF0000 ; font-weight: bold; }
        .message2 { color: #FF0000 ; font-size: small; }
        .notification { color: #00FF00; font-weight: bold; }
    </style>
  </head>

  <body>  
    <b>Join the League!</b><br/>
    Please enter your user name to join up with the League!
    <br/>
    
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>
    
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    <form action="${contextPath}/user/register" method="get">
        <input type="text" value="${username}" name="username"></input>
        <input type="submit" value="OK"></input>
    </form> 
  </body>

</html>