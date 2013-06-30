<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>League</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        .message { color: #FF0000 ; font-weight: bold; }
    </style>
  </head>

  <body>  
    <h1>Welcome to the League!</h1>
    
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>
    
    <!-- Temporary to get to team's page -->
    This is temporary as the MXIT username should be picked up from a header...<br/>
    Enter your username:
    <form action="team/list" method="get">
        <input type="text" value="${username}" name="username"></input>
        <input type="submit" value="Go"></input>
    </form> 
  </body>

</html>