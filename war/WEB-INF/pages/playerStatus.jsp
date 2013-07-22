<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>PFL - Player</title>
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

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	<div class="logo">
        <img src="<c:url value="/resources/soccer-logo-small.png" />" />
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
      </p>	

</body>

</html>