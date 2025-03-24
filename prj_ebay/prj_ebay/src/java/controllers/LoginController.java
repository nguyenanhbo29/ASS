/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers;

import dal.CartDAO;
import dal.OrderDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import models.Cart;
import models.RoleConstant;
import models.User;

/**
 *
 * @author ThinkPro
 */
public class LoginController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("./views/login.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
 HttpSession session = request.getSession();
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();
        UserDAO ud = new UserDAO();
        User user = ud.login(email, password);
        if (user == null) {
            session.setAttribute("notification", "Invalid username or password or role. Try again!");
            session.setAttribute("typeNoti", "alert-danger");
            response.sendRedirect("login");
        } else {
            session.setAttribute("user", user);
            if (user.getRole().equalsIgnoreCase(RoleConstant.ADMIN_ROLE) || user.getRole().equalsIgnoreCase(RoleConstant.STAFF_ROLE)) {
                response.sendRedirect(request.getContextPath() + "/manage");
            } else if (user.getRole().equalsIgnoreCase(RoleConstant.USER_ROLE)) {
                CartDAO cd = new CartDAO();
                int totalItem = cd.getTotalItemInCart(user.getUserId());
                session.setAttribute("totalItem", totalItem);
                String url = (String) session.getAttribute("historyUrl");
                if (url == null || url.isEmpty()) {
                    response.sendRedirect(request.getContextPath() + "/products");
                } else {
                    response.sendRedirect(url);
                }
            }
        }    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
