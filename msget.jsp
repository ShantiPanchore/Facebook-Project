<%-- 
    Document   : msget
    Created on : Feb 13, 2020, 3:24:07 PM
    Author     : user
--%>
<%@ page import="java.util.*" %>
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
             
        
            String user=(String)session.getAttribute("user");
            String time= ((new java.util.Date()).toLocaleString());
            String msg=request.getParameter("msg");
            out.print(msg);
            
            String name=(String)request.getParameter("h1");
            out.print(msg);
            out.print(name);
            String s="insert into message(sender,reciver,msg,time) values(?,?,?,?)";
            p1=con.prepareStatement(s);
            p1.setString(1, user);
            p1.setString(2, name);
            p1.setString(3, msg);
            p1.setString(4, time);
            p1.executeUpdate();            
              %>
              <script>
                  <%--alert("Message Send Succesfully");--%>
                  window.location="demo.jsp";
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
