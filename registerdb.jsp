<%-- 
    Document   : registerdb
    Created on : Jan 12, 2020, 10:12:06 AM
    Author     : user
--%>
<%@page import="java.io.InputStream"%>
<%@page import="javax.servlet.http.*"%>
<%@page import=" java.io.* "%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Facebook</title>
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
              Part filePart=request.getPart("photo");
              if(filePart!=null)
                                   {
                  out.println(filePart.getName());
                   out.println(filePart.getSize());
                    out.println(filePart.getContentType());
                    is=filePart.getInputStream(); 
            
            String first=request.getParameter("first_name");
            String last=request.getParameter("last_name");
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            String gender=request.getParameter("gender");
            String s="insert into register_facebook(first_name,last_name,email,password,gender,photo) values(?,?,?,?,?,?)";
            p1=con.prepareStatement(s);
            p1.setString(1, first);
            p1.setString(2, last);
            p1.setString(3, email);
            p1.setString(4, password);
            p1.setString(5, gender);
            p1.setBlob(6, is);
            p1.executeUpdate();
            out.println("Data Saved Succesfully");
                       }
              %>
              <script>
                  alert("Data Saved Succesfully");
                  window.location="login.jsp";
              </script>
        <%
        }
        
              catch(Exception e)
        {
          out.println("error on data"+e);  
        }
        %>
       
    </body>
</html>
