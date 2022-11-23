<%@ page import="java.sql.*" %>
 
<%
	String un = request.getParameter("username");
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null; 
	
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","607997");
		ps = con.prepareStatement("select * from dp_signup where choose=?");	
		ps.setString(1,un);
		rs = ps.executeQuery();
		if(rs.next())
		{
			con.close();
			response.sendRedirect("passwordsignin.jsp?username="+un);
		}
		else
		{
			response.sendRedirect("usersignin.jsp?status=0");
		}
	}
	catch(Exception e)
	{
		System.out.println(e);	
	}
	finally
	{
		con.close();
	} 

%>