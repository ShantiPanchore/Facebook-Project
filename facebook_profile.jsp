<%-- 
    Document   : newjsp
    Created on : Jan 22, 2020, 11:49:45 AM
    Author     : user
--%>
<%@page import="java.io.InputStream"%>
<%@page import="javax.servlet.http.*"%>
<%@page import=" java.io.* "%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Facebook</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
</style>

 <style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the chat form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 23px;
  right: 28px;
  width: 280px;
}

/* The popup chat - hidden by default */
.chat-popup {
  display: none;
  position: fixed;
  bottom: 0;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px;
  padding: 10px;
  background-color: white;
}

/* Full-width textarea */
.form-container textarea {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
  resize: none;
  min-height: 200px;
}

/* When the textarea gets focus, do something */
.form-container textarea:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/send button */
.form-container .btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
</style>
        
        
        
<body class="w3-theme-l5">

<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  <a href="facebook_profile.jsp" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Logo</a>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="News"><i class="fa fa-globe"></i></a>
  <a href="find_friend.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Account Settings"><i class="fa fa-user"></i></a>
  <a href="msg2.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages"><i class="fa fa-envelope"></i></a>
  <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button w3-padding-large" title="Notifications"><i class="fa fa-bell"></i><span class="w3-badge w3-right w3-small w3-green">3</span></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="#" class="w3-bar-item w3-button">One new friend request</a>
      <a href="#" class="w3-bar-item w3-button">John Doe posted on your wall</a>
      <a href="#" class="w3-bar-item w3-button">Jane likes your post</a>
    </div>
  </div>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="My Account">
    <img src="/w3images/avatar2.png" class="w3-circle" style="height:23px;width:23px" alt="Facebook">
  </a>
 </div>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">My Profile</a>
</div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white">
        <div class="w3-container">
         <h4 class="w3-center">My Profile</h4>
         
         <style>
.fileContainer {
    overflow: hiddens;
    position: relative;
}
.fileContainer [type=file] {
    cursor: inherit;
    display: block;
    font-size: 999px;
    filter: alpha(opacity=0);
    min-height: 100%;
    min-width: 100%;
    opacity: 0;
    position: absolute;
    right: 0;
    text-align: right;
    top: 50;
    width: 80px;
    height: 80px;
}

         </style>
         
         <p class="w3-center">
             <form action="update_profile.jsp" method="post" name="form" enctype="multipart/form-data" >
         <label class ="fileContainer">
         <img src="img.jsp" class="w3-circle" style="height:106px;width:106px">
         <input name="photo" type="file"/>
         <input type="submit" value="update profile" class="w3-button w3-theme">
         
</label></form>
             </p>
         <hr>
     
      <br>  <div class="w3-card w3-round w3-white w3-padding-16 w3-center">
         <%
     
 Connection con3=null;

   try
      {
Class.forName("com.mysql.jdbc.Driver");
  con3=DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root","");

	Statement stmt1=con3.createStatement();
            String strQuery = "select accept_user from request_accept where name='"+(String)session.getAttribute("user")+"'";

	 ResultSet rs1 = stmt1.executeQuery(strQuery);
               
        int sno=0;
                while(rs1.next())
		{
	sno++;
          %>
           
          
      <div class="w3-card w3-round w3-white w3-center"  id="myForm">
        <div class="w3-container">
          <p>Friend Request Accept</p>
          <img src="image_3.jsp?sender_id=<%=rs1.getString(1)%>" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
         
        
            <span><%=rs1.getString(1)%></span>
           
          <div class="w3-row w3-opacity">
            
             <div class="w3-row w3-opacity">
            <div class="w3-half">
                <a href="msg1.jsp"><button class="w3-button w3-block w3-green w3-section" title="Accept" onclick="closeForm()"><i class="fa fa-check"></i></button></a>
            </div>
            <div class="w3-half">
              <button class="w3-button w3-block w3-red w3-section" title="Decline"><i class="fa fa-remove"></i></button>
            </div>
          </div>
          
          </div>
          
        </div>
               
      </div>
      <br>

         <%
                 
		

         }	
          rs1.close();
          con3.close();
	stmt1.close();
}	

	
 catch(Exception e1)
	{
		e1.getMessage();
	}
 
	%>   
        
          
      </div>
      <br>
        </div>
      </div>
      <br>
      
      <!-- Accordion -->
      <div class="w3-card w3-round">
        <div class="w3-white">
          <button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> My Groups</button>
          <div id="Demo1" class="w3-hide w3-container">
            <p>Some text..</p>
          </div>
          <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> My Events</button>
          <div id="Demo2" class="w3-hide w3-container">
            <p>Some other text..</p>
          </div>
          <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> My Photos</button>
          <div id="Demo3" class="w3-hide w3-container">
         <div class="w3-row-padding">
         <br>
           <div class="w3-half">
             <img src="/w3images/lights.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/mountains.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/forest.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/snow.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
         </div>
          </div>
        </div>      
      </div>
      <br>
      
      <!-- Interests --> 
      <div class="w3-card w3-round w3-white w3-hide-small">
        <div class="w3-container">
          <p>Interests</p>
          <p>
            <span class="w3-tag w3-small w3-theme-d5">News</span>
            <span class="w3-tag w3-small w3-theme-d4">W3Schools</span>
            <span class="w3-tag w3-small w3-theme-d3">Labels</span>
            <span class="w3-tag w3-small w3-theme-d2">Games</span>
            <span class="w3-tag w3-small w3-theme-d1">Friends</span>
            <span class="w3-tag w3-small w3-theme">Games</span>
            <span class="w3-tag w3-small w3-theme-l1">Friends</span>
            <span class="w3-tag w3-small w3-theme-l2">Food</span>
            <span class="w3-tag w3-small w3-theme-l3">Design</span>
            <span class="w3-tag w3-small w3-theme-l4">Art</span>
            <span class="w3-tag w3-small w3-theme-l5">Photos</span>
          </p>
        </div>
      </div>
      <br>
      
      <!-- Alert Box -->
      <div class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
        <span onclick="this.parentElement.style.display='none'" class="w3-button w3-theme-l3 w3-display-topright">
          <i class="fa fa-remove"></i>
        </span>
        <p><strong>Hey!</strong></p>
        <p>People are looking at your profile. Find out who.</p>
      </div>
    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7">
    
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">
                <form action="post.jsp" enctype="multipart/form-data" method="post" name="form1">
              <h6 class="w3-opacity">Social Media Post Image And Video</h6>
              <img src="img.jsp"  alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px"><br>
              <button type="submit" class="w3-button w3-theme"><i class="fa fa-pencil"></i>Post</button>
             
               <label class="fileContainer">
         <img src="gallery.png" class="w3-button w3-theme"></button>
         <input name="facebookphoto" type="file"/>
              </label>
                </form>
               
            </div>
          </div>
        </div>
      </div>
        
        
       
     <%
Connection con=null;

try{
Class.forName("com.mysql.jdbc.Driver");
 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root","");

	Statement stmt=con.createStatement();

                String strQuery = "select id,user,time from post order by id desc";

	ResultSet rs = stmt.executeQuery(strQuery);
                
        int sno=0;
                while(rs.next())
		{
	sno++;
	%>
        
       <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <img src="image_4.jsp?imgid=<%=rs.getString(2)%>" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
        <span class="w3-right w3-opacity"><%=rs.getString(3)%></span>
        <h4><%=rs.getString(2)%></h4>
         <br>
        <a href="image_1.jsp?imgid=<%=rs.getInt(1)%>">
            <img src="image_1.jsp?imgid=<%=rs.getInt(1)%>" width="500" height="500">
</a><hr class="w3-clear">
  <%
     
 Connection con8=null;

   try
      {
Class.forName("com.mysql.jdbc.Driver");
 con8=DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root","");

	Statement stmt1=con8.createStatement();
            String strQuery3 = "select * from command";

	 ResultSet rs3 = stmt1.executeQuery(strQuery3);
               
        int sno1=0;
                while(rs3.next())
		{
	sno1++;
          %>
           <img src="image_4.jsp?imgid=<%=rs3.getString(2)%>" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:20px">
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
      
        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom" onclick="openForm()"><i class="fa fa-comment"></i>Comment</button> 
<div class="chat-popup" id="myForm">
  <form action="command.jsp" class="form-container">
    <h1>Command</h1>

    <label for="msg"><b>Message</b></label>
    <textarea placeholder="Type message.." name="msg" required></textarea>

    <button type="submit" class="btn">Send</button>
    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
  </form>
</div>
      </div>  

           
            <%
		}
		rs.close();
		con.close();
		stmt.close();
	}
	catch(Exception e)
	{
		e.getMessage();
	}
	%>
      
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2">
      <div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container">
          <p>Upcoming Events:</p>
          <img src="/w3images/forest.jpg" alt="Forest" style="width:100%;">
          <p><strong>Holiday</strong></p>
          <p>Friday 15:00</p>
          <p><button class="w3-button w3-block w3-theme-l4">Info</button></p>
        </div>
      </div>
      <br>
    
      
          
      <%
     
 Connection con2=null;

   try
      {
Class.forName("com.mysql.jdbc.Driver");
 con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook","root","");

	Statement stmt1=con2.createStatement();
            String strQuery = "select sender_id from friend_request where reciver_id='"+(String)session.getAttribute("user")+"'";

	 ResultSet rs1 = stmt1.executeQuery(strQuery);
               
        int sno=0;
                while(rs1.next())
		{
	sno++;
          %>
           
          
      <div class="w3-card w3-round w3-white w3-center"  id="myForm">
        <div class="w3-container">
          <p>  Friend Request </p>
          <img src="image_3.jsp?sender_id=<%=rs1.getString(1)%>" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
         
        
            <span><%=rs1.getString(1)%></span>
           
          <div class="w3-row w3-opacity">
            <div class="w3-half">
                <a href="msg.jsp?name=<%=rs1.getString(1)%>"><button class="w3-button w3-block w3-green w3-section" title="Accept" onclick="closeForm()"><i class="fa fa-check"></i></button></a>
            </div>
            <div class="w3-half">
              <button class="w3-button w3-block w3-red w3-section" title="Decline"><i class="fa fa-remove"></i></button>
            </div>
          </div>
          
        </div>
               
      </div>
      <br>

         <%
                 
		

         }	
          rs1.close();
          con2.close();
	stmt1.close();
}	

	
 catch(Exception e1)
	{
		e1.getMessage();
	}
 
	%>   
        
        
       
      
    
      
      <div class="w3-card w3-round w3-white w3-padding-32 w3-center">
        <p><i class="fa fa-bug w3-xxlarge"></i></p>
      </div>
      
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>

<!-- Footer -->

 
<script>
// Accordion
function myFunction(id) {
  var x = document.getElementById(id);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
    x.previousElementSibling.className += " w3-theme-d1";
  } else { 
    x.className = x.className.replace("w3-show", "");
    x.previousElementSibling.className = 
    x.previousElementSibling.className.replace(" w3-theme-d1", "");
  }
}


// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}
</script>

<script>
            function openForm() {
  document.getElementById("myForm").style.display = "block";
}

function closeForm() {
  document.getElementById("myForm").style.display = "none";
}
        </script>

</body>
</html> 
