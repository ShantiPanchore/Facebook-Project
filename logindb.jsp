<%-- 
    Document   : logindb
    Created on : Jan 13, 2020, 6:35:36 PM
    Author     : user
--%>
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
        try{
        String user=request.getParameter("user");
        String pass=request.getParameter("pass");
        out.print(user);
        out.print(pass);
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root","");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from register_facebook where first_name='"+user+"' and password='"+pass+"'");
         if(rs.next())
         {
             session.setAttribute("user", user);
             response.sendRedirect("facebook_profile.jsp");
         } 
        else{
    %>
        <script>
            alert("Invalid Login Please Try Again!!");
            window.location="login.jsp";
        </script>
        <%
            
        }}
catch(Exception  e)
        
  {
    out.println(e.toString());
       }
                                                 
        %>
    </body>
</html>
