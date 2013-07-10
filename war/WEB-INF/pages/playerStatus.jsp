<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Player</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        .message { color: #FF0000 ; font-weight: bold; }
    </style>
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
        
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>
    
    <c:if test="${not empty player}">
    
    <c:set var="status" value="${player.status}" scope="page" />
    
        <c:if test="${status == 'CAPTAIN'}">
            <b>Captain: ${player.firstName} ${player.lastName}</b><br/>
        </c:if>        
        <c:if test="${status == 'PLAYER'}">
            <b>Player: ${player.firstName} ${player.lastName}</b><br/>
        </c:if>
        <c:if test="${status == 'SUBSTITUTE'}">
            <b>Substitute: ${player.firstName} ${player.lastName}</b><br/>
        </c:if>
        Position:&nbsp;${player.block}<br/>
        Price:&nbsp;<fmt:formatNumber value="${player.price}" type="currency" currencySymbol="R"/><br/>
        <c:forEach items="${statuses}" var="s">            
            <c:if test="${s == 'CAPTAIN'}">
                <a href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${player.poolPlayerId}&status=${s}">
                Make this player the Captain</a><br/>   
            </c:if>
            <c:if test="${s == 'SUBSTITUTE'}">
                <a href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${player.poolPlayerId}&status=${s}">
                Put this player on the bench</a><br/>   
            </c:if>
            <c:if test="${s == 'DROPPED'}">
                <a href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${player.poolPlayerId}&status=${s}">
                Drop this player</a><br/>   
            </c:if>
            <c:if test="${s == 'PLAYER' && status != 'CAPTAIN'}">
                <a href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${player.poolPlayerId}&status=${s}">
                Add them to the starting team</a><br/>   
            </c:if>
            <c:if test="${s == 'PLAYER' && status == 'CAPTAIN'}">
                <a href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${player.poolPlayerId}&status=${s}">
                No longer Captain</a><br/>   
            </c:if>
        </c:forEach>
    </c:if>

    <a href="${contextPath}/team/players?userid=${userid}&teamid=${teamid}">Back</a><br/>

  </body>

</html>