<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Player Matches</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/main.css" />" />
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <span class="heading">Matches Stats</span><br/>
    
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>

    <c:if test="${empty matches}">
    <span class="hint">No player matches available yet</span><br/>
    </c:if>

    <c:if test="${not empty matches}">
        <b><c:out value="${matches[0].firstName}" />&nbsp;<c:out value="${matches[0].lastName}" /></b>
        (<c:out value="${matches[0].playerBlock}" />)
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
    
    <p class="navigation">
          <a href="${contextPath}/team/players?userid=${userid}&teamid=${teamid}">Back</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
      </p>
    
  </body>
</html>  