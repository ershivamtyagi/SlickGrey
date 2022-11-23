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
                    		<li><a href="usersignin.jsp?status=-1">SignIn</a></li>
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
        			<h2>Guest SignIn</h2>

				<%
				try
				{
				String status = request.getParameter("status");
				if(status.equals("0"))
				{
					out.print("<h3>Sorry! Invalid ID.....</h3><br>");
				}
				if(status.equals("1"))
				{
					out.print("<h3>ID already used.....</h3><br>");
				}
				}
				catch(Exception e)
				{
				}
				%>    

				<form action="guestsubmitid.jsp">
				<table>
					<tr><td><b>Name</b></td><td><input type="text" name="guest"></td></tr>
					<tr><td><b>UID</b></td><td><input type="text" name="uid"></td></tr>
					<tr></tr><tr></tr><tr></tr>
					<tr><td></td><td><input type="submit" value="Submit ID"></td></tr>

				</table>
				</form>
        		</div>

        	<div id="content_bottom"></div>
            	
      		</div>
</div>
</body>

</html>
