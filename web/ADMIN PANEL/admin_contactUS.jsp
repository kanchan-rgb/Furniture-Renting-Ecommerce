
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
        <title>CONTACT US REPORTS</title>
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
            #delete{
                background-color: darkred;
                color: white;
                border: none;
                border-radius: 8px;
                padding: 7px;
                cursor: pointer;
            }
            #delete:hover{
                background-color: red;
                box-shadow: 1px 1px 4px red;
                color: white;
                border: none;
                border-radius: 8px;
                padding: 7px;
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
                    <p style="text-align: center"><b>RENTKARO CONTACT US REPORTS</b></p>
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
            ops = oconn.prepareStatement("SELECT * FROM CONTaCTUS ORDER BY CID DESC");
//       
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
                        
                        String ID = ors.getString("CID");                      

                        c++;
                %>

                <tr>
                    <th><%=c%></th>
                        <%                        for (counter = 2; counter <= orsm.getColumnCount(); counter++) {
                               
                        %>

                  
                    <td><%=ors.getString(counter)%></td>
                    <%
                        }
                    %>

                    <td>

                       
                        <button id="delete"><a style="text-decoration: none;color: white" onclick="return confirm('Are You Sure You Want To Delete This Complain?');" href="deleteContactUs.jsp?ID=<%=ID%>">DELETE</a></button>

                    </td>
                    <%
                        }
                    %>

        </table>
    </body>
</html>
