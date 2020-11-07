<%-- 
    Document   : friend_request
    Created on : Feb 7, 2020, 1:23:11 PM
    Author     : user
--%>

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
      if(request.getParameter("id")!=null && request.getParameter("id")!="")
      {
           
         
        Connection con2=null;
        Class.forName("com.mysql.jdbc.Driver");
        con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root","");
        PreparedStatement p1=null;
         
        try
            {
             
            String  id =request.getParameter("id");
            String user=(String)session.getAttribute("user");
           out.print(user);
            String s="insert into friend_request(sender_id,reciver_id) values(?,?)";
            
            p1=con2.prepareStatement(s);
            p1.setString(1, user);
            p1.setString(2, id);
            
         
            p1.executeUpdate();
            
           
            out.println("Request Send Are Succesfully");
            
                       
              %>
              <script>
                  alert("Request Send Are Succesfully");
                  window.location="find_friend.jsp";
              </script>
       
              
              
              <%
        }
        
          catch(Exception e3)
        {
          out.println("error on data"+e3);  
        }
        
       }
      %>
        
    </body>
</html>
