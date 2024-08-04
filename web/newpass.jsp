<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE HTML>
<%
    if (request.getParameter("bSubmit") != null) {
        
        int x = 0; 
        String EMAIL = (String) session.getAttribute("EMAIL");
        String PASSWORD = request.getParameter("db_confirm_password");


        Connection con;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");
        pst = con.prepareStatement("UPDATE USERS SET PASSWORD =? WHERE EMAIL=?");
        pst.setString(1, PASSWORD);
        pst.setString(2, EMAIL);
      
        x = pst.executeUpdate();
        if(x>0){
            response.sendRedirect("http://localhost:8080/RENT_KARO/UserPasswordUpdateMail?EMAIL="+EMAIL);
        }
        
    }
%>
<html lang="en" >
    <html>
        <head>
            <title>New Password</title>
            <link rel="icon" href="IMAGE/Logo/Small Transparent.png" type="image/x-icon">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta charset="utf-8">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>  
            <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'> 
            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
            <style>
                @import url(https://fonts.googleapis.com/css?family=Roboto:300);

                .body{
                    background-image: url('https://ordinaryfaith.net/wp-content/uploads/2016/03/Gray-plain-website-background.jpg');
                    background-repeat: no-repeat;
                    background-size: cover;
                }

                /* Chrome, Safari, Edge, Opera */
                input::-webkit-outer-spin-button,
                input::-webkit-inner-spin-button {
                    -webkit-appearance: none;
                    margin: 0;
                }

                /* Firefox */
                input[type=number] {
                    -moz-appearance: textfield;
                }
                .login-page {
                    width: 360px;
                    padding: 8% 0 0;
                    margin: auto;

                }
                .form {
                    position: relative;
                    z-index: 1;
                    background: #48c9b0;
                    max-width: 360px;
                    margin: 0 auto 100px;
                    padding: 45px;
                    text-align: center;
                    box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);

                }
                .form input {
                    font-family: FontAwesome, "Roboto", sans-serif;
                    outline: 0;
                    background: #f2f2f2;
                    width: 100%;
                    border: 0;
                    margin: 0 0 15px;
                    padding: 15px;
                    box-sizing: border-box;
                    font-size: 14px;
                    border-radius:10px;

                }
                .form button {
                    font-family: "Titillium Web", sans-serif;
                    font-size: 14px;
                    font-weight: bold;
                    letter-spacing: .1em;
                    outline: 0;
                    background: #17a589;
                    width: 100%;
                    border: 0;
                    border-radius:30px;
                    margin: 0px 0px 8px;
                    padding: 15px;
                    color: #FFFFFF;
                    -webkit-transition: all 0.3 ease;
                    transition: all 0.3 ease;
                    cursor: pointer;
                    transition: all 0.2s;

                }
                .form button:hover,.form button:focus {
                    background: #148f77;
                    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
                    transform: translateY(-4px);
                }
                .form button:active {
                    transform: translateY(2px);
                    box-shadow: 0 2.5px 5px rgba(0, 0, 0, 0.2);
                }

                .form .message {

                    margin: 6px 6px;
                    color: #808080;
                    font-size: 11px;
                    text-align: center;
                    font-weight: bold;
                    font-style: normal;



                }
                .form .message a {
                    color: #FFFFFF;
                    text-decoration: none;
                    font-size: 13px;
                }
                .form .register-form {
                    display: none;
                }
                .container {
                    position: relative;
                    z-index: 1;
                    max-width: 300px;
                    margin: 0 auto;
                }
                .container:before, .container:after {
                    content: "";
                    display: block;
                    clear: both;
                }
                .container .info {
                    margin: 50px auto;
                    text-align: center;
                }
                .container .info h1 {
                    margin: 0 0 15px;
                    padding: 0;
                    font-size: 36px;
                    font-weight: 300;
                    color: #1a1a1a;
                }
                .container .info span {
                    color: #4d4d4d;
                    font-size: 12px;
                }
                .container .info span a {
                    color: #000000;
                    text-decoration: none;
                }
                .container .info span .fa {
                    color: #EF3B3A;
                }
                body {
                    background: #76b852; /* fallback for old browsers */
                    background: -webkit-linear-gradient(right, #76b852, #8DC26F);
                    background: -moz-linear-gradient(right, #76b852, #8DC26F);
                    background: -o-linear-gradient(right, #76b852, #8DC26F);
                    background: linear-gradient(to left, #76b852, #8DC26F);
                    font-family: "Roboto", sans-serif;
                    -webkit-font-smoothing: antialiased;
                    -moz-osx-font-smoothing: grayscale;    
                }
                #bSubmit:hover{
                    color: rgb(3, 141, 47);
                    background-color: #b1f580;
                }
                #bReset:hover{
                    color: rgb(255, 252, 252);
                    background-color: #e86a6a;
                }
                #bClose:hover{
                    color: rgb(252, 2, 2);
                    background-color: #ffffff;
                }
                input:hover{
                    box-shadow: 2px 2px 10px 2px lightgreen;
                }
                input:focus {
                    border-color: blue;
                    box-shadow: 0 1px 1px blue inset, 0 0 8px blue;
                    outline: 0 none;
                }
                /* The message box is shown when the user clicks on the password field */
                #message {
                    display:none;
                    background: transparent;
                    color: #000;
                    position: relative;
                    padding: 2px;
                }

                #message p {
                    padding: 1px 3px;
                    font-size: 16px;
                }

                /* Add a green text color and a checkmark when the requirements are right */
                .valid {
                    color: green;
                }

                .valid:before {
                    position: relative;
                    left: -5px;
                    content: "\2713";
                    font-weight: bold;
                }

                /* Add a red text color and an "x" when the requirements are wrong */
                .invalid {
                    color: red;
                }

                .invalid:before {
                    position: relative;
                    left: -5px;
                    content: "\2718";
                }

                input[type=checkbox]:hover {
                    box-shadow: none;
                    cursor: pointer;
                }
                input[type=checkbox]:focus {
                    box-shadow: none;
                }
            </style>
        </head>

        <body class="body">
            <div class="login-page">
                <div class="form">

                    <form method="POST" action="#">
                        <lottie-player src="https://assets4.lottiefiles.com/datafiles/XRVoUu3IX4sGWtiC3MPpFnJvZNq7lVWDCa8LSqgS/profile.json"  background="transparent"  speed="1"  style="justify-content: center;" loop  autoplay></lottie-player>

                        <div id="message">
                            <h3 style="font-size: 15px">Password Must Contain The Following :</h3>
                            <p id="letter" class="invalid">A <b>Small (Lowercase)</b> Letter [a-z]</p>
                            <p id="capital" class="invalid">A <b>Capital (Uppercase)</b> Letter [A-Z]</p>
                            <p id="number" class="invalid">A <b>Number </b>[0-9]</p>
                            <p id="length" class="invalid">Minimum <b>8 Characters</b></p>
                        </div>
                        <input type="password" id="password" name="db_password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" placeholder="Password" required>
                        <input type="password" id="confirm_password" name="db_confirm_password" placeholder="Confirm Password" oninput="validateConfirmPassword()" required>
                        <p id="showErrorPwd" style="font-style: oblique; color: red; margin-top: 1px;"> </p>
                        <i style="cursor: pointer" class="fas fa-eye" id="togglePassword"></i>
                        <br>
                        <br>
                        <button type="submit" id="bSubmit" name="bSubmit">Save</button>
                        <button type="reset" name="bReset" id="bReset"><i class="fa fa-refresh"></i> Reset</button>
                    </form>
                </div>
            </div>

            <script>

                function validateConfirmPassword() {

                    let pwd = document.getElementById("password").value;
                    let cpwd = document.getElementById("confirm_password").value;

                    if (cpwd != pwd) {
                        document.getElementById("showErrorPwd").innerHTML = "Password Not Match!!!";
                        return false;
                    } else {
                        document.getElementById("showErrorPwd").innerHTML = "";
                        return true;
                    }

                }

                const togglePassword = document.querySelector('#togglePassword');
                const password = document.querySelector('#password');
                const confirm_password = document.querySelector('#confirm_password');

                togglePassword.addEventListener('click', function (e) {
                    // toggle the type attribute
                    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                    password.setAttribute('type', type);
                    const type2 = confirm_password.getAttribute('type') === 'password' ? 'text' : 'password';
                    confirm_password.setAttribute('type', type);
                    // toggle the eye slash icon
                    this.classList.toggle('fa-eye-slash');
                });


                var myInput = document.getElementById("password");
                var letter = document.getElementById("letter");
                var capital = document.getElementById("capital");
                var number = document.getElementById("number");
                var length = document.getElementById("length");

                // When the user clicks on the password field, show the message box
                myInput.onfocus = function () {
                    document.getElementById("message").style.display = "block";
                }

                // When the user clicks outside of the password field, hide the message box
                myInput.onblur = function () {
                    document.getElementById("message").style.display = "none";
                }

                // When the user starts to type something inside the password field
                myInput.onkeyup = function () {
                    // Validate lowercase letters
                    var lowerCaseLetters = /[a-z]/g;
                    if (myInput.value.match(lowerCaseLetters)) {
                        letter.classList.remove("invalid");
                        letter.classList.add("valid");
                    } else {
                        letter.classList.remove("valid");
                        letter.classList.add("invalid");
                    }

                    // Validate capital letters
                    var upperCaseLetters = /[A-Z]/g;
                    if (myInput.value.match(upperCaseLetters)) {
                        capital.classList.remove("invalid");
                        capital.classList.add("valid");
                    } else {
                        capital.classList.remove("valid");
                        capital.classList.add("invalid");
                    }

                    // Validate numbers
                    var numbers = /[0-9]/g;
                    if (myInput.value.match(numbers)) {
                        number.classList.remove("invalid");
                        number.classList.add("valid");
                    } else {
                        number.classList.remove("valid");
                        number.classList.add("invalid");
                    }

                    // Validate length
                    if (myInput.value.length >= 8) {
                        length.classList.remove("invalid");
                        length.classList.add("valid");
                    } else {
                        length.classList.remove("valid");
                        length.classList.add("invalid");
                    }
                }
            </script>
        </body>
    </html>

