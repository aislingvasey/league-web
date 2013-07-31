<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - User Team Players History</title>
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
  
  <mxit:advert auid=""/> 
  
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
        <c:out value="${scores[0].teamName}" /> Current Score:<c:out value="${scores[0].teamCurrentScore}" /> 
        <br/>
        Match Score: <b>${scores[0].matchPoints}</b>
        <br/>        
                
        <table>
        <tr>
            <td><b>Player</b></td> 
            <td><b>Points</b></td>
        </tr>
        <c:forEach items="${scores}" var="score">
            <tr>
                <td>
                    <a href="${contextPath}/team/viewMatchEvents?userid=${userid}&teamid=${teamid}&poolplayerid=${score.poolPlayerId}&matchid=${score.matchId}&fromteam=true">
                    ${score.playerFirstName} ${score.playerLastName}
                    </a>
                </td>
                <td align="right">${score.playerPoints}</td>
            </tr>                               
        </c:forEach>
        
        </table>
    </c:if>
    
    <p class="navigation">
          <a href="${contextPath}/team/teamHistory?userid=${userid}&teamid=${teamid}">Back</a>
           | 
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
           | 
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
          |
              <a href="${contextPath}/terms.jsp?userid=${userid}">T&amp;C</a>
      </p>
    
  </body>
</html>  