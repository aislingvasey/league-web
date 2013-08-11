<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>PFL - Player</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
         body { color: #977038; background: #FFFFFF; }
        .heading { color: #846231; font-weight: bold; }
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

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	<div class="logo">
        <img src="<c:url value="/resources/logo.png" />" />
    </div>

    <c:if test="${not empty message}">    
      <div class="marginSpacer"><span class="message">${message}</span></div>
    </c:if>
        
    <c:if test="${not empty notification}">    
     <div class="marginSpacer"><span class="notification">${notification}</span></div>
    </c:if>
    
	<c:if test="${not empty player}">

		<c:set var="status" value="${player.status}" scope="page" />

		<c:if test="${status == 'Captain'}">
			<span class="heading">Captain: ${player.firstName} ${player.lastName}</span><br/>
		</c:if>
		<c:if test="${status == 'Player'}">
			<span class="heading">Player: ${player.firstName} ${player.lastName}</span><br/>
		</c:if>
		<c:if test="${status == 'Substitute'}">
			<span class="heading">Substitute: ${player.firstName} ${player.lastName}</span><br/>
		</c:if>
        Position: ${player.block}<br />
        Price: <fmt:formatNumber value="${player.price}" type="currency" currencySymbol="R" pattern="¤ #,##0" />
		<br />
		<c:forEach items="${statuses}" var="s">
			<c:if test="${s == 'CAPTAIN'}">
				<a
					href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${player.poolPlayerId}&status=${s}">
					Make this player the Captain</a>
				<br />
			</c:if>
			<c:if test="${s == 'SUBSTITUTE'}">
				<a
					href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${player.poolPlayerId}&status=${s}">
					Put this player on the bench</a>
				<br />
			</c:if>
			<c:if test="${s == 'DROPPED'}">
				<a
					href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${player.poolPlayerId}&status=${s}">
					Drop this player</a>
				<br />
			</c:if>
			<c:if test="${s == 'PLAYER' && status != 'CAPTAIN'}">
				<a
					href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${player.poolPlayerId}&status=${s}">
					Add them to the starting team</a>
				<br />
			</c:if>
			<c:if test="${s == 'PLAYER' && status == 'CAPTAIN'}">
				<a
					href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${player.poolPlayerId}&status=${s}">
					No longer Captain</a>
				<br />
			</c:if>
		</c:forEach>
	</c:if>


<p class="navigation">
    <a href="${contextPath}/team/players?userid=${userid}&teamid=${teamid}">Back</a>
           | 
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
           | 
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
          |
              <a href="${contextPath}/terms.jsp?userid=${userid}">T&amp;C</a>
      </p>	

</body>

</html>