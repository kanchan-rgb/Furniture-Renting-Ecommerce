/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;

public class Cart extends HttpServlet {

    String cID, cPID, cTITLE,cUID, cUNAME, cUEMAIL, cUNUMBER, cQUANTITY, cPRICE, cMONTH, cfinalpriceString;
    OracleConnection oconn;
    OraclePreparedStatement ops;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet signup</title>");
            out.println("</head>");
            out.println("<body>");
            
            String userID = (String) session.getAttribute("USER_ID");
            String userNAME = (String) session.getAttribute("NAME");
            String userEMAIL = (String) session.getAttribute("EMAIL");
            String userNUMBER = (String) session.getAttribute("PH_NUMBER");

            cUID = userID;
            cUNAME = userNAME;
            cUEMAIL = userEMAIL;
            cUNUMBER = userNUMBER;
            cID = request.getParameter("db_p_id");
            cQUANTITY = request.getParameter("db_quantity");
            cMONTH = request.getParameter("db_month");

            try {
                try {
                    DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                } catch (SQLException ex) {
                    Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
                }

                oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");

                ops = (OraclePreparedStatement) oconn.prepareCall("SELECT * FROM PRODUCT WHERE ID=?");
                ops.setString(1, cID);
                ResultSet rs = ops.executeQuery();

                if (rs.next()) {

                    String q = rs.getString("QUANTITY");
                    cTITLE = rs.getString("NAME");
                    cPRICE = rs.getString("PRICE");
                    cPID = rs.getString("ID");
                    byte[] blobData = rs.getBytes("IMAGE");

                    int quantityFromDatabase = Integer.parseInt(q);
                    int userquantity = Integer.parseInt(cQUANTITY);
                    int usermonth = Integer.parseInt(cMONTH);
                    int price = Integer.parseInt(cPRICE);

                    if (quantityFromDatabase < userquantity) {
                        response.sendRedirect("http://localhost:8080/RENT_KARO/quantity_error.html");
                    } else {

                        int cfinalprice = usermonth * userquantity * price;
                        cfinalpriceString = Integer.toString(cfinalprice);

                        ops = (OraclePreparedStatement) oconn.prepareCall("INSERT INTO USERCART(USER_ID, USER_NAME, USER_EMAIL, USER_PH_NUMBER, PRODUCT_ID, PRODUCT_NAME, IMAGE, QUANTITY, MONTHS, PRICE) values(?,?,?,?,?,?,?,?,?,?)");

                        ops.setString(1, cUID);
                        ops.setString(2, cUNAME);
                        ops.setString(3, cUEMAIL);
                        ops.setString(4, cUNUMBER);
                        ops.setString(5, cPID);
                        ops.setString(6, cTITLE);
                        // Set the BLOB data in the INSERT statement
                        ops.setBytes(7, blobData);
                        ops.setString(8, cQUANTITY);
                        ops.setString(9, cMONTH);
                        ops.setString(10, cfinalpriceString);
                        int y = ops.executeUpdate();

                        if (y > 0) {
                            response.sendRedirect("http://localhost:8080/RENT_KARO/cart.jsp");
                        } else {
                            response.sendRedirect("http://localhost:8080/RENT_KARO/error.html");
                        }
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
