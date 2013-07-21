<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - User League</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
body { color: #005A31; background: #A8CD1B; }
a { color: #F3FAB6;  }
a:hover { color: #005A31; }
.heading { color: #005A31; font-weight: bold; font-size: large; }
.hint { color: #005A31; font-size: smaller; }
td.hint { padding: 2px;}
.list { margin: 0; margin-left: 15px;}
.message { background: #FF6423; color: #FFFFFF; font-weight: bold; padding: 2px; }
.marginSpacer { margin-top: 2px; margin-bottom: 2px; }
.notification { background: #005A31; color: #A8CD1B; padding: 2px; font-weight: bold; }
.navigation { }
.button-box { margin-top: 5px; margin-bottom: 7px; }
.button { color: #F3FAB6; background: #005A31; padding: 5px;}
a:hover.button { color: #F3FAB6; background: #327a5a; text-decoration: none; }
.logo { margin-top: 2px; margin-bottom: 2px; }
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
	       <%-- Competing Teams:&nbsp;${count}
	       <br/> --%>
	        
	       <c:if test="${not empty league.leagueTeamSummary}">
               <b>Top <%-- ${league.currentCount} --%> Teams</b><br/>
               <table>
               <tr>
                <td class="hint">&nbsp;</td>
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
                    <td>${team.username}</td>                    
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
          &nbsp;|&nbsp;
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
      </p>
  </body>

</html>