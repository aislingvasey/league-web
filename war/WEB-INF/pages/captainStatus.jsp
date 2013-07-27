<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - Select the Captain</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        body { color: #D3CBBD; background: #1C1919; }
        .heading { color: #FF0000; font-weight: bold; }
        a { color: #70BDC6;  }
        a:hover { color: #A4E9F0; }
        .list { margin: 0; margin-bottom: 5px; margin-left: 15px;}
        .label { margin-right: 5px; font-weight: bold; }
        .count { font-weight: 100; }
        .message-box { padding-top: 5px; padding-bottom: 5px; }
        .message { background: #FF0000; color:#1C1919;  font-weight: bold; padding: 2px; }
        .notification { background: #D3CBBD; color: #1C1919; font-weight: bold; padding: 2px; }
    </style>
  </head>

  <body>  
  
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  
    <div class="logo">
        <img src="<c:url value="/resources/soccer-logo-small.png" />" />
    </div>
    
    <span class="heading">Select your Captain</span>
    <br/>
    <span class="hint">Your captain can be changed each week. They earn double their match points per week.</span>
    
    <c:if test="${not empty message}">    
      <div class="marginSpacer"><span class="message">${message}</span></div>
    </c:if>
        
    <c:if test="${not empty notification}">    
     <div class="marginSpacer"><span class="notification">${notification}</span></div>
    </c:if>
        
    <c:if test="${not empty team}"> 
               
        <c:set var="count" value="1" scope="page" />       
                      
        <c:forEach items="${team.defenders}" var="d">
          <br/>${count} 
            <c:if test="${captainId != d.poolPlayerId}">                
                <a href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${d.poolPlayerId}&status=CAPTAIN">
                ${d.firstName} ${d.lastName}
                </a>                
            </c:if>   
            <c:if test="${captainId == d.poolPlayerId}">
                ${d.firstName} ${d.lastName}
            </c:if> 
            <c:set var="count" value="${count + 1}" scope="page"/>                     
        </c:forEach>     
        
        <c:forEach items="${team.midfielders}" var="f">
            <br/>${count} 
            <c:if test="${captainId != f.poolPlayerId}">	            
	            <a href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${f.poolPlayerId}&status=CAPTAIN">
	            ${f.firstName} ${f.lastName}
	            </a>	            
            </c:if>   
            <c:if test="${captainId == f.poolPlayerId}">
                ${f.firstName} ${f.lastName}
            </c:if> 
            <c:set var="count" value="${count + 1}" scope="page"/>          
        </c:forEach>
                
        <c:forEach items="${team.strikers}" var="s">
            <br/>${count} 
            <c:if test="${captainId != s.poolPlayerId}">                
                <a href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${s.poolPlayerId}&status=CAPTAIN">
                ${s.firstName} ${s.lastName}
                </a>                
            </c:if>   
            <c:if test="${captainId == s.poolPlayerId}">
                ${s.firstName} ${s.lastName}
            </c:if> 
            <c:set var="count" value="${count + 1}" scope="page"/>                  
        </c:forEach>        
        
        <c:forEach items="${team.goalKeepers}" var="g">
            <br/>${count} 
            <c:if test="${captainId != g.poolPlayerId}">                
                <a href="${contextPath}/team/setPlayerStatus?userid=${userid}&teamid=${teamid}&poolplayerid=${g.poolPlayerId}&status=CAPTAIN">
                ${g.firstName} ${g.lastName}
                </a>                
            </c:if>   
            <c:if test="${captainId == g.poolPlayerId}">
                ${g.firstName} ${g.lastName}
            </c:if> 
            <c:set var="count" value="${count + 1}" scope="page"/>                      
        </c:forEach>                       
                                        
     </c:if>  
    
     <p class="navigation">
     <a href="${contextPath}/team/players?userid=${userid}&teamid=${teamid}">Back</a>
           | 
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
           | 
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
      </p>
    
  </body>

</html>