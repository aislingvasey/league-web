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
	      <b>${league.leagueName}</b><br/>
	  </c:if>
	  <c:if test="${empty league}">
	      <br/><span class="message">No League specified</span><br/>
	  </c:if>    
	  <c:if test="${not empty message}">    
        <span class="message">${message}</span><br/>
      </c:if>
    
	  <c:if test="${not empty league}">  
	       <c:set var="count" value="${league.teamCount}"/>  
	       Competing Teams:&nbsp;${count}
	       <br/>
	        
	       <c:if test="${not empty league.leagueTeamSummary}">
               <b>Top <%-- ${league.currentCount} --%> Teams in the League:</b><br/>
               <table>
               <tr>
                <td><b>Owner</b></td>
                <td><b>Name</b></td>
                <td><b>Score</b></td>
                <td><b>Position</b></td>
               </tr>
               <c:forEach items="${league.leagueTeamSummary}" var="team">
                    <tr>
                    <td>${team.username}</td>
                    <td>${team.teamName}</td>
                    <td align="right">${team.currentScore}</td>
                    <td align="right">${team.positionInLeague} / ${league.teamCount}</td>                    
                    </tr>                               
                </c:forEach>
                </table>
           </c:if>                 
	  </c:if>
	  <a href="${contextPath}/team/list?userid=${userid}">Back</a>
  </body>

</html>