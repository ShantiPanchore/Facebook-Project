<%-- 
    Document   : update_profile
    Created on : Jan 30, 2020, 1:18:14 PM
    Author     : user
--%>
<%@page import ="java.sql.*"%>
<%@page import="java.io.InputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String user=(String)session.getAttribute("user");
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root","");
        PreparedStatement p1=null;
        String s=null;
        try{
            InputStream inputStream=null;
            
            Part filepart=request.getPart("photo");
           
            if(filepart!=null)
                 
                               {
                inputStream=filepart.getInputStream();
               
                s="update register_facebook set photo=? where first_name='"+user+"'";
                 
                p1=con.prepareStatement(s);
               
                p1.setBlob(1,inputStream);
                 out.print("helllo");
                int u=p1.executeUpdate();
               
                if(u==1)
                                       {
                    %>
                    <script>
                        alert("Update Profile");
                        window.location="facebook_profile.jsp";
                    </script>
                  <%
                    
                }
                               else{
                    out.print("Error");
                               }
            }
            
        }
        catch(Exception e)
                               {
            out.print("error"+e);
        }
                %>
    </body>
</html>
