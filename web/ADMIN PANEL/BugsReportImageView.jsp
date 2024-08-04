<%@page import="java.util.Base64"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="java.sql.*" %> 


<%
    String ID = request.getParameter("ID");
    Connection con;
    PreparedStatement pst;
    OracleResultSet ors;
    ResultSet rs;

    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl", "RENTKARO", "DATABASE");
    pst = con.prepareStatement("SELECT B_IMAGE FROM BUGSREPORT WHERE B_ID= ?");
    pst.setString(1, ID);
    ors = (OracleResultSet) pst.executeQuery();

    if (ors.next() == true) {
        byte[] imageData = ors.getBytes("B_IMAGE");
        String base64Image = Base64.getEncoder().encodeToString(imageData);
        request.setAttribute("base64Image", base64Image);
%>

<html>
    <body>
    <center>
        <div>
            <img src="data:image/jpeg/png/jpg;base64,${base64Image}"/>
        </div>
    </center>
</body>
<%
    }
%>
</html>