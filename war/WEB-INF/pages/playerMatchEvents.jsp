<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Match Events</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <b>Player's Match Events</b><br/>
    
    <c:if test="${not empty message}">    
      <h3>${message}</h3>
    </c:if>

    <c:if test="${not empty events}">
        Player: 
        <c:out value="${events[0].firstName}" />&nbsp;<c:out value="${events[0].lastName}" />&nbsp;<c:out value="${events[0].playerBlock}" />
        <br/> Match: <c:out value="${events[0].matchDate}" />
        <br/>
        <table>
        <tr>
            <td><b>Event</b></td> <td><b>Time</b></td> <td><b>Points</b></td>
        </tr>
        <c:forEach items="${events}" var="event">
            <tr>
                <td>${event.description}</td>
                <td align="right">${event.matchTime}</td>
                <td align="right">${event.points}</td>
            </tr>                               
        </c:forEach>
        
        </table>
    </c:if>
    
    <a href="${contextPath}/team/viewPlayerMatches?userid=${userid}&teamid=${teamid}&poolplayerid=${poolplayerid}">Back</a>
    
  </body>
</html>  