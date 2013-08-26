<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - User Team Playing Weeks</title>
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
    
    <span class="heading">User Team - FSL Playing Weeks</span><br/>
    

    <c:if test="${not empty message}">    
      <div class="marginSpacer"><span class="message">${message}</span></div>
    </c:if>
        
    <c:if test="${not empty notification}">    
     <div class="marginSpacer"><span class="notification">${notification}</span></div>
    </c:if>


	<c:if test="${not empty playingWeeks}">	
	   <table>
		<c:forEach items="${playingWeeks}" var="week">
			 <tr>
			     <td>
			     <b>Week ${week.key.order}&nbsp;</b>
			     </td>
			     <td><b>Player</b></td>
			     <td><b>Points</b></td>
		      </tr>	 
			
				<c:forEach items="${week.value}" var="player">
					<tr>
						<td>&nbsp;</td>
						<td>
						  <a href="${contextPath}/team/viewMatchStats?userid=${userid}&teamid=${teamid}&poolplayerid=${player.poolPlayerId}&matchid=${player.matchId}&fromplayingweek=true">                    
						  ${player.firstName} ${player.lastName} 
						  </a>
						  (${player.block})
						</td>
						<td>${player.currentScore} <c:if
								test="${player.captainExtraPoints}">(Captain Double Points)</c:if>
						</td>
					</tr>
				</c:forEach>			
		</c:forEach>
		</table>
	</c:if>

	<c:if test="${empty message && empty playingWeeks}">
    <span class="hint">No playing weeks to display yet</span><br/>
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