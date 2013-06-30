<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - User Team Players History</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        .message { color: #FF0000 ; font-weight: bold; }
    </style>
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <b>User Team Players History</b><br/>
    
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>

    <c:if test="${not empty scores}">
        Team: 
        <c:out value="${scores[0].teamName}" />&nbsp;Current Score:<c:out value="${scores[0].teamCurrentScore}" /> 
        <br/>
        Match: ${scores[0].matchDate}&nbsp; Score: ${scores[0].matchPoints}
        <br/>
        <table>
        <tr>
            <td><b>Player</b></td> <td><b>Points</b></td>
        </tr>
        <c:forEach items="${scores}" var="score">
            <tr>
                <td>${score.playerFirstName}&nbsp;${score.playerLastName}</td>
                <td align="right">${score.playerPoints}</td>
            </tr>                               
        </c:forEach>
        
        </table>
    </c:if>
    
    <a href="${contextPath}/team/teamHistory?userid=${userid}&teamid=${teamid}">Back</a>    
    
  </body>
</html>  