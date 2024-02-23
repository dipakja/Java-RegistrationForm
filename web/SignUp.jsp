<%-- 
    Document   : SignUp
    Created on : 08-Jan-2024, 7:15:17 pm
    Author     : dipak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorEx.jsp" %>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--adding Material css sdk-->
         <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            
        
    <style>
        body{
            
            background-image: url(./Image/Animated.jpg);
            background-size: cover;
            background-attachment: fixed;
            
        }
    </style>
        
    </head>
    <body >
       
        
        
<%@include file="navbar.jsp" %>
        

<div class="fixed-action-btn">
  <a class="btn-floating btn-large red">
    <i class="large material-icons person_pin">account_circle</i>
  </a>
  <ul>
    <li><a class="btn-floating red"><i class="material-icons">insert_chart</i></a></li>
    <li><a class="btn-floating yellow darken-1"><i class="material-icons">format_quote</i></a></li>
    <li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
    <li><a class="btn-floating blue"><i class="material-icons">attach_file</i></a></li>
  </ul>
</div>
        
        
        
  
        
        <!--container leaves the space 15% from left and right, the contain will be at center-->
        
        <div class="container" >
            
            <div class="row" >
                
                <div class="col m6 offset-m3">
                    
                    <div class="card">
                        <div class="card-content">
                            
                            <h3 style="text-align: center">Registration!!!</h3>
                            
                            <h5 id="msg" class="center-align"></h5>
                            
                            <div class="form center-align">
                                
                                <!--Creating the form-->
                                
                                <form action="backend" method="post" id="myform"  enctype="multipart/form-data">
                               
                            
                                    <input  type="text" name="user_name" placeholder="Enter user name" >

                                    
                                    
                                    <input  type="password" name="user_password" placeholder="Enter password" >

                                 
                                    
                                    <input  type="email" name="user_email" placeholder="Enter Email" >

                                   
                                    <br>
                                    <br>
                                  
                                    <!--imgage--> 
                                    
                            <div class="file-field input-field">
                                        <div class="btn yellow">
                                            <span>File</span>
                                            <input name="image" type="file">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text">
                                        </div>
                                    </div>
                                    
                                    
                                    <button type="submit" class="btn">Submit</button>
                                    
                                </form>
                            </div>
                            
                            <!--Loader Div-->
                           <!-- Add a loading spinner inside the loader div -->
                           <div class="loader center-align" style="margin-top: 12px; display: none">
                               <div class="preloader-wrapper big active">
                                   <div class="spinner-layer spinner-blue">
                                       <div class="circle-clipper left">
                                           <div class="circle"></div>
                                       </div>
                                       <div class="gap-patch">
                                           <div class="circle"></div>
                                       </div>
                                       <div class="circle-clipper right">
                                           <div class="circle"></div>
                                       </div>
                                   </div>
                               </div>
                               <h5>Please Wait!</h5>
                           </div>

                            
                            
                            
                            
                        </div>
                        
                        
                        
                    </div>
                    
                    
                </div>
                
                
                
                
            </div>
            
            
            
            
            
        </div>
        
        
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

   


<script>
$(document).ready(function () {
    $("#myform").on('submit', function (event) {
        event.preventDefault();

        // Use serialize method to construct FormData
        let f = new FormData($(this)[0]);

        // Hide form and show loader
        $(".form").hide();
        $(".loader").show();

        $.ajax({
            url: "backend",
            data: f,
            type: 'POST',
            processData: false, // Important: prevent jQuery from processing the data
            contentType: false, // Important: prevent jQuery from setting contentType
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                $(".loader").hide();

                if (data.trim() === 'done') {
                    $("#msg").html("Successfully Registered!!");
                    $('#msg').addClass('green-text');

                    // Reset the form after a short delay
                    setTimeout(function () {
                        $("#msg").html(""); // Clear success message
                        $('#msg').removeClass('green-text');
                        document.getElementById("myform").reset();
                        // Show the form after resetting
                        $(".form").show();
                    }, 3000); // 2000 milliseconds (2 seconds) delay before resetting the form
                } else {
                    $(".form").show(); // Show the form if there's an error
                    $("#msg").html("Something went wrong on the server!");
                    $('#msg').addClass('red-text');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(jqXHR.responseText);
                console.log(errorThrown);
                console.log("error.......");
                $(".loader").hide();
                $(".form").show();
                $("#msg").html("Something went wrong on the server!");
                $('#msg').addClass('red-text');
            },
        });
    });
});


  </script>


<!--  <script>
  document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.fixed-action-btn');
    var instances = M.FloatingActionButton.init(elems, {
      direction: 'left'
    });
  });
       
  </script>-->
  

  
  
  
    </body>
</html>
