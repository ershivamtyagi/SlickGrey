<%
	session.removeAttribute("username");
	session.invalidate();
	response.sendRedirect("home.html");
%>

