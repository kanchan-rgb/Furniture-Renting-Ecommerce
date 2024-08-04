
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;

public class ORDER extends HttpServlet {

    String uID, uNAME, uEMAIL, uPH_NUMBER, uADDRESSID, cartID, cartPRODUCTIMAGE, cartPRODUCTNAME, cartPRODUCTPRICE, cartPRODUCTQUANTITY, URL, cartPRODUCTMONTH, pID;
    String aNAME, aNUMBER, aALTNUMBER, aZIPCODE, aSTATE, aCITY, aHOUSE, aROAD, aLANDMARK, OLDquantity, NewQuantity;
    String mNAME, mQUANTITY, mMONTHS, mTOTTAL, mURL;
    String vSUBJECT, vTO;
    int count = 0;
    OracleConnection oconn;
    OraclePreparedStatement ops, ops2, ops3, ops4, ops5;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ORDER</title>");
            out.println("</head>");
            out.println("<body>");

            uID = (String) session.getAttribute("USER_ID");
            uNAME = (String) session.getAttribute("NAME");
            uEMAIL = (String) session.getAttribute("EMAIL");
            uPH_NUMBER = (String) session.getAttribute("PH_NUMBER");
            uADDRESSID = request.getParameter("db_addressID");
            try {
                try {
                    DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                } catch (SQLException ex) {
                    Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
                }

                oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");

                ops3 = (OraclePreparedStatement) oconn.prepareCall("SELECT * FROM USERADDRESS WHERE USER_ADDRESS_ID=?");
                ops3.setString(1, uADDRESSID);
                ResultSet rs3 = ops3.executeQuery();

                if (rs3.next()) {
                    ops = (OraclePreparedStatement) oconn.prepareCall("SELECT * FROM USERCART WHERE USER_ID=?");
                    ops.setString(1, uID);

                    ResultSet rs = ops.executeQuery();

                    while (rs.next()) {
                        count++;
                        cartID = rs.getString("CART_ID");
                        cartPRODUCTNAME = rs.getString("PRODUCT_NAME");
                        mNAME = cartPRODUCTNAME;
                        cartPRODUCTQUANTITY = rs.getString("QUANTITY");
                        mQUANTITY = cartPRODUCTQUANTITY;
                        cartPRODUCTMONTH = rs.getString("MONTHS");
                        mMONTHS = cartPRODUCTMONTH;
                        cartPRODUCTPRICE = rs.getString("PRICE");
                        mTOTTAL = cartPRODUCTPRICE;
                        pID = rs.getString("PRODUCT_ID");
                        byte[] cartIMAGE = rs.getBytes("IMAGE");
                        aNAME = rs3.getString("NAME");
                        aNUMBER = rs3.getString("PHONE_NUMBER");
                        aALTNUMBER = rs3.getString("ALTERNATIVE_PHONE_NUMBER");
                        aZIPCODE = rs3.getString("ZIPCODE");
                        aSTATE = rs3.getString("STATE");
                        aCITY = rs3.getString("CITY");
                        aHOUSE = rs3.getString("HOUSE_BUILDING_NO");
                        aROAD = rs3.getString("ROAD_AREA_COLONY_NAME");
                        aLANDMARK = rs3.getString("LANDMARK");

                        ops = (OraclePreparedStatement) oconn.prepareCall("INSERT INTO USERORDERS(USER_ID,USER_NAME, USER_EMAIL, USER_PH_NUMBER, PRODUCT_ID, PRODUCT_NAME, IMAGE, QUANTITY, MONTHS, PRICE, NAME, PHONE_NUMBER, ALTERNATIVE_PHONE_NUMBER, ZIPCODE, STATE, CITY, HOUSE_BUILDING_NO, ROAD_AREA_COLONY_NAME, LANDMARK) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                        ops.setString(1, uID);
                        ops.setString(2, uNAME);
                        ops.setString(3, uEMAIL);
                        ops.setString(4, uPH_NUMBER);
                        ops.setString(5, pID);
                        ops.setString(6, cartPRODUCTNAME);
                        ops.setBytes(7, cartIMAGE);
                        ops.setString(8, cartPRODUCTQUANTITY);
                        ops.setString(9, cartPRODUCTMONTH);
                        ops.setString(10, cartPRODUCTPRICE);
                        ops.setString(11, aNAME);
                        ops.setString(12, aNUMBER);
                        ops.setString(13, aALTNUMBER);
                        ops.setString(14, aZIPCODE);
                        ops.setString(15, aSTATE);
                        ops.setString(16, aCITY);
                        ops.setString(17, aHOUSE);
                        ops.setString(18, aROAD);
                        ops.setString(19, aLANDMARK);

                        ResultSet rs2 = ops.executeQuery();
                        if (rs2.next()) {

                            ops4 = (OraclePreparedStatement) oconn.prepareCall("SELECT QUANTITY,URL FROM PRODUCT WHERE ID = ?");
                            ops4.setString(1, pID);
                            ResultSet rs4 = ops4.executeQuery();
                            if (rs4.next()) {
                                URL = rs4.getString("URL");
                                vTO = uEMAIL;
                                vSUBJECT = "Order Confirmed!!!";
                               
                                final String username = "rentkaro9@gmail.com";
                                final String password = "kbqlomfsvalimpwo";
                                Properties props = new Properties();
                                props.put("mail.smtp.auth", "true");
                                props.put("mail.smtp.starttls.enable", "true");
                                props.put("mail.smtp.host", "smtp.gmail.com");
                                props.put("mail.smtp.port", "587");

                                Session session2 = Session.getInstance(props,
                                        new javax.mail.Authenticator() {
                                    protected PasswordAuthentication getPasswordAuthentication() {
                                        return new PasswordAuthentication(username, password);
                                    }
                                });

                                try {

                                    Message message = new MimeMessage(session2);
                                    message.setFrom(new InternetAddress(username));
                                    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(vTO));
                                    message.setSubject(vSUBJECT);
                                    String htmlContent = "<h2>Your Order Has Been Succesfully Placed.</h2>"
                                            + "<table style=\" border: 1px solid navy;width:90%; border-collapse:collapse; \">"
                                            + "<tr style=\" border: 1px solid navy; border-collapse:collapse; \">"
                                            + "<th style=\" border: 1px solid navy; border-collapse:collapse; \">"
                                            + "Product Name"
                                            + "</th>"
                                            + "<th style=\" border: 1px solid navy; border-collapse:collapse; \">"
                                            + "Product Image"
                                            + "</th>"
                                            + "<th style=\" border: 1px solid navy; border-collapse:collapse; \">"
                                            + "Qty"
                                            + "</th>"
                                            + "<th style=\" border: 1px solid navy; border-collapse:collapse; \">"
                                            + "Months"
                                            + "</th>"
                                            + "<th style=\" border: 1px solid navy; border-collapse:collapse; \">"
                                            + "Total Price"
                                            + "</th>"
                                            + "</tr>"
                                            + "<tr style=\" border: 1px solid navy; border-collapse:collapse; \">"
                                            + "<td style=\" border: 1px solid navy;text-align:center;border-collapse:collapse; \">"
                                            + cartPRODUCTNAME
                                            + "</td>"
                                            + "<td style=\" border: 1px solid navy;padding: 15px;text-align:center;border-collapse:collapse; \">"
                                            + "<img width=100 height-100 src='" + URL + "'/>"
                                            + "</td>"
                                            + "<td style=\" border: 1px solid navy;padding: 10px;text-align:center;border-collapse:collapse; \">"
                                            + cartPRODUCTQUANTITY
                                            + "</td>"
                                            + "<td style=\" border: 1px solid navy;text-align:center;border-collapse:collapse; \">"
                                            + cartPRODUCTMONTH
                                            + "</td>"
                                            + "<td style=\" border: 1px solid navy;text-align:center;border-collapse:collapse; \">"
                                            + cartPRODUCTPRICE
                                            + "</td>"
                                            + "</tr>"
                                            + "</table>"
                                            + "<br><br>"
                                            + "<img width='90' height='30' src='https://drive.google.com/uc?export=download&id=1Qv7TlsuMWYEV1TvvojMfNVibVlbr_cGV'/>";
                                    message.setContent(htmlContent, "text/html");

                                    Transport.send(message);

                                } catch (MessagingException e) {

                                    out.println("<h2 style='color:red'>" + e.getMessage() + "</h2>");
                                }

                                OLDquantity = rs4.getString("QUANTITY");

                                int oldq = Integer.parseInt(OLDquantity);
                                int pq = Integer.parseInt(cartPRODUCTQUANTITY);

                                int NEWquantity = oldq - pq;

                                NewQuantity = Integer.toString(NEWquantity);

                                ops5 = (OraclePreparedStatement) oconn.prepareCall("UPDATE PRODUCT SET QUANTITY= ? where ID = ?");
                                ops5.setString(1, NewQuantity);
                                ops5.setString(2, pID);
                                ResultSet rs6 = ops5.executeQuery();
                                if (rs6.next()) {
                                    ops2 = (OraclePreparedStatement) oconn.prepareCall("DELETE FROM USERCART WHERE CART_ID = ?");
                                    ops2.setString(1, cartID);
                                }
                                ResultSet rs5 = ops2.executeQuery();
                            }
                        }

                    }
                    if (count > 0) {
                        response.sendRedirect("http://localhost:8080/RENT_KARO/afterpayment.jsp");
                    }
                }

                ops.close();
                oconn.close();

            } catch (SQLException ex) {
                Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
                out.println("<h2 style='color:red'> Error is : " + ex.toString() + "</h2>");
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
