/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.CartDAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import models.Cart;
import models.User;

/**
 *
 * @author ThinkPro
 */
public class OrderController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String fullname = request.getParameter("fullName");
        String phone = request.getParameter("phone").trim();
        String email = request.getParameter("email").trim();
        String address = request.getParameter("address").trim();
        String note = request.getParameter("note").trim();
        CartDAO cd = new CartDAO();
        OrderDAO od = new OrderDAO();

        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        if (listCart == null || listCart.isEmpty()) { // trường hợp click vào history browser
            //session.setAttribute("notification", "Giỏ hàng rỗng");
            response.sendRedirect("list-product");
        } else {
            int sum = (int) session.getAttribute("sum");
            User u = (User) session.getAttribute("user");
            int user_id = u.getUserId();
            int order_id = od.createNewOrder(sum, fullname, email, phone, address, user_id, note);
            od.addCartToOrderDetails(listCart, order_id);
            cd.deleteCartByUserId(user_id);
            session.setAttribute("totalItem", 0);
            request.setAttribute("sum", sum);
            request.setAttribute("order_id", order_id);
            request.setAttribute("fullName", fullname);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("note", note);
            request.getRequestDispatcher("./views/thankyou.jsp").forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
