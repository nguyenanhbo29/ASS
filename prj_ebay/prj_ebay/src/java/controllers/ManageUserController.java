/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.List;
import models.User;

/**
 *
 * @author ThinkPro
 */
public class ManageUserController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageUserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageUserController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        UserDAO ud = new UserDAO();

        List<User> list = ud.getUsers();
        request.setAttribute("listOfPage", list);
        request.setAttribute("p", 3);
        request.getRequestDispatcher("./views/manage-user.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String role = request.getParameter("role");
        HttpSession ses = request.getSession();
        UserDAO ud = new UserDAO();
        if (action.equals("edit")) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            boolean status = Boolean.parseBoolean(request.getParameter("status"));

            // Kiểm tra trùng email và số điện thoại với user có ID khác
            User existingUserByEmail = ud.getUserByEmail(userId + "", email);
            User existingUserByPhone = ud.getUserByPhone(userId + "", phone);

            if ((existingUserByEmail != null && existingUserByEmail.getUserId() != userId)
                    || (existingUserByPhone != null && existingUserByPhone.getUserId() != userId)) {

                // Nếu trùng, gửi thông báo về trang quản lý người dùng
                ses.setAttribute("noti", "Update thất bại. Email hoặc số điện thoại đã được sử dụng bởi người dùng khác.");
            } else {


                // Nếu không trùng, thực hiện cập nhật thông tin
                User user = new User();
                user.setUserId(userId);
                user.setEmail(email);
                user.setPhone(phone);
                user.setFullName(fullName);
                user.setAddress(address);
                user.setRole(role);
                user.setActive(status);
                ud.updateUser(user); // Thực hiện cập nhật thông tin
            }
        } else {
            // Kiểm tra trùng email và số điện thoại với user có ID khác
            User existingUserByEmail = ud.getUserByEmail("", email);
            User existingUserByPhone = ud.getUserByPhone("", phone);

            if ((existingUserByEmail != null)
                    || (existingUserByPhone != null)) {

                // Nếu trùng, gửi thông báo về trang quản lý người dùng
                ses.setAttribute("noti", "Insert thất bại. Email hoặc số điện thoại đã được sử dụng bởi người dùng khác.");
            } else {
                // Nếu không trùng, thực hiện cập nhật thông tin
                User user = new User();
                user.setEmail(email);
                user.setPhone(phone);
                user.setFullName(fullName);
                user.setAddress(address);
                user.setRole(role);

                ud.insertUser(user); // Thực hiện cập nhật thông tin
            }
        }
        response.sendRedirect("manage-user");
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
