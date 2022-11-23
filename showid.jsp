<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*" %>
<%@ page import="career.connection.ConnectionProvider" %>

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
	function rat(x)
	{
		var s = x.substring(0,8);
		var url = "getfiles.jsp?uid="+x;
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
		document.getElementById('neha').innerHTML = val; 
		}  
	}


	function cat(x)
	{
	var tab = "tab"+x;
	document.getElementById('tab1').style.display = 'none';
	document.getElementById('tab2').style.display = 'none';
	document.getElementById('tab3').style.display = 'none';
	document.getElementById(tab).style.display = 'block';
	}

	function changedob()
	{	
	document.getElementById('db1').value = document.getElementById('db2').value;
	}

	var request1;
	function updaterecord()
	{
		var f = document.form2.first.value;
		var l = document.form2.last.value;
		var d = document.form2.dob.value;
		var m = document.form2.mobile.value;
		var a = document.form2.address.value;
		var c = document.form2.country.value;
		var e = document.form2.email.value;
				
		if(f.length==0)
		{
			alert("Error! First Name can't leave blank");
			document.form2.first.focus();
			return false; 
		}
		else if(l.length==0)	
		{
			alert("Error! Last Name can't leave blank");
			document.form2.last.focus();
			return false; 
		}
		else if(d.length==0)	
		{
			alert("Error! DOB can't leave blank");
			document.form2.dob.focus();
			return false; 
		}
		else if(m.length==0)	
		{
			alert("Error! Mobile can't leave blank");
			document.form2.mobile.focus();
			return false; 
		}
		else if(a.length==0)	
		{
			alert("Error! Address can't leave blank");
			document.form2.address.focus();
			return false; 
		}
		else if(c.length==0)	
		{
			alert("Error! Country can't leave blank");
			document.form2.country.focus();
			return false; 
		}
		else if(e.length==0)	
		{
			alert("Error! Email can't leave blank");
			document.form2.email.focus();
			return false; 
		}
		else
		{
			var url = "updaterecord.jsp?first="+f+"&last="+l+"&dob="+d+"&mobile="+m+"&address="+a+"&country="+c+"&email="+e;	
			
			if(window.XMLHttpRequest)
			{  
			request1 = new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject)
			{ 	 	
			request1 = new ActiveXObject("Microsoft.XMLHTTP");  
			}  
  
			try  
			{  
			request1.onreadystatechange = getInfo1;  
			request1.open("GET",url,true);  
			request1.send();  
			}  
			catch(ex)  
			{  
			alert("Unable to connect to server");  
			}  
			return true;
		}
	}
	function getInfo1()
	{
		if(request1.readyState==4)
		{  
		var val = request1.responseText;  
		document.getElementById('update').innerHTML = val; 
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
               </ul>
	</div>
                
                
              	<div id="leftmenu_bottom"></div>
        	</div>
            
        
		<div id="content">
        
        
        <div id="content_top"></div>
	 <div id="content_main">
        	
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="editid.jsp"><img src="images/editid.png" width="80" height="90"></img></a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="showid.jsp"><img src="images/showid.png" width="80" height="90"></img></a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="towhome.jsp"><img src="images/towhome.png" width="80" height="90"></img></a>
		  
		<br><br><br>
      	
		<!- table 1 -->

		<%
		try
		{
			Connection con = ConnectionProvider.makeConnection();
			PreparedStatement ps = con.prepareStatement("select id,date_time,id_loadedfiles from dp_idtable where username='"+username+"' and id_status='true'");
			ResultSet rs = ps.executeQuery();
			out.print("<table border='1'>");	
			out.print("<caption>Active IDs</caption>");
			out.print("<col width='80'>");
  			out.print("<col width='160'>");
  			out.print("<col width='310'>");
  			out.print("<tr><th>Active ID</th><th>Generated On</th><th>Loaded Files</th></tr>");
				while(rs.next())
				{
				out.print("<tr><td><a href='composemail.jsp?id="+rs.getString("id")+"&files="+rs.getString("id_loadedfiles")+"'>"+rs.getString("id")+"</a></td>");
				out.print("<td>"+rs.getString("date_time")+"</td>");
				out.print("<td>"+rs.getString("id_loadedfiles")+"</td></tr>");
				}
				con.close();
			out.print("</table>");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		%>

		<br><br><br>
		<!- table 2 -->

		<%
		try
		{
			Connection con = ConnectionProvider.makeConnection();
			PreparedStatement ps = con.prepareStatement("select id,id_description from dp_idtable where username='"+username+"' and id_status='false'");
			ResultSet rs = ps.executeQuery();
			out.print("<form action='deleteids.jsp'><table border='1'>");	
			out.print("<caption>Used IDs</caption>");
			out.print("<col width='80'>");
  			out.print("<col width='80'>");
  			out.print("<col width='370'>");
  			out.print("<tr><th><input type='submit' class='myButton' value='Delete IDs'></input></th><th>Used ID</th><th>Description</th></tr>");
				while(rs.next())
				{
				out.print("<tr><td><input type='checkbox' name='ids' value='"+rs.getString("id")+"'></input></td>");
				out.print("<td>"+rs.getString("id")+"</td>");
				out.print("<td>"+rs.getString("id_description")+"</td></tr>");
				}
				con.close();
			out.print("</table></form>");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		%>

		<br><br><br>
		<!- table 3 -->

		<%
		try
		{
			Connection con = ConnectionProvider.makeConnection();
			PreparedStatement ps = con.prepareStatement("select id,id_description,deleted_date from dp_idtable where username='"+username+"' and id_status='deleted'");
			ResultSet rs = ps.executeQuery();
			out.print("<form action='restoreid.jsp'><table border='1'>");	
			out.print("<caption>Deleted IDs</caption>");
			out.print("<col width='80'>");
  			out.print("<col width='140'>");
  			out.print("<col width='300'>");
  			out.print("<tr><th><input type='submit' class='myButton' value='Restore'></input></th><th>Deleted ID</th><th>Description</th></tr>");
				while(rs.next())
				{
				out.print("<tr><td><input type='checkbox' name='ids' value='"+rs.getString("id")+"'></input></td>");
				out.print("<td>"+rs.getString("id")+" ("+rs.getString("deleted_date").substring(0,10)+")</td>");
				out.print("<td>"+rs.getString("id_description")+"</td></tr>");
				}
				con.close();
			out.print("</table></form>");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		%>


		<%
			try
			{
				String status = request.getParameter("status");
				if(status.equals("1"))
				{
					out.print("<h3>UId Updated successfully.....</h3><br>");
				}
				else
				{
					out.print("<h3>Sorry! UId not updated.....</h3><br>");
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
