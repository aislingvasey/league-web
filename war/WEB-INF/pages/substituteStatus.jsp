<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>League - Select a Player</title>
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
  
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
    <b>Select a Player to be Substituted</b><br/>
    Your substitute can only be allocated to the correct player position, for example: striker must substitute another striker.<br/>
    The captain can't be substituted. Make someone else the captain first. 
    <c:if test="${not empty message}">    
      <br/><span class="message">${message}</span>
    </c:if>
    
    <c:if test="${not empty team}"> 
               
        <c:set var="count" value="1" scope="page" />       
                      
        <c:forEach items="${team.defenders}" var="d">
          <br/>${count}&nbsp;
            <c:if test="${captainid != d.poolPlayerId}">                
                <a href="${contextPath}/team/swapPlayers?userid=${userid}&teamid=${teamid}&poolplayerid=${d.poolPlayerId}&substituteid=${substituteid}">
                ${d.firstName}&nbsp;${d.lastName}
                </a>                
            </c:if>   
            <c:if test="${captainid == d.poolPlayerId}">
                ${d.firstName}&nbsp;${d.lastName}&nbsp;(Captain)
            </c:if> 
            <c:set var="count" value="${count + 1}" scope="page"/>                     
        </c:forEach>     
        
        <c:forEach items="${team.midfielders}" var="f">
            <br/>${count}&nbsp;
            <c:if test="${captainid != f.poolPlayerId}">                
                <a href="${contextPath}/team/swapPlayers?userid=${userid}&teamid=${teamid}&poolplayerid=${f.poolPlayerId}&substituteid=${substituteid}">
                ${f.firstName}&nbsp;${f.lastName}
                </a>                
            </c:if>   
            <c:if test="${captainid == f.poolPlayerId}">
                ${f.firstName}&nbsp;${f.lastName}&nbsp;(Captain)
            </c:if> 
            <c:set var="count" value="${count + 1}" scope="page"/>          
        </c:forEach>
                
        <c:forEach items="${team.strikers}" var="s">
            <br/>${count}&nbsp;
            <c:if test="${captainid != s.poolPlayerId}">                
                <a href="${contextPath}/team/swapPlayers?userid=${userid}&teamid=${teamid}&poolplayerid=${s.poolPlayerId}&substituteid=${substituteid}">
                ${s.firstName}&nbsp;${s.lastName}
                </a>                
            </c:if>   
            <c:if test="${captainid == s.poolPlayerId}">
                ${s.firstName}&nbsp;${s.lastName}&nbsp;(Captain)
            </c:if> 
            <c:set var="count" value="${count + 1}" scope="page"/>                  
        </c:forEach>        
        
        <c:forEach items="${team.goalKeepers}" var="g">
            <br/>${count}&nbsp;
            <c:if test="${captainid != g.poolPlayerId}">                
                <a href="${contextPath}/team/swapPlayers?userid=${userid}&teamid=${teamid}&poolplayerid=${g.poolPlayerId}&substituteid=${substituteid}">
                ${g.firstName}&nbsp;${g.lastName}
                </a>                
            </c:if>   
            <c:if test="${captainid == g.poolPlayerId}">
                ${g.firstName}&nbsp;${g.lastName}&nbsp;(Captain)
            </c:if> 
            <c:set var="count" value="${count + 1}" scope="page"/>                      
        </c:forEach>                       
                                        
     </c:if>  
    
     <br/>
     <a href="${contextPath}/team/players?userid=${userid}&teamid=${teamid}">Back</a>
    
  </body>

</html>