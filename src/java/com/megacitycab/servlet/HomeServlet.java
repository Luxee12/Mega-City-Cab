package com.megacitycab.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Check if the user is logged in (session exists)
        HttpSession session = request.getSession(false);
        
        if (session != null && session.getAttribute("username") != null) {
            // User is logged in, forward the request to home.jsp
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else {
            // User is not logged in, redirect to login page
            response.sendRedirect("index.jsp");
        }
    }
}

