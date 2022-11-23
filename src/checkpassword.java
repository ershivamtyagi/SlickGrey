import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import career.connection.ConnectionProvider;

public class checkpassword extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
	 
		String un = request.getParameter("username");
		String pw = request.getParameter("password");

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null; 
	
		try
		{
		con = ConnectionProvider.makeConnection();
		ps = con.prepareStatement("select * from dp_signup where choose=? and password=?");	
		ps.setString(1,un);
		ps.setString(2,pw);

		rs = ps.executeQuery();

		if(rs.next())
		{
			HttpSession session = request.getSession();
			session.setAttribute("username",un);
			con.close();
			response.sendRedirect("profile.jsp?username="+un);
		}
		else
		{
			response.sendRedirect("passwordsignin.jsp?status=0&username="+un);
		}
		}
		catch(Exception e)
		{
			System.out.println(e);	
		}
		finally
		{
			try
			{
			con.close();
			}
			catch(Exception e)
			{
			}
		} 
	}
}