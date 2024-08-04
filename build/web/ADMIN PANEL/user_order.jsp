<%-- 
    Document   : user_order
    Created on : 30 Oct, 2023, 8:52:47 AM
    Author     : atrib
--%>

<%@page import="java.util.Base64"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="oracle.jdbc.OracleResultSetMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    Connection oconn;
    PreparedStatement ops;
    OracleResultSetMetaData orsm;
    OracleResultSet ors;
    int counter, recounter, colcounter;
    int c = 0;

    String USER_ID = request.getParameter("USER_ID");

    Class.forName("oracle.jdbc.driver.OracleDriver");
    oconn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");
    ops = oconn.prepareStatement("SELECT * FROM USERORDERS WHERE USER_ID=?");
    ops.setString(1, USER_ID);
    ors = (OracleResultSet) ops.executeQuery();

    orsm = (OracleResultSetMetaData) ops.getMetaData();

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Order Data</title>
        <link rel="icon" href="../IMAGE/Logo/Small Transparent.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <style>
            html,
            body{
                width: 100%;
                margin: 0;
            }
            body {
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                background-image: url('..//IMAGE/Logo/Small Transparent 50.png');
                background-repeat: no-repeat;
                background-size: 100%;
            }
            table,th,td{

                border: 1px solid black;
                border-collapse: collapse;
                text-align: center;
                margin-left: 20px;
                padding: 5px;
            }
            .navbar{
                background-color: lightblue;
                padding: 10px;
                width: 100%;
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
            #logout{
                padding: 6px;
                margin-top: -9px;
                margin-right: 30px;
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
        </style>
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
                    <p style="text-align: center"><b>USER ORDER DETAILS</b></p>
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
        <div>
            <br>
        </div>
        <table>
            <thead>
                <tr>
                    <th>SL. NO.</th>
                        <%                            for (counter = 1; counter <= 11; counter++) {
                        %>
                    <th><%=orsm.getColumnName(counter)%></th>
                        <%
                            }
                        %>
                    <th>Shipping Details</th>
                    <th>Order Date</th>
                </tr>
            </thead>
            <tbody>

                <%
                    while (ors.next() == true) {
//           request.setAttribute("imagedata", rs.getBytes("PRODUCT_IMAGE"));

                        String alnum = ors.getString("ALTERNATIVE_PHONE_NUMBER");
                        String landmark = ors.getString("LANDMARK");
                        byte[] imageData = ors.getBytes("IMAGE");

                        // Encode the image data as Base64
                        String base64Image = Base64.getEncoder().encodeToString(imageData);
                        request.setAttribute("base64Image", base64Image);

                        c++;
                %>

                <tr>
                    <th><%=c%></th>
                        <%
                            for (counter = 1; counter <= 11; counter++) {
                                if (orsm.getColumnName(counter).equals("IMAGE")) {
                        %>

                    <th> <img width="30px" height="20px" src="data:image/jpeg/png/jpg;base64,${base64Image}"/></th>
                        <%
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
                        <br>
                                <p style="font-size: 20px"><b><%=ors.getString("NAME")%></b></p>
                                <p><%=ors.getString("HOUSE_BUILDING_NO")%>, <%=ors.getString("ROAD_AREA_COLONY_NAME")%>, <%=ors.getString("CITY")%>, <%=ors.getString("STATE")%> -  <%=ors.getString("ZIPCODE")%></p>
                                <% if (landmark != null) {%>

                                <p>Landmark : <%=ors.getString("LANDMARK")%></p>
                                <%
                                    }
                                %>
                                <p>PHONE NUMBER : <%=ors.getString("PHONE_NUMBER")%></p>
                                <% if (alnum != null) {%>
                                <p>ALTERNATIVE PHONE NUMBER : <%=ors.getString("ALTERNATIVE_PHONE_NUMBER")%></p>
                                <%
                                    }
                                %>
                    </td>
                    <td>
                        <%=ors.getString("ORDER_DATE")%>
                    </td>
                    <%
                        }
                    %>

        </table>
    </body>
</html>
