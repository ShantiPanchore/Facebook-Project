<%-- 
    Document   : forget_password
    Created on : Jan 26, 2020, 11:46:05 AM
    Author     : user
--%>
<%@page import ="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Facebook</title>
    <style>
            body{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            .container
            {
                height: 130vh;
                width: 100%;
                background: #e9ebee;
            }
            .header{
                width: 100%;
                height: 100px;
                background: #3b5998;
            }
            .header img{
                
                width: 20%;
                height: 50%;
                margin-left: 13%;
                margin-top: 30px;
                    
            }
            .sign-btm{
                background: #42b72a;
                border: 0;
                width: 67px;
                height: 27px;
                color: #fff;
                border-radius: 3px;
                opacity: 0.9;
            
            }
            .sign-btm{
                opacity: 1;
            }
            .box{
                position: absolute;
                top:30%;
                left: 30%;
                height: 284px;
                width: 614px;
                background: #fff;
                text-align: center;
                display: inline-block;
                    
            }
            .box h5{
                font-size: 25px;
                text-align: center;
            }
            .txt-mail, .txt-pass{
                width: 300px;
                height: 30px;
                display: block;
                margin-left: 150px;
                border: 1px solid #dddfe2;
                margin-bottom: 10px;
            }
            input[type=text]
            {
                padding-left: 15px;
            }
            .txt-btn{
                width: 310px;
                height: 50px;
                border: 0;
                background: #3b5998;
                color: #fff;
                font-weight: bold;
                margin-bottom: 10px;
                opacity: 0.9;
                
            }
            .txt-btn:hover{
                opacity: 1;
                
            }
            .box-links a{
                text-decoration: none;
                color: #3b5998;
                
            }
            .box-links a:hover{
                text-decoration: underline;
            }
        </style>
        <script>
             function check()
             {
                 if(document.form1.user.value=="")
                     {
                         alert("Please Enter Your User Name :");
                        form1.user.focus();
                        return (false);
                     }
                  if(document.form1.pass.value=="")
                     {
                         alert("Please Enter Your Password :");
                        form1.pass.focus();
                        return (false);
                     }  
                   return true;  
        </script>
    </head>
    
    <body>
        
         <%
         if(request.getParameter("check")!=null)
                         {
        String user=request.getParameter("user");
        String pass=request.getParameter("pass");
        session.setAttribute("user",user);
         try{
           
            Connection con=null;
            Class.forName("com.mysql.jdbc.Driver");
            String jdbcurl="jdbc:mysql://localhost:3306/facebook";
            con=DriverManager.getConnection(jdbcurl,"root","");
            PreparedStatement ps=null;
            ResultSet rs=null;
            String sql=null;
            sql="select * from register_facebook where first_name='"+user+"'and password='"+pass+"'";
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            if(rs.next())
            {
             %> 
             <script>
                 alert('you want to change password');
                 window.location.href='change_password.jsp';
             </script>
        
        
        <%   
            }
                       else
                       {
                  out.print(" <script>alert('you account not found');</script");
                     out.print(" <script>alert( window.open('register.jsp');</script>");                      
               
                       }
            }
         catch(Exception e)
         {
             out.print(e);
         }
         }
         
        %>
         
        <div class="container">
            <div class="header">
                <img src="img.png" height="30%" width="20%">
                <button class="sign-btm">sign up</button>
                
            </div>
            <div class="box">
                <h5>Forget Password</h5>
                <form action="forget_password.jsp" method="post" onsubmit="function check()" name="form1">
                <input type="text" class="txt-mail" placeholder="User Name" name="user">
                 <input type="text" class="txt-pass" placeholder="Password" name="pass">
                 <input type="submit" class="txt-btn" value="check" name="check">
                  
                 <div class="box-links">
                    <a href="login.jsp">Log In</a>
                     <a href="register.jsp">Sign Up For Facebook</a>
                </form>   
                 </div>
            </div>
            
        </div>
    </body>
</html>
