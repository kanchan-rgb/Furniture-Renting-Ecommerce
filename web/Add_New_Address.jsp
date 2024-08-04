<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session = "true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Address</title>
        <link rel="icon" href="IMAGE/Logo/Small Transparent.png" type="image/x-icon">
        <style>

            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            body {
                width: 100%;
                background:linear-gradient(90deg, lightblue, white, lightblue);
            }

            fieldset {
                text-align: center;
                padding: 100px;

            }

            .fild {
                padding: 20px;
            }


            .box {
                display: inline-block;
                width: 100px;
            }

            #myButton {
                background-color: rgb(4, 132, 4);
                color: rgb(255, 255, 255);
                margin-top: 30px;
                border-radius: 10px;
                border: none;
                font-size: 20px;
                width: 200px;
                padding: 6px;
                cursor: pointer;

            }

            #myButton:hover {
                background-color: rgb(6, 98, 6);
                color: rgb(255, 255, 255);
                border-radius: 10px;
                font-size: 20px;
                width: 200px;
                padding: 7px;
                box-shadow: 1.5px 1.5px 7px 5px rgb(76, 155, 76);
            }
            #name{
                width: 40%;
                padding: 4px;
                border: none;
                background-color: transparent;
                border-bottom: 2px solid black;
                outline: none;
            }
            #number{
                width: 40%;
                padding: 4px;
                border: none;
                background-color: transparent;
                border-bottom: 2px solid black;
                outline: none;
            }
            #zipcode{
                width: 40%;
                padding: 4px;
                border: none;
                background-color: transparent;
                border-bottom: 2px dotted black;
                outline: none;
            }
            #country-state{
                width: 20%;
                padding: 4px;
                border: none;
                background-color: transparent;
                border-bottom: 2px dashed black;
                outline: none;

            }
            #city{
                width: 20%;
                padding: 4px;
                margin-left: 15px;
                background-color: transparent;
                border: none;
                border-bottom: 2px solid black;
                outline: none;

            }
            #house_number{
                width: 50%;
                padding: 4px;
                margin-left: 15px;
                background-color: transparent;
                border: none;
                border-bottom: 2px solid black;
                outline: none;

            }
            #rodename_areaname{
                width: 50%;
                padding: 4px;
                margin-left: 15px;
                background-color: transparent;
                border: none;
                border-bottom: 2px solid black;
                outline: none;

            }
            #addInput{
                background-color: transparent;
                border: none;
                color: blue;
                cursor: pointer;
            }
            #addInput2{
                background-color: transparent;
                border: none;
                color: blue;
                cursor: pointer;
            }
            #backbtn{
                background-color: red;
                color: rgb(255, 255, 255);
                margin-top: 30px;
                border-radius: 10px;
                border: none;
                font-size: 20px;
                width: 200px;
                padding: 6px;
                cursor: pointer;
            }
            
            #backbtn:hover {
                background-color: red;
                color: rgb(255, 255, 255);
                border-radius: 10px;
                font-size: 20px;
                width: 200px;
                padding: 7px;
                box-shadow: 1.5px 1.5px 7px 5px lightcoral;
            }
        </style>
    </head>
    <body>
        <form id="myForm" action="http://localhost:8080/RENT_KARO/UserAddress" method="POST">
            <fieldset style="border: none;">

                <div class="fild">
                    <input type="text" id="name" name="db_fullname" placeholder="Full Name (Required*)" required>
                </div>
                <div class="fild">
                    <input type="number" oninput="validatePhoneNumber()" id="number" name="db_number" placeholder="Phone Number (Required*)" required>
                </div>
                <div class="fild" id="inputContainer" >
                    <a class="add" id="addInput"><i class="fa fa-plus"></i>+ Add Alternative Phone
                        Number</a>
                </div>
                <p id="showErrorPhno" style="font-style: oblique; color: red; margin-top: 1px;"> </p>
                <div class="fild"> 
                    <input type="number" name="db_zipcode" minlength="6" maxlength="6" id="zipcode" placeholder="Pincode (Required*)" required>
                </div>
                <div class="fild">
                    <select id="country-state" name="db_state" required>
                        <option value="">Select State</option>
                        <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                        <option value="Andhra Pradesh">Andhra Pradesh</option>
                        <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                        <option value="Assam">Assam</option>
                        <option value="Bihar">Bihar</option>
                        <option value="Chandigarh">Chandigarh</option>
                        <option value="Chhattisgarh">Chhattisgarh</option>
                        <option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>
                        <option value="Daman and Diu">Daman and Diu</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Goa">Goa</option>
                        <option value="Gujarat">Gujarat</option>
                        <option value="Haryana">Haryana</option>
                        <option value="Himachal Pradesh">Himachal Pradesh</option>
                        <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                        <option value="Jharkhand">Jharkhand</option>
                        <option value="Karnataka">Karnataka</option>
                        <option value="Kerala">Kerala</option>
                        <option value="Ladakh">Ladakh</option>
                        <option value="Lakshadweep">Lakshadweep</option>
                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                        <option value="Maharashtra">Maharashtra</option>
                        <option value="Manipur">Manipur</option>
                        <option value="Meghalaya">Meghalaya</option>
                        <option value="Mizoram">Mizoram</option>
                        <option value="Nagaland">Nagaland</option>
                        <option value="Odisha">Odisha</option>
                        <option value="Puducherry">Puducherry</option>
                        <option value="Punjab">Punjab</option>
                        <option value="Rajasthan">Rajasthan</option>
                        <option value="Sikkim">Sikkim</option>
                        <option value="Tamil Nadu">Tamil Nadu</option>
                        <option value="Telangana">Telangana</option>
                        <option value="Tripura">Tripura</option>
                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                        <option value="Uttarakhand">Uttarakhand</option>
                        <option value="West Bengal">West Bengal</option>
                    </select>
                    <input type="text" name="db_city" id="city" placeholder="City (Required*)" required>
                </div>
                <div class="fild"> 
                    <input type="text" name="db_house_number" id="house_number" placeholder="House No., Building Name (Required*)" required>
                </div>
                <div class="fild"> 
                    <input type="text" name="db_rodename_areaname" id="rodename_areaname" placeholder="Road Name, Area, Colony (Required*)" required>
                </div>
                <div class="fild" id="landmark1">
                    <a class="add2" id="addInput2">+ Add Nearby Famous Shop/Mall/Landmark</a>
                </div>
                <div class="fild"> 
                    <button type="submit" id="myButton">Save Address</button>
                </div>

                <button  id="backbtn" onclick="location.href = 'User_Address_Page.jsp';">Back</button>


            </fieldset>
        </form>
        <script>
            function validatePhoneNumber() {
                let phno = document.getElementById("number").value;

                if (phno.length != 10) {
                    document.getElementById("showErrorPhno").innerHTML = "Phone Number Must Be 10 Digits!!";
                    return false;
                } else {
                    document.getElementById("showErrorPhno").innerHTML = "";
                    return true;
                }
            }

            document.addEventListener("DOMContentLoaded", function () {
                // Get references to the form and container
                const form = document.getElementById("myForm");
                const inputContainer = document.getElementById("inputContainer");
                const addInputButton = document.getElementById("addInput");


                // Counter to keep track of the number of added input fields
                let inputCount = 0;

                // Function to add a new input field
                function addInputField() {
                    inputCount++;

                    if (inputCount > 1) {
                        return;
                    }
                    // Create a new input element
                    const input = document.createElement("input");
                    input.type = "number";
                    input.name = "db_alt_number";
                    input.placeholder = "Alternative Phone Number ";
                    input.style.width = "40%";
                    input.style.padding = "4px";
                    input.style.border = "none";
                    input.style.outline = "none";
                    input.style.backgroundColor = "transparent";
                    input.style.borderBottom = " 2px solid black";
                    // Append the input field to the container
                    inputContainer.appendChild(input);
                }

                // Add an input field when the button is clicked
                addInputButton.addEventListener("click", addInputField);
                addInput.addEventListener('click', () => {
//                // 👇️ hide button
                    addInput.style.display = 'none';
//
                });
            });




        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Get references to the form and container
                const form2 = document.getElementById("myForm");
                const inputContainer2 = document.getElementById("landmark1");
                const addInputButton2 = document.getElementById("addInput2");


                // Counter to keep track of the number of added input fields
                let inputCount2 = 0;

                // Function to add a new input field
                function addInputField2() {
                    inputCount2++;

                    if (inputCount2 > 1) {
                        return;
                    }
                    // Create a new input element
                    const input1 = document.createElement("input");
                    input1.type = "text";
                    
                    input1.name = "db_landmark";
                    input1.placeholder = "Nearby Famouse Shop/Mall/Landmark ";
                    input1.style.width = "40%";
                    input1.style.padding = "4px";
                    input1.style.border = "none";
                    input1.style.outline = "none";
                    input1.style.backgroundColor = "transparent";
                    input1.style.borderBottom = " 2px solid black";
                    // Append the input field to the container
                    inputContainer2.appendChild(input1);
                }

                // Add an input field when the button is clicked
                addInputButton2.addEventListener("click", addInputField2);
                addInput2.addEventListener('click', () => {
//                // 👇️ hide button
                    addInput2.style.display = 'none';
//
                });
            });

        </script>
    </body>

</html>
