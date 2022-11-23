<%@ page import="career.connection.ConnectionProvider" %>
<%@ page import="java.util.Date "%>
<%@ page import="java.text.DateFormat "%>
<%@ page import="java.text.SimpleDateFormat "%>
<%@ page import="java.sql.*" %>
 
<%
	String username = (String)session.getAttribute("username");
	String id = request.getParameter("uid");
	String files[] = request.getParameterValues("selectedfiles");
	String file="";
	for(int i=0 ; i<files.length ; i++)
	{
		file = file + files[i]+",";
	}	
	String state = "true";
	String desp = "not used";
	DateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd HH:MM:ss");	 
	Date date = new Date();
	Timestamp ts = new Timestamp(date.getTime());
	String timestamp = ts.toString();
	String deleteddate="-";
	try
	{
		Connection con = ConnectionProvider.makeConnection();
		PreparedStatement ps = con.prepareStatement("insert into dp_idtable values(?,?,?,?,?,?,?)");
		ps.setString(1,username);
		ps.setString(2,id.trim());
		ps.setString(3,file);
		ps.setString(4,state);
		ps.setString(5,desp);
		ps.setString(6,timestamp);
		ps.setString(7,deleteddate);
		int status = ps.executeUpdate();
		con.close();
		response.sendRedirect("usergenerateid.jsp?status="+status);		 	
	}
	catch(Exception e)
	{	
		System.out.print(e);
	}
%>