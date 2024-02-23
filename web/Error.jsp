<%-- 
    Document   : Error
    Created on : 16-Jan-2024, 7:23:34 pm
    Author     : HP
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    </head>
    <body>

        <div class="container p-3 text-center">
            
            <img style="width:600px; height: 500px;" src="Image/error.jpg" class="img-fluid" />
            <h1 class="display-3">Sorry! Something went Wrong...</h1>
            
            <p><%=exception%></p>
            
            <a href="SignUp.jsp" class="btn btn-outline-info">HomePage</a>
            
        </div>
        
        
        
        
        
        
    </body>
</html>
