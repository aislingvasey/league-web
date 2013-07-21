<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - User Team Players History</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
body { color: #005A31; background: #A8CD1B; }
a { color: #F3FAB6;  }
a:hover { color: #005A31; }
.heading { color: #005A31; font-weight: bold; font-size: large; }
.hint { color: #005A31; font-size: smaller; }
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
  
    <span class="heading">User Team History</span><br/>
  
    <c:if test="${not empty message}">    
      <div class="marginSpacer"><span class="message">${message}</span></div>
    </c:if>
        
    <c:if test="${not empty notification}">    
     <div class="marginSpacer"><span class="notification">${notification}</span></div>
    </c:if>

    <c:if test="${not empty scores}">
        <c:out value="${scores[0].teamName}" />&nbsp;Current Score:<c:out value="${scores[0].teamCurrentScore}" /> 
        <br/>
        Match Score: <b>${scores[0].matchPoints}</b>
        <%-- &nbsp;<span class="hint">Team:&nbsp;${scores[0].teamOneName}</span> --%>
        <br/>        
        
        <%-- <br/> --%>
        <%-- Match: ${scores[0].matchDate}&nbsp; --%>         
        <table>
        <tr>
            <td><b>Player</b></td> 
            <!-- <td><b>Team</b></td> --> 
            <td><b>Points</b></td>
        </tr>
        <c:forEach items="${scores}" var="score">
            <tr>
                <td>
                    <a href="${contextPath}/team/viewMatchEvents?userid=${userid}&teamid=${teamid}&poolplayerid=${score.poolPlayerId}&matchid=${score.matchId}&fromteam=true">
                    ${score.playerFirstName}&nbsp;${score.playerLastName}
                    </a>
                </td>
                <%-- <td class="hint">${score.teamOneName}</td> --%>
                <td align="right">${score.playerPoints}</td>
            </tr>                               
        </c:forEach>
        
        </table>
    </c:if>
    
    <p class="navigation">
          <a href="${contextPath}/team/teamHistory?userid=${userid}&teamid=${teamid}">Back</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
      </p>
    
  </body>
</html>  