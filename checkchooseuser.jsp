<%@ page import="java.sql.* "%>
<%@ page import="java.util.* "%>
<%@ page import="career.connection.ConnectionProvider" %>

<%
	String cu = request.getParameter("chooseuser");
	try	
	{
	Connection con = ConnectionProvider.makeConnection();
	PreparedStatement ps = con.prepareStatement("select choose from dp_signup where choose='"+cu+"'");
	ResultSet rs = ps.executeQuery();
	if(rs.next())
	{
		out.print("<b>already in use</b>");
	}
	else
	{
		out.print("<b>choose name available<b>");
	}
	con.close();
	}
	catch(Exception e)
	{
		System.out.println(e);
	}	
%>