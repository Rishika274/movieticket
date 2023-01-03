    <%@ page language="java" import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.util.*" %>


<html lang="en">

  <head>
    <title>User Interface</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="userInterface.css">


       <style type ="text/css">
         
        h4{
         color: rgb(60, 5, 105);
       }

       form{
          padding: 20px;
        }

       body{
         background-color: white;
       }


         input[type=submit] {
        margin: 10px 23px;
        padding: 5px 7px;
        background-color:#04aa6d;
        border: 2px solid rgb(17, 16, 16);
        border-radius: 10px;
        cursor: pointer;
        font-size:15px;
        color: white;
        }
      

        table{
          border: 2px solid black;
          width: 100%;
          height: 55%;
          margin: 70px 0px;
          background-color: rgb(237, 241, 241);
          font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        }

      </style>
       
  </head>

  <body>

    <nav class="navbar navbar-inverse">

      <div class="container-fluid">
      
        <div class="navbar-header">
          <a class="navbar-brand" id="title" href="#">Movie Ticket</a>
        </div>

        <ul class="nav navbar-nav">
          <li class="active"><a href="#">Home</a></li>
          <li><a href="#">Page 1</a></li>
        </ul>
      
        <ul class="nav navbar-nav navbar-right">
          <li>
                  <%-- logout form starts --%>
              <form action="logout.jsp" method="post">
              <input type="submit" value="Logout"/>
             </form>
                  <%-- logout form ends --%>
          </li>
        </ul>

      </div>
    </nav>

<%-- filter form --%>
    <div class="input-box">
      <form   action="userInterface.jsp" method="post" class="search-container">
        <input type="text" id="search-bar" placeholder="Search by Movie Name" name="name">
        <img class="search-icon" src="https://tse1.mm.bing.net/th?id=OIP.1BQn4R8LUGn9phC_i0m5MAHaHa&pid=Api&P=0">
      </form>

      <form action="userInterface.jsp" method="post" class="search-container">
        <input type="text" id="search-bar" placeholder="Search by Relase Date" name="releasedate">
        <img class="search-icon" src="https://tse1.mm.bing.net/th?id=OIP.1BQn4R8LUGn9phC_i0m5MAHaHa&pid=Api&P=0">
      </form>

      <form action="userInterface.jsp" method="post" class="search-container">
        <input type="text" id="search-bar" placeholder="Search by Theatre Name" name="theatrename">
        <img class="search-icon" src="https://tse1.mm.bing.net/th?id=OIP.1BQn4R8LUGn9phC_i0m5MAHaHa&pid=Api&P=0">
      </form>

  </div>    
<%-- filter form overs --%>


		<%
    Connection conn=null;
  	ResultSet rs=null;
  	Statement stmt=null;
  	Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/movieticket","root","");
  	stmt=conn.createStatement();
    String query = "Select * from addmovie where 1=1";
     

     String search_name = request.getParameter("name");
     String search_date = request.getParameter("releasedate");
     String search_theatrename = request.getParameter("theatrename");
     
       if(search_name!=null)
        {
         query= query + " AND `name` LIKE '%"+search_name+"%'";
        }
        if(search_date!=null)
        {
         query= query + " AND `releasedate` LIKE '%"+search_date+"%'";
        }
        if(search_theatrename!=null)
        {
         query= query + " AND `theatrename` LIKE '%"+search_theatrename+"%'";
        }
    rs=stmt.executeQuery(query);

    while(rs.next())
   {
      // getting image from database
    String fileName = rs.getString("image");
    if( fileName.lastIndexOf("\\") >= 0 )
    {
      fileName = fileName.substring( fileName.lastIndexOf("\\"));
    }
    else
    {
      fileName = fileName.substring( fileName.lastIndexOf("\\")+1);
    }
  %>
   <table>
     <tbody>
    
        <br>
        <br>
        
      <tr>
           <td rowspan = "1" style="padding-top: 7px; padding-left: 10px;"><img  class="image" src="addedimages<%=fileName%>" WIDTH = "225" HEIGHT = "160" BORDER="2"></td> 
         </tr> 


         <tr>
           <td style="padding-left: 310px;"><h3>Movie Name :</h3></td>
           <td><h4><%=rs.getString("name")%></h4></td>
         </tr>
          
          <tr>
           <td style="padding-left: 310px;"><h3>Theatre Name :</h3></td>
           <td><h4><%=rs.getString("theatrename")%></h4></td>
         </tr>

         <tr>
           <td style="padding-left: 310px;"><h3>Date :</h3></td>
           <td><h4><%=rs.getString("releasedate")%></h4></td>
         </tr>

         <tr>
           <td style="padding-left: 310px;"><h3>Director:</h3></td>
           <td><h4><%=rs.getString("director")%></h4></td>
         </tr>  


         <tr>
           <td style="width: 50%; padding-left: 310px;"><h3>Actor :</h3></td>
           <td><h4><%=rs.getString("actor")%></h4></td>
         </tr>

         <tr>
           <td style="width: 50%; padding-left: 310px;"><h3>Actress :</h3></td>
           <td><h4><%=rs.getString("actress")%></h4></td>
         </tr>

         <tr>
           <td style="width: 50%; padding-left: 310px;"><h3>Description :</h3></td>
           <td><h4><%=rs.getString("description")%></h4></td>
         </tr>

     </tbody>   
    </table>
    


         
 

<%
  }
 rs.close();
 stmt.close();
 conn.close();
%>

  </body>
</html>
