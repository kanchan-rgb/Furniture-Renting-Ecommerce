<%-- 
    Document   : Logout
    Created on : 1 Oct, 2023, 1:14:35 PM
    Author     : atrib
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session != null) {
        session.invalidate();
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
        response.sendRedirect("http://localhost:8080/RENT_KARO/index.html");
    }

%>
