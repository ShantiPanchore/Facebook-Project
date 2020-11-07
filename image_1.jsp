<%-- 
    Document   : image
    Created on : Jan 1, 2002, 6:59:43 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,java.io.*,java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>App Downloading</title>
       <%
String c =   "jdbc:mysql://localhost:3306/facebook";

if(request.getParameter("imgid")!=null && request.getParameter("imgid")!="")
{
int id =  Integer.parseInt(request.getParameter("imgid"));

String filename = "image"+id+".jpg";

Connection con=null;

	try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con=DriverManager.getConnection(c,"root","");
	Statement st1=con.createStatement();

String strQuery = "select image from post where id="+id;

		ResultSet rs1 = st1.executeQuery(strQuery);
		String imgLen="";
                if(rs1.next())
                {
	imgLen = rs1.getString(1);

	
int len = imgLen.length();//123456
                    
                        byte rb[] = new byte[len];//to create location in the array

	InputStream readImg = rs1.getBinaryStream(1);

int index=readImg.read(rb, 0, len);

 st1.close();
 response.reset();
response.setContentType("image/jpg");
response.setHeader("Content-disposition","attachment; filename=" +filename);

response.getOutputStream().write(rb,0,len);
response.getOutputStream().flush();
}
}
	catch (Exception e){
		e.printStackTrace();
	}
}
%>
