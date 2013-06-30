<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Player Matches</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <b>Player's Match Points</b><br/>
    
    <c:if test="${not empty message}">    
      <h3>${message}</h3>
    </c:if>

    <c:if test="${not empty matches}">
        Player: <c:out value="${matches[0].firstName}" />&nbsp;<c:out value="${matches[0].lastName}" />&nbsp;<c:out value="${matches[0].playerBlock}" />
        <br/>
        <table>
        <tr>
            <td><b>Match</b></td> <td><b>Points</b></td>
        </tr>
        <c:forEach items="${matches}" var="match">
            <tr>
                <td>
                <a href="${contextPath}/team/viewMatchEvents?userid=${userid}&teamid=${teamid}&poolplayerid=${match.poolPlayerId}&matchid=${match.matchId}">
                ${match.matchDate}
                </a>
                </td>
                <td align="right">${match.playerPoints}</td>
            </tr>                               
        </c:forEach>
        
        </table>
    </c:if>
    
    <a href="${contextPath}/team/players?userid=${userid}&teamid=${teamid}">Back</a>
    
  </body>
</html>  