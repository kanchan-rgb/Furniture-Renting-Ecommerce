<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 

<%
    if (request.getParameter("submit") != null) {
        String USER_ID = request.getParameter("USER_ID");
        String NAME = request.getParameter("NAME");
        String EMAIL = request.getParameter("EMAIL");
        String DOB = request.getParameter("birthday");
        String PH_NUMBER = request.getParameter("PH_NUMBER");
        String PASSWORD = request.getParameter("PASSWORD");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");

  
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dt = sdf.parse(DOB);
            SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MMM-yyyy");
            DOB = sdf1.format(dt);
            pst = con.prepareStatement("UPDATE USERS SET NAME = ?,EMAIL =?,DATE_OF_BIRTH =?,PH_NUMBER= ?,PASSWORD= ? where USER_ID = ?");
            pst.setString(1, NAME);
            pst.setString(2, EMAIL);
            pst.setString(3, DOB);
            pst.setString(4, PH_NUMBER);
            pst.setString(5, PASSWORD);
            pst.setString(6, USER_ID);
            pst.executeUpdate();

        


%>

<script>
    alert("Record Updated!!!");
</script>
<%        }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit User Details</title> 
        <link rel="icon" href="../IMAGE/Logo/Small Transparent.png" type="image/x-icon">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <style>
            body{

            }
            .form-label{
                display: inline-block;
                width: 120px;
                text-align: left;
            }
            .fild{
                padding: 10px;
            }
            .but{
                position: relative;

            }
            #dob{
                width: 22.5ch;
                padding: 1px;
            }
            .submit{
                background-color: green;
                color: white;
                width: 100px;
                margin-left: 10px;
                cursor: pointer;
                padding: 3px 5px;
                border-radius: 5px;
            }
            .submit:hover{
                background-color: rgb(81, 163, 46);
                color: white;
                margin-left: 10px;
                cursor: pointer;
                box-shadow: 1px 1px 3px black;
            }
            .reset{
                background-color: red;
                color: white;
                margin-left: 10px;
                width: 80px;
                cursor: pointer;
                padding: 3px 5px;
                border-radius: 5px;
            }
            .reset:hover{
                background-color: rgb(200, 64, 64);
                color: white;
                margin-left: 10px;
                cursor: pointer;
                box-shadow: 1px 1px 3px black;
            }
            .back{
                background-color: rgb(99, 2, 20);
                color: white;
                margin-left: 10px;
                cursor: pointer;
                width: 80px;
                padding: 3px 5px;
                border-radius: 5px;
            }
            .back:hover{
                background-color: rgb(165, 62, 83);
                color: white;
                margin-left: 10px;
                cursor: pointer;
                box-shadow: 1px 1px 3px black;
            }
        </style>

    </head>
    <body style="background-color: lightgoldenrodyellow">
        <fieldset>
            <legend style="text-align: center;font-size: 30px"><b>Update Details</b></legend>



            <div class="row">
                <div class="col-sm-4">
                    <form  method="POST" action="#" >

                        <%                        Connection con;
                            PreparedStatement pst;
                            ResultSet rs;

                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");

                            String USER_ID = request.getParameter("USER_ID");

                            pst = con.prepareStatement("SELECT USER_ID,NAME,EMAIL,TO_CHAR(DATE_OF_BIRTH,'YYYY-MM-DD')AS DOB,PH_NUMBER,PASSWORD FROM USERS WHERE USER_ID = ?");
                            pst.setString(1, USER_ID);
                            rs = pst.executeQuery();

                            while (rs.next()) {


                        %>
                        <center>
                            <div class="fild">
                                <input type="hidden" class="form-control" value="<%= rs.getString("USER_ID")%>" name="USER_ID" id="sname" required >
                            </div>
                            <div class="fild">
                                <label  class="form-label">User Name :</label>
                                <input type="text" class="form-control" placeholder="Name" value="<%= rs.getString("NAME")%>" name="NAME" id="sname" required >
                            </div>

                            <div class="fild">
                                <label class="form-label">Email :</label>
                                <input type="text" class="form-control" placeholder="EMAIL" name="EMAIL" value="<%= rs.getString("EMAIL")%>" id="course" required >
                            </div>

                            <div class="fild">
                                <label class="form-label">Phone Number :</label>
                                <input type="text" class="form-control" placeholder="PHONE NUMBER" name="PH_NUMBER" id="fee" value="<%= rs.getString("PH_NUMBER")%>" required >
                            </div>

                            <div class="fild">
                                <label class="form-label">Password :</label>
                                <input type="text" class="form-control" placeholder="PASSWORD" name="PASSWORD" id="fee" value="<%= rs.getString("PASSWORD")%>" required >
                            </div>
                            <div class="fild">
                                <label class="form-label" for="inputBirthday">Birthday :</label>
                                <input class="form-control" id="dob" type="date" value="<%=rs.getString("DOB")%>" name="birthday">
                            </div>
                        </center>

                        <% }%>



                        </br>

                        <div class="but" align="center">
                            <input onclick="location.href = 'http://localhost:8080/RENT_KARO/ADMIN%20PANEL/adminpanel.jsp';" type="button" id="back" value="BACK" name="back" class="back">
                            <input type="reset" id="reset" value="RESET" name="reset" class="reset">
                            <input type="submit" id="submit" value="SUBMIT" name="submit" class="submit">
                        </div>

                    </form>
                </div>          
            </div>
        </fieldset>
    </body>
</html>