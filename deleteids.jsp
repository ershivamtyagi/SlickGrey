<%@ page import="career.connection.ConnectionProvider" %>
<%@ page import="java.util.Date "%>
<%@ page import="java.text.DateFormat "%>
<%@ page import="java.text.SimpleDateFormat "%>
<%@ page import="java.sql.*" %>
 
<%
	String username = (String)session.getAttribute("username");
	String ids[] = request.getParameterValues("ids");
	String state = "deleted";
	DateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd HH:MM:ss");	 
	Date date = new Date();
	Timestamp ts = new Timestamp(date.getTime());
	String timestamp = ts.toString();

	try
	{
		Connection con = ConnectionProvider.makeConnection();
		for(int i=0 ; i<ids.length ; i++)
		{
		PreparedStatement ps = con.prepareStatement("update dp_idtable set id_status=?,deleted_date=? where id=?");
		ps.setString(1,state);
		ps.setString(2,timestamp);
		ps.setString(3,ids[i]);
		int status = ps.executeUpdate();
		}
		con.close();
		response.sendRedirect("showid.jsp");		 	
	}
	catch(Exception e)
	{	
		System.out.print(e);
	}
%>