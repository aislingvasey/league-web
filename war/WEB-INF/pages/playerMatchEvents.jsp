<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Match Events</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/main.css" />" />
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  
  <span class="heading">Match Events</span><br/>
        
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>
    
    <c:if test="${not empty events}">
        <b><c:out value="${events[0].firstName}" />&nbsp;<c:out value="${events[0].lastName}" /></b>
        (<c:out value="${events[0].playerBlock}" />)
        <br/>    
        Match: <c:out value="${events[0].matchDate}" /> 
        <span class="hint">${events[0].teamOne} v ${events[0].teamTwo}</span>
        <br/>Points: <c:out value="${events[0].matchPoints}" /> 
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