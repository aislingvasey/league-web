<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>League - Points</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style>
body {
	color: #977038;
	background: #FFFFFF;
}

.heading {
	color: #ff6819;
	font-weight: bold;
}

.list {
	margin: 0;
	margin-bottom: 5px;
	margin-left: 15px;
}

.label {
	margin-right: 5px;
	font-weight: bold;
}

.count {
	font-weight: 100;
}

.message-box {
	padding-top: 5px;
	padding-bottom: 5px;
}

.message {
	color: #FC1108;
	font-weight: bold;
	padding: 1px;
}

.notification {
	color: #FFFFFF;
	background: #977038;
	font-weight: bold;
	padding: 1px;
}

.hint {
	font-size: smaller;
}
</style>
</head>

<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />

	<span class="heading">Points</span>
	<br />
	<br /> Players are awared points using the following statistics for the
	different positions.
	<br />
	<br />

	<span class="heading">Balls</span>
	<table>
		<tr>
			<td></td>
			<td>Keeper</td>
			<td>Defenders</td>
			<td>Midfield</td>
			<td>Strikers</td>
		</tr>
		 
		<tr>
			<td>Balls Played</td>
			<td>0.5</td>
			<td>0.5</td>
			<td>0.5</td>
			<td>0.5</td>
		</tr>
		<tr>
			<td>Balls Earned</td>
			<td>1.0</td>
			<td>3.0</td>
			<td>1.0</td>
			<td>2.0</td>
		</tr>
		<tr>
			<td>Balls Lost</td>
			<td>-1.5</td>
			<td>-2.0</td>
			<td>-3.0</td>
			<td>-1.0</td>
		</tr>
		<tr>
			<td>Passes</td>
			<td>4.0</td>
			<td>1.0</td>
			<td>0.5</td>
			<td>1.5</td>
		</tr>
		<tr>
			<td>Assists</td>
			<td>70.0</td>
			<td>40.0</td>
			<td>40.0</td>
			<td>50.0</td>
		</tr>
		<tr>
			<td>Tackles Won</td>
			<td>10.0</td>
			<td>20.0</td>
			<td>10.0</td>
			<td>5.0</td>
		</tr>
	</table>
<br/>

	<span class="heading">Falses</span>
	<table>
		<tr>
			<td></td>
			<td>Keeper</td>
			<td>Defenders</td>
			<td>Midfield</td>
			<td>Strikers</td>
		</tr>
		 
		<tr>
			<td>Foul Conceded</td>
			<td>-4.0</td>
			<td>-3.5</td>
			<td>-4.0</td>
			<td>-3.0</td>
		</tr>
		<tr>
            <td>Foul received</td>
            <td>5.0</td>
            <td>1.5</td>
            <td>1.5</td>
            <td>3.0</td>
        </tr>
        <tr>
            <td>Offside</td>
            <td>-2.0</td>
            <td>-10.5</td>
            <td>-10.0</td>
            <td>-10.0</td>
        </tr>
        <tr>
            <td>Yellow Card</td>
            <td>-30.0</td>
            <td>-30.0</td>
            <td>-30.0</td>
            <td>-30.0</td>
        </tr>
        <tr>
            <td>Red Card</td>
            <td>-60.0</td>
            <td>-50.0</td>
            <td>-50.0</td>
            <td>-50.0</td>
        </tr>
	</table>
<br/>
<span class="heading">Kick</span>
    <br />
    <table>
        <tr>
            <td></td>
            <td>Keeper</td>
            <td>Defenders</td>
            <td>Midfield</td>
            <td>Strikers</td>
        </tr>
         
        <tr>
            <td>Centres</td>
            <td>10.0</td>
            <td>5.0</td>
            <td>5.0</td>
            <td>10.0</td>
        </tr>
        <tr>
            <td>Corners</td>
            <td>3.00</td>
            <td>2.0</td>
            <td>5.0</td>
            <td>5.0</td>
        </tr>
        <tr>
            <td>Direct Free Kick</td>
            <td>20.0</td>
            <td>20.0</td>
            <td>20.0</td>
            <td>20.0</td>
        </tr>
        <tr>
            <td>Obtained Penalty</td>
            <td>30.0</td>
            <td>30.0</td>
            <td>30.0</td>
            <td>30.0</td>
        </tr>
        <tr>
            <td>Indirect Free Kick</td>
            <td>10.0</td>
            <td>10.0</td>
            <td>10.0</td>
            <td>10.0</td>
        </tr>
        </table>
<br/>
<span class="heading">Goal/Shoot</span>
    <table>
        <tr>
            <td></td>
            <td>Keeper</td>
            <td>Defenders</td>
            <td>Midfield</td>
            <td>Strikers</td>
        </tr>
         
        <tr>
            <td>Goal</td>
            <td>100.0</td>
            <td>40.0</td>
            <td>50.0</td>
            <td>70.0</td>
        </tr>
        <tr>
            <td>Penalty Goal</td>
            <td>50.0</td>
            <td>20.0</td>
            <td>20.0</td>
            <td>20.0</td>
        </tr>
        <tr>
            <td>Own Goal</td>
            <td>-20.0</td>
            <td>-20.0</td>
            <td>-20.0</td>
            <td>-20.0</td>
        </tr>
        <tr>
            <td>Shots Off Target</td>
            <td>10.0</td>
            <td>20.0</td>
            <td>20.0</td>
            <td>25.0</td>
        </tr>
        <tr>
            <td>Shots On Target</td>
            <td>30.0</td>
            <td>20.0</td>
            <td>20.0</td>
            <td>30.0</td>
        </tr>
   </table>     
<br/>
<span class="heading">Keeper</span>
    <table>
        <tr>
            <td></td>
            <td>Keeper</td>
            <td>Defenders</td>
            <td>Midfield</td>
            <td>Strikers</td>
        </tr>
         
        <tr>
            <td>Stop</td>
            <td>30.0</td>
            <td>0.0</td>
            <td>0.0</td>
            <td>0.0</td>
        </tr>
        <tr>
            <td>Diversion</td>
            <td>20.0</td>
            <td>0.0</td>
            <td>0.0</td>
            <td>0.0</td>
        </tr>
        <tr>
            <td>Goal</td>
            <td>-35.0</td>
            <td>0.0</td>
            <td>0.0</td>
            <td>0.0</td>
        </tr>
  </table>      
<br/>
<span class="heading">Bonus Points</span>
    <table>
        <tr>
            <td></td>
            <td>Keeper</td>
            <td>Defenders</td>
            <td>Midfield</td>
            <td>Strikers</td>
        </tr>
         
        <tr>
            <td>Match Win</td>
            <td>20.0</td>
            <td>20.0</td>
            <td>20.0</td>
            <td>20.0</td>
        </tr>
        <tr>
            <td>Match Drawn</td>
            <td>10.0</td>
            <td>10.0</td>
            <td>10.0</td>
            <td>10.0</td>
        </tr>
        <tr>
            <td>Match Lost</td>
            <td>-20.0</td>
            <td>-20.0</td>
            <td>-20.0</td>
            <td>-20.0</td>
        </tr>
   </table>     

	<p class="navigation">
		<a href='${contextPath}/rules.jsp?userid=${param["userid"]}'>Back</a>
		| <a href='${contextPath}/team/list?userid=${param["userid"]}'>Home</a>
	</p>

</body>

</html>