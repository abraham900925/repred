<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="errorPage.jsp" %>
<jsp:useBean id="ga" scope="session" class="com.wellcom.net.GrantAccess"/>

<%
    if(!ga.AccessGranted(session, "grantAccess")){
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PROSA :: REPRED</title>
<style type="text/css">
<!--
body,td,th {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
}
-->
</style>
<script type="text/javascript">
	function enviarParametro(){
		document.formIndex.submit();
	}
</script>

</head>

<body>
<div align="center">
	<p>
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="640" height="144">
			<param name="movie" value="resources/swf/logoREPRED.swf" />
			<param name="quality" value="high" />
			<embeded src="resources/swf/logoREPRED.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="640" height="144"></embeded>
		</object>
</p>
<%
String role=new String((String)session.getAttribute("role"));
System.out.println("role del index: " + role);
if(role.equals("administrador"))
{
		out.print("<form name=\"formIndex\" action=\"index2.jsp\">" 
			+"<select size=1 name=\"AMB\">"
			+"<option value=\"Nacional\">" 
			+"Operacion Nacional"
			+"</option>"
			+"<option value=\"Internacional\">"
			+"Operacion Internacional"
			+"</option>"
			+"</select>"
			+"<p><a href=\"javascript:enviarParametro()\">Entrar</a></p>"
			+"</form>"
			);
}
else if(role.equals("banco"))
{
	session.setAttribute("ambiente","Nacional");
	request.setAttribute("AMB","");
	System.out.println("ya paso por aqui banco y seteo ambiente" );
	out.print("<p><a href=\"index2.jsp\">Entrar</a></p>");	
}
if(role.equals("bancoint"))
{
    System.out.println("ya paso por aqui bancoint y seteo ambiente" );
	session.setAttribute("ambiente","Internacional");
	out.print("<p><a href=\"index2.jsp\">Entrar</a></p>");
	
}
%>
</div>
<p>&nbsp;</p>
</body>
</html>
