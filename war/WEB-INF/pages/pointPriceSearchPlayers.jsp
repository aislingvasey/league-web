<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>PFL - Players By ${criteria}</title>
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

    <span class="heading">Players by ${criteria} - ${type}</span>
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



	<c:if test="${not empty results.players}">

		<table>
			<tr>
				<td><b>Player</b></td>
				<td><b>Points</b></td>
				<td><b>Current Price</b></td>
			</tr>

			<c:forEach items="${results.players}" var="player">
				<tr>
					<td><a
						href="${contextPath}/team/addPlayer?userid=${userid}&teamid=${teamid}&type=${type}&poolplayerid=${player.poolPlayerId}">
							${player.firstName} ${player.lastName} </a> <c:if
							test="${type == 'Substitute'}">${player.block}</c:if></td>
					<td align="right">${player.currentScore}</td>
					<td align="right"><fmt:formatNumber value="${player.price}"
							type="currency" currencySymbol="R" pattern="¤ # ##0" /></td>
				</tr>
			</c:forEach>


			<tr>
				<td colspan="3">

<%-- 				   <c:if test="${results.page > 0}">
						<a
							href="${contextPath}/team/findPlayerByPointsPrice?userid=${userid}&teamid=${teamid}&type=${type}&criteria=${criteria}&page=${results.page - 1}&pagesize=${results.pageSize}&pagescount=${results.pagesCount}">
							Previous</a>&nbsp;
                    </c:if>  --%>
                                      
                   <c:forEach var="i" begin="1" end="${results.pagesCount}" step="1">
                       <c:if test="${results.page == i - 1}">
                            ${i}
                       </c:if>
                       <c:if test="${results.page != i - 1}">
	                       <a href="${contextPath}/team/findPlayerByPointsPrice?userid=${userid}&teamid=${teamid}&type=${type}&criteria=${criteria}&page=${i-1}&pagesize=${results.pageSize}&pagescount=${results.pagesCount}">
	                       ${i}
	                       </a>&nbsp;      
                       </c:if>
                   </c:forEach>  
                    
<%--                     <c:if test="${not results.lessThanAFullPage}">
                        &nbsp;
                        <a
							href="${contextPath}/team/findPlayerByPointsPrice?userid=${userid}&teamid=${teamid}&type=${type}&criteria=${criteria}&page=${results.page + 1}&pagesize=${results.pageSize}&pagescount=${results.pagesCount}">
							Next</a>
					</c:if> --%>
					</td>
			</tr>

		</table>
	</c:if>
	<c:if test="${empty message && empty results.players}">
            No current players to view            
        </c:if>

	<p class="navigation">
		<a
			href="${contextPath}/team/findPlayer?userid=${userid}&teamid=${teamid}&type=${type}">Back</a>
		| <a href="${contextPath}/team/list?userid=${userid}">Home</a> | <a
			href="${contextPath}/rules.jsp?userid=${userid}">Rules</a> | <a
			href="${contextPath}/terms.jsp?userid=${userid}">T&amp;C</a>
	</p>

</body>
</html>
