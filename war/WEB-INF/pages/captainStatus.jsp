<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Select the Captain</title>
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
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <b>Select your Captain</b>
    <br/>
    Your captain can be changed between each match. They earn double points per week when they're captain.
    
    <c:if test="${not empty message}">    
      <br/><span class="message">${message}</span>
    </c:if>
    
    <c:if test="${not empty team}"> 
               
        <c:set var="count" value="1" scope="page" />       
                      
        <c:forEach items="${team.defenders}" var="d">
          <br/>${count}&nbsp;
            <c:if test="${captainId != d.poolPlayerId}">                
                <a href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${d.poolPlayerId}&status=CAPTAIN">
                ${d.firstName}&nbsp;${d.lastName}
                </a>                
            </c:if>   
            <c:if test="${captainId == d.poolPlayerId}">
                ${d.firstName}&nbsp;${d.lastName}
            </c:if> 
            <c:set var="count" value="${count + 1}" scope="page"/>                     
        </c:forEach>     
        
        <c:forEach items="${team.midfielders}" var="f">
            <br/>${count}&nbsp;
            <c:if test="${captainId != f.poolPlayerId}">	            
	            <a href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${f.poolPlayerId}&status=CAPTAIN">
	            ${f.firstName}&nbsp;${f.lastName}
	            </a>	            
            </c:if>   
            <c:if test="${captainId == f.poolPlayerId}">
                ${f.firstName}&nbsp;${f.lastName}
            </c:if> 
            <c:set var="count" value="${count + 1}" scope="page"/>          
        </c:forEach>
                
        <c:forEach items="${team.strikers}" var="s">
            <br/>${count}&nbsp;
            <c:if test="${captainId != s.poolPlayerId}">                
                <a href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${s.poolPlayerId}&status=CAPTAIN">
                ${s.firstName}&nbsp;${s.lastName}
                </a>                
            </c:if>   
            <c:if test="${captainId == s.poolPlayerId}">
                ${s.firstName}&nbsp;${s.lastName}
            </c:if> 
            <c:set var="count" value="${count + 1}" scope="page"/>                  
        </c:forEach>        
        
        <c:forEach items="${team.goalKeepers}" var="g">
            <br/>${count}&nbsp;
            <c:if test="${captainId != g.poolPlayerId}">                
                <a href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${g.poolPlayerId}&status=CAPTAIN">
                ${g.firstName}&nbsp;${g.lastName}
                </a>                
            </c:if>   
            <c:if test="${captainId == g.poolPlayerId}">
                ${g.firstName}&nbsp;${g.lastName}
            </c:if> 
            <c:set var="count" value="${count + 1}" scope="page"/>                      
        </c:forEach>                       
                                        
     </c:if>  
    
     <br/>
     <a href="${contextPath}/team/players?userid=${userid}&teamid=${teamid}">Back</a>
    
  </body>

</html>