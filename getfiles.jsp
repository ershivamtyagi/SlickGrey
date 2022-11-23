<%@ page import="career.connection.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
	String username = (String)session.getAttribute("username");
	String uid = request.getParameter("uid");
	System.out.print(uid);
	try
	{
		Connection con = ConnectionProvider.makeConnection();
		PreparedStatement ps = con.prepareStatement("select * from dp_idtable");
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			if(rs.getString("id").equals(uid))
			{
				out.print(rs.getString("id_loadedfiles"));
			}
			else
			{
				System.out.println("not ok");
			}
		}
		con.close();		
	}
	catch(Exception e)
	{
	}	
%>