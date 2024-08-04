<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="oracle.jdbc.OracleResultSetMetaData"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Base64"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>RENT KARO</title>
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css"
              integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
              integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="icon" href="IMAGE/Logo/Small Transparent.png" type="image/x-icon">
        <link rel='stylesheet' type='text/css' href='CSS/MAIN_INDEX.css'>
        <style>
            #otp{

                margin-top: 13px;
                background-color: #09841B;
                color: white;
                border-radius: 8px;
                width: 80px;
                font-size: 13px;
                padding: 4px;
                cursor: pointer;
            }
            #otp:hover{
                color: black;
                background-image: linear-gradient( to bottom, #fff, #90EE90 );
            }

            .checked {
                color: orange;
            }

            #items {
                width: 70%;
                margin: auto;
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                align-items: center;
                justify-content: center;
                padding: 10ch;
                gap: 20px;
                margin-bottom: 70px;
                overflow: hidden;
                position: relative;

                /* border: 5px solid black; */

            }
            #items div {
                height: 140px;
                width: 140px;
                margin-top: 20px;
                cursor: pointer;
            }
            .try{
              margin-left: 20px;
            }
            .tryX{
                margin-left: -15px;
            }

            #items img {
                width: 100%;

            }



            #items div:hover {
                box-shadow: rgba(18, 103, 232, 0.413) 1px 1px 0px 0px;
                transform: scale(1.2);
                animation: mymove 2s infinite;
            }
        </style>
    </head>

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
            <div><img src="IMAGE/cart.png" onclick="cart_clicked()" alt=""></div>
            <!-- <div><button id="home_login_button" onclick="show_login_popup()">LOGIN/SIGNUP</button></div> -->
            <div><button id="home_login_button" onclick="show_login_popup()">LOGIN/SIGNUP</button></div>

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
            <input type="text" id="nav_search_down" onclick="nav_search_fn()" placeholder="Search for Product">
        </div>
        <!-- loginsignup started -->
        <div id="login_popup">
            <div id="login_popup_img"><img src="IMAGE/login_side.png" style="margin-top: 20%; width:100% ;height: 70%; border-radius: 20px" alt=""></div>
            <div>

                <label style="margin-top: -1px;" for="">Enter Your Email And Password to Login</label>
                <span onclick="document.getElementById('login_popup').style.display = 'none'" class="close"
                      title="Close Modal">&times;</span>
                <form id="login" method="POST" action="http://localhost:8080/RENT_KARO/Login">
                    <p class="input-group">
                        <input id="user_name" class="form-control" placeholder="Enter Your Email..." name="db_user_name"
                               type="email" size="30" aria-required="false" required>
                        <span style="background-color: transparent;border: none;cursor: default" class="input-group-addon" role="button" title="veiw password" id="">

                        </span>
                    </p>
                    <p class="input-group">
                        <input id="passInput" class="form-control" placeholder="Enter Your Password..." name="db_password" type="text"
                               size="30" aria-required="false" autocomplete="off" required>
                        <span class="input-group-addon" role="button" title="veiw password" id="passBtn">
                            <i class="fa fa-eye" aria-hidden="true"></i>
                        </span>
                    </p>
                    <button id="otp" type="button" onclick="redirectToServlet()">SEND OTP</button>
                    <br>
                    <br>

                    <input type="text"  class="form-control" pattern="\d*" maxlength="6" name="Lotp" placeholder="Enter Your OTP" required>
                    <span style="background-color: transparent;border: none" class="input-group-addon" role="button" title="veiw password" id="">

                    </span>

                </form>
                <div>
                    <button form="login" type="submit" id="login_data_submit_button">Log In</button>
                </div>
                <div>
                    <button id="signup" type="button" onclick="window.location.href = 'signup.html'">Create New Account</button>
                </div>
                <a style="float: right; margin-top: -6ch;" class="forgot" href="forgot.html">Forgot Your Password?</a>

                <!-- <input type="text" name="" id="login_otp_data" placeholder="Enter OTP"> -->

                <img src="IMAGE/Logo/Small Transparent.png" style="width: 300px;height: 200px; margin-left: 17%; margin-top: -1ch">


            </div>
        </div>



        <script>


            function redirectToServlet() {
                // Get the input value
                var email = document.getElementById("user_name").value;
                var password = document.getElementById("passInput").value;

                // Construct the URL with the input value as a query parameter
                var url = "http://localhost:8080/RENT_KARO/LoginOTP?EMAIL=" + email + "&PASS=" + password;

                // Redirect to the servlet
                window.location.href = url;
            }

            const PassBtn = document.querySelector('#passBtn');
            PassBtn.addEventListener('click', () => {
                const input = document.querySelector('#passInput');
                input.getAttribute('type') === 'text' ? input.setAttribute('type', 'password') : input.setAttribute('type', 'text');

                if (input.getAttribute('type') === 'text') {
                    PassBtn.innerHTML = '<i class="fa fa-eye-slash"></i>';
                } else {
                    PassBtn.innerHTML = '<i class="fa fa-eye fa-fw" aria-hidden="true"></i>';
                }

            });
        </script>
        <div id="cont">

            <div class="banner">
                <div class="banner_inner">
                    <a href="fitness.html">
                        <div class="banner_item banner_item__active">
                            <img src="IMAGE/Banner/b1.jpg" alt="" class="banner_img">
                        </div>
                    </a>
                    <div class="banner_item">
                        <img src="IMAGE/Banner/b2.jpg" alt="" class="banner_img">
                    </div>
                    <div class="banner_item">
                        <img src="IMAGE/Banner/b3.jpg" alt="" class="banner_img">
                    </div>
                    <div class="banner_item">
                        <img src="IMAGE/Banner/b4.jpg" alt="" class="banner_img">
                    </div>
                    <div class="banner_item">
                        <img src="IMAGE/Banner/b5.jpg" alt="" class="banner_img">
                    </div>
                    <div class="banner_item">
                        <img src="IMAGE/Banner/b6.jpg" alt="" class="banner_img">
                    </div>
                    <div class="banner_item">
                        <img src="IMAGE/Banner/b7.jpg" alt="" class="banner_img">
                    </div>


                    <div class="banner_indicator">
                        <button class="banner_dot banner_dot__active"></button>
                        <button class="banner_dot"></button>
                        <button class="banner_dot"></button>
                        <button class="banner_dot"></button>
                        <button class="banner_dot"></button>
                        <button class="banner_dot"></button>
                        <button class="banner_dot"></button>
                    </div>

                    <div class="banner_control">
                        <button class="banner_button banner_button__prev">
                            <i class="fas fa-chevron-left"></i>
                        </button>
                        <button class="banner_button banner_button__next">
                            <i class="fas fa-chevron-right"></i>
                        </button>
                    </div>
                </div>
                <div class="truck">
                    <img src="IMAGE/output-onlinegiftools.gif" style="height: 70px; margin-bottom: 20px;">
                </div>
            </div>


            <div id="items">


                <div class="tryX" onclick="window.location.href='furniture.jsp'"> <img src="IMAGE/Items/Furniture.png" alt="" /></div>


                <div class="try" onclick="window.location.href='appliances.jsp'"> <img src="IMAGE/Items/appliances.png" alt="" /></div>


                <div class="try" onclick="window.location.href='electronics.jsp'"> <img src="IMAGE/Items/electronics.png" alt="" /></div>


                <div class="try" onclick="window.location.href='fitness.jsp'"><img src="IMAGE/Items/fitness.png" alt="" /></div>


            </div>

            <div id="div3">

                <div id="cont3">
                    <div class="sub3">
                        <img src="IMAGE/cont3/sub1.jpg" alt="">
                        <h3>Finest-quality products</h3>
                        <p>Quality matters to you, and us! That's why we do a strict quality-check for every product.</p>
                    </div>

                    <div class="sub3">
                        <img src="IMAGE/cont3/sub2.jpg" alt="">
                        <h3>Free relocation</h3>
                        <p>Changing your house or even your city? We'll relocate your rented products for free.</p>
                    </div>

                    <div class="sub3">
                        <img src="IMAGE/cont3/sub3.jpg" alt="">
                        <h3>Free maintenance</h3>
                        <p>Keeping your rented products in a spick and span condition is on us, so you can sit back and
                            relax.</p>
                    </div>

                    <div class="sub3">
                        <img src="IMAGE/cont3/sub4.jpg" alt="">
                        <h3>Cancel anytime</h3>
                        <p>Pay only for the time you use the product and close your subscription without any hassle.</p>
                    </div>

                    <div class="sub3">
                        <img src="IMAGE/cont3/sub5.jpg" alt="">
                        <h3>Easy return on delivery</h3>
                        <p>If you don't like the product on delivery, you can return it right away—no questions asked.</p>
                    </div>

                    <div class="sub3">
                        <img src="IMAGE/cont3/sub6.jpg" alt="">
                        <h3>Keep upgrading</h3>
                        <p>Bored of the same product? Upgrade to try another, newer design and enjoy the change!</p>
                    </div>

                </div>
                <div>
                    <h1> </h1>
                </div>

            </div>

            <!-- div4 nitish -->


            <div id="nitish_div4">


                <div id="div4">
                    <div id="details">
                        <!-- <h2>Over 1.5 lac</h2> -->
                        <h2 id="un" style="margin: 40px 0px;">Over 1.5 lac happy subscribers</h2>
                        <p>Here's what they</p>
                        <p>have to say about</p>
                        <p>their Rent Karo</p>
                        <p>experience.</p>

                        <!-- Next and previous buttons -->
                        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                        <a class="next" onclick="plusSlides(1)">&#10095;</a>
                    </div>

                    <!-- Slideshow container -->
                    <div class="slideshow4">

                        <!-- Full-width images with number and caption text -->

                        <%
                            Connection oconn;
                            PreparedStatement ops;
                            OracleResultSetMetaData orsm;
                            OracleResultSet ors;
                            int c = 0;

                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            oconn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");
                            ops = oconn.prepareStatement("SELECT * FROM(SELECT * FROM FEEDBACK ORDER BY DBMS_RANDOM.RANDOM)WHERE ROWNUM<6");

                            ors = (OracleResultSet) ops.executeQuery();

                            orsm = (OracleResultSetMetaData) ops.getMetaData();
                            while (ors.next() == true) {
                                c++;
                                byte[] imageData = ors.getBytes("IMAGE");
                                byte[] videoData = ors.getBytes("VIDEO");
                                String star = ors.getString("Rating_Star");

                        %>


                        <div class="mySlides4">
                            <br>
                            <br>
                            <br>
                            <div><%=c%>/5</div>


                            <h3><%=ors.getString("NAME")%></h3>
                            <%
                                if (star.equals("5")) {
                            %>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <%
                                }
                                if (star.equals("4")) {
                            %>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                            <%
                                }
                                if (star.equals("3")) {
                            %>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                            <%
                                }
                                if (star.equals("2")) {
                            %>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                            <%
                                }
                                if (star.equals("1")) {
                            %>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                            <%
                                }
                            %>
                            <p>
                                <%=ors.getString("Experience")%>
                            </p>
                            <%
                                if (imageData != null) {
                                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                                    request.setAttribute("base64Image", base64Image);
                            %>
                            <div class="fIV">

                                <img src="data:image/jpeg/png/jpg;base64,${base64Image}"/>

                            </div>
                            <%
                                }
                                if (videoData != null) {
                                    String base64Image2 = Base64.getEncoder().encodeToString(videoData);
                                    request.setAttribute("base64Image2", base64Image2);
                            %>
                            <div class="fIV">
                                <video width="170px" height="100px" controlsList="nodownload"
                                       controls
                                       playsinline
                                       autoplay
                                       muted
                                       loop
                                       class="uvodna__bg-video"
                                       >
                                    <source src="data:video/mp4;base64,${base64Image2}" type="video/mp4" />
                                </video>
                            </div>
                            <%
                            } else {
                            %>

                            <%
                                }
                            %>
                        </div>


                        <%
                            }
                        %>







                    </div>





                </div>



            </div>


            <!-- footer added 
            -->

            <div id="cb">

                <div class="p">
                    <h3>Rent Karo: Upgrade To Your Dream Lifestyle At An Unbelievably Low Price!</h3> <br>
                    <p>
                        Rent Karo is your ticket to a better lifestyle in India. We provide designer furniture, the newest
                        gadgets, and bestselling appliances on rent in major Indian cities. You can use the best products
                        available in the market at just a fraction of their retail value. You pay us a small monthly fee,
                        which becomes lesser the longer you rent from us. <br> <br>
                        Besides saving you money, we do our best to provide you with an exceptional, super-comfortable
                        rental experience. Our ordering process is straightforward and efficient. You can order from us in a
                        matter of minutes from your PC or smartphone. We offer speedy delivery in major Indian cities,
                        namely Bangalore, Mumbai, Delhi, Chennai, Pune, Hyderabad, Gurgaon, and Noida. <br> <br>
                        No matter what product you rent from us, we will provide you with several complementary benefits
                        with it. The benefits range from a yearly product swap option to a periodic free maintenance
                        service. These are benefits no regular retailer offers. Start renting now! <br>
                        Read More </p> <br> <br>
                </div>


                <div id="footer">



                    <div>
                        <ol>
                            <h3>Rent Karo</h3>
                            <li><a href="about_us.html">About Us</a></li>
                            <li><a style="cursor: pointer" onclick="cart_clicked()">Feedback</a></li>
                            <li><a href="contact_us.html">Contact Us</a></li>
                            <li><a href="http://localhost:8080/RENT_KARO/benifits.html">Our Benefits</a></li>
                            <li><a href="bugs_report.html">Bugs Report</a></li>
                        </ol>
                    </div>


                    <div>
                        <ol>
                            <h3>INFORMATION</h3>
                            <li><a href="http://localhost:8080/RENT_KARO/blog.html">Blog</a></li>
                            <li><a href="http://localhost:8080/RENT_KARO/FAQ.html">FAQs</a></li>
                            <li><a href="http://localhost:8080/RENT_KARO/Document%20Required.html">Document Required</a></li>
                        </ol>
                    </div>

                    <div>
                        <ol>
                            <h3>POLICIES</h3>
                            <li><a href="http://localhost:8080/RENT_KARO/shipping.html">Shipping Policy</a></li>
                            <li><a href="http://localhost:8080/RENT_KARO/cancel%20and%20return.html">Cancellation and Return</a></li>
                            <li><a href="http://localhost:8080/RENT_KARO/privacy%20policy.html">Privacy Policy</a></li>
                            <li><a href="http://localhost:8080/RENT_KARO/renatl%20tc.html">Rental Terms and Conditions</a></li>
                            <li><a href="http://localhost:8080/RENT_KARO/referralTC.html">Referral Terms and Conditions</a></li>
                        </ol>
                    </div>
                    <div class="C">

                        <ol>


                            <h3>NEED HELP ?</h3>
                            <button style="margin-top: 20px;">Chat with us (9AM - 6PM)</button>
                            <P style="margin-top: 20px;">www.RentKaro.com</P>


                        </ol>



                    </div>

                </div>





            </div>



            <div id="bottom_footer">



                <div>
                    <p>&#169 2023 RentKaro Pvt.Ltd</p>
                </div>


                <div class="B">


                    <a href="https://www.twitter.com/"><img src="IMAGE/Footer Logo/twitter.png" id="twitter" alt=""></a>
                    <a href="https://www.linkedin.com/"><img src="IMAGE/Footer Logo/linkedin.png" id="linkedin" alt=""></a>
                    <a href="https://www.facebook.com"><img src="IMAGE/Footer Logo/facebook.png" id="facebook" alt=""></a>
                    <a href="https://www.youtube.com"> <img src="IMAGE/Footer Logo/youtube.png" id="youtube" alt=""></a>
                    <a href="https://www.instagram.com"> <img src="IMAGE/Footer Logo/instagram.png" id="instagram"
                                                              alt=""></a>
                </div>


                <div style="margin-left:155px">

                    <button onclick="topFunction()" id="myBtn" title="Go to top">Go to top</button>

                </div>
            </div>
    </body>
    <script>
        // banner data add from here

        let onSlide = false;

        window.addEventListener("load", () => {
            autoSlide();

            let dots = document.querySelectorAll(".banner_dot");
            for (let i = 0; i < dots.length; i++) {
                dots[i].addEventListener("click", () => slide(i));
            }

            let btnPrev = document.querySelector(".banner_button__prev");
            let btnNext = document.querySelector(".banner_button__next");
            btnPrev.addEventListener("click", () => slide(getItemActiveIndex() - 1));
            btnNext.addEventListener("click", () => slide(getItemActiveIndex() + 1));
        })

        function autoSlide() {
            setInterval(() => {
                slide(getItemActiveIndex() + 1);
            }, 3000);
        }

        function slide(toIndex) {
            if (onSlide)
                return;
            onSlide = true;

            let itemsArr = Array.from(document.querySelectorAll(".banner_item"));
            let itemActive = document.querySelector(".banner_item__active");
            let itemActiveIndex = itemsArr.indexOf(itemActive);
            let newItemActive = null;

            if (toIndex > itemActiveIndex) {
                // check if toIndex exceeds the number of banner items
                if (toIndex >= itemsArr.length) {
                    toIndex = 0;
                }

                newItemActive = itemsArr[toIndex];

                // start transition
                newItemActive.classList.add("banner_item__pos_next");
                setTimeout(() => {
                    newItemActive.classList.add("banner_item__next");
                    itemActive.classList.add("banner_item__next");
                }, 20);
            } else {
                // check if toIndex exceeds the number of banner items
                if (toIndex < 0) {
                    toIndex = itemsArr.length - 1;
                }

                newItemActive = itemsArr[toIndex];

                // start transition
                newItemActive.classList.add("banner_item__pos_prev");
                setTimeout(() => {
                    newItemActive.classList.add("banner_item__prev");
                    itemActive.classList.add("banner_item__prev");
                }, 20);
            }

            // remove all transition class and switch active class
            newItemActive.addEventListener("transitionend", () => {
                itemActive.className = "banner_item";
                newItemActive.className = "banner_item banner_item__active";
                onSlide = false;
            }, {
                once: true
            });

            slideIndicator(toIndex);
        }

        function getItemActiveIndex() {
            let itemsArr = Array.from(document.querySelectorAll(".banner_item"));
            let itemActive = document.querySelector(".banner_item__active");
            let itemActiveIndex = itemsArr.indexOf(itemActive);
            return itemActiveIndex;
        }

        function slideIndicator(toIndex) {
            let dots = document.querySelectorAll(".banner_dot");
            let dotActive = document.querySelector(".banner_dot__active");
            let newDotActive = dots[toIndex];

            dotActive.classList.remove("banner_dot__active");
            newDotActive.classList.add("banner_dot__active");
        }

        // banner end here  

        // div4 started nitish 


        let slideI = 1;
        showSlides(slideI);

        // Next/previous controls
        function plusSlides(n) {
            showSlides(slideI += n);
        }

        // Thumbnail image controls
        function currentSlide(n) {
            showSlides(slideI = n);
        }

        function showSlides(n) {
            let i;
            let slides = document.getElementsByClassName("mySlides4");

            if (n > slides.length) {
                slideI = 1
            }
            if (n < 1) {
                slideI = slides.length
            }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }

            slides[slideI - 1].style.display = "block";

        }
       
        // search function
        function nav_search_fn(event) {
            let se = document.getElementById("nav_search").value.toUpperCase();
            // event.preventDefault();
            let keyCode = event.keyCode ? event.keyCode : event.which;
            if (event.keyCode == 13) {
                if (se == "BED" || se == "ALMIRAH" || se == "CLOSET" || se == "WARDROBE" || se == "CHAIR" || se == "TABLE" || se == "SOFA") {
                    window.location.href = "furniture.jsp";
                } else if (se == "APPLIANCES" || se == "APPLIANCE") {
                    window.location.href = "appliances.jsp";
                } else if (se == "AC" || se == "AIR CONDITIONER" || se == "COOLER") {
                    window.location.href = "appliances.jsp";
                } else if (se == "FRIDGE" || se == "REFRIGERATOR" || se == "FREEZER ") {
                    window.location.href = "appliances.jsp";
                } else if (se == "MICROWAVEOVEN" || se == "MICROWAVE OVEN" || se == "MICRO WAVE OVEN" || se == "MICROWAVE" || se == "MICRO WAVE" || se == "MICROOVEN" || se == "MICRO OVEN") {
                    window.location.href = "appliances.jsp";
                } else if (se == "WATERPURIFIER" || se == "WATER PURIFIER" || se == "AQUAGUARD" || se == "RO" || se == "WATER FILTER" || se == "WATERFILTER" || se == "PURIFIER") {
                    window.location.href = "appliances.jsp";
                } else if (se == "WASHINGMACHINE" || se == "WASHING MACHINE" || se == "LAUNDRY MACHINE" || se == "LAUNDRYMACHINE" || se == "WASHER" || se == "CLOTHESWASHER" || se == "CLOTHES WASHER" || se == "CLOTH WASHER" || se == "CLOTHWASHER" || se == "LAUNDRYWASHER" || se == "LAUNDRY WASHER") {
                    window.location.href = "appliances.jsp";
                } else if (se == "INDUCTIONOVEN" || se == "INDUCTION OVEN" || se == "OVEN" || se == "INDUCTION") {
                    window.location.href = "appliances.jsp";
                } else if (se == "TV" || se == "TELEVISION" || se == "SMART TV" || se == "SMARTTV" || se == "TELE VISION" || se == "ANDROID TV" || se == "ANDROIDTV") {
                    window.location.href = "appliances.jsp";
                } else if (se == "LAPTOP" || se == "TABLET" || se == "TAB" || se == "PAD" || se == "DESKTOP" || se == "PC" || se == "GAMINGPC" || se == "GAMING PC" || se == "GAMING DESKTOP" || se == "GAMINGDESKTOP" || se == "GAMING CONSOLE" || se == "GAMINGCONSOLE" || se == "COMPUTER") {
                    window.location.href = "electronics.jsp";
                } else if (se == "GYM" || se == "GYMPRODUCTS" || se == "GYM PRODUCTS" || se == "GYMPRODUCT" || se == "GYM PRODUCT" || se == "DUMBBLLE" || se == "DUMBBLLES" || se == "GYMEQUIPMENTS" || se == "GYMEQUIPMENT" || se == "GYM EQUIPMENT" || se == "EXERCISE PRODUCTS" || se == "EXERCISE PRODUCT" || se == "EXERCISEPRODUCTS" || se == "EXERCISEPRODUCT" || se == "EXERCISE EQUIPMENTS" || se == "EXERCISE EQUIPMENT" || se == "EXERCISEEQUIPMENTS" || se == "EXERCISEEQUIPMENT"
                        || se == "FITNESS EQUIPMENTS" || se == "FITNESS EQUIPMENT" || se == "FITNESSEQUIPMENTS" || se == "FITNESSEQUIPMENT" || se == "FITNESS" || se == "FITNESS EQUIPMENT" || se == "FITNESS PRODUCTS" || se == "FITNESS PRODUCT" || se == "WALKER" || se == "CYCLING" || se == "FITNESSPRODUCTS" || se == "FITNESSPRODUCT") {
                    window.location.href = "fitness.jsp";
                } else {
                    window.alert("MISMATCH KEYWORD!!");
                }

            }
        }
        //cart data
        function cart_clicked() {
            alert("Login first!!");
        }

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



//        let acc = document.getElementsByClassName("outer");
//        let i;
//
//        for (i = 0; i < acc.length; i++) {
//            acc[i].addEventListener("click", function () {
//                /* Toggle between adding and removing the "active" class,
//                 to highlight the button that controls the inner */
//                this.classList.toggle("active");
//
//                /* Toggle between hiding and showing the active inner */
//                var inner = this.nextElementSibling;
//                if (inner.style.display === "block") {
//                    inner.style.display = "none";
//                } else {
//                    inner.style.display = "block";
//                }
//            });
//        }

        function goToHome() {
            window.location.href = "main_index.jsp";
        }

        // Get the button
        let mybutton = document.getElementById("myBtn");

        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function () {
            scrollFunction()
        };

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                mybutton.style.display = "block";
            } else {
                mybutton.style.display = "none";
            }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
        //contact us
        function contactus() {
            window.location.href = "contact_us.html";
        }
    </script>

</html>