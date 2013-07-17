<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Teams</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/main.css" />" />
  </head>

  <body>  
  
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <img src="<c:url value="/resources/small_ball.jpeg" />" /><br/>
    
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>
    
    <c:if test="${not empty notification}">    
      <span class="notification">${notification}</span><br/>
    </c:if>

    <c:if test="${(not empty newUser || empty teams) && empty message}">
        <span class="heading">Hello!</span><br/>
        <form action="${contextPath}/team/create" method="get">
            <span class="hint">First things first. You need to create your team.</span>
            <br/>
            Team Name:<input type="text" value="" name="teamname"></input>
            <input type="hidden" value="${userid}" name="userid" />
            <input type="submit" value="Go"></input>
        </form>   
    </c:if>
    
    <c:if test="${not empty teams}">
    
        <c:forEach items="${teams}" var="team">
            <b>${team.teamName}</b>            
            <br/>
            <c:if test="${team.teamStatus == 'INCOMPLETE'}">
                <span class="hint">To complete your team, use the <a class="message2" href="${contextPath}/team/players?userid=${userid}&teamid=${team.teamId}">View your Players</a> page.</span>
                <br/>
            </c:if>   
                  
            League:&nbsp;<a href="${contextPath}/league/view?leagueid=${team.leagueId}&userid=${userid}">${team.leagueName}</a>
            <c:if test="${team.teamStatus != 'INCOMPLETE'}">
                Position:&nbsp;${team.positionInLeague} / ${team.leagueCount}
            </c:if>                        
            <br/>         
            Current Score: ${team.currentScore}
            <br/>            
            Available Money: <fmt:formatNumber value="${team.availableMoney}" type="currency" currencySymbol="R" pattern="¤ #,##0"/>          
            
            <p class="navigation">
          <a href="${contextPath}/team/players?userid=${userid}&teamid=${team.teamId}">View your Players</a> 
          &nbsp;|&nbsp;
          <a href="${contextPath}/team/teamHistory?userid=${userid}&teamid=${team.teamId}">Team History</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/pool/view?userid=${userid}&teamid=${team.teamId}">Pool Players</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
            </p>
            
        </c:forEach>
    </c:if>

  </body>

</html>