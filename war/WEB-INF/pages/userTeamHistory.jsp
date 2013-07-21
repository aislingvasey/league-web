<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - User Team History</title>
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
        <table>
        <tr>
            <td><b>Match</b></td> <td><b>Teams<b></td> <td><b>Points</b></td>
        </tr>
        <c:forEach items="${scores}" var="score">
            <tr>
                <td>
                    <a href="${contextPath}/team/teamHistoryPlayersPoints?userid=${userid}&teamid=${teamid}&matchid=${score.matchId}">                
                    ${score.matchDate}
                    </a>
                </td>
                <td class="hint">
                    ${score.teamOneName} v ${score.teamTwoName}    
                </td>
                <td align="right">
                    ${score.matchPoints}
                </td>
            </tr>                               
        </c:forEach>
        
        </table>
    </c:if>
    
    <c:if test="${empty message && empty scores}">
    <span class="hint">No team history to display yet</span><br/>
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