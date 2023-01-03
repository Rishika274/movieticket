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

String name ="";
String email =""; 
String address = "";
String city = "";
String state ="";
String zipcode ="";
String contactNumber ="";
String addService = "";
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
               name= fi.getString();
               break;
         case "email" :
               email= fi.getString();
               break;
         case "address" :
               address= fi.getString();
               break;
         case "city" :
               city= fi.getString();
               break;
         case "state" :
               state= fi.getString();
               break;
         case "zip" :
               zipcode = fi.getString();
               break;
         case "contactNumber" :
               contactNumber = fi.getString();
               break;
        case "addServices" :
               addService = fi.getString();
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
    PreparedStatement pst = conn.prepareStatement("INSERT INTO `addtheatres` (`id`,`name`, `email`,`address`,  `city`, `state`, `zip`, `contactNumber`, `addServices`, `image`)  VALUES (default,?,?,?,?,?,?,?,?,?)");

    pst.setString(1,name);
    pst.setString(2,email);
    pst.setString(3,address);
    pst.setString(4,city);
    pst.setString(5,state);
    pst.setString(6,zipcode);
    pst.setString(7,contactNumber);
    pst.setString(8,addService);
    pst.setString(9,filePath2Save);
   
    int status = pst.executeUpdate();

    if(status!=0)
    {
      response.sendRedirect("adminInterface.html");
    }
    else
    {
      response.sendRedirect("addtheatres.html");
    }


}
catch(Exception e)
{
      out.println("Exception :- "+e);
}
%>