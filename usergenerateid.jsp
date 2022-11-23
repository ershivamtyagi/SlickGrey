<%@ page import="java.io.*" %>
<%@ page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<title>DocumentProvider</title>

<style>
.myButton{-moz-box-shadow:inset 0px 1px 0px 0px #54a3f7;
	-webkit-box-shadow:inset 0px 1px 0px 0px #54a3f7;
	box-shadow:inset 0px 1px 0px 0px #54a3f7;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #007dc1), color-stop(1, #0061a7));
	background:-moz-linear-gradient(top, #007dc1 5%, #0061a7 100%);
	background:-webkit-linear-gradient(top, #007dc1 5%, #0061a7 100%);
	background:-o-linear-gradient(top, #007dc1 5%, #0061a7 100%);
	background:-ms-linear-gradient(top, #007dc1 5%, #0061a7 100%);
	background:linear-gradient(to bottom, #007dc1 5%, #0061a7 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#007dc1', endColorstr='#0061a7',GradientType=0);
	background-color:#007dc1;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	border:1px solid #124d77;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:arial;
	font-size:13px;
	padding:3px 16px;
	text-decoration:none;
	text-shadow:0px 1px 0px #154682;
}

.myButton:hover{background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #0061a7), color-stop(1, #007dc1));
	background:-moz-linear-gradient(top, #0061a7 5%, #007dc1 100%);
	background:-webkit-linear-gradient(top, #0061a7 5%, #007dc1 100%);
	background:-o-linear-gradient(top, #0061a7 5%, #007dc1 100%);
	background:-ms-linear-gradient(top, #0061a7 5%, #007dc1 100%);
	background:linear-gradient(to bottom, #0061a7 5%, #007dc1 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#0061a7', endColorstr='#007dc1',GradientType=0);
	background-color:#0061a7;
}
.myButton:active {
	position:relative;
	top:1px;
}

</style>

<script>
	var request;
	function generateid()
	{
		var url = "generateid.jsp";	
		
		if(window.XMLHttpRequest)
		{  
		request = new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject)
		{ 	 	
		request = new ActiveXObject("Microsoft.XMLHTTP");  
		}  
  
		try  
		{  
			request.onreadystatechange = getInfo;  
			request.open("GET",url,true);  
			request.send();  
		}  
		catch(ex)  
		{  
		alert("Unable to connect to server");  
		}  
	}
	function getInfo()
	{
		if(request.readyState==4)
		{  
		var val = request.responseText;
		document.getElementById('gid').value = val;
		document.getElementById('did').value = val;
		}  
	}
</script>

</head>

<body>
<div id="container">
		<div id="header">
        	<h1>Document<span class="off">Provider</span></h1>
           
		 <%
			String username = (String)session.getAttribute("username");
			
			File fe = new File(getServletContext().getRealPath("/")+"/photos/");
			String str[] = fe.list();
			for(int i=0 ; i<str.length ; i++)
			{
			String fn = str[i].substring(0,str[i].indexOf("."));
			if(fn.equals(username))
			{
			out.print("<h2>Login as - "+username+" <img src='photos/"+username+".jpg' width='40' height='40'></img> </h2>");
			break;
			}	
			else
			{
			out.print("<h2>Login as - "+username+" <img src='photos/default.png' width='40' height='40'></img> </h2>");
			}
		}
					
		%>
		
        </div>   
        
        <div id="menu">
        	<ul>
            	<li class="menuitem"><a href="logout.jsp">Logout</a></li>
                </ul>
        </div>
        
        <div id="leftmenu">

        <div id="leftmenu_top"></div>

				<div id="leftmenu_main">    
                
                <h3>Links</h3>
                        
                <ul>
                    <li><a href="usersettings.jsp">Settings</a></li>
                    <li><a href="userupload.jsp">Upload Documents</a></li>
                    <li><a href="userdownload.jsp">Download Documents</a></li>
                    <li><a href="usergenerateid.jsp">Generate ID</a></li>
                    <li><a href="idstatus.jsp">ID's Status</a></li>
		    <li><a href="usercompose.jsp">Compose</a></li>
                    <li><a href="sent.jsp">Sent</a></li>
                    <li><a href="trash.jsp">Trash</a></li> 
	</div>
                
                
              	<div id="leftmenu_bottom"></div>
        	</div>
            
        
		<div id="content">
        
        
        <div id="content_top"></div>
	<div id="content_main">
        	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<img src="images/id.png" width="100" height="100"></img>
			

		<%
		try
		{
		String path = getServletContext().getRealPath("/") + File.separator + "data/"+username; 
		File fe1 = new File(path);
		if(fe1.exists())
		{

			out.print("<br><br><br>");
		
			out.print("<form name='myform'>");
			out.print("<table>");
			out.print("<tr><td><input type='text' id='gid' placeholder='click on button below' readonly></input></td></tr>");
			out.print("<tr><td><a class='myButton' href='#' onclick='generateid()'>Generate ID</a></td></tr>");
			out.print("</table>");
			out.print("</form>");

			out.print("<br><br>");

			String files[] = fe1.list();
			float size[] = new float[files.length];
			String val[] = new String[size.length];
			for(int i=0 ; i<files.length ; i++)
			{
				File fn = new File(path+"/"+files[i]);
				InputStream is = new FileInputStream(fn);
				size[i] = (float)is.available();	
				float d = size[i]/1024;
				val[i] = new DecimalFormat("##.##").format(d);
			} 
		

			out.print("<form action='saveid.jsp' method='post'>");
			out.print("<table>");
			out.print("<tr><td><input type='hidden' name='uid' id='did'></input></td></tr>");
		
			for(int i=0 ; i<files.length ; i++)
			{
				out.print("<tr><td><input type='checkbox' name='selectedfiles' value='"+files[i]+"'>&nbsp;"+files[i]+" ("+val[i]+" kb)</input></td></tr>");
			}
		
			out.print("<tr><td><input type='submit' class='myButton' value='Save ID'></input></td></tr>");
			out.print("</table>");
			out.print("</form>");
	
		}
		else
		{
		%>
			<script>alert("Sorry! First Upload Documents then Create UID");</script>	
		<%	
		}
		}
		catch(Exception e)
		{
		}	
			
		%>

		<%
			try
			{
				String status = request.getParameter("status");
				if(status.equals("1"))
				{
					out.print("<h3>UId saved successfully.....</h3><br>");
				}
				else
				{
					out.print("<h3>Sorry! UId not saved.....</h3><br>");
				}
			}
			catch(Exception e)
			{
			}
			%>   
	
	</div>
        <div id="content_bottom"></div>
            
            <div id="footer"><h3></h3></div>
      </div>
   </div>
</body>
</html>
