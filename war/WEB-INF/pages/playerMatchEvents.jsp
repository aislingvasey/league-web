<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - Match Events</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        body { color: #D3CBBD; background: #1C1919; }
        .heading { color: #FF0000; font-weight: bold; }
        a { color: #70BDC6;  }
        a:hover { color: #A4E9F0; }
        .list { margin: 0; margin-bottom: 5px; margin-left: 15px;}
        .label { margin-right: 5px; font-weight: bold; }
        .count { font-weight: 100; }
        .message-box { padding-top: 5px; padding-bottom: 5px; }
        .message { background: #FF0000; color:#1C1919;  font-weight: bold; padding: 2px; }
        .notification { background: #D3CBBD; color: #1C1919; font-weight: bold; padding: 2px; }
    </style>
  </head>

  <body>  
  
  <mxit:advert auid=""/> 
  
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  
    <div class="logo">
        <img src="<c:url value="/resources/soccer-logo-small.png" />" />
    </div>
  
    <span class="heading">Match Events</span><br/>
        
    <c:if test="${not empty message}">    
      <div class="marginSpacer"><span class="message">${message}</span></div>
    </c:if>
        
    <c:if test="${not empty notification}">    
     <div class="marginSpacer"><span class="notification">${notification}</span></div>
    </c:if>
    
    <c:if test="${not empty events}">
        <b><c:out value="${events[0].firstName}" /> <c:out value="${events[0].lastName}" /></b>
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
    
    <c:if test="${empty fromteam}">
        <a href="${contextPath}/team/viewPlayerMatches?userid=${userid}&teamid=${teamid}&poolplayerid=${poolplayerid}">Back</a>
    </c:if>
    <c:if test="${not empty fromteam}">    
        <a href="${contextPath}/team/teamHistoryPlayersPoints?userid=${userid}&teamid=${teamid}&matchid=${matchid}">Back</a>
    </c:if>
    
  </body>
</html>  