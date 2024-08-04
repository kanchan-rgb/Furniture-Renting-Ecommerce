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
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fitness</title>
        <link rel="icon" href="IMAGE/Logo/Small Transparent.png" type="image/x-icon">
        <link rel='stylesheet' type='text/css' href='CSS/FITNESS.css'>
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css"
              integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
              integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <script src="JS/FITNESS.js"></script>
        <style>
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
                    <li><a href="main_index.jsp">Categories</a></li>
                    <li><a href="">Read More</a></li>
                    <li><a href="">Need Help</a></li>
                </ul>
            </div>
        </div>
        <div id="search_down">
            <input type="text" id="nav_search_down" onclick="nav_search_fn()" placeholder="Search for Product">
        </div>
        <!--Navigation Bar-->
        <div class="top">
            <div class="wid">
                <div>
                    <a style="text-decoration:none; color: black;" href="after_main_index.jsp">Home ></a>
                    <a style="text-decoration:none; color: black;" href="after_fitness.jsp">Fitness</a>
                </div>
                <div>
                    <a style="text-decoration:none; color: black;" href="after_furniture.jsp">Furniture &nbsp;</a>
                    <a style="text-decoration:none; color: black;" href="after_appliances.jsp">Appliances &nbsp;</a>
                    <a style="text-decoration:none; color: black;" href="after_electronics.jsp">Electronics &nbsp;</a>
                    <a style="text-decoration:none; color: black;" href="after_fitness.jsp">Fitness &nbsp;</a>
                </div>
            </div>
        </div>
        <div>
            <table style="margin-left: 30px">
                <%
                    Connection oconn;
                    PreparedStatement ops;
                    OracleResultSetMetaData orsm;
                    OracleResultSet ors;

                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    oconn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");
                    ops = oconn.prepareStatement("SELECT * FROM PRODUCT WHERE CATEGORY=? AND QUANTITY<>0 ORDER BY ID DESC");
                    ops.setString(1, "fitness");
                    ors = (OracleResultSet) ops.executeQuery();

                    orsm = (OracleResultSetMetaData) ops.getMetaData();
                    while (ors.next() == true) {
                        //           request.setAttribute("imagedata", rs.getBytes("PRODUCT_IMAGE"));
                        byte[] imageData = ors.getBytes("IMAGE");

                        String ID = ors.getString("ID");
                        String Qty = ors.getString("QUANTITY");
                        int quantity = Integer.parseInt(Qty);

                        // Encode the image data as Base64
                        String base64Image = Base64.getEncoder().encodeToString(imageData);
                        request.setAttribute("base64Image", base64Image);
                %>
                <tr>
                    <td><img width="80%" height="40%"  src="data:image/jpeg/png/jpg;base64,${base64Image}"/></td>
                    <td>
                        <p style="font-size: 200%"><%=ors.getString("NAME")%></p>
                        <p> ₹ <%=ors.getString("PRICE")%> /month</p>
                        <%
                            if (quantity <= 5) {
                        %>
                        <p style="color: red"> Available Quantity: Only - <%=ors.getString("QUANTITY")%></p>
                        <%
                            }
                        %>
                        <button id="vew_btn" onclick="location.href = 'after_new-product-page.jsp?ID=<%=ID%>'">VIEW PRODUCT DETAILS</button>
                    </td>
                </tr>
                <%
                    }
                %>
                <!--        <div class="containerX">
                            <div class="check" style="margin: 1%;">
                                <h3>PRODUCT TYPE</h3>
                                <div class="checkboxS">
                
                                    <div> <input type="checkbox" id="bed" value="bed">
                                        <label for="bed">BED</label>
                                    </div>
                                    <div> <input type="checkbox" id="sofa" value="sofa">
                                        <label for="sofa">SOFA</label>
                                    </div>
                                    <div> <input type="checkbox" id="table" value="table">
                                        <label for="table">TABLE</label>
                                    </div>
                                    <div> <input type="checkbox" id="chair" value="chair">
                                        <label for="chair">CHAIR</label>
                                    </div>
                                    <div> <input type="checkbox" id="almirah" value="almirah">
                                        <label for="almirah">CLOSET</label>
                                    </div>
                                </div>
                
                            </div>
                
                            <div style="position: relative; margin: 2%;" id="product_containor"></div>
                        </div>-->
            </table>
        </div>
        <button style="float: right" id="backToTopBtn" onclick="scrollToTop()"><i class="fas fa-arrow-up"></i></button>
    </body>

</html>
<script>
// Get a reference to the "Back to Top" button
    const backToTopButton = document.getElementById("backToTopBtn");

// Add a scroll event listener to the window
    window.addEventListener("scroll", toggleBackToTopButton);

// Function to toggle the button's visibility
    function toggleBackToTopButton() {
        if (window.scrollY > 200) {
            // Show the button when the user scrolls down 200 pixels
            backToTopButton.style.display = "block";
        } else {
            // Hide the button when the user is near the top of the page
            backToTopButton.style.display = "none";
        }
    }

// Function to scroll to the top of the page when the button is clicked
    function scrollToTop() {
        window.scrollTo({
            top: 0,
            behavior: "smooth" // Smooth scrolling behavior (optional)
        });
    }


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

//    function PINCODE() {
//        var txt;
//        if (pin.value == 700102) {
//            txt = "Available";
//        } else {
//            txt = "Not Available";
//        }
//        document.getElementById("validity").innerHTML = txt;
//    }
//    let fitness = document.getElementById("fitness");
//
//    function initial() {
//        fitness.checked = true;
//        display(fitness_data)
//    }
//    initial();
//
//
//
//    function display(data) {
//
//        let cont = document.getElementById("product_containor");
//
//
//        cont.innerHTML = "";
//
//        data.forEach((e) => {
//
//            let div = document.createElement("div")
//            div.setAttribute("class", "product_cards");
//
//            let btn_div = document.createElement("div");
//            btn_div.setAttribute("class", "view");
//            let btn = document.createElement("button")
//            btn.innerText = "View Details";
//            btn.setAttribute("id", "viewbtn")
//            btn.addEventListener("click", function () {
//                localStorage.setItem("products", JSON.stringify(e));
//                window.location.href = "after_new-product-page.jsp";
//
//            })
//            if (performance.navigation.type == 2) {
//                location.reload(true);
//            }
//
//            btn_div.append(btn);
//
//            let span = document.createElement("span");
//            span.innerText = "month";
//            span.setAttribute("class", "mo")
//
//            let i = document.createElement("img")
//            i.src = e.img;
//            i.style.width = "100%"
//            let t = document.createElement("h3");
//            t.innerText = e.title;
//            let p = document.createElement("p");
//            p.innerText = e.price + "/";
//            p.style.display = "inline"
//
//
//            div.append(i, t, p, span, btn_div)
//            cont.append(div);
//
//
//
//        });
//
//    }
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

    // navbar started 
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

    // login signup started

//    function show_login_popup() {
//        let menu = document.getElementById("menu");
//        menu.style.display = "none";
//        let but = document.getElementById("home_login_button");
//        if (but.innerText == "LOGIN/SIGNUP") {
//            let div = document.getElementById("login_popup");
//            div.style.display = "flex";
//        } else {
//            localStorage.setItem("user_login_data", null);
//            localStorage.setItem("loginsuccess", false);
//            but.innerText = "LOGIN/SIGNUP";
//            alert("Logout Success!!!");
//        }
//    }
//    document.addEventListener("mouseup", function (e) {
//        let div = document.getElementById("login_popup");
//        if (!div.contains(e.target)) {
//            div.style.display = "none";
//        }
//    });
//    let login_data_submit_button = document.getElementById("login_data_submit_button");
//    login_data_submit_button.addEventListener("click", function () {
//        let phone = document.getElementById("login_phone_data").value;
//        let name = document.getElementById("login_name_data").value;
//        let otp = document.getElementById("login_otp_data").value;
//        if (phone == "" || name == "" || otp == "") {
//            alert("Fill All Inputs");
//        } else {
//            if (otp == "1234") {
//                let obj = {
//                    name: name,
//                    mobile: phone,
//                }
//                localStorage.setItem("user_login_data", JSON.stringify(obj));
//                localStorage.setItem("loginsuccess", true);
//                show_name_login_user();
//                alert("Login successfull");
//
//            } else {
//                alert("OTP not match");
//            }
//        }
//    })
//    show_name_login_user();
//
//    function show_name_login_user() {
//        if (localStorage.getItem("user_login_data") == null) {
//            localStorage.setItem("loginsuccess", false);
//        } else {
//            localStorage.setItem("loginsuccess", true);
//            let details = JSON.parse(localStorage.getItem("user_login_data"));
//            let but = document.getElementById("home_login_button");
//            but.innerText = details.name;
//        }
//    }
    //my account

    // Close the dropdown menu if the user clicks outside of it

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