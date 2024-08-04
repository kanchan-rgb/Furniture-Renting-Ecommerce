<%@page import="oracle.jdbc.OraclePreparedStatement"%>
<%@page import="oracle.jdbc.OracleConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@ page session = "true" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Address</title>
        <link rel="icon" href="IMAGE/Logo/Small Transparent.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <style>
            body{
                width: 100%;
            }
            table{
                margin-left: 50px;
                margin-top: 20px;
                width: 70%;
            }
            td{
                border-bottom: 1px solid gray;
                padding: 8px;
            }
            .navbar{
                background-color: lightgray;
                padding: 10px;
                height: 30px;
                margin-left: -9px;
                margin-bottom: 10px;
            }
            .me-2{
                margin-bottom: -8px;
                margin-top: -20px;
            }
            #text{
                margin-bottom: -30px;
                margin-top: -10px;

            }
            #addnew{
                background-color: transparent;
                border: none;
                color: blue;
                font-size: 30px;
                font-family: monospace;
                cursor: pointer;  
            }
            #addnew:hover{
                background-color: transparent;
                border: none;
                color: rgb(224, 179, 16);
                text-shadow: 1px 1px 2px black;
                font-size: 30px;
                font-family: monospace;
                cursor: pointer;  
            }
            #delete{
                padding: 4px;
                background-color: rgb(186, 22, 22);
                width: 10ch;
                color: white;
                border: none;
                font-size: 16px;
                border-radius: 14px;
                cursor: pointer;
            }
            #delete:hover{
                background-color: rgb(200, 64, 64);
                box-shadow: 1px 1px 4px #000;
            }
            #edit{

                background-color: green;
                border-radius: 14px;
                width: 18ch;
                border: none;
                color: white;
                font-size: 16px;
                padding: 4px;
                cursor: pointer;
            }
            #edit:hover{
                background-color: rgb(81, 163, 46);

                padding: 4px;
                box-shadow: 1px 1px 2px #000;
            }
            #bak{
                
               margin-bottom: -20px;
               margin-top: 20px;
            }
            #back{
                float: right;
                padding: 3px;
                border: none;
                font-size: 17px;
                margin-right: 30px;
                border-radius: 10px;
                width: 10%;
                cursor: pointer;
                background-color: darkblue;
                color: white;
            }
             #back:hover{
                float: right;
                padding: 3px;
                border: none;
                font-size: 17px;
                margin-right: 30px;
                border-radius: 10px;
                width: 10%;
                cursor: pointer;
                box-shadow: 1px 1px 4px darkblue;
                background-color: rgb(2, 2, 163);
                color: white;
            }
        </style>
    </head>


    <body>

        <!-- Image and text -->
        <div class="navbar">
            <nav class="navbar-h">
                <div id="bak">
                    <button id="back" onclick="location.href='after_main_index.jsp'"><i class="fa fa-arrow-left"></i> Back</button>
                </div>
                <div id="text">
                    <p style="text-align: center;font-size: 20px;margin-top: 15px;"><b>My Saved Addresses</b></p>
                    
                </div>
                
                <div class="container-fluid">
                    <a class="navbar-brand">
                        <img
                            src="IMAGE/Logo/Small Transparent.png"
                            class="me-2"
                            height="50"
                            />
                    </a>
                    
                </div>
                
            </nav>
            
        </div>
        <div>
            <button onclick="location.href = 'Add_New_Address.jsp'"  id="addnew"><img style="width: 36px; margin-top: 3px" src="IMAGE/map.png"> Click Here To Add New Address.....</button>
        </div>
        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                    <thead>


                        <%
                            OracleConnection oconn;
                            OraclePreparedStatement ops;
                            String userID = (String) session.getAttribute("USER_ID");
                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");

                            ops = (OraclePreparedStatement) oconn.prepareCall("SELECT * FROM USERADDRESS WHERE USER_ID=?");

                            ops.setString(1, userID);
                            ResultSet set = ops.executeQuery();

                            while (set.next()) {
                                String USER_ADDRESS_ID = set.getString("USER_ADDRESS_ID");
                                String alnum = set.getString("ALTERNATIVE_PHONE_NUMBER");
                                String landmark = set.getString("LANDMARK");
                               
                        %>

                        <tr>
                            <td style="text-align: left;">
                                <br>
                                <p style="font-size: 20px"><b><%=set.getString("NAME")%></b></p>
                                <p><%=set.getString("HOUSE_BUILDING_NO")%>, <%=set.getString("ROAD_AREA_COLONY_NAME")%>, <%=set.getString("CITY")%>, <%=set.getString("STATE")%> -  <%=set.getString("ZIPCODE")%></p>
                                <% if (landmark != null) {%>

                                <p>Landmark : <%=set.getString("LANDMARK")%></p>
                                <%
                                    }
                                %>
                                <p>PHONE NUMBER : <%=set.getString("PHONE_NUMBER")%></p>
                                <% if (alnum != null) {%>
                                <p>ALTERNATIVE PHONE NUMBER : <%=set.getString("ALTERNATIVE_PHONE_NUMBER")%></p>
                                <%
                                    }
                                %>
                            </td>

                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td><button onclick="location.href='User_Address_Update.jsp?USER_ADDRESS_ID=<%=USER_ADDRESS_ID%>'" id="edit">Edit</button></td>
                            <td><button onclick="location.href='User_Address_Delete.jsp?USER_ADDRESS_ID=<%=USER_ADDRESS_ID%>'" id="delete">Delete</button></td>
                    
                        </tr> 

                        <%

                            }
                        %>

                </table>    
            </div>

        </div>  
    </div>

</body>
</html>
