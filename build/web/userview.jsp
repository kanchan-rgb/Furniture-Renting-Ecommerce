<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER DATABASE</title>
        <link rel="icon" href="IMAGE/Logo/Small Transparent.png" type="image/x-icon">
        <style>
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
        </style>
    </head>
    <body>
        <!-- Image and text -->
        <div class="navbar">
            <nav class="navbar-h">
                <div id="text">
                    <p style="text-align: center"><b>RENTKARO ADMIN PANNEL</b></p>
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
        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                    <thead>
                        <tr>
                            <th>NAME</th>
                            <th>EMAIL</th>
                            <th>PH_NUMBER</th>
                            <th>PASSWORD</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>  

                        <%

                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;

                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");

                            String query = "SELECT * FROM USERS";
                            Statement st = con.createStatement();

                            rs = st.executeQuery(query);

                            while (rs.next()) {
                                String EMAIL = rs.getString("EMAIL");
                        %>

                        <tr>
                            <td><%=rs.getString("NAME")%></td>
                            <td><%=rs.getString("EMAIL")%></td>
                            <td><%=rs.getString("PH_NUMBER")%></td>
                            <td><%=rs.getString("PASSWORD")%></td>
                            <td><button id="edit"><a style="text-decoration: none;color: white" href="update_user.jsp?EMAIL=<%=EMAIL%>">Edit</a></button></td>
                            <td><button id="delete"><a style="text-decoration: none;color: white" href="delete_user.jsp?EMAIL=<%=EMAIL%>">Delete</a></button></td>
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
