<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Search Teams</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        .message { color: #FF0000 ; font-weight: bold; }
    </style>
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <b>Search Teams</b><br/>
    
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>
    
    <c:if test="${not empty teams}">
        <c:forEach items="${teams}" var="team">
            <a href="${contextPath}/team/teamPlayers?userid=${userid}&teamid=${teamid}&type=${type}&team=${team.teamId}">${team.teamName}</a><br/>
        </c:forEach>
    </c:if>
    <c:if test="${empty message && empty teams}">
        No teams available<br/>
    </c:if>
    <a href="${contextPath}/team/players?userid=${userid}&teamid=${teamid}">Back</a>
  </body>

</html>