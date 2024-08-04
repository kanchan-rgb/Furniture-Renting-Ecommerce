<%@page import="java.sql.*" %> 


<%
    String ID = request.getParameter("ID");
    Connection con;
    PreparedStatement pst;
    ResultSet rs;

    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");
    pst = con.prepareStatement("DELETE FROM BUGSREPORT WHERE B_ID = ?");
    pst.setString(1, ID);
    pst.executeUpdate();

%>

<script>

    window.location.href = "http://localhost:8080/RENT_KARO/ADMIN%20PANEL/adminBugsReports.jsp"

</script>