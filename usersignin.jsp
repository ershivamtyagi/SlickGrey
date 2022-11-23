<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="style.css" />
		<title>DocumentProvider</title>
		<style>
			.myButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	-webkit-box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #79bbff), color-stop(1, #378de5));
	background:-moz-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-webkit-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-o-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-ms-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:linear-gradient(to bottom, #79bbff 5%, #378de5 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#79bbff', endColorstr='#378de5',GradientType=0);
	background-color:#79bbff;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #84bbf3;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:7px 71px;
	text-decoration:none;
	text-shadow:0px 1px 0px #528ecc;
			}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #378de5), color-stop(1, #79bbff));
	background:-moz-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-webkit-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-o-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-ms-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:linear-gradient(to bottom, #378de5 5%, #79bbff 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#378de5', endColorstr='#79bbff',GradientType=0);
	background-color:#378de5;
}
.myButton:active {
	position:relative;
	top:1px;
}

		
		.textbox{
			width: 230px;
			height: 25px;
			border: 1px solid #3366FF;
			border-left: 4px solid #3366FF;
			}

		.form-container 
		{
   		border: 1px solid #575451;
   		background: #999999;
   		background: -webkit-gradient(linear, left top, left bottom, from(#4d4d4c), to(#999999));
   		background: -webkit-linear-gradient(top, #4d4d4c, #999999);
   		background: -moz-linear-gradient(top, #4d4d4c, #999999);
   		background: -ms-linear-gradient(top, #4d4d4c, #999999);
   		background: -o-linear-gradient(top, #4d4d4c, #999999);
   		background-image: -ms-linear-gradient(top, #4d4d4c 0%, #999999 100%);
   		-webkit-border-radius: 8px;
   		-moz-border-radius: 8px;
   		border-radius: 8px;
   		-webkit-box-shadow: rgba(000,000,000,0.9) 0 1px 2px, inset rgba(255,255,255,0.4) 0 0px 0;
   		-moz-box-shadow: rgba(000,000,000,0.9) 0 1px 2px, inset rgba(255,255,255,0.4) 0 0px 0;
   		box-shadow: rgba(000,000,000,0.9) 0 1px 2px, inset rgba(255,255,255,0.4) 0 0px 0;
   		font-family: 'Helvetica Neue',Helvetica,sans-serif;
   		text-decoration: none;
   		vertical-align: middle;
   		min-width:300px;
   		padding:20px;
   		width:300px;
   		}

		.form-field 
		{
   		border: 1px solid #c9b7a2;
   		background: #e4d5c3;
   		-webkit-border-radius: 4px;
   		-moz-border-radius: 4px;
   		border-radius: 4px;
   		color: #030200;
   		-webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(000,000,000,0.7) 0 0px 0px;
   		-moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(000,000,000,0.7) 0 0px 0px;
   		box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(000,000,000,0.7) 0 0px 0px;
   		padding:8px;
   		margin-bottom:20px;
   		width:280px;
   		}

		.form-field:focus 
		{
   		background: #fff;
   		color: #0f0903;
   		}

		.form-container h2 
		{
   		text-shadow: #806e58 0 1px 0;
   		font-size:18px;
   		margin: 0 0 10px 0;
   		font-weight:bold;
   		text-align:center;
    		}

		.form-title 
		{
   		margin-bottom:10px;
   		color: #141414;
   		text-shadow: #806e58 0 1px 0;
   		}

		.submit-container 
		{
   		margin:8px 0;
   		text-align:right;
   		}

		.submit-button 
		{
   		border: 2px solid #447314;
   		background: #6aa436;
   		background: -webkit-gradient(linear, left top, left bottom, from(#8dc059), to(#6aa436));
   		background: -webkit-linear-gradient(top, #8dc059, #6aa436);
   		background: -moz-linear-gradient(top, #8dc059, #6aa436);
   		background: -ms-linear-gradient(top, #8dc059, #6aa436);
   		background: -o-linear-gradient(top, #8dc059, #6aa436);
   		background-image: -ms-linear-gradient(top, #8dc059 0%, #6aa436 100%);
   		-webkit-border-radius: 6px;
   		-moz-border-radius: 6px;
   		border-radius: 6px;
   		-webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   		-moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   		box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   		text-shadow: #0b1402 0 1px 0;
   		color: #1f3803;
   		font-family: helvetica, serif;
   		padding: 8.5px 18px;
   		font-size: 14px;
   		text-decoration: none;
   		vertical-align: middle;
   		}

		.submit-button:hover 
		{
   		border: 2px solid #447314;
   		text-shadow: #030500 0 1px 0;
   		background: #6aa436;
   		background: -webkit-gradient(linear, left top, left bottom, from(#8dc059), to(#6aa436));
   		background: -webkit-linear-gradient(top, #8dc059, #6aa436);
   		background: -moz-linear-gradient(top, #8dc059, #6aa436);
   		background: -ms-linear-gradient(top, #8dc059, #6aa436);
   		background: -o-linear-gradient(top, #8dc059, #6aa436);
   		background-image: -ms-linear-gradient(top, #8dc059 0%, #6aa436 100%);
   		color: #fff;
   		}

		.submit-button:active 
		{
   		text-shadow: #31540c 0 1px 0;
   		border: 2px solid #447314;
   		background: #8dc059;
   		background: -webkit-gradient(linear, left top, left bottom, from(#6aa436), to(#6aa436));
   		background: -webkit-linear-gradient(top, #6aa436, #8dc059);
   		background: -moz-linear-gradient(top, #6aa436, #8dc059);
   		background: -ms-linear-gradient(top, #6aa436, #8dc059);
   		background: -o-linear-gradient(top, #6aa436, #8dc059);
   		background-image: -ms-linear-gradient(top, #6aa436 0%, #8dc059 100%);
   		color: #fff;
   		}
	

		</style>
	</head>

<body>
<div id="container">

	<div id="header">
        	<h1>Document<span class="off">Provider</span></h1>
            	<h2></h2>
        </div>   
        
       	<div id="menu">
        	<ul>
        		<li class="menuitem"><a href="home.html">Home</a></li>
                	<li class="menuitem"><a href="download_documents.jsp">Download Documents</a></li>
                	<li class="menuitem"><a href="about.html">About Us</a></li>
              		<li class="menuitem"><a href="contact.html">Contact Us</a></li>
            	</ul>
        </div>
        
        <div id="leftmenu">

        	<div id="leftmenu_top"></div>
			<div id="leftmenu_main">    
                       	        <h3>Links</h3>
                        
                	<ul>
                    		<li><a href="#">SignIn</a></li>
                    		<li><a href="signup.html">SignUp</a></li>
                	</ul>
		</div>
                               
              	<div id="leftmenu_bottom"></div>
        	</div>
                
		
		<div id="content">
               

        	<div id="content_top"></div>
       			<div id="content_main">
				
			<%
			try
			{
				String status = request.getParameter("status");
				if(status.equals("0"))
				{
					out.print("<h3>Sorry! UserName is Invalid.....</h3><br>");
				}
				if(status.equals("1"))
				{
					out.print("<h3>Username & Password Sent Successfully To Your Registered Email Address.....</h3><br>");
				}
				if(status.equals("2"))
				{
					out.print("<h3>Sorry! Error In Sending Mail (Internet Connection Not Found).....</h3><br>");
				}
				if(status.equals("3"))
				{
					out.print("<h3>Sorry! Registered Email Address Not Found.....</h3><br>");
				}
			}
			catch(Exception e)
			{
			}
			%>    
				<form name="myloginform" class="form-container" action="checkuser.jsp">
					<h2 class="form-title">Provide UserName</h2>	
					<input type="text" class="form-field" name="username" placeholder="Enter Username"></input>
					<input type="submit" class="submit-button" value="Next" ></input>&nbsp;&nbsp;<a href="forget.jsp?val=1">Need Help ?</a>
				</form>
        		</div>

        	<div id="content_bottom"></div>
            	
      		</div>
</div>
</body>

</html>
