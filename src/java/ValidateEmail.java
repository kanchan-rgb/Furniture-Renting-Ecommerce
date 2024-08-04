
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;
import oracle.jdbc.OracleResultSet;

public class ValidateEmail extends HttpServlet {

    OracleConnection oconn;
    OraclePreparedStatement ost;
    OracleResultSet ors = null;
    String fEMAIL, fPASS, fNAME;
    String vTO, vFORM, vCC, vBCC, vSUBJECT, vBODY;
    int otpNumber;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ValidateEmail</title>");
            out.println("</head>");
            out.println("<body>");

            fEMAIL = request.getParameter("fEmail");
            try {
                DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            } catch (SQLException ex) {
                Logger.getLogger(ValidateEmail.class.getName()).log(Level.SEVERE, null, ex);
            }
            oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");
            ost = (OraclePreparedStatement) oconn.prepareStatement("SELECT * FROM USERS WHERE EMAIL=?");
            ost.setString(1, fEMAIL);
            ors = (OracleResultSet) ost.executeQuery();
            if (ors.next()) {
                vTO = fEMAIL;
                vSUBJECT = "Forgot Password !!!";
                vBODY = "Please enter the below OTP in your webpage to reset your password";
                final String username = "rentkaro9@gmail.com";
                final String password = "kbqlomfsvalimpwo";
                Properties props = new Properties();
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "587");

                Random random = new Random();
                otpNumber = 100000 + random.nextInt(900000);

                Session session = Session.getInstance(props,
                        new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

                try {

                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(username));
                    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(vTO));
                    message.setSubject(vSUBJECT);
                    String htmlContent = "<h3>Please enter the below OTP in your webpage to reset your password</h3><br><h3>Hi,</h3><br><p>Greetings!</p><br><p>We are sharing a verification code to reset your account's password. The code is usable only once.</p><br><p>Once you have verified the code, you'll be prompted to set a new password immediately. This is to ensure that only you have access to your account</p><p>Your OTP:"+otpNumber+"</p><br><p>Best Regards,<br><p>Team RENTKARO<p><img width='90' height='30' src='https://drive.google.com/uc?export=download&id=1Qv7TlsuMWYEV1TvvojMfNVibVlbr_cGV'/>";
                  
                    message.setContent(htmlContent, "text/html");
                   
                    Transport.send(message);
                    String OTP = Integer.toString(otpNumber);
                    httpSession.setAttribute("OTP", OTP);
                    httpSession.setAttribute("EMAIL", fEMAIL);
                    response.sendRedirect("http://localhost:8080/RENT_KARO/forgotOTP.jsp");

                

                } catch (MessagingException e) {

                    out.println("<h2 style='color:red'>" + e.getMessage() + "</h2>");
                }

            } else {
                response.sendRedirect("http://localhost:8080/RENT_KARO/userNotFound.html");
            }
            ost.close();
            oconn.close();
            out.println("</body>");
            out.println("</html>");
        } catch (SQLException ex) {
            Logger.getLogger(ValidateEmail.class.getName()).log(Level.SEVERE, null, ex);
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
