<%@page import="lobby.Lobby"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>
	<%
		out.print(session.getAttribute("username"));
	%>
</title>
</head>
<body>

	<%
		final Lobby lobby = (Lobby) session.getAttribute("lobby");

		session = request.getSession(false);
		String userName = "";
		//out.print(session.getAttribute("opponentsLimit"));
//		out.print((Integer)session.getAttribute("opponentsLimit")!=0);
		
		if (session != null&&(Integer)session.getAttribute("opponentsLimit")!=0) {
			out.print("<form action=\"chooseOpponent\" method=\"GET\">");
			for (String user : lobby.getOnlineUsers().keySet()) {
				HttpSession otherUserSession = lobby.getSession(user);
				Boolean playing = (Boolean) otherUserSession
						.getAttribute("playing");
				if (!session.getAttribute("username").equals(user)
						&& !playing) {
					out.print("<input type=\"submit\" name = \"onlineUsers\" value = \""
							+ user + "\"><br>");
				}
			}
			out.print("</form>");
		}

		response.setIntHeader("Refresh", 3);
	%>



	<%
		if (session.getAttribute("playWith") != null&&(Integer)session.getAttribute("opponentsLimit")!=0) {			
			session.setAttribute("opponentsLimit", 0);
			out.print(session.getAttribute("playWith")
					+ " wants to play with you.");
			out.print("<form id= \"playWith\" action=\"userChoice\" method=\"GET\">");
			out.print("<input type=\"submit\" value = \"play\" name = \"choice\">");
			out.print("<input type=\"submit\" value = \"reject\" name = \"choice\">");
			out.print("</form>");
			
		}
	%>

	<%
		if (session.getAttribute("startGame") != null) {
			out.print("<form action=\"display\" method=\"GET\">");
			out.print("<input type=\"submit\" value = \"play\" name = \"start\">");
			out.print("</form>");
		}
	%>


	<%
		if (session.getAttribute("rejection") != null) { 
				out.print((String)session.getAttribute("rejectionMSG"));
				out.print("<form method=\"GET\" action=\"Lobby\"><input type=\"submit\" value=\"ok\"></form>");
		}
	%>



	<form action="Logout.jsp" method="POST">
		<input type="submit" name="logout" value="logout">

	</form>


</body>
</html>