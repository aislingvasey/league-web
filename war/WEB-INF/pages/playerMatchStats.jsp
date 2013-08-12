<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - Match Events</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        body { color: #977038; background: #FFFFFF; }
        .heading { color: #ff6819; font-weight: bold; }
        .list { margin: 0; margin-bottom: 5px; margin-left: 15px;}
        .label { margin-right: 5px; font-weight: bold; }
        .count { font-weight: 100; }
        .message-box { padding-top: 5px; padding-bottom: 5px; }
        .message { color: #FC1108; font-weight: bold; padding: 1px; }
        .notification { color: #FFFFFF; background: #ff6819; font-weight: bold; padding: 1px; }
        .hint { font-size: smaller; }
    </style>
  </head>

  <body>  
  
  <mxit:advert auid=""/> 
  
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  
    <div class="logo">
        <img src="<c:url value="/resources/logo.png" />" />
    </div>
  
    <span class="heading">Match Statistics</span><br/>
        
    <c:if test="${not empty message}">    
      <div class="marginSpacer"><span class="message">${message}</span></div>
    </c:if>
        
    <c:if test="${not empty notification}">    
     <div class="marginSpacer"><span class="notification">${notification}</span></div>
    </c:if>
    
    <c:if test="${not empty stats}">
        <b><c:out value="${stats[0].firstName}" /> <c:out value="${stats[0].lastName}" /></b>
        (<c:out value="${stats[0].playerBlock}" />)
        <br/>    
        Match: <c:out value="${stats[0].matchDate}" /> 
        
        <br/>${stats[0].teamOne} v ${stats[0].teamTwo}
        
        <br/>Total Points: <b><c:out value="${stats[0].matchPoints}" /></b> 
        <br/>
        <table>
        <tr>
            <td><b>Statistic</b></td> 
            <td><b>Points</b></td> 
            <td>&nbsp;<b>Number</b></td>
            <td>&nbsp;<b>Total Stat</b></td>
        </tr>
        <c:forEach items="${stats}" var="stat">
            <tr>
                <td>${stat.statName}</td>
                <td align="right">${stat.statPoints}</td>
                <td align="right">${stat.statCount}</td>
                <td align="right">${stat.statTotal}</td>
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