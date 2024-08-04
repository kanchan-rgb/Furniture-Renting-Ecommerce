<%@page import="java.sql.*" %> 


<%
    String ID = request.getParameter("ID");
    Connection con;
    PreparedStatement pst;
    ResultSet rs;

    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");
    pst = con.prepareStatement("DELETE FROM CONTACTUS WHERE CID = ?");
    pst.setString(1, ID);
    pst.executeUpdate();

%>

<script>

    window.location.href = "http://localhost:8080/RENT_KARO/ADMIN%20PANEL/admin_contactUS.jsp"

</script>