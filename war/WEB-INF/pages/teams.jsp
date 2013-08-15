<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - Teams</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        body { color: #977038; background: #FFFFFF; }
        .heading { color: #ff6819; font-weight: bold; }
        .list { margin: 0; margin-bottom: 5px; margin-left: 15px;}
        .label { margin-right: 5px; font-weight: bold; }
        .count { font-weight: 100; }
        .message-box { padding-top: 5px; padding-bottom: 5px; }
        .message { color: #FC1108; font-weight: bold; padding: 1px; }
        .notification { color: #FFFFFF; background: #977038; font-weight: bold; padding: 1px; }
        .hint { font-size: smaller; }
    </style>
  </head>

  <body>  

    <mxit:advert auid=""/> 
  
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <div class="logo">
        <img src="<c:url value="/resources/logo.png" />" />
    </div>
    
    <c:if test="${not empty message}">    
      <div class="marginSpacer"><span class="message">${message}</span></div>
    </c:if>
        
    <c:if test="${not empty notification}">    
     <div class="marginSpacer"><span class="notification">${notification}</span></div>
    </c:if>
    
    <c:if test="${(not empty newUser || empty teams) && empty message}">
        <span class="heading">Welcome to the PFL!</span><br/>
        <form action="${contextPath}/team/create" method="get">
            <span class="hint">First things first - You need to create your team.</span>
            <br/>
            Team Name:<input type="text" value="" name="teamname"></input>
            <input type="hidden" value="${userid}" name="userid" />
            <input type="submit" value="Go"></input>
        </form>   
    </c:if>
    
    <c:if test="${not empty teams}">
    
        <c:forEach items="${teams}" var="team">
            <span class="heading">${team.teamName}</span>            
            <br/>
            <c:if test="${team.teamStatus == 'INCOMPLETE'}">
                <span class="hint">To complete your team, use the <a class="message2" href="${contextPath}/team/players?userid=${userid}&teamid=${team.teamId}">View your Players</a> page.</span>
                <br/>
            </c:if>   
                  
            League: <a href="${contextPath}/league/view?leagueid=${team.leagueId}&userid=${userid}">${team.leagueName}</a>
            <c:if test="${team.teamStatus != 'INCOMPLETE'}">
                Position: ${team.positionInLeague} / ${team.leagueCount}
            </c:if>                        
            <br/>         
            Current Score: ${team.currentScore}
            <br/>            
            Available Money: <fmt:formatNumber value="${team.availableMoney}" type="currency" currencySymbol="R" pattern="¤ #,##0"/>          
            
            <p class="navigation">
	          <a href="${contextPath}/team/players?userid=${userid}&teamid=${team.teamId}">View your Players</a> 
	           | 
	          <a href="${contextPath}/team/teamHistory?userid=${userid}&teamid=${team.teamId}">Team History</a>
	           | 
	          <a href="${contextPath}/pool/view?userid=${userid}&teamid=${team.teamId}">Pool Players</a>
	           | 
	          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
	          |
	          <a href="${contextPath}/terms.jsp?userid=${userid}">T&amp;C</a>
            </p>
            
        </c:forEach>
    </c:if>

  </body>

</html>