<%-- 
    Document   : newjsp
    Created on : Jan 11, 2020, 8:20:12 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Facebook Registration</title>
         <script>
             function check()
             {
                 if(document.form1.first_name.value=="")
                     {
                         alert("Please Enter Your First Name :");
                        form1.first_name.focus();
                        return (false);
                     }
                  if(document.form1.last_name.value=="")
                     {
                         alert("Please Enter Your last Name :");
                        form1.last_name.focus();
                        return (false);
                     }  
                   if(document.form1.email.value=="")
                     {
                         alert("Please Enter Your Email :");
                        form1.email.focus();
                        return (false);
                     }  
                   if(document.form1.password.value=="")
                     {
                         alert("Please Enter Your Passord :");
                        form1.password.focus();
                        return (false);
                     }    
                   if((document.form1.gender[0].checked==false)&&(document.form1.gender[1].checked==false))
                     {
                         alert("Please Enter Your gender :");
                        form1.gender.focus();
                        return (false);
                     }  
                     return (true);
             }
         </script>
       
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
                height: 80px;
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
                height: 600px;
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
            .r-b{
	font-size:12px;
	height:15px;
	width:15px;
}
        </style>
       
    </head>
    <body>
          <div class="container">
            <div class="header">
                <img src="img.png" height="10%" width="10%">
                <button class="sign-btm">sign up</button>
                
            </div>
            <div class="box">
                <h5>Registration  To Facebook</h5>
                <form action="registerdb.jsp" method="post" name="form1" enctype="multipart/form-data" onsubmit="return check();">
                 <input placeholder="First Name" type="text" class="txt-mail" name="first_name" />
		<input placeholder="Last Name" type="text" class="txt-mail" name="last_name" /> <br>
		<input placeholder="Emai" type="text" class="txt-mail" name="email" /><br>
		<input placeholder="Password" type="password" class="txt-mail" name="password" /><br>
                <input placeholder="Password" type="file" class="txt-mail" name="photo" /><br>
		
		<input type="radio"   value="male" class="r-b" name="gender"/>Male
		<input type="radio"   value="female" class="r-b" name="gender"/>Female<br><br>
				
                <input type="submit" class="txt-btn" value="Create Account">
				<br><hr>
				
                
                 <div class="box-links">
                     <a href="#">Forget Account?</a>
                     <a href="#">Sign Up For Facebook</a>
                   </form>  
                 </div>
            </div>
            
        </div>
    </body>
</html>
