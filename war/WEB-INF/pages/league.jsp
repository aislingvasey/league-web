<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - User League</title>
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
	  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	  
	  <div class="logo">
        <img src="<c:url value="/resources/soccer-logo-small.png" />" />
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
               <b>Top <%-- ${league.currentCount} --%> Teams</b><br/>
               <table>
               <tr>
                <td class="hint"> </td>
                <td class="hint"><b>Name</b></td>
                <td class="hint"><b>Owner</b></td>                
                <td class="hint"><b>Points</b></td>
                <td class="hint"><b>Weeks</b></td>
                <td class="hint"><b>Total</b></td>
                <!-- <td class="hint"><b>Position</b></td> -->
               </tr>
               <c:forEach items="${league.leagueTeamSummary}" var="team">
                    <tr>
                    <td><b>${team.positionInLeague}</b><%--  / ${league.teamCount} --%></td>
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
      </p>
  </body>

</html>