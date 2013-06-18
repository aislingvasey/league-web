<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Team Players</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  </head>

  <body>  
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <b>Your Players</b><br/>
    
    <c:if test="${not empty message}">    
      <h3>${message}</h3>
    </c:if>
    
    <c:if test="${not empty team}"> 
       
        Team Name:&nbsp;${team.teamName}<br/>
        Team Format:&nbsp;<a href="${contextPath}/team/changeFormat?userid=${team.userId}&teamid=${team.teamId}">${team.teamFormat.name}</a><br/>
        Squad Count:&nbsp;${team.playersCount} out of 15 players assigned        
        <br/>Defenders:    
        <c:forEach items="${team.defenders}" var="d">
            <br/>
            Player:&nbsp;${d.firstName}&nbsp;${d.lastName}<br/>
            Status:&nbsp;${d.status}&nbsp;
            Type:&nbsp;${d.blockType}<br/>
            Price:&nbsp;${d.price}&nbsp;
            Current Score:&nbsp;${g.currentScore}<br/>                          
        </c:forEach>
        <c:if test="${team.requiresDefenders}">
            <br/><a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=defender">Add Defender</a> 
        </c:if>        
        
        <br/>Mid Fielders:    
        <c:forEach items="${team.defenders}" var="f">
            <br/>
            Player:&nbsp;${f.firstName}&nbsp;${f.lastName}<br/>
            Status:&nbsp;${f.status}&nbsp;
            Type:&nbsp;${f.blockType}<br/>
            Price:&nbsp;${f.price}&nbsp;
            Current Score:&nbsp;${f.currentScore}<br/>                          
        </c:forEach>
        <c:if test="${team.requiresMidFielders}">
            <br/><a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=midfielder">Add Mid Fielder</a> 
        </c:if>  
        
        <br/>Strikers:  
        <c:forEach items="${team.defenders}" var="s">
            <br/>
            Player:&nbsp;${s.firstName}&nbsp;${s.lastName}<br/>
            Status:&nbsp;${s.status}&nbsp;
            Type:&nbsp;${s.blockType}<br/>
            Price:&nbsp;${s.price}&nbsp;
            Current Score:&nbsp;${s.currentScore}<br/>                          
        </c:forEach>
        <c:if test="${team.requiresDefenders}">
            <br/><a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=striker">Add Striker</a> 
        </c:if>  
        
        <br/>Goal Keepers:<br/>    
        <c:forEach items="${team.goalKeepers}" var="g">
            Player:&nbsp;${g.firstName}&nbsp;${g.lastName}<br/>
            Status:&nbsp;${g.status}&nbsp;
            Type:&nbsp;${g.blockType}<br/>
            Price:&nbsp;${g.price}&nbsp;
            Current Score:&nbsp;${g.currentScore}<br/>	                        
        </c:forEach>
        <c:if test="${team.requiresGoalKeepers}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=goalkeeper">Add Goal Keeper</a> 
        </c:if>  
        
        <br/>
        <c:if test="${team.requiresSubstitutes}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=substitute">Add Substitute</a> 
        </c:if> 
               
        <br/>
        <a href="${contextPath}/team/list?userid=${team.userId}">Back</a>
    </c:if>
    
  </body>

</html>