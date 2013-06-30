<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - User League</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        .message { color: #FF0000 ; font-weight: bold; }
    </style>
  </head>

  <body>  
	  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	    
	  <c:if test="${not empty league}">
	      <b>League: ${league.leagueName}</b><br/>
	  </c:if>
	  <c:if test="${empty league}">
	      <b>League</b><br/>
	  </c:if>    
	  <c:if test="${not empty message}">    
        <span class="message">${message}</span><br/>
      </c:if>
    
	  <c:if test="${not empty league}">  
	       <c:set var="count" value="${league.teamCount}"/>  
	       Overall Number of Teams:&nbsp;${count}
	       <br/>
	       <c:if test="${not empty league.userTeamSummary}">
	           <b>Your Teams:</b><br/>
	           <c:forEach items="${league.userTeamSummary}" var="userTeam">
		            ${userTeam.teamName}&nbsp;
		            Current Score:&nbsp;${userTeam.currentScore}&nbsp;
		            Position:&nbsp;${userTeam.positionInLeague} out of ${count}<br/>		                        
                </c:forEach>
	       </c:if> 
	       <c:if test="${not empty league.leagueTeamSummary}">
               <b>Top ${league.currentCount} Teams in the League:</b><br/>
               <c:forEach items="${league.leagueTeamSummary}" var="team">
                    ${team.teamName}&nbsp;
                    Current Score:&nbsp;${team.currentScore}&nbsp;
                    Position:&nbsp;${team.positionInLeague} out of ${league.teamCount}
                    &nbsp;${team.username}<br/>                               
                </c:forEach>
           </c:if>                 
	  </c:if>
	  <a href="${contextPath}/team/list?userid=${userid}">Back</a>
  </body>

</html>