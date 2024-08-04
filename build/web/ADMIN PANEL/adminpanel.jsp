<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER DATABASE</title>
        <link rel="icon" href="../IMAGE/Logo/Small Transparent.png" type="image/x-icon">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
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
                width: 80px;
                font-size: 20px;
                padding: 4px;
                cursor: pointer;
            }
            #edit:hover{
                background-color: rgb(81, 163, 46);
                border-radius: 5px;
                box-shadow: 1px 1px 2px #000;
            }
            #delete{
                background-color: rgb(186, 22, 22);
                border-radius: 5px;
                width: 80px;
                font-size: 20px;
                padding: 4px;
                cursor: pointer;
            }
            #delete:hover{
                background-color: rgb(200, 64, 64);
                border-radius: 5px;
                box-shadow: 1px 1px 2px #000;
            }
            #cart{
                background-color: navy;
                border-radius: 5px;
                width: 80px;
                font-size: 20px;
                padding: 4px;
                cursor: pointer;
            }
            #cart:hover{
                background-color: purple;
                border-radius: 5px;
                box-shadow: 1px 1px 2px #000;
            }
            #address{
                background-color: #C78407;
                border-radius: 5px;
                width: 80px;
                font-size: 20px;
                padding: 4px;
                cursor: pointer;
            }
            #address:hover{
                background-color: #895D0C;
                border-radius: 5px;
                box-shadow: 1px 1px 2px #000;
            }
            #order{
                background-color: purple;
                border-radius: 5px;
                width: 80px;
                font-size: 20px;
                padding: 4px;
                cursor: pointer;
            }
            #order:hover{
                background-color: blueviolet;
                border-radius: 5px;
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
            #addnewuser{
                background-color: green;
                border: none;
                padding: 10px;
                border-radius: 8px;
                color: white;
                cursor: pointer;
            }
            #addnewuser:hover{
                background-color: limegreen;
                border: none;
                padding: 10px;
                box-shadow: 1px 1px 5px black;
                border-radius: 8px;
                color: white;
                cursor: pointer;
            }
            #product_page{
                margin-left: 16px;
                background-color: lightseagreen;
                border: none;
                padding: 10.3px;
                border-radius: 8px;
                color: white;
                cursor: pointer;
            }
            #product_page:hover{
                margin-left: 16px;
                background-color: turquoise;
                border: none;
                padding: 10px;
                box-shadow: 1px 1px 5px black;
                border-radius: 8px;
                color: black;
                cursor: pointer;
            }
            #contactus_page{
                margin-left: 16px;
                background-color: blueviolet;
                border: none;
                padding: 10.3px;
                border-radius: 8px;
                color: white;
                cursor: pointer;
            }
             #contactus_page:hover{
                margin-left: 16px;
                background-color: purple;
                border: none;
                padding: 10px;
                box-shadow: 1px 1px 5px black;
                border-radius: 8px;
                color: white;
                cursor: pointer;
            }
             #bugs_report{
                margin-left: 16px;
                background-color: #FFE615;
                border: none;
                padding: 10.3px;
                border-radius: 8px;
                color: navy;
                cursor: pointer;
            }
             #bugs_report:hover{
                margin-left: 16px;
                background-color: #615705;
                border: none;
                padding: 10px;
                box-shadow: 1px 1px 5px black;
                border-radius: 8px;
                color: white;
                cursor: pointer;
            }
             #feedback{
                margin-left: 16px;
                background-color: #0645C8;
                border: none;
                padding: 10.3px;
                border-radius: 8px;
                color: white;
                cursor: pointer;
            }
             #feedback:hover{
                margin-left: 16px;
                background-color: #108DC6;
                border: none;
                padding: 10px;
                box-shadow: 1px 1px 5px black;
                border-radius: 8px;
                color: white;
                cursor: pointer;
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
                    <p style="text-align: center"><b>RENTKARO ADMIN PANEL</b></p>
                </div>
                <div>
                    <button style="float: right" id="logout" onclick="confirmAction()"><i class="fa fa-sign-out"></i> LogOut</button>
                </div>
                <div class="container-fluid">
                    <a class="navbar-brand">
                        <img
                            src="../IMAGE/Logo/Small Transparent.png"
                            class="me-2"
                            height="50"
                            />

                    </a>

                </div>

            </nav>

        </div>
<!--        <button id="addnewuser" onclick="location.href = 'http://localhost:8080/RENT_KARO/signup.html'"><span style="font-size: 15px">+ </span>Add New User</button>-->
        <button id="product_page" onclick="location.href = 'http://localhost:8080/RENT_KARO/ADMIN%20PANEL/Admin_Product_Panel.jsp'">PRODUCT PAGE</button>
        <button id="contactus_page" onclick="location.href = 'http://localhost:8080/RENT_KARO/ADMIN%20PANEL/admin_contactUS.jsp'">CONTACT US</button>
        <button id="bugs_report" onclick="location.href = 'http://localhost:8080/RENT_KARO/ADMIN%20PANEL/adminBugsReports.jsp'">BUGS REPORTS</button>
        <button id="feedback" onclick="location.href = 'http://localhost:8080/RENT_KARO/ADMIN%20PANEL/adminFeedback.jsp'">FEEDBACKS</button>
        <div><br></div>
        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                    <thead>
                        <tr>
                            <th>SL. NO.</th>
                            <th>PHOTO</th>
                            <th>NAME</th>
                            <th>EMAIL</th>
                            <th>DATE_OF_BIRTH</th>
                            <th>PH_NUMBER</th>
                            <th>PASSWORD</th>
                            <th>User's Cart</th>
                            <th>User's Orders</th>
                            <th>User's Address</th>
<!--                            <th>User's Profile Photo Update</th>
                            <th>Edit</th>-->
                            <th>Delete</th>          
                        </tr>  

                        <%

                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;
                            int c = 0;

                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");

                            String query = "SELECT USER_ID,PROFILE_PHOTO,NAME,EMAIL,TO_CHAR(DATE_OF_BIRTH,'DD-MM-YYYY')AS DOB,PH_NUMBER,PASSWORD FROM USERS";
                            Statement st = con.createStatement();

                            rs = st.executeQuery(query);

                            while (rs.next()) {
                                String USER_ID = rs.getString("USER_ID");
                                byte[] imageData = rs.getBytes("PROFILE_PHOTO");

                                // Encode the image data as Base64
                                c++;
                        %>

                        <tr>
                            <td><%=c%></td>
                            <%
                                if (imageData != null) {
                                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                                    request.setAttribute("base64Image", base64Image);
                            %>
                            <td> <img width="50px" height="50px" src="data:image/jpeg/png/jpg;base64,${base64Image}"/></td>
                                <%
                                } else {
                                %>
                            <td> <img width="50px" height="50px" src="../IMAGE/Default.png"/></td>
                                <%
                                    }
                                %>
                            <td><%=rs.getString("NAME")%></td>
                            <td><%=rs.getString("EMAIL")%></td>
                            <td><%=rs.getString("DOB")%></td>
                            <td><%=rs.getString("PH_NUMBER")%></td>
                            <td><%=rs.getString("PASSWORD")%></td>                            
                            <td><button id="cart"><a style="text-decoration: none;color: white"  href="user_cart.jsp?USER_ID=<%=USER_ID%>">View</a></button></td>
                            <td><button id="order"><a style="text-decoration: none;color: white"  href="user_order.jsp?USER_ID=<%=USER_ID%>">View</a></button></td>
                            <td><button id="address"><a style="text-decoration: none;color: white"  href="user_address.jsp?USER_ID=<%=USER_ID%>">View</a></button></td>
<!--                            <td>
                                <form id="myForm" method="POST" action="http://localhost:8080/RENT_KARO/UserImageUpdate" enctype="multipart/form-data">
                                    <input type="hidden" name="ID" value="<%=USER_ID%>">

                                    <input class="custom-file-input" type="file" id="selector" name="db_user_image" accept="image/png,image/jpg, image/jpeg" onclick="return confirm('Please Select An Image File (PNG, JPG, JPEG) That Is Less Than 15MB')">
                                   
                                    <button type="submit" id="submit" onclick="return confirm('Are You Sure? You Want To Update User\'s Profile Photo?')">Submit</button>
                                </form>

                            </td>     -->
<!--                            <td><button id="edit"><a style="text-decoration: none;color: white"  href="update_user.jsp?USER_ID=<%=USER_ID%>">Edit</a></button></td>-->
                            <td><button id="delete"><a style="text-decoration: none;color: white" onclick="return confirm('Are You Sure You Want To Delete This Account?');" href="delete_user.jsp?USER_ID=<%=USER_ID%>">Delete</a></button></td>
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
