<%@ page import="career.connection.ConnectionProvider" %>
<%@ page import="java.util.Date "%>
<%@ page import="java.text.DateFormat "%>
<%@ page import="java.text.SimpleDateFormat "%>
<%@ page import="java.sql.*" %>
 
<%
	String ids[] = request.getParameterValues("ids");

	try
	{
		Connection con = ConnectionProvider.makeConnection();
		for(int i=0 ; i<ids.length ; i++)
		{
		PreparedStatement ps = con.prepareStatement("delete from dp_idtable where id=?");
		ps.setString(1,ids[i]);
		int status = ps.executeUpdate();
		}
		con.close();
		response.sendRedirect("trash.jsp");		 	
	}
	catch(Exception e)
	{	
		System.out.print(e);
	}
%>