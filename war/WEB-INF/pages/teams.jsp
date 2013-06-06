<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>League</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  
    <h1>Your teams</h1>
    <c:if test="${not empty message}">    
      <h3>${message}</h3>
    </c:if>

    <c:if test="${not empty newUser}">       
      <a href="${contextPath}/teams/create">Create your team</a>
    </c:if>

  </body>

</html>