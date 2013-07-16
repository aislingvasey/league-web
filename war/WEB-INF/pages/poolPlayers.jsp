<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>League - Pool Players</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style>
        body {color: #ffffff; background-color: #202020; }
        a {color: #FF6600; }
        a:visited {color: #FF6600; }
        a:hover {color: #FF6600; }
        .message { color: #FF0000 ; font-weight: bold; }
        .message2 { color: #FF0000 ; font-size: small; }
        .notification { color: #00FF00; font-weight: bold; }
</style>
</head>

<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<b>Pool Players</b>
	<br />

	<c:if test="${not empty message}">
		<span class="message">${message}</span>
		<br />
	</c:if>

	<table>
		<tr>
			<td><b>Player</b></td>
			<td><b>Points</b></td>
			<td>&nbsp;<b>Price</b></td>
		</tr>

		<c:if test="${not empty results.poolPlayers}">

			<c:forEach items="${results.poolPlayers}" var="poolPlayer">
				<tr>
					<td>
					${poolPlayer.firstName}&nbsp;${poolPlayer.lastName}&nbsp;${poolPlayer.block}					
					</td>
					<td align="right">${poolPlayer.currentScore}</td>
					<td align="right">&nbsp; <fmt:formatNumber value="${poolPlayer.price}" type="currency" currencySymbol="R" pattern="¤ # ##0" />
					</td>
				</tr>
			</c:forEach>
		</c:if>

		<c:if test="${empty message && empty results.poolPlayers}">
			<tr>
				<td>No current pool players to view</td>
			</tr>
		</c:if>

		<tr>
			<td colspan="3">
			     <c:if test="${results.page > 0}">
					<a href="${contextPath}/pool/view?userid=${userid}&teamid=${teamid}&page=${results.page - 1}&pagesize=${results.pageSize}">
						Previous </a>
				</c:if>
				 <c:if test="${results.page == 0}">                    
                    Previous
                </c:if>                
				&nbsp;
				<c:if test="${not results.lessThanAFullPage}"> 
				    <a href="${contextPath}/pool/view?userid=${userid}&teamid=${teamid}&page=${results.page + 1}&pagesize=${results.pageSize}">
					Next </a>
				</c:if>	
				<c:if test="${results.lessThanAFullPage}"> 
                    Next
                </c:if> 
			</td>
		</tr>

	</table>

	<a href="${contextPath}/team/list?userid=${userid}">Back</a>

</body>
</html>
