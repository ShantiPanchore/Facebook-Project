<%-- 
    Document   : img
    Created on : Aug 16, 2019, 11:09:50 PM
    Author     : admin
--%>
<%@page import="java.io.InputStream"%>
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
           Connection con=null;
           PreparedStatement ps=null;
           ResultSet rs=null;
           String sql=null;
           
         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root","");
            Statement st=null;
            st = con.createStatement();
            sql="select photo from register_facebook where first_name='"+(String)session.getAttribute("user")+"'";
            rs=st.executeQuery(sql);
            String imaglen = "";
            while(rs.next())
                               {
                imaglen=rs.getString(1);
                int len=imaglen.length();
                byte[]  rb=new byte[len];
                InputStream reading=rs.getBinaryStream(1);
                int index=reading.read(rb, 0, len);
                response.reset();
                response.setContentType("image/jsp");
                response.getOutputStream().write(rb,0,len);
                response.getOutputStream().flush();
                
                
                
                
            }
            st.close();
       }
       catch(Exception e)
                             {
           System.out.println("Error"+e);
           
       }
       %>
    </body>
</html>
