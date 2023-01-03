<%@ page import="java.sql.*"%>


<%
try
{
    String rname = request.getParameter("name");
    String remail = request.getParameter("email");
    String rpassword= request.getParameter("password");
    
   
if(rpassword.length()!=0)
{
    Class.forName("com.mysql.jdbc.Driver").newInstance();

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movieticket","root","");

     PreparedStatement pst = conn.prepareStatement("INSERT INTO `userdetails` (`id`,`name`,`email`,`password`) VALUES (default,?,?,?)");
    
    pst.setString(1,rname);
    pst.setString(2,remail);
    pst.setString(3,rpassword);
    
    int status = pst.executeUpdate();


    if(status!=0)
    {
      
      response.sendRedirect("userInterface.jsp");
    }
    else
    {
      
      response.sendRedirect("pages/usersigninup.jsp");
    }
}//end of the if statement

else{
  response.sendRedirect("pages/usersigninup.jsp");
}

}//try ended

catch(Exception e)
{
      out.println("Exception :- "+e);
}


%>
