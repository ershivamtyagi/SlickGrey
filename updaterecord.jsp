<%@ page import="java.sql.* "%>
<%@ page import="java.util.* "%>
<%@ page import="career.connection.ConnectionProvider" %>

<%
	String username = (String)session.getAttribute("username");
	try	
	{
	Connection con = ConnectionProvider.makeConnection();
	PreparedStatement ps = con.prepareStatement("update dp_signup set first=?,last=?,dob=?,mobile=?,address=?,country=?,email=? where choose='"+username+"'");
	ps.setString(1,request.getParameter("first"));
	ps.setString(2,request.getParameter("last"));
	ps.setString(3,request.getParameter("dob"));
	ps.setString(4,request.getParameter("mobile"));
	ps.setString(5,request.getParameter("address"));
	ps.setString(6,request.getParameter("country"));
	ps.setString(7,request.getParameter("email"));
	int w = ps.executeUpdate();
	if(w>0)
	{
		out.print("<b>Record Updated Sucessfully.....<b>");
	}
	else
	{
		out.print("<b>Record Not Updated.....<b>");
	}
	con.close();
	}
	catch(Exception e)
	{
		System.out.println(e);
	}	
%>