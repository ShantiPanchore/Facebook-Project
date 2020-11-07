 <%-- 
 
    Document   : post
    Created on : Jan 31, 2020, 3:54:54 PM
    Author     : user
--%>

<%@ page import="java.util.*" %>
<%@page import="java.io.InputStream"%>
<%@page import="javax.servlet.http.*"%>
<%@page import=" java.io.* "%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
                
                 Connection con=null;
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root","");
        PreparedStatement p1=null;
         
        
        try
        {
            
            InputStream is=null;
              Part filePart=request.getPart("facebookphoto");
              if(filePart!=null)
                                   {
                  out.println(filePart.getName());
                   out.println(filePart.getSize());
                    out.println(filePart.getContentType());
                    is=filePart.getInputStream(); 
            
            String user=(String)session.getAttribute("user");
            String a= ((new java.util.Date()).toLocaleString());
            String s="insert into post(user,image,time) values(?,?,?)";
            p1=con.prepareStatement(s);
            p1.setString(1,user);
            p1.setBlob(2, is);
            p1.setString(3,a);
            p1.executeUpdate();
            %>
            <script>
                alert("postting Are Sucessfully")
                window.location="facebook_profile.jsp";
            </script>
        <%
                       }
        }
        
              catch(Exception e)
        {
          out.println("error on data"+e);  
        }
                %>
    </body>
</html>
