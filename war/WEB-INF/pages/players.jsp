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
      <b>${message}</b><br/>
    </c:if>
    
    <c:if test="${not empty team}"> 
    
      <c:if test="${team.teamStatus == 'INCOMPLETE'}">  
       
        Team Name:&nbsp;${team.teamName}<br/>
        Team Format:&nbsp;<a href="${contextPath}/team/changeFormat?userid=${team.userId}&teamid=${team.teamId}">${team.teamFormat.name}</a><br/>
        Squad Count:&nbsp;${team.playersCount} out of 15 players assigned<br/> 
        Captain: ${team.captain}       
        <br/>
        <b>Defenders:</b>
        <c:if test="${team.requiresDefenders}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=defender">Add Defender</a> 
        </c:if>              
        <c:forEach items="${team.defenders}" var="d">
        <br/>
            ${d.firstName}&nbsp;${d.lastName}&nbsp;
            Status:&nbsp;
            <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=defender&poolplayerid=${d.poolPlayerId}">
            ${d.status}</a>&nbsp;
            <%-- Price:&nbsp;${d.price}&nbsp;
            Current Score:&nbsp;${g.currentScore}            --%>                       
        </c:forEach>

        <br/>
        <b>Mid Fielders:</b>
        <c:if test="${team.requiresMidFielders}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=midfielder">Add Mid Fielder</a> 
        </c:if>      
        <c:forEach items="${team.midfielders}" var="f">
                <br/>
            ${f.firstName}&nbsp;${f.lastName}&nbsp;
            Status:&nbsp;
            <a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=midfielder&poolplayerid=${f.poolPlayerId}">
            ${f.status}</a>&nbsp;
            <%-- Price:&nbsp;${f.price}&nbsp;
            Current Score:&nbsp;${f.currentScore}       --%>               
        </c:forEach>
        
        
        <br/>
        <b>Strikers:</b>  
        <c:if test="${team.requiresStrikers}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=striker">Add Striker</a> 
        </c:if>  
        <c:forEach items="${team.strikers}" var="s">
            <br/>
            ${s.firstName}&nbsp;${s.lastName}&nbsp;
            Status:&nbsp;<a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=striker&poolplayerid=${s.poolPlayerId}">
            ${s.status}</a>&nbsp;
            <%-- Price:&nbsp;${s.price}&nbsp;
            Current Score:&nbsp;${s.currentScore}     --%>               
        </c:forEach>        
        
        <br/>
        <b>Goal Keepers:</b>
        <c:if test="${team.requiresGoalKeepers}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=goalkeeper">Add Goal Keeper</a> 
        </c:if>   
        <c:forEach items="${team.goalKeepers}" var="g">
            <br/>
            ${g.firstName}&nbsp;${g.lastName}&nbsp;
            Status:&nbsp;<a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=goalkeeper&poolplayerid=${g.poolPlayerId}">
            ${g.status}</a>&nbsp;
            <%-- Price:&nbsp;${g.price}&nbsp;
            Current Score:&nbsp;${g.currentScore}	 --%>                        
        </c:forEach>         
        
        <br/>
        <b>Substitutes:</b>
        <c:if test="${team.requiresSubstitutes}">
            <a href="${contextPath}/team/findPlayer?userid=${team.userId}&teamid=${team.teamId}&type=substitute">Add Substitute</a> 
        </c:if> 
        <c:forEach items="${team.substitutes}" var="s">
            <br/>
            ${s.firstName}&nbsp;${s.lastName}&nbsp;
            Status:&nbsp;<a href="${contextPath}/team/changePlayerStatus?userid=${team.userId}&teamid=${team.teamId}&type=substitute&poolplayerid=${s.poolPlayerId}">
            ${s.status}</a>&nbsp;
            <%-- Price:&nbsp;${s.price}&nbsp;
            Current Score:&nbsp;${s.currentScore}  --%>                          
        </c:forEach>  
               
        <br/>
        <a href="${contextPath}/team/set?userid=${team.userId}&teamid=${team.teamId}">Set Team</a>
        <br/>
        <a href="${contextPath}/team/list?userid=${team.userId}">Back</a>

     </c:if>  
     
             
 <!-- Team is complete/locked -->    
     <c:if test="${team.teamStatus == 'COMPLETE'}">
        Team Name:&nbsp;${team.teamName}<br/>
        Team Format:&nbsp;${team.teamFormat.name}<br/>
        Squad Count:&nbsp;${team.playersCount} out of 15 players assigned<br/> 
        Captain: ${team.captain}       
        <br/>
        <b>Defenders:</b>             
        <c:forEach items="${team.defenders}" var="d">
        <br/>
            <a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${d.poolPlayerId}">
            ${d.firstName}&nbsp;${d.lastName}
            </a>
            Status:&nbsp;${d.status}&nbsp;                                  
        </c:forEach>

        <br/>
        <b>Mid Fielders:</b>     
        <c:forEach items="${team.midfielders}" var="f">
                <br/>
            <a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${f.poolPlayerId}">
            ${f.firstName}&nbsp;${f.lastName}</a>
            Status:&nbsp;${f.status}&nbsp;               
        </c:forEach>
                
        <br/>
        <b>Strikers:</b>   
        <c:forEach items="${team.strikers}" var="s">
            <br/>
            <a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${s.poolPlayerId}">
            ${s.firstName}&nbsp;${s.lastName}</a>
            Status:&nbsp;${s.status}&nbsp;             
        </c:forEach>        
        
        <br/>
        <b>Goal Keepers:</b>  
        <c:forEach items="${team.goalKeepers}" var="g">
            <br/>
            <a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${g.poolPlayerId}">
            ${g.firstName}&nbsp;${g.lastName}</a>
            Status:&nbsp;${g.status}&nbsp;
        </c:forEach>         
        
        <br/>
        <b>Substitutes:</b>
        <c:forEach items="${team.substitutes}" var="s">
            <br/>
            <a href="${contextPath}/team/viewPlayerMatches?userid=${team.userId}&teamid=${team.teamId}&poolplayerid=${s.poolPlayerId}">
            ${s.firstName}&nbsp;${s.lastName}</a>
            Status:&nbsp;${s.status}&nbsp;                          
        </c:forEach>  
               
        <br/>
        <a href="${contextPath}/team/list?userid=${team.userId}">Back</a>        
     </c:if> 
      
    </c:if>
    
  </body>

</html>