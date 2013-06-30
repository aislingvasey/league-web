<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - User Team History</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        .message { color: #FF0000 ; font-weight: bold; }
    </style>
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <b>User Team History</b><br/>
    
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>

    <c:if test="${not empty scores}">
        Team: 
        <c:out value="${scores[0].teamName}" />&nbsp;Current Score:<c:out value="${scores[0].teamCurrentScore}" /> 
        <br/>
        <table>
        <tr>
            <td><b>Match</b></td> <td><b>Points</b></td>
        </tr>
        <c:forEach items="${scores}" var="score">
            <tr>
                <td>
                <a href="${contextPath}/team/teamHistoryPlayersPoints?userid=${userid}&teamid=${teamid}&matchid=${score.matchId}">                
                ${score.matchDate}
                </a>
                </td>
                <td align="right">${score.matchPoints}</td>
            </tr>                               
        </c:forEach>
        
        </table>
    </c:if>
    
    <a href="${contextPath}/team/list?userid=${userid}">Back</a>    
    
  </body>
</html>  