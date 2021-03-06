<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>League - How to Play</title>
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

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<span class="heading">How to Play</span>
	<br />
	<br />

	<span class="label">Premier Fantasy League (PFL)</span> is a fantasy
	soccer game based on the real performances of the players in the South
	Africa
	<span class="soccer">Premier Soccer League (PSL)</span>. After each
	match in the PSL, the players in the FSL are awarded points based upon
	their performance in the actual match. Each FSL player on your FSL team
	will gain points that contribute to your PFL team's standing.

	<br /><br/> View the different sections linked below to play the FSL to the
	best of your ability!
	<br />
	<br />
	<a href='${contextPath}/rules-basics.jsp?userid=${param["userid"]}'>The
		Basics</a>
	<br />
	<a
		href='${contextPath}/rules-playingweek.jsp?userid=${param["userid"]}'>Playing
		Week</a>
	<br />
	<a
		href='${contextPath}/rules-teamchanges.jsp?userid=${param["userid"]}'>Team
		Changes</a>
	<br />
	<a
        href='${contextPath}/rules-points.jsp?userid=${param["userid"]}'>Points</a>
    <br />
	<p class="navigation">
		<a href='${contextPath}/team/list?userid=${param["userid"]}'>Home</a>
	</p>

</body>

</html>