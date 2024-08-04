<%@page import="java.util.Base64"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 

<%
    if (request.getParameter("submit") != null) {
        String ID = request.getParameter("ID");

        String NAME = request.getParameter("db_product_name");
        String PRICE = request.getParameter("db_product_price");
        String QUANTITY = request.getParameter("db_product_quantity");
        String DESCRIPTION = request.getParameter("db_product_description");
        String URL = request.getParameter("db_product_url");
        String CATEGORY = request.getParameter("db_product_category");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");
        pst = con.prepareStatement("UPDATE PRODUCT SET  NAME=?,PRICE=?,QUANTITY=?,CATEGORY=?,DESCRIPTION= ?,URL=? where ID = ?");

        pst.setString(1, NAME);
        pst.setString(2, PRICE);
        pst.setString(3, QUANTITY);
        pst.setString(4, CATEGORY);
        pst.setString(5, DESCRIPTION);
        pst.setString(6, URL);
        pst.setString(7, ID);
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
        <title>ADD NEW PRODUCTS</title>
        <link rel="icon" href="../IMAGE/Logo/Small Transparent.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <style>
            body{
                background-color: lightyellow;
                margin: 0;

            }
            form{
                align-items: center;
            }
            legend{
                text-align: center;
            }

            .fild{
                padding: 10px;
            }

            /* .box{
                display: inline-block;
                text-align: left;
                width: 15ch;
            } */
            input{
                width: 30ch;
                height: 20px;

            }
            #expiry_date{
                width: 30.5ch;
            }
            #category{
                width: 30.5ch;
                padding: 2px;
                text-align: center;;
            }
            #frequently_available{
                width: 5ch;
            }
            label {
                display: inline-block;
                width: 150px;
                text-align: right;
                padding: 10px;
            }
            #fc{
                margin-left: -11.2ch;
            }
              #bSubmit{
                border-radius: 8px;
                background-color: green;
                color: white;
                border: none;
                margin-left: 50px;
                width: 20ch;
                cursor: pointer;
                padding: 7px;
            }
            #bSubmit:hover{
                border-radius: 8px;
                background-color: rgb(2, 75, 2);
                color: white;
                border: none;
                cursor: pointer;
                padding: 7px;
            }
            #bReset{
                border-radius: 8px;
                width: 120px;
                background-color: rgb(161, 172, 12);
                color: white;
                cursor: pointer;
                margin-left: 20px;
                padding: 5px;
            }
            #bReset:hover{
                border-radius: 8px;
                background-color: rgb(250, 250, 250);
                color: rgb(95, 18, 4);
                cursor: pointer;
                padding: 5px;
            }
            #bClose{
                border-radius: 8px;
                width: 100px;
                background-color: rgb(233, 3, 3);
                color: white;
                cursor: pointer;
                margin-left: 100px;
                padding: 5px;
                
            }
            #bClose:hover{
                border-radius: 8px;
                background-color: rgb(250, 250, 250);
                color: rgb(252, 38, 0);
                cursor: pointer;
                padding: 5px;
            }
            .fild textarea {
                width: 100%;
                height: 59px;
                padding: 15px;
                outline: none;
                resize: none;
                font-size: 16px;
                border-radius: 5px;
            }
            #product_category{
                width: 30.5ch;
                text-align: center;
            }
            /*  textarea:is(:focus, :valid) {
                border-color: #000000;
                border-width: 2px;
                padding: 14px;
              }*/
            #product_description{
                width: 30ch;
                margin-left: 230px;
                height: 10ch;
            }
            #product_description_label{
                margin-left: -230px;
            }
            textarea::-webkit-scrollbar {
                width: 0px;
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
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
        </style>

    </head>
    <body>
        <div class="navbar">
            <nav class="navbar-h">
                <div id="text">
                    <p style="text-align: center"><b>RENTKARO PRODUCT ADD PANNEL</b></p>
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
    <center>
        <form method="POST" action="#">

            <%                        Connection con;
                PreparedStatement pst;
                ResultSet rs;

                Class.forName("oracle.jdbc.driver.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");
                OracleResultSet ors;
                String ID = request.getParameter("ID");

                pst = con.prepareStatement("SELECT * FROM PRODUCT WHERE ID = ?");
                pst.setString(1, ID);
                rs = pst.executeQuery();

                while (rs.next()) {
                    byte[] imageData = rs.getBytes("IMAGE");

                    // Encode the image data as Base64
                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                    request.setAttribute("base64Image", base64Image);

            %>
            <div class="fild">
                <label for="product_name" class="box">Product Name : </label>
                <input type="text" name="db_product_name" value="<%= rs.getString("NAME")%>" id="product_name" required>
            </div>

            <div class="fild">
                <label for="product_url" class="box">Product IMG URL : </label>
                <input type="text" name="db_product_url" value="<%= rs.getString("URL")%>" id="product_url" required>
            </div>

            <div class="fild">
                <label for="product_price" class="box">Product Price : </label>
                <input type="number" name="db_product_price" value="<%= rs.getString("PRICE")%>" id="product_price" required>
            </div>
            <div class="fild">
                <label for="product_quantity" class="box">Product Quantity : </label>
                <input type="number" name="db_product_quantity" value="<%= rs.getString("QUANTITY")%>" id="product_quantity" required>
            </div>
            <div class="fild">
                <label for="product_category" class="box">
                    Product Category :
                </label>
                <select name="db_product_category" id="product_category" required>
                    <option value="<%= rs.getString("CATEGORY")%>"><%= rs.getString("CATEGORY")%></option>
                    <option value="furniture">Furniture</option>
                    <option value="appliances">Appliances</option>
                    <option value="electronics">Electronics</option>
                    <option value="fitness">Fitness</option>
                </select>
            </div>
            <div class="fild">
                <label for="product_description" id="product_description_label" class="box">
                    Product Description :
                </label>
                <br>
                <textarea name="db_product_description" type="text" id="product_description" placeholder="Write here....." required><%= rs.getString("DESCRIPTION")%></textarea>
            </div>


            <% }%>



            <div class="fild">
                
                <button type="button" name="bClose" id="bClose" onclick="location.href = 'http://localhost:8080/RENT_KARO/ADMIN%20PANEL/Admin_Product_Panel.jsp'"><i class="fa fa-arrow-left"></i> Back</button>
                <button type="reset" name="bReset" id="bReset"><i class="fa fa-refresh"></i> Reset</button>
                <button type="submit" name="submit" id="bSubmit">Register</button>
                
            </div>
        </form>
    </center>
</body>
</html>