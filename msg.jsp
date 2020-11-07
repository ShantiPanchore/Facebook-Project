<%-- 
    Document   : msg
    Created on : Feb 10, 2020, 12:55:15 PM
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
        <title>JSP Page</title>
    </head>
    <body>
           <%
      if(request.getParameter("name")!=null && request.getParameter("name")!="")
      {        Connection con=null;
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root","");
        PreparedStatement p1=null;
        PreparedStatement p2=null;
         
        
        try
        {
             String user=(String)session.getAttribute("user");
            String first=request.getParameter("name");
            String s="insert into request_accept(name,accept_user) values(?,?)";
            p1=con.prepareStatement(s);
            p1.setString(1, first);
            p1.setString(2, user);
            String s1="delete from friend_request where sender_id='"+first+"'";
             p2=con.prepareStatement(s1);
              p2.executeUpdate();
            p1.executeUpdate();
           
                 
              %>
              <script>
                  alert("Request Accept")
                  window.location="facebook_profile.jsp";
                 
              </script>
        <%
        }
        
              catch(Exception e)
        {
          out.println("error on data"+e);  
        }
               }
        %>
       
        
        
    </body>
</html>
