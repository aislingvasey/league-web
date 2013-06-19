<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>League</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  </head>

  <body>  
    <h1>Join the League!</h1>
    <p>
    Are you new around here? Please enter your user name to join up with the League!
    </p>
    <c:if test="${not empty message}">    
      <h3>${message}</h3>
    </c:if>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    <form action="${contextPath}/user/register" method="get">
        <input type="text" value="${username}" name="username"></input>
        <input type="submit" value="OK"></input>
    </form> 
  </body>

</html>