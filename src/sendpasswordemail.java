import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;  
import javax.mail.*;  
import javax.mail.internet.*;  
import javax.activation.*; 
import java.sql.*;
import java.text.*;
import career.connection.ConnectionProvider;

public class sendpasswordemail extends HttpServlet
{
int status=0;

public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
{
	HttpSession session = req.getSession(false);
	String un="";	
	int status = 0;
	try
	{
		String em = req.getParameter("email");
		Connection con = ConnectionProvider.makeConnection();
		PreparedStatement ps = con.prepareStatement("select choose,password from dp_signup where email='"+em+"'");
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{	
			String msg="Username :- "+ rs.getString("choose") + " Password :- "+rs.getString("password");
			un = rs.getString("choose");
			final String from = "documentprovider.com@gmail.com";
			final String pass = "document123";
			final String to = em;
			String subject = "Password Recovery";
			String body = msg;

			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");

			// Get the Session object.
			Session msession = Session.getInstance(props,
			new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(from,pass);
			}
			});
			
			try
			{
				// Create a default MimeMessage object.
				Message message = new MimeMessage(msession);
	
				// Set From: header field of the header.
				message.setFrom(new InternetAddress(from));
	
				// Set To: header field of the header.
				message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
	
				// Set Subject: header field
				message.setSubject(subject);
	
				// Now set the actual message
				message.setText(body);
		
				Transport.send(message);
				status=1;
				msession=null;
			} 
			catch (MessagingException e)
			{
				status=2;
			}
		}
		else
		{
			status=3;
		}
		con.close();
	}
	catch(SQLException e)
	{
		System.out.println(e);
	}

	res.sendRedirect("usersignin.jsp?status="+status);
}
}

