/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers;

import dal.FeedbackDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import models.Feedback;
import models.Order;
import models.Product;
import models.User;

/**
 *
 * @author ThinkPro
 */
public class ProductDetailsController extends HttpServlet {
       private final int record_per_page = 3;

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
            out.println("<title>Servlet ProductDetailsController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetailsController at " + request.getContextPath () + "</h1>");
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
       FeedbackDAO fd = new FeedbackDAO();
        HttpSession session = request.getSession();

        ProductDAO pd = new ProductDAO();
        OrderDAO od = new OrderDAO();
        String productidStr = request.getParameter("id");
        String categoryidStr = request.getParameter("cid");
        int product_id = Integer.parseInt(productidStr);
        int category_id = Integer.parseInt(categoryidStr);
        User user = (User) session.getAttribute("user");
       
        // get index of page
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        // get total number of feedback
        List<Feedback> feedbackList = fd.getAllFeedbackByProductId(product_id);
        int endPage = (feedbackList.size() / record_per_page);
        if (feedbackList.size() % record_per_page != 0) {
            endPage++;
        }
        List<Feedback> feedbacks = fd.pagingFeedback(product_id, index, record_per_page);
        Order accept = null;
        if (user != null) {
            accept = od.checkProductOrderByUser(user.getUserId(), product_id);
        }
        Product p = pd.getProductByID(product_id);
        List<Product> relatedProducts = pd.getRelatedProduct(product_id, category_id);

        String history = "product-details?id=" + productidStr + "&cid=" + categoryidStr + "&index=" + indexPage;
        session.setAttribute("historyUrl", history);
        request.setAttribute("productFeedbacks", feedbacks);
        request.setAttribute("relatedProducts", relatedProducts);
        request.setAttribute("product", p);

        request.setAttribute("accept", accept);
        request.setAttribute("endPage", endPage);
        request.setAttribute("pageIndex", index);
        request.setAttribute("totalFeedback", feedbackList.size());
        request.getRequestDispatcher("./views/product-details.jsp").forward(request, response);
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
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
