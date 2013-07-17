<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - User Team History</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/main.css" />" />
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <span class="heading">User Team History</span><br/>
    
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>

    <c:if test="${not empty scores}">
        Team: 
        <c:out value="${scores[0].teamName}" />&nbsp;Current Score:<c:out value="${scores[0].teamCurrentScore}" /> 
        <br/>
        <table>
        <tr>
            <td><b>Match</b></td> <td><b>Teams<b></td> <td><b>Points</b></td>
        </tr>
        <c:forEach items="${scores}" var="score">
            <tr>
                <td>
                    <a href="${contextPath}/team/teamHistoryPlayersPoints?userid=${userid}&teamid=${teamid}&matchid=${score.matchId}">                
                    ${score.matchDate}
                    </a>
                </td>
                <td class="hint">
                    ${score.teamOneName} v ${score.teamTwoName}    
                </td>
                <td align="right">
                    ${score.matchPoints}
                </td>
            </tr>                               
        </c:forEach>
        
        </table>
    </c:if>
    
    <c:if test="${empty message && empty scores}">
    <span class="hint">No team history to display yet</span><br/>
    </c:if>
    
    <p class="navigation">
    <a href="${contextPath}/team/list?userid=${userid}">Back</a>  
          &nbsp;|&nbsp;
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
      </p>
        
  </body>
</html>  