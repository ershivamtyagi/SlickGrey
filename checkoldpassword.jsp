<%@ page import="career.connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
	String old = request.getParameter("old");
	String un = (String)session.getAttribute("username");
	try
	{
	Connection con = ConnectionProvider.makeConnection();
	PreparedStatement ps = con.prepareStatement("select * from dp_signup where choose=? and password=?");
	ps.setString(1,un);
	ps.setString(2,old);
	ResultSet rs = ps.executeQuery();
	if(!rs.next())
	{
		out.print("invalid old password");
	}
	else
	{
		out.print("<td>New Password</td><td><input type='password' name='newpass'></input></td>");
	}
	con.close();
	}
	catch(Exception e)
	{
	}
%>