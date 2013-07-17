<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>League - Player</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/main.css" />" />
</head>

<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<c:if test="${not empty message}">
		<span class="message">${message}</span>
		<br />
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
        Position:&nbsp;${player.block}<br />
        Price:&nbsp;<fmt:formatNumber value="${player.price}" type="currency" currencySymbol="R" pattern="¤ #,##0" />
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
          &nbsp;|&nbsp;
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
      </p>	

</body>

</html>