<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session = "true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WELCOME</title>
        <link rel="icon" href="IMAGE/Logo/Small Transparent.png" type="image/x-icon">
        <style>
            html, body {
                width: 100%;
                height:100%;
            }

            body {
                background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
                background-size: 400% 400%;
                animation: gradient 15s ease infinite;
            }

            @keyframes gradient {
                0% {
                    background-position: 0% 50%;
                }
                50% {
                    background-position: 100% 50%;
                }
                100% {
                    background-position: 0% 50%;
                }
            }
        </style>
    </head>
    <body onload="time()">
    <center>
        <p style="font-size:100px;margin-top: 10%;">&#128519;</p>
        <p style="font-size: 50px;color: white">Welcome <b>${NAME}</b></p>
    </center>
</body>
<script>
    let timeout;

    function time() {
        timeout = setTimeout(alertFunc, 3000);
    }

    function alertFunc() {
        window.location.href = "after_main_index.jsp";
    }
</script>
</html>
