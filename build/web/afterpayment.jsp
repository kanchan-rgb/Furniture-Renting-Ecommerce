<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ORDER CONFIRM</title>
        <link rel="icon" href="IMAGE/Logo/Small Transparent.png" type="image/x-icon">
        <style>
            .animate-charcter
            {
                text-transform: uppercase;
                background-image: linear-gradient(
                    -225deg,
                    green 0%,
                    lightseagreen 29%,
                    #ff1361 67%,
                    #fff800 100%
                    );
                background-size: auto auto;
                background-clip: border-box;
                background-size: 200% auto;
                color: #fff;
                background-clip: text;
                text-fill-color: transparent;
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                animation: textclip 5s linear infinite;
                display: inline-block;
                font-size: 30px;
            }

            @keyframes textclip {
                to {
                    background-position: 200% center;
                }
            }
        </style>
    </head>
    <body onload="time()">
    <center>
        <img src="IMAGE/delivery-completed.gif" style="margin-top: 3ch; width: 50ch;">
        <br>
        <h3 style="color: green;font-size: 50px" class="animate-charcter">ORDER CONFIRMED</h3>
    </center>
</body>
<script>
    let timeout;

    function time() {
        timeout = setTimeout(alertFunc, 2000);
    }

    function alertFunc() {
        window.location.href = "order_page.jsp";
    }
</script>
</html>