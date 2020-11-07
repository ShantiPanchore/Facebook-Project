<%-- 
    Document   : forgetdb
    Created on : Jan 26, 2020, 11:52:17 AM
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
      String new1=request.getParameter("new");
       Class.forName("com.mysql.jdbc.Driver");
       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root","");
        PreparedStatement ps=null;
            ResultSet rs=null;
            String sql=null;
           sql="update register_facebook set password='"+new1+"'where first_name='"+user+"'";
           ps=con.prepareStatement(sql);
           int p1=0;
           p1=ps.executeUpdate();
           if(p1>0)
               
            {
               %>
                <script>
                 
                 window.location.href='success.jsp';
             </script>
         <%
           }
           else
           {
               %>
          <script>
                 alert('new password not set succufullly');
                 window.location.href='register.jsp';
             </script>
             <%
               
           }
            
             }
       catch(Exception e)
        {
           out.print(e);
       }
       %>
       
    </body>
</html>
