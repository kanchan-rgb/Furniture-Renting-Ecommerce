<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head onload="time()">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ALREADY REGISTER</title>
        <link rel="icon" href="IMAGE/Logo/Small Transparent.png" type="image/x-icon">
        <style>
            html {
                font: 5vmin/1.3 Serif;
                overflow: hidden;
                background: #123; }

            body, head {
                display: block;
                font-size: 52px;
                color: transparent; }

            head::before, head::after,
            body::before, body::after {
                position: fixed;
                top: 50%;
                left: 50%;
                width: 3em;
                height: 3em;
                content: '.';
                mix-blend-mode: screen;
                animation: 44s -27s move infinite ease-in-out alternate; }

            body::before {
                text-shadow: 0.52802em 1.7755em 7px rgba(210, 0, 255, 0.9), 1.00788em 2.44863em 7px rgba(0, 71, 255, 0.9), 2.39548em 1.68622em 7px rgba(217, 0, 255, 0.9), -0.13145em 0.13724em 7px rgba(0, 255, 86, 0.9), 1.00419em 1.9061em 7px rgba(133, 255, 0, 0.9), 0.48943em -0.36987em 7px rgba(0, 255, 204, 0.9), -0.49205em 1.7515em 7px rgba(0, 255, 229, 0.9), 1.78105em 1.2855em 7px rgba(25, 0, 255, 0.9), 0.34405em -0.35236em 7px rgba(0, 3, 255, 0.9), 1.8903em 0.32146em 7px rgba(58, 255, 0, 0.9), 1.91882em -0.42623em 7px rgba(255, 191, 0, 0.9), 0.1724em 0.12009em 7px rgba(0, 255, 127, 0.9), 2.40613em 0.44041em 7px rgba(255, 185, 0, 0.9), 1.37852em 1.13197em 7px rgba(0, 255, 15, 0.9), 0.73817em 0.05284em 7px rgba(0, 121, 255, 0.9), -0.06558em 0.47309em 7px rgba(242, 0, 255, 0.9), 0.75593em -0.48994em 7px rgba(239, 255, 0, 0.9), 0.70589em 1.20909em 7px rgba(255, 0, 116, 0.9), 1.86803em 1.61483em 7px rgba(193, 255, 0, 0.9), 0.36106em 0.0117em 7px rgba(255, 0, 41, 0.9), 1.97057em 0.30227em 7px rgba(0, 98, 255, 0.9), 2.44216em 0.93139em 7px rgba(255, 0, 162, 0.9), 1.08893em 1.0712em 7px rgba(115, 255, 0, 0.9), -0.3673em 0.78531em 7px rgba(153, 255, 0, 0.9), 0.25211em -0.39926em 7px rgba(0, 253, 255, 0.9), -0.07848em 0.774em 7px rgba(0, 148, 255, 0.9), 0.76093em 0.71194em 7px rgba(0, 238, 255, 0.9), 1.45295em 2.27411em 7px rgba(237, 255, 0, 0.9), 0.74286em -0.09544em 7px rgba(75, 255, 0, 0.9), -0.02854em 0.04348em 7px rgba(83, 0, 255, 0.9), 1.05853em 1.01986em 7px rgba(114, 255, 0, 0.9), 2.25358em 2.40387em 7px rgba(255, 0, 36, 0.9), 0.99252em 0.97992em 7px rgba(255, 156, 0, 0.9), 1.89511em 1.49385em 7px rgba(0, 31, 255, 0.9), 0.52502em 0.07653em 7px rgba(255, 22, 0, 0.9), 1.87093em 1.51027em 7px rgba(0, 255, 136, 0.9), 2.17472em 2.2398em 7px rgba(74, 255, 0, 0.9), 0.79806em 1.80585em 7px rgba(255, 217, 0, 0.9), 1.12814em 1.74205em 7px rgba(255, 238, 0, 0.9), 0.81595em -0.0011em 7px rgba(255, 0, 167, 0.9), 1.73419em 0.99451em 7px rgba(55, 0, 255, 0.9);
                animation-duration: 44s;
                animation-delay: -27s; }

            body::after {
                text-shadow: 0.31323em 0.92155em 7px rgba(0, 255, 107, 0.9), 0.87497em -0.12308em 7px rgba(255, 0, 5, 0.9), 0.22306em -0.08341em 7px rgba(211, 255, 0, 0.9), 1.47758em 2.38289em 7px rgba(128, 0, 255, 0.9), -0.12261em 1.2413em 7px rgba(0, 48, 255, 0.9), 1.34708em 2.39869em 7px rgba(0, 255, 226, 0.9), -0.37458em 1.90084em 7px rgba(2, 255, 0, 0.9), 1.78242em 0.62203em 7px rgba(0, 27, 255, 0.9), 1.84702em 2.05744em 7px rgba(0, 255, 54, 0.9), 1.51466em 2.37904em 7px rgba(0, 216, 255, 0.9), 1.52772em 0.08113em 7px rgba(7, 255, 0, 0.9), 1.27914em 0.81156em 7px rgba(111, 255, 0, 0.9), 1.65753em 1.0299em 7px rgba(1, 0, 255, 0.9), 0.75803em 0.77859em 7px rgba(255, 3, 0, 0.9), 1.10311em 1.24866em 7px rgba(255, 0, 217, 0.9), -0.02521em 0.99858em 7px rgba(0, 255, 28, 0.9), 0.52182em 1.02467em 7px rgba(211, 255, 0, 0.9), 0.14379em 1.39479em 7px rgba(37, 255, 0, 0.9), 1.51519em 2.43001em 7px rgba(0, 255, 245, 0.9), 0.96619em 2.34405em 7px rgba(0, 255, 124, 0.9), 0.65617em 0.03499em 7px rgba(255, 0, 146, 0.9), 1.28321em -0.37591em 7px rgba(31, 0, 255, 0.9), 2.15834em -0.26365em 7px rgba(255, 0, 107, 0.9), 1.09688em 2.23317em 7px rgba(168, 0, 255, 0.9), -0.19274em 2.42833em 7px rgba(255, 0, 57, 0.9), 1.14657em -0.08621em 7px rgba(255, 177, 0, 0.9), 2.20841em 2.32295em 7px rgba(255, 0, 51, 0.9), 1.01604em 2.12432em 7px rgba(0, 131, 255, 0.9), 0.57073em -0.48489em 7px rgba(0, 4, 255, 0.9), 2.3847em 1.9289em 7px rgba(0, 169, 255, 0.9), 0.18964em 0.37616em 7px rgba(0, 165, 255, 0.9), 0.75565em 2.02214em 7px rgba(255, 18, 0, 0.9), 1.11126em 0.26555em 7px rgba(255, 222, 0, 0.9), 1.75708em 0.44659em 7px rgba(255, 167, 0, 0.9), 0.84088em 1.57673em 7px rgba(168, 255, 0, 0.9), 0.0017em 1.74986em 7px rgba(225, 0, 255, 0.9), -0.27601em 0.61359em 7px rgba(0, 255, 237, 0.9), 1.98711em 1.06419em 7px rgba(255, 0, 217, 0.9), 1.6799em 1.51955em 7px rgba(146, 0, 255, 0.9), 2.26848em 2.17427em 7px rgba(94, 0, 255, 0.9), -0.31518em 0.03526em 7px rgba(197, 255, 0, 0.9);
                animation-duration: 43s;
                animation-delay: -32s; }

            head::before {
                text-shadow: 1.35295em 0.29439em 7px rgba(0, 255, 180, 0.9), -0.41948em 0.84744em 7px rgba(255, 173, 0, 0.9), -0.13268em 0.22531em 7px rgba(135, 0, 255, 0.9), 0.74584em 0.36709em 7px rgba(0, 141, 255, 0.9), 1.73255em 0.90037em 7px rgba(255, 232, 0, 0.9), 0.61824em 0.60565em 7px rgba(255, 49, 0, 0.9), -0.25118em 0.35425em 7px rgba(195, 0, 255, 0.9), 1.00468em 2.26938em 7px rgba(140, 0, 255, 0.9), 0.74108em -0.02995em 7px rgba(0, 255, 121, 0.9), 0.20171em -0.22405em 7px rgba(0, 255, 139, 0.9), 0.61522em 0.78395em 7px rgba(0, 255, 51, 0.9), 0.6146em 0.09931em 7px rgba(0, 67, 255, 0.9), -0.21281em 0.85342em 7px rgba(0, 255, 243, 0.9), 0.9221em 1.39185em 7px rgba(60, 255, 0, 0.9), 2.07487em 1.13826em 7px rgba(255, 0, 187, 0.9), -0.01914em 0.33287em 7px rgba(166, 0, 255, 0.9), 0.42216em 2.47721em 7px rgba(255, 135, 0, 0.9), 2.02395em 1.9868em 7px rgba(255, 195, 0, 0.9), 1.94723em 1.4245em 7px rgba(236, 0, 255, 0.9), -0.19597em 2.4625em 7px rgba(0, 1, 255, 0.9), 1.73859em 1.91883em 7px rgba(46, 0, 255, 0.9), 1.50973em -0.46188em 7px rgba(255, 0, 207, 0.9), -0.3804em -0.08101em 7px rgba(0, 210, 255, 0.9), 1.28352em 2.03745em 7px rgba(255, 54, 0, 0.9), 1.1331em 0.56037em 7px rgba(200, 255, 0, 0.9), 2.19134em -0.46024em 7px rgba(255, 252, 0, 0.9), 2.128em 1.12283em 7px rgba(255, 48, 0, 0.9), 1.38684em -0.2362em 7px rgba(255, 0, 33, 0.9), -0.17598em 2.19932em 7px rgba(0, 11, 255, 0.9), -0.16168em 1.43647em 7px rgba(255, 145, 0, 0.9), 1.75773em 1.70817em 7px rgba(255, 223, 0, 0.9), 0.02902em 2.31601em 7px rgba(255, 53, 0, 0.9), 1.37972em 0.58734em 7px rgba(0, 255, 0, 0.9), 0.95917em -0.13595em 7px rgba(0, 130, 255, 0.9), 1.66222em 1.63705em 7px rgba(51, 0, 255, 0.9), 0.63757em 0.62513em 7px rgba(82, 255, 0, 0.9), 0.5207em -0.48138em 7px rgba(224, 255, 0, 0.9), 0.75861em 1.53039em 7px rgba(255, 0, 91, 0.9), 0.64966em 0.23241em 7px rgba(179, 0, 255, 0.9), 1.49353em -0.31245em 7px rgba(255, 0, 230, 0.9), -0.46643em 2.15898em 7px rgba(243, 0, 255, 0.9);
                animation-duration: 42s;
                animation-delay: -23s; }

            head::after {
                text-shadow: 0.58621em 2.36531em 7px rgba(255, 0, 63, 0.9), 2.19103em -0.25516em 7px rgba(47, 0, 255, 0.9), 0.37565em 2.19986em 7px rgba(255, 91, 0, 0.9), 0.21698em 0.93417em 7px rgba(0, 255, 11, 0.9), 0.91394em -0.39772em 7px rgba(255, 254, 0, 0.9), 1.84366em 0.42683em 7px rgba(164, 0, 255, 0.9), -0.00565em 0.01843em 7px rgba(37, 255, 0, 0.9), -0.09571em 0.9174em 7px rgba(255, 1, 0, 0.9), 1.33646em 2.49157em 7px rgba(20, 0, 255, 0.9), 0.17764em -0.29238em 7px rgba(0, 255, 219, 0.9), 0.68318em -0.02819em 7px rgba(0, 109, 255, 0.9), -0.454em 1.61513em 7px rgba(0, 255, 17, 0.9), 1.98509em 1.89515em 7px rgba(128, 0, 255, 0.9), 0.80084em -0.22032em 7px rgba(0, 255, 145, 0.9), 1.42458em 1.71147em 7px rgba(43, 255, 0, 0.9), 0.06608em 0.32947em 7px rgba(255, 0, 242, 0.9), 1.85499em 1.0086em 7px rgba(0, 39, 255, 0.9), -0.10057em 0.0713em 7px rgba(255, 0, 219, 0.9), 2.44787em -0.2318em 7px rgba(255, 1, 0, 0.9), 0.42245em 2.30107em 7px rgba(0, 255, 239, 0.9), 2.39539em -0.40001em 7px rgba(255, 0, 50, 0.9), 0.39255em 0.48787em 7px rgba(250, 255, 0, 0.9), 1.61287em 1.82147em 7px rgba(0, 255, 98, 0.9), 2.20143em 2.01446em 7px rgba(255, 249, 0, 0.9), 1.26376em 1.90403em 7px rgba(72, 0, 255, 0.9), 2.26603em 1.38647em 7px rgba(0, 56, 255, 0.9), 0.54635em 1.51214em 7px rgba(0, 255, 154, 0.9), 0.63632em 0.49846em 7px rgba(0, 255, 194, 0.9), 0.85465em 1.23238em 7px rgba(52, 0, 255, 0.9), 0.00828em 1.08385em 7px rgba(0, 116, 255, 0.9), 2.37516em 1.19011em 7px rgba(81, 255, 0, 0.9), 2.45587em 1.2918em 7px rgba(255, 38, 0, 0.9), 0.34286em 1.00092em 7px rgba(255, 250, 0, 0.9), 1.84365em 1.59348em 7px rgba(0, 54, 255, 0.9), 1.17333em 1.12219em 7px rgba(245, 0, 255, 0.9), -0.09414em 1.28482em 7px rgba(0, 204, 255, 0.9), 0.41963em 0.34555em 7px rgba(255, 91, 0, 0.9), 0.80092em 1.76257em 7px rgba(0, 255, 145, 0.9), -0.38318em 0.67023em 7px rgba(0, 255, 9, 0.9), 2.35221em -0.16818em 7px rgba(41, 0, 255, 0.9), -0.43937em 2.07887em 7px rgba(255, 131, 0, 0.9);
                animation-duration: 41s;
                animation-delay: -19s; }

            @keyframes move {
                from {
                    transform: rotate(0deg) scale(12) translateX(-20px); }
                to {
                    transform: rotate(360deg) scale(18) translateX(20px); } }

           
        </style>
    </head>
    <body onload="time()">
        <h3 style="text-align: center;font-family:monospace;color: white;margin-top: 10%">This Email Is Already Registered!! Please Login! &#128521;</h3>
    </body>
    <script>
        let timeout;

        function time() {
            timeout = setTimeout(alertFunc, 3000);
        }

        function alertFunc() {
            window.location.href = "main_index.jsp";
        }
    </script>
</html>
