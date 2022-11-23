import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;  
import javax.mail.*;  
import javax.mail.internet.*;  
import javax.activation.*; 
import java.sql.*;
import java.util.*;
import java.text.*;
import career.connection.ConnectionProvider;

public class sendmail extends HttpServlet
{
int status=0;

public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
{
	String msg="Unique ID : - ";
	
	HttpSession session = req.getSession(false);
	String un = (String)session.getAttribute("username");

	final String from = "documentprovider.com@gmail.com";
	final String pass = "document123";
	final String to = req.getParameter("to");
	String subject = "Unique ID from "+un;
	String body = msg + req.getParameter("id") +" : "+ req.getParameter("message");
	
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
		message.setRecipients(Message.RecipientType.TO,
		InternetAddress.parse(to));
	
		// Set Subject: header field
		message.setSubject(subject);
	
		// Now set the actual message
		message.setText(body);
		
		Transport.send(message);
		status=1;
		msession=null;

		try
		{
			Connection con = ConnectionProvider.makeConnection();
			PreparedStatement ps = con.prepareStatement("insert into dp_sent (username,email_to,id,message) values(?,?,?,?)");
			ps.setString(1,un);
			ps.setString(2,to);
			ps.setString(3,req.getParameter("id"));
			ps.setString(4,req.getParameter("message"));
			status = ps.executeUpdate();
			con.close();
		}
		catch(SQLException s)
		{
			System.out.println("sendmail.java : - "+s);
		}
	} 
	catch (MessagingException e)
	{
		status=2;
	}	
	
	res.sendRedirect("composemail.jsp?status="+status);
}
}




