<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*" %> 


<%
    String ID = request.getParameter("ID");
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    InputStream inputStream = null;
    Part part = request.getPart("IMAGE");
    if (part != null) {
        inputStream = part.getInputStream();
    }
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");
    pst = con.prepareStatement("UPDATE USERS SET PROFILE_PHOTO=? WHERE USER_ID = ?");
    pst.setBinaryStream(1, inputStream, (int) part.getSize());
    pst.setString(2, ID);
    pst.executeUpdate();

%>

<script>

    window.location.href = "http://localhost:8080/RENT_KARO/ADMIN%20PANEL/Admin_Product_Panel.jsp"

</script>