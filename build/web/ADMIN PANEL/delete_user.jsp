<%@page import="java.sql.*" %> 


<% 
        String USER_ID = request.getParameter("USER_ID");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl","RENTKARO","DATABASE");
        pst = con.prepareStatement("DELETE FROM USERS WHERE USER_ID = ?");
         pst.setString(1, USER_ID);
        pst.executeUpdate();  
        
        %>
        
        <script>
            
           window.location.href="http://localhost:8080/RENT_KARO/ADMIN%20PANEL/adminpanel.jsp"
            
       </script>