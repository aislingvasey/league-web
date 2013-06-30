<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Player Status</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        .message { color: #FF0000 ; font-weight: bold; }
    </style>
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <b>Player Status</b>
    <br/>
    
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>
    
    <c:if test="${not empty player}">
        Player: ${player.firstName} ${player.lastName}&nbsp;Status:${player.status}
        <br/>
        <c:forEach items="${statuses}" var="s">            
            <a href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${player.poolPlayerId}&status=${s}">
            Change status to ${s}
            </a>
            <br/>
        </c:forEach>
    </c:if>

    <a href="${contextPath}/team/players?userid=${userid}&teamid=${teamid}">Back</a><br/>

  </body>

</html>