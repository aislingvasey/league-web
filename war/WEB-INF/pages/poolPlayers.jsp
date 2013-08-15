<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>PFL - Pool Players</title>
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

	<mxit:advert auid="" />

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<div class="logo">
		<img src="<c:url value="/resources/logo.png" />" />
	</div>

	<span class="heading">Pool Players</span>
	<br />

	<c:if test="${not empty message}">
		<div class="marginSpacer">
			<span class="message">${message}</span>
		</div>
	</c:if>

	<c:if test="${not empty notification}">
		<div class="marginSpacer">
			<span class="notification">${notification}</span>
		</div>
	</c:if>



	<c:if test="${not empty results.poolPlayers}">

		<table>
			<tr>
				<td><b>Player</b></td>
				<td><b>Points</b></td>
				<td><b>Current Price</b></td>
			</tr>

			<c:forEach items="${results.poolPlayers}" var="poolPlayer">
				<tr>
					<td>${poolPlayer.firstName} ${poolPlayer.lastName}
						(${poolPlayer.block})</td>
					<td align="right">${poolPlayer.currentScore}</td>
					<td align="right"><fmt:formatNumber
							value="${poolPlayer.price}" type="currency" currencySymbol="R"
							pattern="¤ # ##0" /></td>
				</tr>
			</c:forEach>


			<tr>
				<td colspan="3">
				    <c:if test="${results.page > 0}">
						<a
							href="${contextPath}/pool/view?userid=${userid}&teamid=${teamid}&page=${results.page - 1}&pagesize=${results.pageSize}">
							Previous</a>&nbsp;
					</c:if> 
					<c:if test="${not results.lessThanAFullPage}">
						&nbsp;
						<a
							href="${contextPath}/pool/view?userid=${userid}&teamid=${teamid}&page=${results.page + 1}&pagesize=${results.pageSize}">
							Next</a>
					</c:if></td>
			</tr>

		</table>
	</c:if>
	<c:if test="${empty message && empty results.poolPlayers}">
            No current pool players to view            
        </c:if>

	<p class="navigation">
		<a href="${contextPath}/team/list?userid=${userid}">Back</a> | <a
			href="${contextPath}/team/list?userid=${userid}">Home</a> | <a
			href="${contextPath}/rules.jsp?userid=${userid}">Rules</a> | <a
			href="${contextPath}/terms.jsp?userid=${userid}">T&amp;C</a>
	</p>

</body>
</html>
