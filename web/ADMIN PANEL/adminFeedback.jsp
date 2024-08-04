
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="oracle.jdbc.driver.OracleResultSetMetaData"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FEEDBACK PANELS</title>
        <link rel="icon" href="../IMAGE/Logo/Small Transparent.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <style>
            body{
                width: 100%;
                margin: 0;
            }
            table,th,td{

                border: 1px solid black;
                border-collapse: collapse;
                text-align: center;
                padding: 5px;
            }
            #edit{
                background-color: green;
                border-radius: 5px;
                padding: 2px;
                cursor: pointer;
            }
            #edit:hover{
                background-color: rgb(81, 163, 46);
                border-radius: 5px;
                padding: 2px;
                box-shadow: 1px 1px 2px #000;
            }
            #delete{
                background-color: rgb(186, 22, 22);
                border-radius: 5px;
                padding: 2px;
                cursor: pointer;
            }
            #delete:hover{
                background-color: rgb(200, 64, 64);
                border-radius: 5px;
                padding: 2px;
                box-shadow: 1px 1px 2px #000;
            }
            .navbar{
                background-color: lightblue;
                padding: 10px;
                margin-bottom: 10px;
            }
            .me-2{
                margin-bottom: -10px;
                margin-top: -20px;
            }
            #text{
                margin-bottom: -30px;
                margin-top: -10px;

            }
            #add_product{
                background-color: lightseagreen;
                margin-left: 20px;
                border: none;
                padding: 10px;
                border-radius: 8px;
                color: white;
                cursor: pointer;
            }
            #add_product:hover{
                background-color: lightseagreen;
                border: none;
                padding: 10px;
                box-shadow: 1px 1px 5px lightseagreen;
                border-radius: 8px;
                color: white;
                cursor: pointer;
            }
            #update{
                background-color: green;
                color: white;
                border: none;
                border-radius: 8px;
                padding: 5px;
                cursor: pointer;
            }
            #update:hover{
                background-color: navy;
                box-shadow: 1px 1px 4px navy;
                color: white;
                border: none;
                border-radius: 8px;
                padding: 5px;
            }
            #delete{
                background-color: darkred;
                color: white;
                border: none;
                border-radius: 8px;
                padding: 5px;
                cursor: pointer;
            }
            #delete:hover{
                background-color: red;
                box-shadow: 1px 1px 4px red;
                color: white;
                border: none;
                border-radius: 8px;
                padding: 5px;
            }
            #view{
                background-color: green;
                color: white;
                border: none;
                border-radius: 8px;
                padding: 5px;
                cursor: pointer;
            }
            #view:hover{
                background-color: lightseagreen;
                box-shadow: 1px 1px 4px green;
                color: white;
                border: none;
                border-radius: 8px;
                padding: 5px;
            }
            #logout{
                padding: 6px;
                margin-top: -9px;
                background-color: transparent;
                border: none;
                color: red;
                cursor: pointer;
            }
            #logout:hover{
                padding: 6px;
                margin-top: -9px;
                background-color: transparent;
                border: none;
                color: red;
                text-shadow: 0.2px 0.3px 1px black;
                cursor: pointer;
            }
            .custom-file-input::-webkit-file-upload-button {
                visibility: hidden;
            }
            .custom-file-input::before {

                content: 'Upload Image';
                display: inline-block;
                background-color: navy; 
                color: white;
                border: 1px solid #999;
                border-radius: 7px;
                padding: 8px 8px;
                outline: none;
                white-space: nowrap;
                -webkit-user-select: none;
                cursor: pointer;

                font-weight: 700;
                font-size: 10pt;
            }
            .custom-file-input:hover::before {
                border-color: black;
                color: black;
                background-image: linear-gradient( to bottom, #fff, #a9dbf6 );
            }
            .custom-file-input:active::before {
                background: -webkit-linear-gradient(top, #e3e3e3, #f9f9f9);
            }
            #submit{
                margin-top: 13px;
                background-color: #09841B;
                color: white;
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
            #selector{
                width: 110px;
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script>
            function confirmAction() {
                const confirmation = confirm("Are You Sure You Want To LogOut?");
                // Check if the user confirmed (clicked "OK")
                if (confirmation) {
                    // User confirmed, perform the action here
                    window.location.href = "http://localhost:8080/RENT_KARO/Logout.jsp";
                } else {
                    // User canceled, do nothing or provide feedback

                }
            }
        </script>
    </head>
    <body>
        <div class="navbar">
            <nav class="navbar-h">
                <div id="text">
                    <p style="text-align: center"><b>RENTKARO FEEDBACKS</b></p>
                </div>
                <div>
                    <button style="float: right" id="logout" onclick="confirmAction()"> <i class="fa fa-sign-out"></i> LogOut</button>
                </div>
                <div class="container-fluid">
                    <a class="navbar-brand" href="http://localhost:8080/RENT_KARO/ADMIN%20PANEL/adminpanel.jsp">
                        <img
                            src="../IMAGE/Logo/Small Transparent.png"
                            class="me-2"
                            height="50"
                            />

                    </a>

                </div>

            </nav>

        </div>
       



        <%
            Connection oconn;
            PreparedStatement ops;
            OracleResultSetMetaData orsm;
            OracleResultSet ors;
            int counter, recounter, colcounter;
            int c = 0;

            Class.forName("oracle.jdbc.driver.OracleDriver");
            oconn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");
            ops = oconn.prepareStatement("SELECT * FROM FEEDBACK ORDER BY F_ID DESC");
//            ops.setString(1, "furniture");
            ors = (OracleResultSet) ops.executeQuery();

            orsm = (OracleResultSetMetaData) ops.getMetaData();
        %>
        <div>
            <br>
        </div>
        <table style="width: 100%">
            <thead>
                <tr>
                    <th>SL. NO.</th>
                        <%
                            for (counter = 2; counter <= orsm.getColumnCount(); counter++) {
                        %>
                    <th><%=orsm.getColumnName(counter)%></th>
                        <%
                            }
                        %>

                    <th>DELETE</th>
                </tr>
            </thead>
            <tbody>

                <%
                    while (ors.next() == true) {
//           request.setAttribute("imagedata", rs.getBytes("PRODUCT_IMAGE"));
                        byte[] imageData = ors.getBytes("IMAGE");
                        byte[] videoData = ors.getBytes("VIDEO");

                        String ID = ors.getString("F_ID");

                        // Encode the image data as Base64
                        c++;
                %>

                <tr>
                    <th><%=c%></th>
                        <%                        for (counter = 2; counter <= orsm.getColumnCount(); counter++) {
                                if (orsm.getColumnName(counter).equals("IMAGE")) {

                                    if (imageData != null) {
                                        String base64Image = Base64.getEncoder().encodeToString(imageData);
                                        request.setAttribute("base64Image", base64Image);
                        %>
                    <td> 
                        <img width="50px" height="50px" src="data:image/jpeg/png/jpg;base64,${base64Image}"/>
                        <br>
                        <button id="view"><a style="text-decoration: none;color: white" href="FeedbackImageView.jsp?ID=<%=ID%>">VIEW IMAGE</a></button>
                    </td>
                        <%
                        } else {
                        %>
                        <td> <img width="50px" height="50px" src="../IMAGE/Logo/Small Transparent.png"/></td>
                        <%
                            }
                        } else if (orsm.getColumnName(counter).equals("VIDEO")) {
                            if (videoData != null) {
                                String base64Image2 = Base64.getEncoder().encodeToString(videoData);
                                request.setAttribute("base64Image2", base64Image2);
                        %>
                    <td> 
                        <video width="170px" height="100px" 
                               controls
                               playsinline
                               autoplay
                               muted
                               loop
                               class="uvodna__bg-video"
                               >
                            <source src="data:video/mp4;base64,${base64Image2}" type="video/mp4" />
                        </video>
                    </td>
                    <%
                    } else {
                    %>
                    <td> <img width="50px" height="50px" src="../IMAGE/Logo/Small Transparent.png"/></td>
                        <%
                            }

                        } else {
                        %>
                    <td><%=ors.getString(counter)%></td>
                    <%
                        }
                    %>


                    <%
                        }
                    %>

                    <td>


                        <button id="delete"><a style="text-decoration: none;color: white" onclick="return confirm('Are You Sure You Want To Delete This Feedback?');" href="deleteFeedBack.jsp?ID=<%=ID%>">DELETE</a></button>

                    </td>
                    <%
                        }
                    %>

        </table>
    </body>
</html>
