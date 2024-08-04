<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="oracle.jdbc.OracleResultSetMetaData"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session = "true" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>PRODUCT</title>
        <link rel="icon" href="IMAGE/Logo/Small Transparent.png" type="image/x-icon">
        <link rel='stylesheet' type='text/css' href='CSS/new-product-page.css'>
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css"
              integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
              integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <style>

            #addtocart {
                margin-top: 60px;
                margin-bottom: 30px;
                float: right;
                color: yellow;
                background-color: blue;
                border-color: transparent;
                padding: 8px 50px;
                font-size: 25px;
                border-radius: 10px;
                cursor: pointer;
            }

            #addtocart:hover {
                margin-top: 60px;
                margin-bottom: 30px;
                float: right;
                border-color: rgba(245, 181, 72, 0.854);
                color: blue;
                background-color: white;
                padding: 8px 50px;
                font-size: 25px;
                border-radius: 10px;
                box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;
                cursor: pointer;
            }
            #months{
                padding: 5px;
                border:none;
                outline: none;
                border-bottom: 1px dotted navy;
                margin-left: 10px;
            }
            #quantity{
                border: none;
                width: 60px;
                border-bottom: 1px solid black;
                outline: none;
                text-align: center;
            }
            .checked {
                color: orange;
            }
            #cart{
                margin-top: -15px;
            }
            #cart_count{
                background-color: red;
                color: white;
                text-align: center;
                border-radius:80px;
                padding: 2px;
                margin-left: 30px;
                margin-top: -60px;
            }

        </style>
    </head>
    <%                    Connection con;
        PreparedStatement pst, pst2;
        ResultSet rs, rs2;

        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");

        String userID = (String) session.getAttribute("USER_ID");

        pst = con.prepareStatement("SELECT * FROM USERS WHERE USER_ID=?");
        pst.setString(1, userID);

        rs = pst.executeQuery();

        if (rs.next()) {

            byte[] imageData = rs.getBytes("PROFILE_PHOTO");

            pst2 = con.prepareStatement(" SELECT COUNT(*) \"TOTAL\" FROM USERCART WHERE USER_ID=?");
            pst2.setString(1, userID);
            rs2 = pst2.executeQuery();
            if (rs2.next()) {
                String CART_COUNT = rs2.getString("TOTAL");


    %>
    <body>

        <div id="navbar">
            <div><img src="IMAGE/DropDownMenu.png" id="dropdown_menu_open" style="width: 20px; height: 20px;" alt=""><img
                    src="IMAGE/Logo/small.png" style="width: 36px; height: 26px;" alt=""></div>
            <div onclick="goToHome()"><img src="IMAGE/Logo/LogoWithNameFinal.png" alt=""></div>

            <div>
                <!--                <div class="show_pincode_popup">
                                    <input type="text" placeholder="CHECK PINCODE" id="pin" style="height: 19.1px;align-items: center;">
                                    <button name="pin_data_submit_button" id="pin_data_submit_button" onclick="PINCODE()">🔍︎</button>
                                    <div><span id="validity"></span></div>
                                </div>-->
            </div>
            <div>
                <input type="text" id="nav_search" onkeypress="return nav_search_fn(event)"
                       placeholder="Search for Product">
            </div>

            <div id="cart"><img src="IMAGE/cart.png" onclick="location.href = 'cart.jsp';" alt=""><p id="cart_count"><%=CART_COUNT%></p></div>    


            <%
                }
            %>



            <div class="myaccount">
                <%                                if (imageData != null) {
                        String base64Image = Base64.getEncoder().encodeToString(imageData);
                        request.setAttribute("base64Image", base64Image);
                %>

                <button id="login_user_name" class="dropbtn" onclick=myaccount() data-toggle="dropdown"><img style="border-radius: 100px" width="40px" height="40px" src="data:image/jpeg/png/jpg;base64,${base64Image}" alt=""> ${NAME}</button>
                    <%
                    } else {
                    %>
                <button id="login_user_name" class="dropbtn" onclick=myaccount() data-toggle="dropdown" ><i class="fa fa-user" aria-hidden="true"></i> ${NAME}</button>
                <%
                        }
                    }
                %>

                <div id="myDropdown" class="dropdown-content">
                    <a style="text-decoration: none" href="http://localhost:8080/RENT_KARO/my_account.jsp"> <i class="far fa-user"></i> My Account</a>
                    <a style="text-decoration: none" href="http://localhost:8080/RENT_KARO/order_page.jsp"><i class='fa fa-first-order'></i> My Orders</a>
                    <a style="text-decoration: none" href="User_Address_Page.jsp"> <i class="fa fa-address-card" aria-hidden="true"></i> My Address</a>
                    <a id="logout" style="text-decoration: none;cursor: pointer" onclick="confirmAction()"><i class="fa fa-sign-out"></i> LogOut</a>

                </div>
            </div>

        </div>
        <div id="menu">
            <div>
                <div><img src="IMAGE/Logo/LogoWithNameFinal.png" alt=""></div>
            </div>
            <div>
                <ul>
                    <li><a href="" onclick="show_login_popup()">Login/Signup</a></li>
                    <li><a href="">Categories</a></li>
                    <li><a href="">Read More</a></li>
                    <li><a href="">Need Help</a></li>
                </ul>
            </div>
        </div>

        <div id="search_down">
            <input type="text" id="nav_search_down" oninput="nav_search_fn()" placeholder="Search for Product">
        </div>
        <!-- loginsignup started -->
        <div id="login_popup">
            <div id="login_popup_img"><img src="IMAGE/login_side.png" alt=""></div>
            <div>

                <label style="margin-top: -1px;" for="">Enter Your Number to Login or Signup</label>
                <span onclick="document.getElementById('login_popup').style.display = 'none'" class="closeX"
                      title="Close Modal">&times;</span>
                <form id="login" method="POST" action="http://localhost:8080/RENT_KARO/Login">
                    <p class="input-group">
                        <input id="user_name" class="form-control" placeholder="Enter Your Email..." name="db_user_name"
                               type="text" size="30" aria-required="false" required>
                        <span style="background-color: transparent;border: none" class="input-group-addon" role="button" title="veiw password" id="">

                        </span>
                    </p>
                    <p class="input-group">
                        <input id="passInput" class="form-control" placeholder="Enter Your Password..." name="db_password" type="password"
                               size="30" aria-required="false" required>
                        <span class="input-group-addon" role="button" title="veiw password" id="passBtn">
                            <i class="fa fa-eye" aria-hidden="true"></i>
                        </span>
                    </p>
                </form>
                <a style="float: right;" class="forgot" href="forgot.html">Forgot Your Password?</a>

                <!-- <input type="text" name="" id="login_otp_data" placeholder="Enter OTP"> -->
                <div>
                    <button id="signup" type="button" onclick="window.location.href = 'signup.html'">SIGN UP</button>
                </div>
                <img src="IMAGE/Logo/Small Transparent.png" style="width: 200px;height: 200px; margin-left: 8ch">
                <button form="login" type="submit" id="login_data_submit_button">Continue</button>

            </div>
        </div>

        <div>
            <form method="POST" action="http://localhost:8080/RENT_KARO/Cart">
                <table style="margin-left: 30px;">
                    <%
                        Connection oconn;
                        PreparedStatement ops;
                        OracleResultSetMetaData orsm;
                        OracleResultSet ors;

                        String ID = request.getParameter("ID");

                        Class.forName(
                                "oracle.jdbc.driver.OracleDriver");
                        oconn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");
                        ops = oconn.prepareStatement("SELECT * FROM PRODUCT WHERE id=?");

                        ops.setString(
                                1, ID);
                        ors = (OracleResultSet) ops.executeQuery();

                        orsm = (OracleResultSetMetaData) ops.getMetaData();

                        while (ors.next()
                                == true) {
                            //           request.setAttribute("imagedata", rs.getBytes("PRODUCT_IMAGE"));
                            byte[] imageData = ors.getBytes("IMAGE");

                            String Qty = ors.getString("QUANTITY");
                            int quantity = Integer.parseInt(Qty);

                            // Encode the image data as Base64
                            String base64Image = Base64.getEncoder().encodeToString(imageData);
                            request.setAttribute("base64Image", base64Image);
                    %>
                    <tr style="text-align:left;">
                        <td><img width="100%" height="90%"  src="data:image/jpeg/png/jpg;base64,${base64Image}"/></td>

                        <td style="padding: 18px">
                            <p style="font-size: 200%"><%=ors.getString("NAME")%></p>
                            <br>
                            <p style="font-size: 20px;"> ₹ <%=ors.getString("PRICE")%> /month</p>
                            <br>
                            <pre style=" background-color: transparent;border: none;font-family: sans-serif;font-size: 20px"><%=ors.getString("DESCRIPTION")%></pre>

                            <br>
                            <br>
                            <br>
                            <br>
                            <%
                                if (quantity <= 5) {
                            %>
                            <p style="color: red"> Available Quantity: Only - <%=ors.getString("QUANTITY")%></p>
                            <%
                                }
                            %>
                            <label for="months" class="box">
                                How Long You Want This Product :
                            </label>
                            <select name="db_month" id="months" required>

                                <option value="1">1 Month</option>
                                <option value="2">2 Month</option>
                                <option value="3">3 Month</option>
                                <option value="4">4 Month</option>
                                <option value="5">5 Month</option>
                                <option value="6">6 Month</option>
                                <option value="7">7 Month</option>
                                <option value="8">8 Month</option>
                                <option value="9">9 Month</option>
                                <option value="10">10 Month</option>
                                <option value="11">11 Month</option>
                                <option value="12">12 Month</option>
                            </select>
                            <br>
                            <br>
                            <input type="hidden" name="db_p_id" value="<%=ors.getString("ID")%>" >
                            <label for="months" class="box">
                                Product Quantity (Max 5 Piece/Person) :
                            </label>
                            <input type="number" value="1" id="quantity" name="db_quantity" min="1" max="5">

                            <button id="addtocart" type="submit">ADD TO CART</button>
                        </td>
                    </tr>
                    <%
                        }
                    %>

                </table>
            </form>
        </div>

    </body>


    <script>

        document.getElementById("myNumber").defaultValue = "1";

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

        const PassBtn = document.querySelector('#passBtn');
        PassBtn.addEventListener('click', () => {
            const input = document.querySelector('#passInput');
            input.getAttribute('type') === 'password' ? input.setAttribute('type', 'text') : input.setAttribute('type', 'password');

            if (input.getAttribute('type') === 'text') {
                PassBtn.innerHTML = '<i class="fa fa-eye-slash"></i>';
            } else {
                PassBtn.innerHTML = '<i class="fa fa-eye fa-fw" aria-hidden="true"></i>';
            }

        });


        // nav started 
        let dropdown_menu_open = document.getElementById("dropdown_menu_open");
        dropdown_menu_open.addEventListener("click", function () {
            let menu = document.getElementById("menu");
            menu.style.display = "block";
        });
        let dropdown_menu_close = document.getElementById("dropdown_menu_close");
        dropdown_menu_close.addEventListener("click", function () {
            let menu = document.getElementById("menu");
            menu.style.display = "none";
        });


        // search function
        // search function
        function nav_search_fn(event) {
            let se = document.getElementById("nav_search").value.toUpperCase();
            // event.preventDefault();
            let keyCode = event.keyCode ? event.keyCode : event.which;
            if (event.keyCode == 13) {
                if (se == "BED" || se == "ALMIRAH" || se == "CLOSET" || se == "WARDROBE" || se == "CHAIR" || se == "TABLE" || se == "SOFA") {
                    window.location.href = "after_furniture.jsp";
                } else if (se == "APPLIANCES" || se == "APPLIANCE") {
                    window.location.href = "after_appliances.jsp";
                } else if (se == "AC" || se == "AIR CONDITIONER" || se == "COOLER") {
                    window.location.href = "after_appliances.jsp";
                } else if (se == "FRIDGE" || se == "REFRIGERATOR" || se == "FREEZER ") {
                    window.location.href = "after_appliances.jsp";
                } else if (se == "MICROWAVEOVEN" || se == "MICROWAVE OVEN" || se == "MICRO WAVE OVEN" || se == "MICROWAVE" || se == "MICRO WAVE" || se == "MICROOVEN" || se == "MICRO OVEN") {
                    window.location.href = "after_appliances.jsp";
                } else if (se == "WATERPURIFIER" || se == "WATER PURIFIER" || se == "AQUAGUARD" || se == "RO" || se == "WATER FILTER" || se == "WATERFILTER" || se == "PURIFIER") {
                    window.location.href = "after_appliances.jsp";
                } else if (se == "WASHINGMACHINE" || se == "WASHING MACHINE" || se == "LAUNDRY MACHINE" || se == "LAUNDRYMACHINE" || se == "WASHER" || se == "CLOTHESWASHER" || se == "CLOTHES WASHER" || se == "CLOTH WASHER" || se == "CLOTHWASHER" || se == "LAUNDRYWASHER" || se == "LAUNDRY WASHER") {
                    window.location.href = "after_appliances.jsp";
                } else if (se == "INDUCTIONOVEN" || se == "INDUCTION OVEN" || se == "OVEN" || se == "INDUCTION") {
                    window.location.href = "after_appliances.jsp";
                } else if (se == "TV" || se == "TELEVISION" || se == "SMART TV" || se == "SMARTTV" || se == "TELE VISION" || se == "ANDROID TV" || se == "ANDROIDTV") {
                    window.location.href = "after_appliances.jsp";
                } else if (se == "LAPTOP" || se == "TABLET" || se == "TAB" || se == "PAD" || se == "DESKTOP" || se == "PC" || se == "GAMINGPC" || se == "GAMING PC" || se == "GAMING DESKTOP" || se == "GAMINGDESKTOP" || se == "GAMING CONSOLE" || se == "GAMINGCONSOLE" || se == "COMPUTER") {
                    window.location.href = "after_electronics.jsp";
                } else if (se == "GYM" || se == "GYMPRODUCTS" || se == "GYM PRODUCTS" || se == "GYMPRODUCT" || se == "GYM PRODUCT" || se == "DUMBBLLE" || se == "DUMBBLLES" || se == "GYMEQUIPMENTS" || se == "GYMEQUIPMENT" || se == "GYM EQUIPMENT" || se == "EXERCISE PRODUCTS" || se == "EXERCISE PRODUCT" || se == "EXERCISEPRODUCTS" || se == "EXERCISEPRODUCT" || se == "EXERCISE EQUIPMENTS" || se == "EXERCISE EQUIPMENT" || se == "EXERCISEEQUIPMENTS" || se == "EXERCISEEQUIPMENT"
                        || se == "FITNESS EQUIPMENTS" || se == "FITNESS EQUIPMENT" || se == "FITNESSEQUIPMENTS" || se == "FITNESSEQUIPMENT" || se == "FITNESS" || se == "FITNESS EQUIPMENT" || se == "FITNESS PRODUCTS" || se == "FITNESS PRODUCT" || se == "WALKER" || se == "CYCLING" || se == "FITNESSPRODUCTS" || se == "FITNESSPRODUCT") {
                    window.location.href = "after_fitness.jsp";
                } else {
                    window.alert("MISMATCH KEYWORD!!");
                }

            }
        }

        //cart data
        function cart_clicked() {
            window.location.href = "cart.jsp";
        }
        // login signup started


        function show_login_popup() {
            let menu = document.getElementById("menu");
            menu.style.display = "none";
            let but = document.getElementById("home_login_button");
            if (but.innerText == "LOGIN/SIGNUP") {
                let div = document.getElementById("login_popup");
                div.style.display = "flex";
            } else {
                localStorage.setItem("user_login_data", null);
                localStorage.setItem("loginsuccess", false);
                but.innerText = "LOGIN/SIGNUP";
                alert("Logout Success!!!");
            }
        }
        document.addEventListener("mouseup", function (e) {
            let div = document.getElementById("login_popup");
            if (!div.contains(e.target)) {
                div.style.display = "none";
            }
        })


        function myaccount() {
            document.getElementById("myDropdown").classList.toggle("show");
            window.onclick = function (event) {
                if (!event.target.matches('.dropbtn')) {
                    var dropdowns = document.getElementsByClassName("dropdown-content");
                    var i;
                    for (i = 0; i < dropdowns.length; i++) {
                        var openDropdown = dropdowns[i];
                        if (openDropdown.classList.contains('show')) {
                            openDropdown.classList.remove('show');
                        }
                    }
                }
            }
        }



        function goToHome() {
            window.location.href = "after_main_index.jsp";
        }

    </script>
</html>