<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - User League</title>
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
	    	    
	  <c:if test="${not empty league}">
	      <span class="heading">${league.leagueName}</span><br/>
	  </c:if>
	  <c:if test="${empty league}">
	      <span class="message">No League specified</span><br/>
	  </c:if>    
	  
    <c:if test="${not empty message}">    
      <div class="marginSpacer"><span class="message">${message}</span></div>
    </c:if>
        
    <c:if test="${not empty notification}">    
     <div class="marginSpacer"><span class="notification">${notification}</span></div>
    </c:if>
    
	  <c:if test="${not empty league}">  
	       <c:set var="count" value="${league.teamCount}"/>  
	       <%-- Competing Teams: ${count}
	       <br/> --%>
	        
	       <c:if test="${not empty league.leagueTeamSummary}">
               <table>
               <tr>
                <td class="hint"> </td>
                <td class="hint">Name</td>
                <td class="hint">Owner</td>                
                <td class="hint">Points</td>
                <td class="hint">Weeks</td>
                <td class="hint">Total</td>
                <!-- <td class="hint"><b>Position</b></td> -->
               </tr>
               <c:forEach items="${league.leagueTeamSummary}" var="team">
                    <tr>
                    <td>${team.positionInLeague}<%--  / ${league.teamCount} --%></td>
                    <td><b>${team.teamName}</b></td>
                    <td>
                    <c:if test="${not empty team.firstName}">
                        ${team.firstName}
                    </c:if>
                    <c:if test="${empty team.firstName}">
                        ${team.username}
                    </c:if>
                    </td>                    
                    <td align="right">${team.currentScore}</td>
                    <td align="right">${team.numberOfWeeks}</td>
                    <td align="right">${team.currentRank}</td>                                                            
                    </tr>                               
                </c:forEach>
                </table>
           </c:if>                 
	  </c:if>
	  
	  <p class="navigation">
          <a href="${contextPath}/team/list?userid=${userid}">Back</a>
           | 
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
           | 
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
          |
              <a href="${contextPath}/terms.jsp?userid=${userid}">T&amp;C</a>
      </p>
  </body>

</html>