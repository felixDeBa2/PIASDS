/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import JavaClasses.SQLStatements;
import JavaClasses.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author felix
 */
public class userDelController extends HttpServlet {

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
        String emailAdd = request.getParameter("userMail");
        String deleteConfirmed = request.getParameter("deleteConfirmed");
        HttpSession session = request.getSession();

        if (deleteConfirmed.equals("yes")) {
            String userPass = request.getParameter("userPass");
            User usrToDel = new User();
            usrToDel.setEmailAddress(emailAdd);
            usrToDel = SQLStatements.SelectUser(usrToDel);
            if (usrToDel.getPassword().equals(userPass)) {
                if (SQLStatements.DeleteUser(emailAdd)) {
                    session.invalidate();
                    try (PrintWriter out = response.getWriter()) {
                        out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<title>Servlet UsersRegisterController</title>");
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<h1><script>alert(\"User deleted successfully\"); window.location='loginVista.html';</script></h1>");
                        out.println("</body>");
                        out.println("</html>");
                    }
                }

            }
        } else {
            session.setAttribute("emailAddress", emailAdd);
            response.sendRedirect("confirmAction.jsp");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
