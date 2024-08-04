
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleConnection;

public class Login extends HttpServlet {

    String vEMAIL, vPass, vOTP;
    OracleConnection oconn;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");

            vEMAIL = request.getParameter("db_user_name");
            vPass = request.getParameter("db_password");
            vOTP = request.getParameter("Lotp");
            String OTP = (String) session.getAttribute("LOTP");

            if (vOTP.equals(OTP)) {

                try {
                    try {
                        DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                    } catch (SQLException ex) {
                        Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");

                    String query = "SELECT USER_ID,PROFILE_PHOTO,NAME,PH_NUMBER,EMAIL FROM USERS WHERE EMAIL=? AND PASSWORD=?";
                    PreparedStatement pstmt = oconn.prepareStatement(query);
                    pstmt.setString(1, vEMAIL);
                    pstmt.setString(2, vPass);
                    if (vEMAIL.equals("ADMIN") && vPass.equals("ADMIN")) {
                        response.sendRedirect("http://localhost:8080/RENT_KARO/ADMIN%20PANEL/adminpanel.jsp");

                        oconn.close();
                    } else {
                        ResultSet set = pstmt.executeQuery();
                        if (set.next()) {
                            String user_id = set.getString("USER_ID");
                            String name = set.getString("NAME");
                            String ph_number = set.getString("PH_NUMBER");
                            String email = set.getString("EMAIL");
                            // Set the data as a request attribute
                            session.setAttribute("USER_ID", user_id);
                            session.setAttribute("NAME", name);
                            session.setAttribute("PH_NUMBER", ph_number);
                            session.setAttribute("EMAIL", email);
                            response.sendRedirect("afterlogin.jsp");
                            //request.setAttribute("NAME", name);

                            // Create and configure multiple RequestDispatchers
                            // RequestDispatcher dispatcher1 = request.getRequestDispatcher("after_main_index.jsp");
                            // RequestDispatcher dispatcher2 = request.getRequestDispatcher("after_furniture.jsp");
                            // Forward the request to different JSP pages using different dispatchers
                            //dispatcher1.forward(request, response);
                            // You can perform some processing here
                            // dispatcher2.include(request, response);
                            oconn.close();
                        } else {
                            response.sendRedirect("http://localhost:8080/RENT_KARO/invalidpage.html");
                            oconn.close();
                        }
                    }

                } catch (SQLException ex) {
                    Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
                    out.println("<h2 style='color:red'> Error is : " + ex.toString() + "</h2>");
                }
            }
            else{
                   out.println("alert('INVALID OTP');");
                   response.sendRedirect("index.html"); 
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
