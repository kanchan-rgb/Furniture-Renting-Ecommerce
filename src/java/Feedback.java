
import java.io.ByteArrayInputStream;
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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;

@MultipartConfig(maxFileSize = 56177215)
public class Feedback extends HttpServlet {

    String name, experience, star;
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
            out.println("<title>Servlet BugsReport</title>");
            out.println("</head>");
            out.println("<body>");
            InputStream inputStream = null;
            Part part = request.getPart("db_f_image");
            if (part != null) {
                inputStream = part.getInputStream();
            }

            InputStream inputStream2 = null;
            Part part2 = request.getPart("db_f_vedio");
            if (part2 != null) {
                inputStream2 = part2.getInputStream();
            }

            name = (String)session.getAttribute("NAME");
            experience = request.getParameter("db_f_experience");
            star = request.getParameter("rating");

            try {
                try {
                    DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                } catch (SQLException ex) {
                    Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
                }

                oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");
                
                ops = (OraclePreparedStatement) oconn.prepareCall("INSERT INTO FEEDBACK(NAME,Experience,Rating_Star,IMAGE,VIDEO) VALUES(?,?,?,?,?)");      
                
                ops.setString(1, name);
                ops.setString(2, experience);
                ops.setString(3, star);
                ops.setBinaryStream(4, inputStream, (int) part.getSize());
                ops.setBinaryStream(5, inputStream2, (int) part2.getSize());
                

                int y = ops.executeUpdate();

                if (y > 0) {
                    response.sendRedirect("http://localhost:8080/RENT_KARO/recordUpdated.html");
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
