<%-- 
    Document   : newjsp
    Created on : Mar 12, 2020, 12:14:45 PM
    Author     : user
--%>
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
     
 Connection con8=null;

   try
      {
Class.forName("com.mysql.jdbc.Driver");
 con8=DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root","");

	Statement stmt1=con8.createStatement();
            String strQuery = "select * from command";

	 ResultSet rs3 = stmt1.executeQuery(strQuery);
               
        int sno=0;
                while(rs3.next())
		{
	sno++;
          %>
           
          <p><%=rs3.getString(3)%></p>    
      
         <%
                 
		

         }	
          rs3.close();
          con8.close();
	stmt1.close();
}	

	
 catch(Exception e1)
	{
		e1.getMessage();
	}
 
	%>   
    </body>
</html>
