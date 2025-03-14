<%-- 
    Document   : logout
    Created on : Mar 13, 2025, 3:35:28 PM
    Author     : Luxee
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%
    // Invalidate the session to log out the user
    if (session != null) {
        session.invalidate();
    }
    // Redirect to the login page after logout
    response.sendRedirect("index.jsp");
%>


