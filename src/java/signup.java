
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;

@MultipartConfig(maxFileSize=16177215)

public class signup extends HttpServlet {

    String vNAME, vEMAIL, vPH_NUMBER, vPASSWORD;
    OracleConnection oconn;
    OraclePreparedStatement ops;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet signup</title>");
            out.println("</head>");
            out.println("<body>");
            InputStream inputStream = null;
            Part part = request.getPart("db_image");
            if (part != null) {
               inputStream  = part.getInputStream();
            }
            
            vNAME = request.getParameter("db_name");
            vEMAIL = request.getParameter("db_email");
            vPH_NUMBER = request.getParameter("db_phnumber");
            vPASSWORD = request.getParameter("db_password");
            try {
                try {
                    DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                } catch (SQLException ex) {
                    Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
                }

                oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");

                ops = (OraclePreparedStatement) oconn.prepareCall("SELECT * FROM USERS WHERE EMAIL=?");
                ops.setString(1, vEMAIL);
                int x = ops.executeUpdate();
                if (x > 0) {
                    response.sendRedirect("http://localhost:8080/RENT_KARO/alreadyregister.jsp");
                    ops.close();
                    oconn.close();
                } else {
                    ops = (OraclePreparedStatement) oconn.prepareCall("INSERT INTO USERS(NAME,PROFILE_PHOTO,EMAIL,PH_NUMBER,PASSWORD) VALUES(?,?,?,?,?)");
                    ops.setString(1, vNAME);
                    ops.setBinaryStream(2, inputStream, (int) part.getSize());              
                    ops.setString(3, vEMAIL);
                    ops.setString(4, vPH_NUMBER);
                    ops.setString(5, vPASSWORD);

                    int y = ops.executeUpdate();

                    if (y > 0) {
                        response.sendRedirect("http://localhost:8080/RENT_KARO/main_index.jsp");
                    } else {
                        response.sendRedirect("http://localhost:8080/RENT_KARO/error.html");
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
