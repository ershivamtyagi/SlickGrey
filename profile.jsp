<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<title>DocumentProvider</title>
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
               </ul>
</div>
                
                
              <div id="leftmenu_bottom"></div>
        </div>
        
          
        
		<div id="content">
        
        
        <div id="content_top"></div>
        <div id="content_main">
        	
        </div>
        <div id="content_bottom"></div>
            
            <div id="footer"><h3></h3></div>
      </div>
   </div>
</body>
</html>
