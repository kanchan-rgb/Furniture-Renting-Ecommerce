<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session = "true" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Payment Gateway</title>
	<link rel="icon" href="IMAGE/Logo/Small Transparent.png" type="image/x-icon">
	<script src="https://kit.fontawesome.com/e8fa2e31b4.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="CSS/PAYMENNT_GATEWAY.css">
</head>

<body onload="doFun()">

	<div class="container">
		<div class="left">
			<p>Payment methods</p>
			<hr style="border:1px solid #ccc; margin: 0 15px;">
			<div class="methods">
				<div onclick="doFun()" id="tColorA" style="color: green;"><i class="fa-solid fa-credit-card"
						style="color: green;"></i> Payment By Card</div>
				<div onclick="doFunA()" id="tColorB"><i class="fa-solid fa-building-columns"></i> Internet Banks</div>
				<div onclick="doFunB()" id="tColorC"><i class="fa-solid fa-wallet"></i> UPI</div>
			</div>
			<hr style="border:1px solid #ccc; margin: 0 15px;">
		</div>
		<div class="center">
			<a href="https://www.rbi.org.in/"><img alt="Credit Card Logos" title="Credit Card Logos"
					src="IMAGE/PaymentGateway Logo.png" width="300" height="auto" /></a>
			<hr style="border:1px solid #ccc; margin: 0 15px;">

			<div class="card-details">
                            <form method="POST" action="http://localhost:8080/RENT_KARO/ORDER">
                                    
                                    <input type="hidden" name="db_addressID" value="<%=request.getParameter("USER_ADDRESS_ID")%>" >
                                    
					<p>Card number</p>
					<div class="c-number" id="c-number">
						<input id="number" class="cc-number" placeholder="Card number" maxlength="19" required>
						<i class="fa-solid fa-credit-card" style="margin: 0;"></i>
					</div>

					<div class="c-details">
						<div>
							<p>Expiry date</p>
							<input id="e-date" class="cc-exp" placeholder="MM/YY" required maxlength="5" required>
						</div>
						<div>
							<p>CVV</p>
							<div class="cvv-box" id="cvv-box">
								<input id="cvv" type="password" class="cc-cvv" placeholder="CVV" required maxlength="3"
									required>
								<i class="fa-solid fa-circle-question" title="3 digits on the back of the card"
									style="cursor: pointer;"></i>
							</div>
						</div>
					</div>
					<div class="email">
						<p>Email</p>
						<input type="email" placeholder="example@email.com" id="email" required>
					</div>
					<button>PAY NOW</button>
				</form>
			</div>
			<div class="net-details">
				<form method="POST" action="http://localhost:8080/RENT_KARO/ORDER">
                                    
                                    <input type="hidden" name="db_addressID" value="<%=request.getParameter("USER_ADDRESS_ID")%>" >
                                    
					<p>User Name</p>
					<div class="u-name" id="u-name">
						<input type="text" class="u-name2" placeholder="User Name" required>
						<i class="fa-solid fa-building-columns" id="nt" style="margin: 0;"></i>
					</div>

					<div class="net-password">
						<div class="net-pass">
							<p>Password</p>
							<input type="password" class="n-pass" placeholder="Password" required>
						</div>
					</div>
					<button>PAY NOW</button>
				</form>
			</div>
			<div class="upi-details">
				<form method="POST" action="http://localhost:8080/RENT_KARO/ORDER">
                                    
                                    <input type="hidden" name="db_addressID" value="<%=request.getParameter("USER_ADDRESS_ID")%>" >
                                    
					<p>UPI ID</p>
					<div class="upi-id" id="upi-id">
						<input type="text" class="upi-id2" placeholder="UPI ID" required>
						<i class="fa-solid fa-wallet" id="uw" style="margin: 0;" title="aXXXXX122X@oksbi"
							style="cursor: pointer;"></i>
					</div>
					<button>PAY NOW</button>
				</form>
			</div>
		</div>


		<div class="right">
			<p style="font-size: large;">Total Amount :</p>
			<hr style="border:1px solid #ccc; margin: 0 15px;">
			<p id="amount" style="float: right; font-size: 3ch;color: green">${finaltot}</p>
			
		</div>

		<script src="JS/PAYMENT_GATEWAY.js">

		</script>
</body>

</html>