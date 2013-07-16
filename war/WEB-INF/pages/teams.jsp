<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Teams</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        body {color: #ffffff; background-color: #202020; }
        a {color: #FF6600; }
        a:visited {color: #FF6600; }
        a:hover {color: #FF6600; }
        a.message2:active { color: #FF0000 ; }
        a.message2:hover { color: #FF0000 ; }
        a.message2:visited { color: #FF0000 ; }
        .message { color: #FF0000 ; font-weight: bold; }
        .message2 { color: #FF0000 ; }
        .notification { color: #00FF00; font-weight: bold; }
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
        Congratulations on starting to play fantasy soccer!<br/>
        <form action="${contextPath}/team/create" method="get">
            Create your team
            <br/>
            Name:<input type="text" value="" name="teamname"></input>
            <input type="hidden" value="${userid}" name="userid" />
            <input type="submit" value="Go"></input>
        </form>   
    </c:if>
    
    <c:if test="${not empty teams}">
    
        <c:forEach items="${teams}" var="team">
            <b>${team.teamName}</b>            
            <br/>
            <c:if test="${team.teamStatus == 'INCOMPLETE'}">
                <span class="message2">Use the <a class="message2" href="${contextPath}/team/players?userid=${userid}&teamid=${team.teamId}">View your Players</a> link to complete your team.</span>
                <br/>
            </c:if>   
                  
            <a href="${contextPath}/league/view?leagueid=${team.leagueId}&userid=${userid}">${team.leagueName}</a>
            <c:if test="${team.teamStatus != 'INCOMPLETE'}">
                Position:&nbsp;${team.positionInLeague} / ${team.leagueCount}
            </c:if>                        
            <br/>         
            Current Score: ${team.currentScore}
            <br/>            
            Available Money: <fmt:formatNumber value="${team.availableMoney}" type="currency" currencySymbol="R" pattern="¤ #,##0"/>          
            <br/>
            <a href="${contextPath}/team/players?userid=${userid}&teamid=${team.teamId}">View your Players</a> 
            <br/>
            <a href="${contextPath}/team/teamHistory?userid=${userid}&teamid=${team.teamId}">Team History</a>
            <br/>
            <a href="${contextPath}/pool/view?userid=${userid}&teamid=${team.teamId}">Pool Players</a>
            <br/>
        </c:forEach>
    </c:if>

  </body>

</html>