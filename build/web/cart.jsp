<%@page import="java.util.Base64"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="oracle.jdbc.OracleResultSetMetaData"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session = "true" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    <link rel="icon" href="IMAGE/Logo/Small Transparent.png" type="image/x-icon">
    <link rel='stylesheet' type='text/css' href='CSS/CART.css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
        #remove{
            float: right;
            width: 120px;
            margin-right: 10%;
            background-color: red;
            padding: 6px;
            font-size: 20px;
            border-radius: 10px;
            border: none;
            cursor: pointer;
        }
        #remove:hover{
            float: right;
            width: 120px;
            margin-right: 10%;
            background-color: orangered;
            padding: 6px;
            border-radius: 10px;
            border: none;
            cursor: pointer;
            box-shadow: 1px 1px 3px black;
        }
        #finaltotal{
            text-align: right;
            margin-right: 40px;
            margin-bottom: 40px;
            font-size: 30px;
        }
        #checkout{
            position: relative;
            display: flow-root;
            width: 200px;
            height: 40px;
            float: right;
            border: none;
            font-size: large;
            margin-bottom: 40px;
            margin-right: 2%;
            color: white;
            background-color: rgb(24, 131, 16);
            border-radius: 10px;
        }
        #checkout:hover {
            position: relative;
            display: flow-root;
            width: 200px;
            height: 40px;
            float: right;
            font-size: large;
            margin-bottom: 40px;
            margin-right: 2%;
            color: rgb(255, 255, 255);
            background-color: rgb(28, 156, 11);
            box-shadow: 1px 2px 7px 0 black;
            border-radius: 10px;
            cursor: pointer;
        }
        #bBack{
            padding: 5.7px;

            width: 100px;
            border-radius: 10px;
            background-color: navy;
            font-size: 16px;
            color: white;
            text-align: center;
            border: none;
            cursor: pointer;
        }
        #bBack:hover{
            padding: 5.7px;

            width: 100px;
            border-radius: 10px;
            background-color: royalblue;
            font-size: 16px;
            color: white;
            text-align: center;
            border: none;
            cursor: pointer;
            box-shadow: 2px 2px 4px blue;
        }
    </style>
</head>

<body>
    <div id="navbar">
        <div><img src="IMAGE/DropDownMenu.png" id="dropdown_menu_open" style="width: 20px; height: 20px;" alt=""><img
                src="IMAGE/Logo/small.png" style="width: 36px; height: 26px;" alt=""></div>
        <div onclick="goToHome()"><img src="IMAGE/Logo/LogoWithNameFinal.png" alt=""></div>

        <div>
            <div class="show_pincode_popup">

            </div>
        </div>
        <div>
            <!--            <input type="text" id="nav_search" onkeypress="return nav_search_fn(event)"
                            placeholder="Search for Product">-->
        </div>
        <!--        <div><img src="IMAGE/cart.png" onclick="cart_clicked()" alt=""></div>
                <div><button id="home_login_button" onclick="show_login_popup()">LOGIN/SIGNUP</button></div>-->
        <button type="button" name="bReset" id="bBack" onclick="history.go(-1)"><i class="fa fa-arrow-left"></i> Back</button>
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

    </div>
    <div><br><br></div>
    <div>
        <table style="margin-left: 30px">
            <%
                Connection oconn;
                PreparedStatement ops;
                int count = 0;
                int total = 0;
                OracleResultSet ors;

                Class.forName("oracle.jdbc.driver.OracleDriver");
                oconn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");
                String USER_ID = (String) session.getAttribute("USER_ID");

                ops = oconn.prepareStatement("SELECT * FROM USERCART WHERE USER_ID=?");
                ops.setString(1, USER_ID);

                ors = (OracleResultSet) ops.executeQuery();

                while (ors.next()) {
                    //           request.setAttribute("imagedata", rs.getBytes("PRODUCT_IMAGE"));
                    count++;
                    byte[] imageData = ors.getBytes("IMAGE");

                    String ID = ors.getString("CART_ID");
                    String PRICE = ors.getString("PRICE");

                    int tot = Integer.parseInt(PRICE);
                    total += tot;

                    String finaltotal = "Total Amount :  ₹ " + Integer.toString(total);
                    String finaltot = "₹ " + Integer.toString(total);
                    session.setAttribute("finaltotal", finaltotal);
                    session.setAttribute("finaltot", finaltot);
                    // Encode the image data as Base64
                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                    request.setAttribute("base64Image", base64Image);
            %>
            <tr>
                <td style="width: 40%"><img src="data:image/jpeg/png/jpg;base64,${base64Image}"/></td>
                <td style="width: 40%">
                    <p style="font-size: 150%"><%=ors.getString("PRODUCT_NAME")%></p>
                    <p style="font-size: 120%"> ₹ <%=ors.getString("PRICE")%></p>
                    <p style="font-size: 110%"> For : <%=ors.getString("MONTHS")%> Months</p>
                    <p style="font-size: 105%"> Quantity : <%=ors.getString("QUANTITY")%></p>
                    <button id="remove"><a style="text-decoration: none;color: white" onclick="return confirm('Are You Sure You Want To Delete This Product?\uD83D\uDE1E');" href="remove_from_cart.jsp?ID=<%=ID%>">REMOVE</a></button>
                </td>
            </tr>


            <%
                }

            %>

            <%    if (count == 0) {
            %>
            <div id="emptyCart">
                <img src="IMAGE/emptycart.png" alt="">
                <h1>No Items in Cart</h1>
                <p>Add a few items to your cart and come back here for an
                    express checkout process!</p>
                <div><button onclick="goToHome()">Browse Catalogue</button></div>

            </div>

            <%
            } else {
            %>
            <tfoot>
            <td colspan="2">
                <p id="finaltotal"><b>${finaltotal}</b></p>

                <button id="checkout" onclick="location.href = 'http://localhost:8080/RENT_KARO/select_delivery_address.jsp'">Checkout</button>
            </td>
            </tfoot>
        </table>
    </div>
    <%
        }
    %>
</body>
<script>


    // search function
    function nav_search_fn() {
        let se = document.getElementById("nav_search").value.toUpperCase();
        if (event.keyCode == 13) {
            if (se == "BED" || se == "ALMIRAH" || se == "CLOSET" || se == "WARDROBE" || se == "CHAIR" || se == "TABLE" || se == "SOFA") {
                window.location.href = "furniture.html";
            } else if (se == "APPLIANCES" || se == "APPLIANCE") {
                window.location.href = "appliances.html";
            } else if (se == "AC" || se == "AIR CONDITIONER" || se == "COOLER") {
                window.location.href = "appliances.html";
            } else if (se == "FRIDGE" || se == "REFRIGERATOR" || se == "FREEZER ") {
                window.location.href = "appliances.html";
            } else if (se == "MICROWAVEOVEN" || se == "MICROWAVE OVEN" || se == "MICRO WAVE OVEN" || se == "MICROWAVE" || se == "MICRO WAVE" || se == "MICROOVEN" || se == "MICRO OVEN") {
                window.location.href = "appliances.html";
            } else if (se == "WATERPURIFIER" || se == "WATER PURIFIER" || se == "AQUAGUARD" || se == "RO" || se == "WATER FILTER" || se == "WATERFILTER" || se == "PURIFIER") {
                window.location.href = "appliances.html";
            } else if (se == "WASHINGMACHINE" || se == "WASHING MACHINE" || se == "LAUNDRY MACHINE" || se == "LAUNDRYMACHINE" || se == "WASHER" || se == "CLOTHESWASHER" || se == "CLOTHES WASHER" || se == "CLOTH WASHER" || se == "CLOTHWASHER" || se == "LAUNDRYWASHER" || se == "LAUNDRY WASHER") {
                window.location.href = "appliances.html";
            } else if (se == "INDUCTIONOVEN" || se == "INDUCTION OVEN" || se == "OVEN" || se == "INDUCTION") {
                window.location.href = "appliances.html";
            } else if (se == "TV" || se == "TELEVISION" || se == "SMART TV" || se == "SMARTTV" || se == "TELE VISION" || se == "ANDROID TV" || se == "ANDROIDTV") {
                window.location.href = "appliances.html";
            } else if (se == "LAPTOP" || se == "TABLET" || se == "TAB" || se == "PAD" || se == "DESKTOP" || se == "PC" || se == "GAMINGPC" || se == "GAMING PC" || se == "GAMING DESKTOP" || se == "GAMINGDESKTOP" || se == "GAMING CONSOLE" || se == "GAMINGCONSOLE" || se == "COMPUTER") {
                window.location.href = "electronics.html";
            } else if (se == "GYM" || se == "GYMPRODUCTS" || se == "GYM PRODUCTS" || se == "GYMPRODUCT" || se == "GYM PRODUCT" || se == "DUMBBLLE" || se == "DUMBBLLES" || se == "GYMEQUIPMENTS" || se == "GYMEQUIPMENT" || se == "GYM EQUIPMENT" || se == "EXERCISE PRODUCTS" || se == "EXERCISE PRODUCT" || se == "EXERCISEPRODUCTS" || se == "EXERCISEPRODUCT" || se == "EXERCISE EQUIPMENTS" || se == "EXERCISE EQUIPMENT" || se == "EXERCISEEQUIPMENTS" || se == "EXERCISEEQUIPMENT"
                    || se == "FITNESS EQUIPMENTS" || se == "FITNESS EQUIPMENT" || se == "FITNESSEQUIPMENTS" || se == "FITNESSEQUIPMENT" || se == "FITNESS" || se == "FITNESS EQUIPMENT" || se == "FITNESS PRODUCTS" || se == "FITNESS PRODUCT" || se == "WALKER" || se == "CYCLING" || se == "FITNESSPRODUCTS" || se == "FITNESSPRODUCT") {
                window.location.href = "fitness.html";
            }
        }
    }
    // navbar started 
    //cart data

    let cartArr = JSON.parse(localStorage.getItem("cartpage")) || [];


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
            window.location.href = "index.html";
        }
    }
    document.addEventListener("mouseup", function (e) {
        let div = document.getElementById("login_popup");
        if (!div.contains(e.target)) {
            div.style.display = "none";
        }
    })
    let login_data_submit_button = document.getElementById("login_data_submit_button");
    login_data_submit_button.addEventListener("click", function () {
        let phone = document.getElementById("login_phone_data").value;
        let name = document.getElementById("login_name_data").value;
        let otp = document.getElementById("login_otp_data").value;
        if (phone == "" || name == "" || otp == "") {
            alert("Fill All Inputs");
        } else {
            if (otp == "1234") {
                let obj = {
                    name: name,
                    mobile: phone,
                }
                localStorage.setItem("user_login_data", JSON.stringify(obj));
                localStorage.setItem("loginsuccess", true);
                show_name_login_user();
                alert("Login successfull");
            } else {
                alert("OTP not match");
            }
        }
    })
    show_name_login_user();

    function show_name_login_user() {
        if (localStorage.getItem("user_login_data") == null) {
            localStorage.setItem("loginsuccess", false);
        } else {
            localStorage.setItem("loginsuccess", true);
            let details = JSON.parse(localStorage.getItem("user_login_data"));
            let but = document.getElementById("home_login_button");
            but.innerText = details.name;
        }
    }

    function goToHome() {
        window.location.href = "after_main_index.jsp";
    }
    // navbar ended
    if (localStorage.getItem("cartArr") == null || localStorage.getItem("cartpage") == "null") {

        let box = document.querySelector("body");
        let div = document.createElement("div");
        div.innerText = "Cart is Empty!!";
        div.style.textAlign = "center";
        div.style.marginTop = "20vh";
        div.style.fontSize = "22px"
        let div1 = document.createElement("div");
        // div1.innerText="Go Back...";
        // div1.style.textAlign="center";
        // div1.style.fontSize="18px"
        // div1.style.color="blue";
        // div1.style.cursor="pointer"
        div1.addEventListener("click", function () {
            window.location.href = "after_main_index.jsp";
        });
        box.append(div, div1);
    } else {
        let cartArr = JSON.parse(localStorage.getItem("cartpage"));
        function displayCart(data) {
            let tot = 0;
            let checkout = document.getElementById("checkout");
            checkout.innerHTML = "";
            let box = document.getElementById("cart");
            box.innerHTML = "";
            let total = document.createElement("div");
            total.setAttribute("id", "carttotal");
            let tot1 = document.createElement("h1");
            let tot2 = document.createElement("button");
            tot2.innerText = "Checkout";
            tot2.addEventListener("click", function () {
                window.location.href = "payment_gateway.html";
            });
            total.append(tot1, tot2);
            checkout.append(total);
            data.forEach((e, i) => {
                let div = document.createElement("div");
                div.setAttribute("class", "cartItem");
                box.append(div);
                let img = document.createElement("img");
                img.src = e.img;
                img.style.width = "auto";
                img.style.height = "355px";
                img.style.textAlign = "center";
                let name = document.createElement("h2");
                name.innerText = e.title;
                let price = document.createElement("h3");
                price.innerText = "₹" + e.price;
                tot = tot + Number(e.price);
                let remove = document.createElement("button");
                remove.innerText = "Remove";
                remove.addEventListener("click", function () {
                    cartArr.splice(i, 1);
                    localStorage.setItem("cartpage", JSON.stringify(cartArr));
                    displayCart(cartArr);
                    window.location.href = "cart.jsp";
                });
                remove.setAttribute("class", "remove_btn");
                div.append(img, name, price, remove);
            });
            tot1.innerText = "Total is :- ₹" + tot;
            window.x = tot;
            localStorage.setItem("totalamount", x);

        }
        displayCart(cartArr);
    }
    let empC = document.getElementById("emptyCart");
    let dataWithCart = document.getElementById("cart");

    if (cartArr.length === 0) {
        empC.style.display = "block";
        dataWithCart.style.visibility = "hidden";
    } else {
        empC.style.display = "none";
        dataWithCart.style.visibility = "visible";

    }

</script>

</html>