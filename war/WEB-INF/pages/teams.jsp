<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League -Teams</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <h1>Your Teams</h1>
    <c:if test="${not empty message}">    
      <h3>${message}</h3>
    </c:if>

    <c:if test="${not empty newUser || empty teams}">    
        <form action="create" method="post">
            Create your Team
            <input type="text" value="" name="teamname"></input>
            <input type="hidden" value="${userid}" name="userid" />
            <input type="submit" value="Go"></input>
        </form>   
    </c:if>
    
    
    
    <c:if test="${not empty teams}">
    
        <c:forEach items="${teams}" var="team">
            <b>${team.name}</b><br/>
            League:&nbsp;<a href="league/view?leagueid=${team.userLeague.id}">${team.userLeague.name}</a><br/>
            Current Score: ${team.currentScore}<br/>            
            Available Money: <fmt:formatNumber value="${team.availableMoney}" type="currency" currencySymbol="R"/><br/>
            Format: <a href="/team/changeFormat?userid=${userid}&teamid=${team.id}">${team.currentFormat.name}</a><br/>
            <c:if test="${team.validTeam}">
                Status: Ready to Play!
            </c:if> 
            <c:if test="${not team.validTeam}">
                Status: Not ready yet
            </c:if>
            <br/><a href="/team/players?userid=${userid}&teamid=${team.id}">Your Players</a><br/>            
        </c:forEach>
    </c:if>

  </body>

</html>