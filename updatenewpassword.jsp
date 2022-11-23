<%@ page import="career.connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
	String nw = request.getParameter("new");

	String un = (String)session.getAttribute("username");
	try
	{
	Connection con = ConnectionProvider.makeConnection();
	PreparedStatement ps = con.prepareStatement("update dp_signup set password=? where choose=?");
	ps.setString(1,nw);
	ps.setString(2,un);
	int w = ps.executeUpdate();
	if(w>0)
	{
		out.print("password successfully changed...");
	}

	con.close();
	}
	catch(Exception e)
	{
	}
%>