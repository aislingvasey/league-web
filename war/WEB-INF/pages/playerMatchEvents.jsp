<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Match Events</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        body {color: #ffffff; background-color: #202020; }
        a {color: #FF6600; }
        a:visited {color: #FF6600; }
        a:hover {color: #FF6600; }
        .message { color: #FF0000 ; font-weight: bold; }
        .message2 { color: #FF0000 ; font-size: small; }
        .notification { color: #00FF00; font-weight: bold; }
    </style>
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
        
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>
    
    <c:if test="${not empty events}">
        <b>Player: <c:out value="${events[0].firstName}" />&nbsp;<c:out value="${events[0].lastName}" /></b><br/>
        Position:&nbsp;<c:out value="${events[0].playerBlock}" />
        <br/>    
        Match: <c:out value="${events[0].matchDate}" /> Points: <c:out value="${events[0].matchPoints}" /> 
        <br/>
        <table>
        <tr>
            <td><b>Match Event</b></td> <td><b>Time</b></td> <td><b>Points</b></td>
        </tr>
        <c:forEach items="${events}" var="event">
            <tr>
                <td>${event.description}</td>
                <td align="right">${event.matchTime}</td>
                <td align="right">${event.eventPoints}</td>
            </tr>                               
        </c:forEach>
        
        </table>
    </c:if>
    
    <a href="${contextPath}/team/viewPlayerMatches?userid=${userid}&teamid=${teamid}&poolplayerid=${poolplayerid}">Back</a>
    
  </body>
</html>  