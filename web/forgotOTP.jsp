<%-- 
    Document   : forgotOTP
    Created on : 30 Oct, 2023, 9:24:26 PM
    Author     : atrib
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="oracle.jdbc.OracleResultSetMetaData"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en" >
    <html>
        <head>
            <title>Forgot Password OTP</title>
            <link rel="icon" href="IMAGE/Logo/Small Transparent.png" type="image/x-icon">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta charset="utf-8">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" type="text/css" href="CSS/forgot.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>  
            <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'> 
            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
        </head>

        <body class="body">
            <div class="login-page">
                <div class="form">

                    <form method="POST" action="#">
                        <lottie-player src="https://assets4.lottiefiles.com/datafiles/XRVoUu3IX4sGWtiC3MPpFnJvZNq7lVWDCa8LSqgS/profile.json"  background="transparent"  speed="1"  style="justify-content: center;" loop  autoplay></lottie-player>
                        <input type="text" pattern="\d*" maxlength="6" name="Fotp" placeholder="Enter Your OTP" required>
                        <br>
                        <p id="invalid"></p>

                        <button type="submit" id="bSubmit" name="bSubmit">Verify</button>
                        <button type="reset" name="bReset" id="bReset"><i class="fa fa-refresh"></i> Reset</button>

                        <button type="button" name="bClose" id="bClose" onclick="window.href = 'http://localhost:8080/RENT_KARO/forgot.html'"><i class="fa fa-arrow-left"></i> Back</button>
                    </form>
                </div>
            </div>

            <%
                String OTP = (String) session.getAttribute("OTP");
                
                if (request.getParameter("bSubmit") != null) {
                    
                    String uOTP = request.getParameter("Fotp");
                    if (OTP.equals(uOTP)) {
                        response.sendRedirect("http://localhost:8080/RENT_KARO/newpass.jsp");
                    } else {


            %>
            <script>

                var error = document.getElementById("invalid")

                // Changing content and color of content
                error.textContent = "INVALID OTP"
                error.style.color = "red"
                timeout = setTimeout(alertFunc, 2000);



                function alertFunc() {
                    window.location.href = "forgot.html";
                }
            </script>
            <%            }
                }
            %>
        </body>
    </html>

