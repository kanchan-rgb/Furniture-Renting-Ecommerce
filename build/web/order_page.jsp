<%@page import="java.util.Base64"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="oracle.jdbc.OraclePreparedStatement"%>
<%@page import="oracle.jdbc.OracleConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@ page session = "true" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Orders</title>
        <link rel="icon" href="IMAGE/Logo/Small Transparent.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="CSS/ORDER_PAGE.css">
    </head>
    <body>
        <div class="navbar">
            <nav class="navbar-h">
                <div id="bak">
                    <button id="back" onclick="goToHome()"><i class="fa fa-arrow-left"></i> Back</button>
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

        
        <table style="width: 100%">
            <tr style="width: 100%">
                <td style="width: 100%">
                    <%
                        OracleConnection oconn;
                        OraclePreparedStatement ops;
                        int count = 0;
                        String userEMAIL = (String) session.getAttribute("EMAIL");
                        String userNAME = (String) session.getAttribute("NAME");
                        String userID = (String) session.getAttribute("USER_ID");
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");

                        ops = (OraclePreparedStatement) oconn.prepareCall("SELECT * FROM USERORDERS WHERE USER_ID=? ORDER BY ORDER_ID DESC");

                        ops.setString(1, userID);
                        
                        ResultSet set = ops.executeQuery();

                        while (set.next()) {
                            count++;
                            String PRODUCT_NAME = set.getString("PRODUCT_NAME");
                            byte[] imageData = set.getBytes("IMAGE");
                            String QUANTITY = set.getString("QUANTITY");
                            String MONTHS = set.getString("MONTHS");
                            String PRICE = set.getString("PRICE");
                            String NAME = set.getString("NAME");
                            String PHONE_NUMBER = set.getString("PHONE_NUMBER");
                            String ALTERNATIVE_PHONE_NUMBER = set.getString("ALTERNATIVE_PHONE_NUMBER");
                            String ZIPCODE = set.getString("ZIPCODE");
                            String STATE = set.getString("STATE");
                            String CITY = set.getString("CITY");
                            String HOUSE_BUILDING_NO = set.getString("HOUSE_BUILDING_NO");
                            String ROAD_AREA_COLONY_NAME = set.getString("ROAD_AREA_COLONY_NAME");
                            String LANDMARK = set.getString("LANDMARK");
                            String ORDER_DATE = set.getString("ORDER_DATE");
                            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");

                            String formattedDate = outputFormat.format(inputFormat.parse(ORDER_DATE));

                            String base64Image = Base64.getEncoder().encodeToString(imageData);
                            request.setAttribute("base64Image", base64Image);
                            String ORDER_ID = set.getString("ORDER_ID");
                            String alnum = set.getString("ALTERNATIVE_PHONE_NUMBER");
                            String landmark = set.getString("LANDMARK");
                    %>

                    <div class="card" style="margin-top: 2%">
                        <div class="title" style="margin-top: 5%">Purchase Reciept</div>
                        <div class="info">
                            <div class="row">
                                <div class="col-7">
                                    <span id="heading"><b>Order Date</b></span><br>
                                    <span id="details"><%=formattedDate%></span>
                                    <br>
                                    <span id="heading"><b>Order ID</b></span><br>
                                    <span id="details">OD<%=set.getString("ORDER_ID")%></span>
                                </div>
                                <div class="col-0">
                                    <span id="heading"><img width="90%" height="40%"  src="data:image/jpeg/png/jpg;base64,${base64Image}"/></span><br>
                                </div>
                            </div>      
                        </div>      
                        <div class="pricing">
                            <div class="row">
                                <div class="col-9">
                                    <span id="name"><%=set.getString("PRODUCT_NAME")%></span>  
                                </div>
                                <div class="col-3">
                                    <span id="price"><b>Price:</b> &#8377;<%=set.getString("PRICE")%></span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-9">
                                    <span id="shipping_fee"><b>Shipping Fee:</b> &#8377;00.00</span>
                                </div>
                                <div class="col-3">
                                    <span id="month"><b>Rent For:</b> <%=set.getString("MONTHS")%> MONTH</span>
                                </div>
                                <div class="col-3">
                                    <span id="quantity"><b>Quantity:</b> <%=set.getString("QUANTITY")%></span>
                                </div>
                                <div class="col-3">
                                    <span id="paymentstatus"><b>Payment Status:</b> PAID</span>
                                </div>
                                <div class="invoice">
                                    <button onclick="location.href = 'invoice.jsp?ORDER_ID=<%=ORDER_ID%>'" id="invoice">Download Invoice</button>
                                </div>
                            </div>
                        </div>
                        <div class="total">
                            <div class="row">
                                <div class="col-9"></div>

                            </div>
                        </div>
                        <div class="tracking">
                            <div class="title" style="font-size: 20px">Tracking Order</div>
                        </div>
                        <div class="progress-track">
                            <ul id="progressbar">
                                <li class="step0 active " id="step1"><p>Ordered<p></li>
                                <li class="step0  text-center" id="step2"><p style="margin-left: 20%">Shipped</p></li>
                                <li class="step0  text-right" id="step3"><p style="margin-left: 50%">On the way</p></li>
                                <li class="step0 text-right" id="step4"><p style="margin-left: 68%">Delivered</p></li>
                            </ul>
                        </div>

                        <div class="address">
                            <div class="title" style="font-size: 15px;color: navy">Shipping Details</div>      
                            <div style="font-size: 10px;margin-left: 10%">
                                <p style="font-size: 10px"><b><%=set.getString("NAME")%></b></p>
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
                            </div>
                        </div>

                        <div class="footer">
                            <div class="row">
                                <div class="col-2"><img class="img-fluid" src=".//IMAGE/Logo/Small Transparent.png"></div>
                                <div class="col-10">Want any help? Please &nbsp;<a href="http://localhost:8080/RENT_KARO/contact_us.html"> Contact US</a></div>
                            </div>


                        </div>
                    </div>
                    <br>
                    <%
                        }
                    %>
                    <%    if (count == 0) {
                    %>
                    <div style="text-align: center;margin-top: 2%">
                        <img src="IMAGE/emptycart.png" alt="">
                        <h1>No Order Found</h1>

                        <div><button id="bttn" onclick="goToHome()">Browse Catalogue</button></div>

                    </div>

                    <%
                        }
                    %>

                </td>

            </tr>

        </table>
                    </div>
    </body>
    <script>
        function goToHome() {
            window.location.href = "after_main_index.jsp";
        }
    </script>
</html>