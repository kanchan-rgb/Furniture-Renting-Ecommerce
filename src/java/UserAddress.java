
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
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

public class UserAddress extends HttpServlet {

    String aUID, aUNAME, aUEMAIL, aUNUMBER, aNAME, aNUMBER, aALT_NUMBER, aZIPCODE, aSTATE, aCITY, aHOUSENO, aROADNAME, aLANDMARK;
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
            // Retrieve data from the session
            String userID = (String) session.getAttribute("USER_ID");
            String userNAME = (String) session.getAttribute("NAME");
            String userEMAIL = (String) session.getAttribute("EMAIL");
            String userNUMBER = (String) session.getAttribute("PH_NUMBER");

            aUID = userID;
            aUNAME = userNAME;
            aUEMAIL = userEMAIL;
            aUNUMBER = userNUMBER;
            aNAME = request.getParameter("db_fullname");
            aNUMBER = request.getParameter("db_number");
            aALT_NUMBER = request.getParameter("db_alt_number");
            aZIPCODE = request.getParameter("db_zipcode");
            aSTATE = request.getParameter("db_state");
            aCITY = request.getParameter("db_city");
            aHOUSENO = request.getParameter("db_house_number");
            aROADNAME = request.getParameter("db_rodename_areaname");
            aLANDMARK = request.getParameter("db_landmark");
            try {
                try {
                    DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                } catch (SQLException ex) {
                    Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
                }

                oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");

                ops = (OraclePreparedStatement) oconn.prepareCall("INSERT INTO USERADDRESS(USER_ID,USER_NAME,USER_EMAIL,USER_PH_NUMBER,NAME,PHONE_NUMBER,ALTERNATIVE_PHONE_NUMBER,ZIPCODE,STATE,CITY,HOUSE_BUILDING_NO,ROAD_AREA_COLONY_NAME,LANDMARK ) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
                ops.setString(1, aUID);
                ops.setString(2, aUNAME);
                ops.setString(3, aUEMAIL);
                ops.setString(4, aUNUMBER);
                ops.setString(5, aNAME);
                ops.setString(6, aNUMBER);
                ops.setString(7, aALT_NUMBER);
                ops.setString(8, aZIPCODE);
                ops.setString(9, aSTATE);
                ops.setString(10, aCITY);
                ops.setString(11, aHOUSENO);
                ops.setString(12, aROADNAME);
                ops.setString(13, aLANDMARK);

                int x = ops.executeUpdate();
                if (x > 0) {
                    String script = "<script>window.history.go(-2);</script>";

                    // Set the content type to HTML
                    response.setContentType("text/html");

                    // Write the script to the response
                    response.getWriter().write(script);

                } else {
                    response.sendRedirect("http://localhost:8080/RENT_KARO/error.html");
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
