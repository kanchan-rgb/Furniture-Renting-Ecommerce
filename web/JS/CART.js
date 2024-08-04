 //PIN CODE CHECKING
    function PINCODE() {
            var txt;
            if (pin.value == 700102 || pin.value == 700064 || pin.value == 700091 || pin.value == 700097 || pin.value == 700098 || pin.value == 700101 || pin.value == 700102 || pin.value == 700105 || pin.value == 700106 || pin.value == 700156) {
                txt = "Available";
                document.getElementById("validity").style.color = "green";
            }
            else {
                txt = "Not Available";
                document.getElementById("validity").style.color = "red";
            }
            document.getElementById("validity").innerHTML = txt;
        }

    // search function
    function nav_search_fn() {
        let se = document.getElementById("nav_search").value.toUpperCase();
        if (event.keyCode == 13) {
            if (se == "BED" || se == "ALMIRAH" || se == "CLOSET" || se == "WARDROBE" || se == "CHAIR" || se == "TABLE" || se == "SOFA") {
                window.location.href = "furniture.html";
            }
            else if (se == "APPLIANCES" || se == "APPLIANCE") {
                window.location.href = "appliances.html";
            }
            else if (se == "AC" || se == "AIR CONDITIONER" || se == "COOLER") {
                window.location.href = "appliances.html";
            }

            else if (se == "FRIDGE" || se == "REFRIGERATOR" || se == "FREEZER ") {
                window.location.href = "appliances.html";
            }
            else if (se == "MICROWAVEOVEN" || se == "MICROWAVE OVEN" || se == "MICRO WAVE OVEN" || se == "MICROWAVE" || se == "MICRO WAVE" || se == "MICROOVEN" || se == "MICRO OVEN") {
                window.location.href = "appliances.html";
            }
            else if (se == "WATERPURIFIER" || se == "WATER PURIFIER" || se == "AQUAGUARD" || se == "RO" || se == "WATER FILTER" || se == "WATERFILTER" || se == "PURIFIER") {
                window.location.href = "appliances.html";
            }
            else if (se == "WASHINGMACHINE" || se == "WASHING MACHINE" || se == "LAUNDRY MACHINE" || se == "LAUNDRYMACHINE" || se == "WASHER" || se == "CLOTHESWASHER" || se == "CLOTHES WASHER" || se == "CLOTH WASHER" || se == "CLOTHWASHER" || se == "LAUNDRYWASHER" || se == "LAUNDRY WASHER") {
                window.location.href = "appliances.html";
            }
            else if (se == "INDUCTIONOVEN" || se == "INDUCTION OVEN" || se == "OVEN" || se == "INDUCTION") {
                window.location.href = "appliances.html";
            }
            else if (se == "TV" || se == "TELEVISION" || se == "SMART TV" || se == "SMARTTV" || se == "TELE VISION" || se == "ANDROID TV" || se == "ANDROIDTV") {
                window.location.href = "appliances.html";
            }
            else if (se == "LAPTOP" || se == "TABLET" || se == "TAB" || se == "PAD" || se == "DESKTOP" || se == "PC" || se == "GAMINGPC" || se == "GAMING PC" || se == "GAMING DESKTOP" || se == "GAMINGDESKTOP" || se == "GAMING CONSOLE" || se == "GAMINGCONSOLE" || se == "COMPUTER") {
                window.location.href = "electronics.html";
            }
            else if (se == "GYM" || se == "GYMPRODUCTS" || se == "GYM PRODUCTS" || se == "GYMPRODUCT" || se == "GYM PRODUCT" || se == "DUMBBLLE" || se == "DUMBBLLES" || se == "GYMEQUIPMENTS" || se == "GYMEQUIPMENT" || se == "GYM EQUIPMENT" || se == "EXERCISE PRODUCTS" || se == "EXERCISE PRODUCT" || se == "EXERCISEPRODUCTS" || se == "EXERCISEPRODUCT" || se == "EXERCISE EQUIPMENTS" || se == "EXERCISE EQUIPMENT" || se == "EXERCISEEQUIPMENTS" || se == "EXERCISEEQUIPMENT"
                || se == "FITNESS EQUIPMENTS" || se == "FITNESS EQUIPMENT" || se == "FITNESSEQUIPMENTS" || se == "FITNESSEQUIPMENT" || se == "FITNESS" || se == "FITNESS EQUIPMENT" || se == "FITNESS PRODUCTS" || se == "FITNESS PRODUCT" || se == "WALKER" || se == "CYCLING" || se == "FITNESSPRODUCTS" || se == "FITNESSPRODUCT") {
                window.location.href = "fitness.html";
            }
        }
    }
    // navbar started 
    //cart data

    let cartArr = JSON.parse(localStorage.getItem("cartpage")) || [];
    function cart_clicked() {
        let login_status = JSON.parse(localStorage.getItem("loginsuccess"));
        if (login_status == true) {
            window.location.href = "cart.html";
        } else {
            alert("Login first!!");
        }
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
        window.location.href = "main_index.html";
    }
    // navbar ended
    if (localStorage.getItem("cartpage") == null || localStorage.getItem("cartpage") == "null") {

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
            window.location.href = "main_index.html"
        })
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
            })
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
                    window.location.href = "cart.html"
                });
                remove.setAttribute("class", "remove_btn")
                div.append(img, name, price, remove);
            });
            tot1.innerText = "Total is :- ₹" + tot;
            window.x=tot;
            localStorage.setItem("totalamount", x);
            
        }
        displayCart(cartArr);
    }
    let empC = document.getElementById("emptyCart")
    let dataWithCart = document.getElementById("cart")

    if (cartArr.length === 0) {
        empC.style.display = "block"
        dataWithCart.style.visibility = "hidden"
    } else {
        empC.style.display = "none"
        dataWithCart.style.visibility = "visible"

    }