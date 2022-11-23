<%@ page import="java.sql.*" %>
<%@ page import="career.connection.ConnectionProvider" %>
<%@ page import="java.util.Date "%>
<%@ page import="java.text.DateFormat "%>
<%@ page import="java.text.SimpleDateFormat "%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="style.css" />
		<title>DocumentProvider</title>
	</head>

<body>
<div id="container">

	<div id="header">
		<img src="images/documentprovider1.png" width="130" height="130"></img>
        	<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Document<span class="off">Provider</span></h1>
            	<h2></h2>
        </div>   
        
       	<div id="menu">
        	<ul>
        		<li class="menuitem"><a href="home.html">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Home</a></li>
                	<li class="menuitem"><a href="download_documents.jsp">Download Documents</a></li>
                	<li class="menuitem"><a href="about.html">About Us</a></li>
              		<li class="menuitem"><a href="contact.html">Contact Us</a></li>
			<li ><a href="#"><img src="images/facebook.png" width="32" height="32"></img></a></li>
			<li ><a href="#"><img src="images/twitter.png" width="32" height="32"></img></a></li>
			<li ><a href="#"><img src="images/linkedin.png" width="32" height="32"></img></a></li>
			<li ><a href="#"><img src="images/yahoo.png" width="32" height="32"></img></a></li>
				
            	</ul>
        </div>
        
        <div id="leftmenu">

        	<div id="leftmenu_top"></div>
			<div id="leftmenu_main">    
                       	        <h3>Links</h3>
                        
                	<ul>
                    		<li><a href="usersignin.jsp?status=1">SignIn</a></li>
                    		<li><a href="signup.html">SignUp</a></li>
				&nbsp;&nbsp;&nbsp;
				<a href="#"><img src="images/facebook.png" width="32" height="32"></img></a>
				&nbsp;&nbsp;<a href="#"><img src="images/twitter.png" width="32" height="32"></img></a>
				&nbsp;&nbsp;<a href="#"><img src="images/linkedin.png" width="32" height="32"></img></a>
				&nbsp;&nbsp;<a href="#"><img src="images/yahoo.png" width="32" height="32"></img></a>
				

                	</ul>
		</div>
                               
              	<div id="leftmenu_bottom"></div>
        	</div>
                
        
		<div id="content">
        
        
        	<div id="content_top"></div>
       			<div id="content_main">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="home.html">Logout</a>
        			<h2><%= "Welcome, "+request.getParameter("guest")%></h2>
				
				<%
				String guest = request.getParameter("guest");
				String uid = request.getParameter("uid");
				try
				{
				Connection con = ConnectionProvider.makeConnection();
				PreparedStatement ps = con.prepareStatement("select username,id_loadedfiles,id_status from dp_idtable where id=?");
				ps.setString(1,uid);
				ResultSet rs = ps.executeQuery();
				if(rs.next())
				{
					if(rs.getString("id_status").equals("true"))
					{
						out.print("<br><h3>Uploaded By:"+rs.getString("username")+"</h3>");
						String files[] = rs.getString("id_loadedfiles").split(",");

						for(int i=0 ; i<files.length ; i++)
						{
							out.print("<br>"+(i+1)+")&nbsp;<a href='downloadfiles.jsp?filename="+files[i]+"'>"+files[i]+"</a>");
						}
					
						
						DateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd HH:MM:ss");	 
						Date date = new Date();
						Timestamp timestamp = new Timestamp(date.getTime());
						String st = "false";
						String desp = "Used by : " + guest + " - on " + timestamp.toString();
						ps = con.prepareStatement("update dp_idtable set id_status=?,id_description=? where id='"+uid+"'");
						ps.setString(1,st);
						ps.setString(2,desp);
						ps.executeUpdate();
					}
					else
					{
						response.sendRedirect("download_documents.jsp?status=1");
					}
				}
				else
				{
					response.sendRedirect("download_documents.jsp?status=0");
				}
				
				con.close();	
				}
				catch(Exception e)
				{
				System.out.println(e);
				}

				%>
 

        		</div>

        	<div id="content_bottom"></div>
            	
      		</div>
</div>
</body>

</html>
