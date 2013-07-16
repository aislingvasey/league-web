<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>League - Pool Players</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style>
        /* body {color: #ffffff; background-color: #202020; }
        a {color: #FF6600; }
        a:visited {color: #FF6600; }
        a:hover {color: #FF6600; }
        a.message2:active { color: #FF0000 ; }
        a.message2:hover { color: #FF0000 ; }
        a.message2:visited { color: #FF0000 ; }
        .message { color: #FF0000 ; font-weight: bold; }
        .message2 { color: #FF0000 ; }
        .notification { color: #00FF00; font-weight: bold; } */
        body { color: #005A31; background: #A8CD1B; }
        h1 { color:  #F3FAB6; font-family: Verdana, sans-serif; text-transform: uppercase; font-size: 22px;}
        h2 { font-family: Verdana, sans-serif; font-size: 20px; margin: 0;}
        h3 { font-family: Verdana, sans-serif; font-size: 16px; margin: 0;}
        p, li { font-family: Georgia, serif; font-size: 16px; margin: 0;  }
        ol { margin: 0; margin-bottom: 2px;}
        a { text-decoration: none; color: #F3FAB6;  }
        a:hover { text-decoration: underline; color: #005A31; }
        .label { font-family: Verdana, sans-serif; font-weight: bold; margin-right: 5px; }
        .count { font-weight: 100; font-size: 16px; }
                .message { font-family: Verdana, sans-serif; color: #FF6423 ; font-weight: bold; padding: 2px; }
        .button-box { margin-top: 5px; margin-bottom: 7px; }
        .button { color: #F3FAB6; background: #005A31; padding: 5px;}
        a:hover.button { color: #F3FAB6; background: #327a5a; text-decoration: none; }
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
