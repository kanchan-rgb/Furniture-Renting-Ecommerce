<%@page import="java.sql.*" %> 


<% 
        String USER_ADDRESS_ID = request.getParameter("USER_ADDRESS_ID");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl","RENTKARO","DATABASE");
        pst = con.prepareStatement("DELETE FROM USERADDRESS WHERE USER_ADDRESS_ID = ?");
         pst.setString(1, USER_ADDRESS_ID);
        pst.executeUpdate();  
        
        %>
        
        <script>
            
           window.location.href="User_Address_Page.jsp"
            
       </script>