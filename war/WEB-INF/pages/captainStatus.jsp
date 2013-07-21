<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>PFL - Select the Captain</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
body { color: #005A31; background: #A8CD1B; }
a { color: #F3FAB6;  }
a:hover { color: #005A31; }
.heading { color: #005A31; font-weight: bold; font-size: large; }
.hint { color: #005A31; font-size: smaller; }
.list { margin: 0; margin-left: 15px;}
.message { background: #FF6423; color: #FFFFFF; font-weight: bold; padding: 2px; }
.marginSpacer { margin-top: 2px; margin-bottom: 2px; }
.notification { background: #005A31; color: #A8CD1B; padding: 2px; font-weight: bold; }
.navigation { }
.button-box { margin-top: 5px; margin-bottom: 7px; }
.button { color: #F3FAB6; background: #005A31; padding: 5px;}
a:hover.button { color: #F3FAB6; background: #327a5a; text-decoration: none; }
.logo { margin-top: 2px; margin-bottom: 2px; }
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
    
     <p class="navigation">
     <a href="${contextPath}/team/players?userid=${userid}&teamid=${teamid}">Back</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/team/list?userid=${userid}">Home</a>
          &nbsp;|&nbsp;
          <a href="${contextPath}/rules.jsp?userid=${userid}">Rules</a>
      </p>
    
  </body>

</html>