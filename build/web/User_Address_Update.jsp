<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<!DOCTYPE html>
<%
    if (request.getParameter("submit") != null) {
        String NAME = request.getParameter("NAME");
        String PHONE_NUMBER = request.getParameter("PHONE_NUMBER");
        String ALTERNATIVE_PHONE_NUMBER = request.getParameter("ALTERNATIVE_PHONE_NUMBER");
        String ZIPCODE = request.getParameter("ZIPCODE");
        String STATE = request.getParameter("STATE");
        String CITY = request.getParameter("CITY");
        String HOUSE_BUILDING_NO = request.getParameter("HOUSE_BUILDING_NO");
        String ROAD_AREA_COLONY_NAME = request.getParameter("ROAD_AREA_COLONY_NAME");
        String LANDMARK = request.getParameter("LANDMARK");
        String USER_ADDRESS_ID = request.getParameter("USER_ADDRESS_ID");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");
        pst = con.prepareStatement("UPDATE USERADDRESS SET NAME =?,PHONE_NUMBER =?,ALTERNATIVE_PHONE_NUMBER=?,ZIPCODE=?,STATE=?,CITY=?,HOUSE_BUILDING_NO=?,ROAD_AREA_COLONY_NAME=?,LANDMARK=? where USER_ADDRESS_ID=?");
        pst.setString(1, NAME);
        pst.setString(2, PHONE_NUMBER);
        pst.setString(3, ALTERNATIVE_PHONE_NUMBER);
        pst.setString(4, ZIPCODE);
        pst.setString(5, STATE);
        pst.setString(6, CITY);
        pst.setString(7, HOUSE_BUILDING_NO);
        pst.setString(8, ROAD_AREA_COLONY_NAME);
        pst.setString(9, LANDMARK);
        pst.setString(10, USER_ADDRESS_ID);
        pst.executeUpdate();

%>
<script>
    window.location.href = "User_Address_Page.jsp";
</script>
<%        }

%>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Your Address Details</title> 
        <link rel="icon" href="IMAGE/Logo/Small Transparent.png" type="image/x-icon">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <style>
            @import url(https://fonts.googleapis.com/css?family=Roboto:300);
            /* Chrome, Safari, Edge, Opera */
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
            input:hover{
                border-bottom: 5px solid green;
            }
            input:focus {
                border-bottom: 5px solid blue;

                outline: 0 none;
            }
            body{
                background:linear-gradient(90deg, lightsalmon, white, lightgreen);
            }
            .form-label{
                display: inline-block;
                width: 200px;
                font-size: 20px;
                text-align: left;
            }
            .fild{
                padding: 20px;
            }
            .but{
                position: relative;

            }
            input{
                padding: 8px;
                width: 60%;
                font-size: 18px;
                border: none;
                background: none;
                color: darkblue;
                outline: none;
                border-bottom: 1px solid black;
            }
            .submit{
                background-color: green;
                width: 40%;
                border: none;
                font-size: 18px;
                color: white;
                margin-left: 10px;
                cursor: pointer;
                padding: 2ch;
                border-radius: 20px;
            }
            .submit:hover{
                background-color: rgba(34, 116, 1, 0.778);
                width: 40%;
                border: none;
                font-size: 20px;
                color: white;
                margin-left: 10px;
                cursor: pointer;
                padding: 2ch;
                border-radius: 20px;
            }
            .reset{
                background-color: red;
                width: 40%;
                border: none;
                font-size: 18px;
                color: white;
                margin-left: 10px;
                cursor: pointer;
                padding: 2ch;
                border-radius: 20px;
            }
            .reset:hover{
                background-color: rgb(200, 64, 64);
                color: white;
                font-size: 20px;
                border: none;
                margin-left: 10px;
                cursor: pointer;
                box-shadow: 1px 1px 3px black;
            }
            .back{
                background-color: darkred;
                width: 40%;
                color: white;
                border: none;
                font-size: 18px;
                margin-left: 10px;
                cursor: pointer;
                padding: 2ch;
                border-radius: 20px;
            }
            .back:hover{
                background-color: rgb(165, 62, 83);
                color: white;
                font-size: 20px;
                margin-left: 10px;
                border: none;
                cursor: pointer;
                box-shadow: 1px 1px 3px black;
            }
        </style>

    </head>
    <body>
        <fieldset style="border: none">
            <legend style="text-align: center;font-size: 30px"><b>Update Your Address</b></legend>



            <div class="row">
                <div class="col-sm-4">
                    <form  method="POST" action="#" >

                        <%  Connection con;
                            PreparedStatement pst;
                            ResultSet rs;

                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");

                            String USER_ADDRESS_ID = request.getParameter("USER_ADDRESS_ID");

                            pst = con.prepareStatement("SELECT * FROM USERADDRESS WHERE USER_ADDRESS_ID=?");
                            pst.setString(1, USER_ADDRESS_ID);
                            rs = pst.executeQuery();

                            while (rs.next()) {
                                String LANDMARK = rs.getString("LANDMARK");
                                String ALTERNATIVE_PHONE_NUMBER = rs.getString("ALTERNATIVE_PHONE_NUMBER");

//                                if (LANDMARK == null || ALTERNATIVE_PHONE_NUMBER == null) {
//                                    LANDMARK = "";
//                                    ALTERNATIVE_PHONE_NUMBER = "";
//                                }

                        %>
                        <center>
                            <br>
                            <br>
                            <div class="fild">
                                <label  class="form-label">Name :</label>
                                <input type="text" class="form-control" placeholder="Name" value="<%= rs.getString("NAME")%>" name="NAME"  required >
                            </div>

                            <div class="fild">
                                <input type="hidden" class="form-control" placeholder="EMAIL" name="USER_ADDRESS_ID" value="<%= rs.getString("USER_ADDRESS_ID")%>"  required >
                            </div>
                            <p id="showErrorPhno" style="font-style: oblique; color: red; margin-top: 1px;"> </p>
                            <div class="fild">
                                <label class="form-label">Phone Number :</label>
                                <input type="text" class="form-control" oninput="validatePhoneNumber()" placeholder="PHONE NUMBER" id="number" name="PHONE_NUMBER" value="<%= rs.getString("PHONE_NUMBER")%>" required >
                            </div>

                            <div class="fild">
                                <label class="form-label">Alternative Phone Number :</label>
                                <%
                                    if (ALTERNATIVE_PHONE_NUMBER == null) {
                                %>
                                <input type="text" class="form-control"  placeholder="ALTERNATIVE PHONE" id="altnumber" name="ALTERNATIVE_PHONE_NUMBER">

                                <% } else {
                                %>
                                <input type="text" class="form-control"  placeholder="ALTERNATIVE PHONE" id="altnumber" name="ALTERNATIVE_PHONE_NUMBER"  value="<%= rs.getString("ALTERNATIVE_PHONE_NUMBER")%>">
                                <% }%>
                            </div>

                            <div class="fild">
                                <label class="form-label">PinCode :</label>
                                <input type="text" class="form-control" placeholder="ZIPCODE" name="ZIPCODE"  value="<%= rs.getString("ZIPCODE")%>" required >
                            </div>
                            <div class="fild">
                                <label class="form-label">State :</label>
                                <input type="text" class="form-control" placeholder="STATE" name="STATE"  value="<%= rs.getString("STATE")%>" required >
                            </div>
                            <div class="fild">
                                <label class="form-label">City :</label>
                                <input type="text" class="form-control" placeholder="CITY" name="CITY"  value="<%= rs.getString("CITY")%>" required >
                            </div>
                            <div class="fild">
                                <label class="form-label">HOUSE/BUILDING NO :</label>
                                <input type="text" class="form-control" placeholder="HOUSE_BUILDING_NO" name="HOUSE_BUILDING_NO"  value="<%= rs.getString("HOUSE_BUILDING_NO")%>" required >
                            </div>
                            <div class="fild">
                                <label class="form-label">Road/Area/Colony Name :</label>
                                <input type="text" class="form-control" placeholder="ROAD_AREA_COLONY_NAME" name="ROAD_AREA_COLONY_NAME"  value="<%= rs.getString("ROAD_AREA_COLONY_NAME")%>" required >
                            </div>
                            <div class="fild">
                                <label class="form-label">Landmark :</label>
                                <%
                                    if (LANDMARK == null) {
                                %>
                                <input type="text" class="form-control" placeholder="LANDMARK" name="LANDMARK">
                                <% } else {
                                %>
                                <input type="text" class="form-control" placeholder="LANDMARK" name="LANDMARK"  value="<%=rs.getString("LANDMARK")%>">
                                <% }%>
                            </div>

                            <% }%>



                            </br>


                            <div>
                                <button type="submit" id="submit" value="SUBMIT" name="submit" class="submit">SAVE</button>
                            </div>
                            <br>
                            <div>
                                <button type="reset" id="reset" value="RESET" name="reset" class="reset">RESET</button>
                            </div>
                            <br>
                            <div>
                                <button onclick="location.href = 'Add_New_Address.jsp';" id="back" value="BACK" name="back" class="back">BACK</button>
                            </div>
                        </center>
                    </form>
                </div>          
            </div>
        </fieldset>
        <script>
            function validatePhoneNumber() {
                let phno = document.getElementById("number").value;

                if (phno.length != 10) {
                    document.getElementById("showErrorPhno").innerHTML = "Phone Number Must Be 10 Digits!!";
                    return false;
                } else {
                    document.getElementById("showErrorPhno").innerHTML = "";
                    return true;
                }
            }

        </script>
    </body>
</html>