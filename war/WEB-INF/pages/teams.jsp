<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Teams</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        .message { color: #FF0000 ; font-weight: bold; }
        .message2 { color: #FF0000 ; }
        .notification { color: green; font-weight: bold; }
    </style>
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <c:if test="${not empty message}">    
      <span class="message">${message}</span><br/>
    </c:if>
    
    <c:if test="${not empty notification}">    
      <span class="notification">${notification}</span><br/>
    </c:if>

    <c:if test="${(not empty newUser || empty teams) && empty message}">
        <form action="create" method="get">
            Create your team. Name:<input type="text" value="" name="teamname"></input>
            <input type="hidden" value="${userid}" name="userid" />
            <input type="submit" value="Go"></input>
        </form>   
    </c:if>
    
    <c:if test="${not empty teams}">
    
        <c:forEach items="${teams}" var="team">
            <b>${team.teamName}</b>                        
            <br/>
            <c:if test="${team.teamStatus == 'INCOMPLETE'}">
                <span class="message2">You team is not ready to play. Use the <a href="${contextPath}/team/players?userid=${userid}&teamid=${team.teamId}">View your Players</a> link to complete your team.</span>
                <br/>
            </c:if>
<%--             <c:if test="${team.teamStatus == 'COMPLETE' && empty notification}">
                <span class="notification">Your team is doing fine!</span>
                <br/>
            </c:if>   --%>          
            League:&nbsp;<a href="${contextPath}/league/view?leagueid=${team.leagueId}&userid=${userid}">${team.leagueName}</a>
            <c:if test="${team.teamStatus != 'INCOMPLETE'}">
                &nbsp;Position: ${team.positionInLeague} / ${team.leagueCount}
            </c:if>                        
            <br/>         
            Current Score: ${team.currentScore}
            <br/>            
            Available Money: <fmt:formatNumber value="${team.availableMoney}" type="currency" currencySymbol="R"/>          
            <br/>
            <a href="${contextPath}/team/players?userid=${userid}&teamid=${team.teamId}">View your Players</a> 
            &nbsp;
            <a href="${contextPath}/team/teamHistory?userid=${userid}&teamid=${team.teamId}">Team History</a>
            &nbsp;
            <a href="${contextPath}/pool/view?userid=${userid}&teamid=${team.teamId}">Pool Players</a>
            <br/>
        </c:forEach>
    </c:if>

  </body>

</html>