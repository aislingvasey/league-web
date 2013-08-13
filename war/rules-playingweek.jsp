<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>League - Playing Weeks</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style>
        body { color: #977038; background: #FFFFFF; }
        .heading { color: #ff6819; font-weight: bold; }
        .list { margin: 0; margin-bottom: 5px; margin-left: 15px;}
        .label { margin-right: 5px; font-weight: bold; }
        .count { font-weight: 100; }
        .message-box { padding-top: 5px; padding-bottom: 5px; }
        .message { color: #FC1108; font-weight: bold; padding: 1px; }
        .notification { color: #FFFFFF; background: #ff6819; font-weight: bold; padding: 1px; }
        .hint { font-size: smaller; }
</style>
</head>

<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<span class="heading">Playing Week</span>
	<br />
	<br /> Each week that the PFL runs is called a Playing Week. A Playing Week typically runs from Saturday to Friday.
	You gain bonus points for taking part in each Playing Week so the sooner you join the PFL, the more points your team will gain.<br/> 
	For each PSL match, if any of your 11 players on your team played, you will get the points for each of your players
	added to your team's current score. Your captain's points will be added twice so choose a good player as your captain! 
	The player's points are calculated after each match and are added to your team's score. <br/> 
	If one or more of your 11 players did not player a match during the Playing Week, one or more up to all of your substitutes
	 will be counted instead. 
	Any substitutes points are only added at the end of each playing week, after all the matches are played and it is clear that
	your team does not have 11 players contributing points this Playing Week.
	<br />

	<p class="navigation">
		<a href='${contextPath}/rules.jsp?userid=${param["userid"]}'>Back</a>
		| <a href='${contextPath}/team/list?userid=${param["userid"]}'>Home</a>
	</p>

</body>

</html>