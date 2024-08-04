<%-- 
    Document   : invoice
    Created on : 25 Oct, 2023, 1:45:38 PM
    Author     : atrib
--%>
<%@page import="java.util.Base64"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="oracle.jdbc.OraclePreparedStatement"%>
<%@page import="oracle.jdbc.OracleConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<%@ page session = "true" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>INVOICE</title>
        <link rel="icon" href="IMAGE/Logo/Small Transparent.png" type="image/x-icon">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <style>
            table {
                width: 100%;
                margin-left: 15px;
                border-collapse: collapse;
            }

            tr {
                border-bottom: 1px solid gray;
            }

            td {
                border-right: 1px solid gray;
                padding: 10px;
            }
            .btn-download{
                display: none;
            }
            body {
                background-image: url('IMAGE/Logo/Small Transparent 50.png');
                width: 95%;
                background-repeat: no-repeat;
                background-position-x: 50%;
                background-position-y: 50%;
                background-size: 800px;
            }
        </style>
    </head>
    <%
        OracleConnection oconn;
        OraclePreparedStatement ops;
        int igst = 0;
        String userEMAIL = (String) session.getAttribute("EMAIL");
        String userNAME = (String) session.getAttribute("NAME");
        String ORDER_ID = request.getParameter("ORDER_ID");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");

        ops = (OraclePreparedStatement) oconn.prepareCall("SELECT * FROM USERORDERS WHERE ORDER_ID=?");

        ops.setString(1, ORDER_ID);

        ResultSet set = ops.executeQuery();

        if (set.next()) {

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
            String alnum = set.getString("ALTERNATIVE_PHONE_NUMBER");
            String landmark = set.getString("LANDMARK");

            int total = Integer.parseInt(PRICE);
            igst = (total * 5) / 100;

            int taxable = total - igst;

            String IGST = "₹" + Integer.toString(igst);
            session.setAttribute("IGST", IGST);
            String taxable_AMOUNT = "₹" + Integer.toString(taxable);
            session.setAttribute("taxable_AMOUNT", taxable_AMOUNT);
            String FIANL_PRICE = "₹" + Integer.toString(total);
            session.setAttribute("FIANL_PRICE", FIANL_PRICE);


    %>

    <body onload="triggerBtnClick()">
        <div id="invoice">
            <table>

                <tr>
                    <td>
                        <h3>Tax Invoice</h3>
                    </td>
                    <td>
                        Order Id: OD<%=set.getString("ORDER_ID")%>
                        <br>
                        Order Date: <%=formattedDate%>
                    </td>
                    <td>
                        Invoice Date: <span id="currentDateTime"></span>
                    </td>
                    <td style="border-right: none">
                        GSTIN: <span>09AGLPT0535C1ZF</span>
                        <br>
                        PAN: SFFADFADA
                    </td>
                </tr>
                <tr style="border: none;">
                    <td style="border: none; line-height: 1.5;">
                        <b>Sold By</b><br>
                        RENT KARO
                        <br>
                        27, Karl Marx Sarani Rd,<br>
                        Khidirpur, Kolkata,
                        West Bengal 700023
                    </td>
                    <td style="border: none; line-height: 1.5;">
                        <b>Shipping Address</b><br>
                        <div class="address">
                            <div style="font-size: 13px;">
                                <p style="font-size: 13px"><%=set.getString("NAME")%></p>
                                <p><%=set.getString("HOUSE_BUILDING_NO")%>, <%=set.getString("ROAD_AREA_COLONY_NAME")%>, <%=set.getString("CITY")%>, <%=set.getString("STATE")%> -  <%=set.getString("ZIPCODE")%></p>
                                <% if (landmark != null) {%>

                                <p>Landmark : <%=set.getString("LANDMARK")%></p>
                                <%
                                    }
                                %>
                                <p>PHONE NUMBER : <%=set.getString("PHONE_NUMBER")%></p>
                                <% if (alnum != null) {%>
                                <p>ALTERNATIVE NUMBER : <%=set.getString("ALTERNATIVE_PHONE_NUMBER")%></p>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </td>
                    <td style="border: none; line-height: 1.5;">
                        <b>Billing Address</b><br>
                        <div class="address">
                            <div style="font-size: 13px;">
                                <p style="font-size: 13px"><%=set.getString("NAME")%></p>
                                <p><%=set.getString("HOUSE_BUILDING_NO")%>, <%=set.getString("ROAD_AREA_COLONY_NAME")%>, <%=set.getString("CITY")%>, <%=set.getString("STATE")%> -  <%=set.getString("ZIPCODE")%></p>
                                <% if (landmark != null) {%>

                                <p>Landmark : <%=set.getString("LANDMARK")%></p>
                                <%
                                    }
                                %>
                                <p>PHONE NUMBER : <%=set.getString("PHONE_NUMBER")%></p>
                                <% if (alnum != null) {%>
                                <p>ALTERNATIVE NUMBER : <%=set.getString("ALTERNATIVE_PHONE_NUMBER")%></p>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </td>
                    <td style="border: none;">
                        <div style="text-align: center;">
                            <img width="150px" height="150px" style="margin-bottom: -20px;" src="IMAGE/QR.png">
                        </div>
                    </td>
                </tr>
            </table>
            <br>
            <br>
            <br>
            <table style="width: 98%">
                <tr style="border: 1px solid black;">
                    <th>Product</th>
                    <th>Product Image</th>
                    <th>Description</th>
                    <th>Qty</th>
                    <th>Months</th>
                    <th>Taxable Value</th>
                    <th>IGST</th>
                    <th>Total</th>
                </tr>
                <tr style="text-align: center; border: 1px solid black;">
                    <td style="border-right: none; text-align: left;width: 30%">
                        <%=set.getString("PRODUCT_NAME")%>
                    </td>
                    <td style="border-right: none;">
                        <span id="heading"><img width="55px" height="50px"  src="data:image/jpeg/png/jpg;base64,${base64Image}"/></span>
                    </td>
                    <td style="border-right: none;">
                        HSN: 6210 | IGST: 5%
                    </td>
                    <td style="border-right: none;">
                        <%=set.getString("QUANTITY")%>
                    </td>
                    <td style="border-right: none;">
                        <%=set.getString("MONTHS")%>
                    </td>
                    <td style="border-right: none;">
                        ${taxable_AMOUNT}
                    </td>
                    <td style="border-right: none;">
                        ${IGST}
                    </td>
                    <td style="border-right: none;">
                        ${FIANL_PRICE}
                    </td>
                </tr>
                <tr style="text-align: center; border: 1px solid black;">
                    <td style="border-right: none;">

                    </td>
                    <td style="border-right: none;">
                        <b>Shipping and Handling Charges</b>
                    </td>
                    <td style="border-right: none;">

                    </td>
                    <td style="border-right: none;">

                    </td>
                    <td style="border-right: none;">
                        &#8377;0.00
                    </td>
                    <td style="border-right: none;">
                        &#8377;0.00
                    </td>
                    <td style="border-right: none;">
                        &#8377;0.00
                    </td>
                </tr>
                <tr style="border: noen;">
                    <td colspan="7" style="text-align: right; border: none;">
                        <b style="color: green">TOTAL PRICE: ${FIANL_PRICE}</b>
                    </td>
                </tr>
            </table>
            <div style="margin-left: 15px">
                <p>
                    <b>Seller Registered Address: </b> 27, Karl Marx Sarani Rd,<br>
                    Khidirpur, Kolkata,
                    West Bengal 700023
                </p>
                <p><b>Declaration</b>
                    <br>The goods sold are intended for end user consumption and not for resale.
                </p>
                <div>
                    <img width="100px" src="IMAGE/Logo/Small Transparent.png">
                </div>
                <div style="float: right; margin-right: 2%; margin-top: -20ch">
                    <div style="text-align: center;">
                        <p>Ordered Through</p>
                        <div>
                            <img width="90px" height="50px" src="IMAGE/Signature.jpg">
                        </div>
                        <p>
                            <b>RENTKARO</b><br>
                            <span>Authorized Signature</span>
                        </p>
                    </div>

                </div>
            </div>

        </div>
        <a href="javascript:void(0)" id="btn" class="btn-download">Download PDF </a>



        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js" integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script type="text/javascript" src="https://unpkg.com/html2canvas@1.0.0-rc.7/dist/html2canvas.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.debug.js"></script>

        <script>
        function triggerBtnClick() {
            document.getElementById("btn").click();
        }

        function updateDateTime() {
            var currentDateTime = new Date();
            var dateTimeString = currentDateTime.toLocaleString(); // Format the date and time

            document.getElementById("currentDateTime").textContent = dateTimeString;
        }

        // Update the date and time every second
        setInterval(updateDateTime, 1000);

        // Initial update
        updateDateTime();

        const options = {
            margin: 0,
            filename: 'invoice.pdf',
            image: {
                type: 'png',
                quality: 20000
            },
            html2canvas: {
                scale: 1
            },
            jsPDF: {
                unit: 'in',
                format: 'a4',
                orientation: 'landscape'
            }
        }

        $('.btn-download').click(function (e) {
            e.preventDefault();
            const element = document.getElementById('invoice');
            html2pdf().from(element).set(options).save();
        });


        function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;
        }
        </script>

    </body>
    <%
        }
    %>

</html>