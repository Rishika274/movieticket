    <%@ page language="java" import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.util.*" %>

<html>

  <head>
    <title>Verify Password</title>
   </head>

	<body>
		<%
		String adminemail=request.getParameter("username");
		String adminpassword=request.getParameter("password");

    Connection conn=null;
  	ResultSet rs=null;
  	Statement stmt=null;
  	Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/movieticket","root","");
  	stmt=conn.createStatement();
    String query = "SELECT  email,password FROM `userdetails` WHERE `email` = '"+adminemail+"' AND `password` = '"+adminpassword+"' ";

    rs=stmt.executeQuery(query);

    if(rs.next()) 
    {
      session.setAttribute("abc",adminemail);
    	response.sendRedirect("userInterface.jsp");
    } 
    else
    { 
      	 response.sendRedirect("pages/usersigninup.html");
    }
    %>

    <%
    rs.close();
    conn.close();
    %>
 </body>
</html>