<%@ page import="java.sql.*"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>

<%
String filePath2Save="";
String fileName = "";
String fieldName = "";

String mname ="";
String theatrename="";
String releasedate ="";
String director ="";
String actor ="";
String actress = "";
String description = "";
String image = "";


File file ;
ServletContext context = pageContext.getServletContext();

String filePath ="D:\\Xampp\\tomcat\\webapps\\movieticket\\addedimages\\";

//Content type verification
String contentType = request.getContentType();

if ((contentType.indexOf("multipart/form-data") >= 0))
{
    DiskFileItemFactory factory = new DiskFileItemFactory();

 //File upload handler
 ServletFileUpload upload = new ServletFileUpload(factory);

 try {
    // Get the all file items via parsing the request.
    List fileItems = upload.parseRequest(request);

    // Iterate the uploaded file items
    Iterator i = fileItems.iterator();
    while ( i.hasNext () )
    {
     FileItem fi = (FileItem)i.next();
     if (fi.isFormField())
     {
        switch(fi.getFieldName())
        {
         case "name" :
               mname= fi.getString();
               break;
         case "theatrename" :
               theatrename= fi.getString();
               break;
         case "releasedate" :
               releasedate= fi.getString();
               break;
         case "director" :
               director= fi.getString();
               break;
         case "actor" :
               actor= fi.getString();
               break;
         case "actress" :
               actress = fi.getString();
               break;
         case "description" :
               description = fi.getString();
               break;
        }
      }
      else
      { 
                // Get the uploaded file parameters
                 fieldName = fi.getFieldName();
                 fileName = fi.getName();

                // Write the file
                if( fileName.lastIndexOf("\\") >= 0 ) {
                   file = new File( filePath +
                   fileName.substring( fileName.lastIndexOf("\\"))) ;
                } else {
                   file = new File( filePath +
                   fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                }
                fi.write( file ) ;
                out.println("Uploaded Filename: " + filePath + fileName + "<br>");
                filePath2Save = filePath+fileName;
              %>

    <%

      }

    }


 } 
 catch(Exception ex)
  {
  out.println(ex);
 }
} else
 {
 out.println("<html>");
 out.println("<head>");
 out.println("<title>Upload Failed</title>");
 out.println("</head>");
 out.println("<body>");
out.println("<p>No file uploaded</p>");
 out.println("</body>");
 out.println("</html>");
}

try
{

    Class.forName("com.mysql.jdbc.Driver").newInstance();

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movieticket","root","");
    PreparedStatement pst = conn.prepareStatement("INSERT INTO `addmovie` (`name`,`theatrename`, `releasedate`, `director`, `actor`, `actress`, `description`, `image`) VALUES (?,?,?,?,?,?,?,?)");


    pst.setString(1,mname);
    pst.setString(2,theatrename);
    pst.setString(3,releasedate);
    pst.setString(4,director);
    pst.setString(5,actor);
    pst.setString(6,actress);
    pst.setString(7,description);
    pst.setString(8,filePath2Save);

    int status = pst.executeUpdate();


    if(status!=0)
    {
      out.println("<h1>Success</h1>");
      response.sendRedirect("adminInterface.html");
    }
    else
    {
      out.println("<h1>NOT Successful</h1>");
      response.sendRedirect("addmovies.html");
    }


}
catch(Exception e)
{
      out.println("Exception :- "+e);
}
%>


