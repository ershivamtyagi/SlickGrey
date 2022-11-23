<%@ page import="career.connection.ConnectionProvider" %>
<%@ page import="java.util.Date "%>
<%@ page import="java.text.DateFormat "%>
<%@ page import="java.text.SimpleDateFormat "%>
<%@ page import="java.sql.*" %>
 
<%
	String username = (String)session.getAttribute("username");
	String uid = request.getParameter("ids");
	String files[] = request.getParameterValues("selectedfiles");
	String file="";
	for(int i=0 ; i<files.length ; i++)
	{
		file = file + files[i]+",";
	}	
	DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:MM:ss");
	Date date = new Date();
	String timestamp = ""+df.format(date.getTime());

	try
	{
		Connection con = ConnectionProvider.makeConnection();
		PreparedStatement ps = con.prepareStatement("update dp_idtable set id_loadedfiles=? , date_time=? where id='"+uid+"'");
		ps.setString(1,file);
		ps.setString(2,timestamp);
		int status = ps.executeUpdate();
		con.close();
		response.sendRedirect("editid.jsp?status="+status);		 	
	}
	catch(Exception e)
	{	
		System.out.print(e);
	}
%>