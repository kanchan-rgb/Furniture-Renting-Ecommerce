<%@page import="java.util.Base64"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="oracle.jdbc.OracleResultSetMetaData"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session = "true" %>

<%
    if (request.getParameter("submit") != null) {
        String NAME = request.getParameter("name");
        String EMAIL = request.getParameter("email");
        String ID = request.getParameter("ID");
        String PASSWORD = request.getParameter("password");
        String PH_NUMBER = request.getParameter("phnumber");
        String DOB = request.getParameter("birthday");
        int x = 0;

        Connection con;
        PreparedStatement pst, pst1, pst2, pst3, pst4, pst5, pst6;

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date dt = sdf.parse(DOB);
        SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MMM-yyyy");
        DOB = sdf1.format(dt);

        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");
        pst = con.prepareStatement("UPDATE USERS SET NAME = ?,EMAIL =?,DATE_OF_BIRTH =?,PH_NUMBER= ?,PASSWORD= ? where USER_ID = ?");
        pst.setString(1, NAME);
        pst.setString(2, EMAIL);
        pst.setString(3, DOB);
        pst.setString(4, PH_NUMBER);
        pst.setString(5, PASSWORD);
        pst.setString(6, ID);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            
            session.setAttribute("NAME", NAME);
            pst1 = con.prepareStatement("SELECT * FROM USERORDERS where USER_ID=?");
            pst1.setString(1, ID);
            ResultSet rs1 = pst1.executeQuery();
            while (rs1.next()) {

                pst2 = con.prepareStatement("UPDATE USERORDERS SET USER_NAME=?,USER_EMAIL=?,USER_PH_NUMBER=? where USER_ID=?");
                pst2.setString(1, NAME);
                pst2.setString(2, EMAIL);
                pst2.setString(3, PH_NUMBER);
                pst2.setString(4, ID);

                ResultSet rs2 = pst2.executeQuery();
            }

            pst3 = con.prepareStatement("SELECT * FROM USERADDRESS where USER_ID=?");
            pst3.setString(1, ID);
            ResultSet rs3 = pst3.executeQuery();
            while (rs3.next()) {

                pst4 = con.prepareStatement("UPDATE USERADDRESS SET USER_NAME=?,USER_EMAIL=?,USER_PH_NUMBER=? where USER_ID=?");
                pst4.setString(1, NAME);
                pst4.setString(2, EMAIL);
                pst4.setString(3, PH_NUMBER);
                pst4.setString(4, ID);

                ResultSet rs4 = pst4.executeQuery();
            }

            pst5 = con.prepareStatement("SELECT * FROM USERCART where USER_ID=?");
            pst5.setString(1, ID);
            ResultSet rs5 = pst5.executeQuery();
            while (rs5.next()) {

                pst6 = con.prepareStatement("UPDATE USERCART SET USER_NAME=?,USER_EMAIL=?,USER_PH_NUMBER=? where USER_ID=?");
                pst6.setString(1, NAME);
                pst6.setString(2, EMAIL);
                pst6.setString(3, PH_NUMBER);
                pst6.setString(4, ID);

                ResultSet rs6 = pst6.executeQuery();
            }


%>

<script>
    alert("Account Updated Successfully " + String.fromCodePoint(0x1F60A));
</script>
<%                  }
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MY ACCOUNT</title>
        <link rel="icon" href="IMAGE/Logo/Small Transparent.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />




        <style>
            body {
                background-image: url('IMAGE/Logo/Small Transparent back.png');
                opacity: 100;
                background-repeat: no-repeat;
                background-position-x: 50%;
                background-position-y: 10ch;
                background-size: 850px;

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

            .container{
                text-align: center;
            }
            .animate-charcter
            {
                text-transform: uppercase;
                background-image: linear-gradient(
                    -225deg,
                    #231557 0%,
                    #44107a 29%,
                    #ff1361 67%,
                    #fff800 100%
                    );
                background-size: auto auto;
                background-clip: border-box;
                background-size: 200% auto;
                color: #fff;
                background-clip: text;
                text-fill-color: transparent;
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                animation: textclip 5s linear infinite;
                display: inline-block;
                font-size: 30px;
            }

            @keyframes textclip {
                to {
                    background-position: 200% center;
                }
            }
            .form-label{
                display: inline-block;
                width: 170px;
                text-align: left;
                font-style: oblique;

                font-size: 20px;
            }
            .fild{
                padding: 14px;
            }
            input{
                padding: 5px;
                background:transparent;
                border:none;
                font-size: 17px;
                border-bottom: 1px solid black;
                outline: none;
            }
            #inputBirthday{
                width: 23.6ch;
            }

            input[type=text]:focus, textarea:focus {
                box-shadow: 0 3px 0 navy;
                padding: 3px 0px 3px 3px;
                border: none;
                border-bottom: 1px solid rgba(81, 203, 238, 1);
            }
            input[type=email]:focus, textarea:focus {
                box-shadow: 0 3px 0 navy;
                padding: 3px 0px 3px 3px;
                border: none;
                border-bottom: 1px solid rgba(81, 203, 238, 1);
            }
            input[type=date]:focus, textarea:focus {
                box-shadow: 0 3px 0 navy;
                padding: 3px 0px 3px 3px;
                border: none;
                border-bottom: 1px solid rgba(81, 203, 238, 1);
            }
            input[type=text]:hover, textarea:focus {
                box-shadow: 0 3px 1px rgb(248, 159, 15);
                padding: 3px 0px 3px 3px;
                border: none;
                border-bottom: 1px solid rgba(81, 203, 238, 1);
            }
            input[type=email]:hover, textarea:focus {
                box-shadow: 0 3px 1px rgb(248, 159, 15);
                padding: 3px 0px 3px 3px;
                border: none;
                border-bottom: 1px solid rgba(81, 203, 238, 1);
            }
            input[type=date]:hover, textarea:focus {
                box-shadow: 0 3px 1px rgb(248, 159, 15);
                padding: 3px 0px 3px 3px;
                border: none;
                border-bottom: 1px solid rgba(81, 203, 238, 1);
            }
            #submin_bttn{
                padding: 5.7px;
                margin-top: 40px;
                margin-left: 16ch;
                border-radius: 10px;
                background-color: green;
                font-size: 16px;
                color: white;
                text-align: center;
                border: none;
                cursor: pointer;
            }
            #submin_bttn:hover{
                padding: 6px;
                margin-top: 40px;
                margin-left: 16ch;
                border-radius: 10px;
                background-color: #17a589;
                font-size: 16px;
                color: white;
                text-align: center;
                box-shadow: 2px 2px 4px #17a589;
                border: none;
            }
            #bReset{
                padding: 5.7px;
                margin-top: 40px;
                margin-left: 1ch;
                width: 100px;
                border-radius: 10px;
                background-color: red;
                font-size: 16px;
                color: white;
                text-align: center;
                border: none;
                cursor: pointer;
            }
            #bReset:hover{
                padding: 5.7px;
                margin-top: 40px;
                margin-left: 1ch;
                width: 100px;
                border-radius: 10px;
                background-color: #ff1361;
                font-size: 16px;
                color: white;
                text-align: center;
                border: none;
                cursor: pointer;
                box-shadow: 2px 2px 4px crimson;
            }
            #bBack{
                padding: 5.7px;
                margin-top: 40px;
                margin-left: 1ch;
                width: 100px;
                border-radius: 10px;
                background-color: navy;
                font-size: 16px;
                color: white;
                text-align: center;
                border: none;
                cursor: pointer;
            }
            #bBack:hover{
                padding: 5.7px;
                margin-top: 40px;
                margin-left: 1ch;
                width: 100px;
                border-radius: 10px;
                background-color: royalblue;
                font-size: 16px;
                color: white;
                text-align: center;
                border: none;
                cursor: pointer;
                box-shadow: 2px 2px 4px blue;
            }

            .profile_photo{
                display: inline-block;
                color: white;
                width: 200px;
                line-height: 2.2em;
                padding: 0 0.62em;
                border: 1px solid #666;
                border-radius: 8px;
                background-color: navy;
                box-shadow: inset 0 0 0.1em #fff, 0.2em 0.2em 0.2em rgba( 0, 0, 0, 0.3 );
                font-family: arial, sans-serif;
                font-size: 0.8em;
                cursor: pointer;
                margin-bottom: 20px;
            }

            .profile_photo:hover {
                border-color: #3c7fb1;
                color: black;
                background-image: linear-gradient( to bottom, #fff, #a9dbf6 );
            }
            #submit{
                margin-top: 13px;
                margin-left: 10px;
                background-color: #09841B;
                box-shadow: inset 0 0 0.1em #fff, 0.2em 0.2em 0.2em rgba( 0, 0, 0, 0.3 );
                color: white;
                border: none;
                border-radius: 8px;
                width: 80px;
                font-size: 13px;
                padding: 4px;
                cursor: pointer;
            }
            #submit:hover{
                color: black;
                background-image: linear-gradient( to bottom, #fff, #90EE90 );
            }
        </style>
    </head>
    <body>
        <div class="container">
            <!-- Account page navigation-->

            <hr class="mt-0 mb-4">
            <div class="row">
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">


                    </div>
                </div>
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <h3 class="animate-charcter">Account Details</h3>
                        <%                        Connection con;
                            PreparedStatement pst, ops, ops2;
                            ResultSet rs, rs2;

                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");

                            String userID = (String) session.getAttribute("USER_ID");

                            pst = con.prepareStatement("SELECT NAME,PROFILE_PHOTO,EMAIL,USER_ID,TO_CHAR(DATE_OF_BIRTH,'YYYY-MM-DD')AS DOB,PH_NUMBER,PASSWORD FROM USERS WHERE USER_ID=?");
                            pst.setString(1, userID);

                            rs = pst.executeQuery();

                            if (rs.next()) {
                                String USER_ID = rs.getString("USER_ID");
                                byte[] imageData = rs.getBytes("PROFILE_PHOTO");


                        %>
                        <div class="card-body text-center">
                            <%                                if (imageData != null) {
                                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                                    request.setAttribute("base64Image", base64Image);
                            %>
                            <td> <img id="preview" style="border-radius: 100px" width="120px" height="120px" src="data:image/jpeg/png/jpg;base64,${base64Image}"/></td>
                                <%
                                } else {
                                %>
                            <td> <img id="preview" width="120px" height="120px" src="IMAGE/Default.png"/></td>
                                <%
                                    }
                                %>
                        </div>
                        <div>
                            <form  method="POST" action="http://localhost:8080/RENT_KARO/MyAccountUpdate" enctype="multipart/form-data">
                                <input class="form-control" id="inputFirstName" type="hidden" name="ID" value="<%= rs.getString("USER_ID")%>" required>
                                <input type="file" id="fileInput" style="display: none" name="db_image" accept="image/png,image/jpg, image/jpeg" onchange="previewImage(event)" required>
                                <label class="profile_photo" for="fileInput">UPLOAD PROFILE IMAGE</label>
                                <button type="submit" id="submit">Save</button>
                            </form>
                            <script>
                                function previewImage(event) {
                                    var input = event.target;
                                    var image = document.getElementById('preview');
                                    var UploadFieldID = "fileInput";
                                    var MaxSizeInBytes = 16177215;
                                    var fld = document.getElementById(UploadFieldID);
                                    if (fld.files && fld.files.length == 1 && fld.files[0].size > MaxSizeInBytes)
                                    {
                                        alert("The file size must be no more than " + parseInt(MaxSizeInBytes / 1024 / 1024) + "MB");

                                    } else {
                                        if (input.files && input.files[0]) {
                                            var reader = new FileReader();
                                            reader.onload = function (e) {
                                                image.src = e.target.result;
                                                image.style.width = "150px";
                                                image.style.height = "150px";
                                            }
                                            reader.readAsDataURL(input.files[0]);
                                        }
                                    }
                                }
                            </script>
                        </div>
                        <div class="card-body">
                            <form>




                                <!-- Form Row-->
                                <div class="box">
                                    <!-- Form Group (first name)-->
                                    <div class="fild">
                                        <label class="form-label" for="inputFirstName"><b>Name </b></label>
                                        <input class="form-control" id="inputFirstName" type="text" name="name" value="<%= rs.getString("NAME")%>" required>
                                        <input class="form-control" id="inputFirstName" type="hidden" name="ID" value="<%= rs.getString("USER_ID")%>" required>
                                    </div>
                                </div>
                                <!-- Form Row        -->

                                <!-- Form Group (email address)-->
                                <div class="fild">
                                    <label class="form-label" for="inputEmailAddress"><b>Email </b></label>
                                    <input class="form-control" id="inputEmailAddress" type="email" name="email" value="<%= rs.getString("EMAIL")%>" required>
                                </div>
                                <div class="fild">
                                    <label class="form-label" for="inputEmailAddress"><b>Password </b></label>
                                    <input class="form-control" id="inputEmailAddress" type="text" name="password" value="<%= rs.getString("PASSWORD")%>" required>
                                </div>
                                <!-- Form Row-->
                                <div class="box">
                                    <!-- Form Group (phone number)-->
                                    <div class="fild">
                                        <label class="form-label" for="inputPhone"><b>Phone Number</b></label>
                                        <input class="form-control" id="inputPhone" type="text" pattern="\d*" maxlength="10" name="phnumber" value="<%= rs.getString("PH_NUMBER")%>" required>
                                    </div>
                                    <!-- Form Group (birthday)-->
                                    <div class="fild">
                                        <label class="form-label" for="inputBirthday"><b>Birthday</b></label>
                                        <input class="form-control" id="inputBirthday" value="<%= rs.getString("DOB")%>" type="date" name="birthday">
                                    </div>
                                </div>
                                <!-- Save changes button-->
                                <button type="button" name="bReset" id="bBack" onclick="window.location.href = 'http://localhost:8080/RENT_KARO/after_main_index.jsp'"><i class="fa fa-arrow-left"></i> Back</button>
                                <button type="reset" name="bReset" id="bReset"><i class="fa fa-refresh"></i> Reset</button>
                                <button class="btn btn-primary" id="submin_bttn" type="submit" name="submit" value="submit">Save changes</button>
                                <% }%>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
