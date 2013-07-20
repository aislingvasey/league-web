<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - User Team Players History</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/main.css" />" />
  </head>

  <body>  
  
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
  
    <span class="heading">User Team History - Players Points</span><br/>
  
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>

    <c:if test="${not empty scores}">
        <b>Team: <c:out value="${scores[0].teamName}" /></b> 
        <br/>
        Current Score:<c:out value="${scores[0].teamCurrentScore}" /><br/>
        Match: ${scores[0].matchDate}&nbsp; Score: ${scores[0].matchPoints}
        <br/>
        <table>
        <tr>
            <td><b>Player</b></td> <td><b>Team</b></td> <td><b>Points</b></td>
        </tr>
        <c:forEach items="${scores}" var="score">
            <tr>
                <td>${score.playerFirstName}&nbsp;${score.playerLastName}</td>
                <td class="hint">${score.teamOneName}</td>
                <td align="right">${score.playerPoints}</td>
            </tr>                               
        </c:forEach>
        
        </table>
    </c:if>
    
    <p class="navigation">
          <a href="${contextPath}/team/teamHistory?userid=${userid}&teamid=${teamid}">Back</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
      </p>
    
  </body>
</html>  