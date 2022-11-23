<%@ page import="java.util.Enumeration" %>

<%@ page import="career.dao.SignupDao" %>

<%@ taglib uri="WEB-INF/mytag.tld" prefix="s"%>

<%
	Enumeration<String> e = request.getParameterNames();	
	
	String str="";
	String field1="",field2="";
	while(e.hasMoreElements())
	{
		str = (String)e.nextElement();
		if(!str.equals("cpassword"))
		{
		field1 = "set" + (""+str.charAt(0)).toUpperCase() + str.substring(1);
		field2 = field2 + field1+":"+request.getParameter(str)+",";
		}
	}
%>


<s:insertData data="<%= field2 %>"></s:insertData>

<%
	response.sendRedirect("usersignin.jsp");
	
	
%>



