<%-- 
    Document   : remove_from_cart
    Created on : 9 Oct, 2023, 9:01:21 PM
    Author     : atrib
--%>

<%@page import="java.sql.*" %> 


<% 
        String ID = request.getParameter("ID");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-UQIIHK3:1521:orcl","RENTKARO","DATABASE");
        pst = con.prepareStatement("DELETE FROM USERCART WHERE CART_ID = ?");
         pst.setString(1, ID);
        pst.executeUpdate();  
        
        %>
        
        <script>
            
           window.location.href="http://localhost:8080/RENT_KARO/cart.jsp";
            
       </script>
