/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.useDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.user;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author kausar
 */
@MultipartConfig
public class editRegister extends HttpServlet {

      /**
       * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
       *
       * @param request servlet request
       * @param response servlet response
       * @throws ServletException if a servlet-specific error occurs
       * @throws IOException if an I/O error occurs
       */
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, SQLException {
            response.setContentType("text/html;charset=UTF-8");
            try ( PrintWriter out = response.getWriter()) {
                  /* TODO output your page here. You may use following sample code. */
                  out.println("<!DOCTYPE html>");
                  out.println("<html>");
                  out.println("<head>");
                  out.println("<title>Servlet editRegister</title>");
                  out.println("</head>");
                  out.println("<body>");
//                Fetch All Data From Edit Profile

                  String first_Name = request.getParameter("f_name");
                  String last_Name = request.getParameter("l_name");
                  String userEmail = request.getParameter("email");
                  String password = request.getParameter("pass");
                  String conPass = request.getParameter("pass");
                  Part part = request.getPart("image");
                  String image_Name = part.getSubmittedFileName();

                  // Get The User From The Session..........
                  HttpSession s = request.getSession();
                  user User = (user) s.getAttribute("currentUser");

                  User.setFirst_name(first_Name);
                  User.setLast_name(last_Name);
                  User.setEmail(userEmail);
                  User.setPassword(password);
                  User.setCon_pass(conPass);

                  String oldFile = User.getProfile();
                  User.setProfile(image_Name);
                  /// Update Data Into DatabAse................................

                  useDao dao = new useDao(ConnectionProvider.getConnection());
                  boolean ans = dao.updateUser(User);
                  if (ans) {

                        String path = request.getRealPath("/") + "profile" + File.separator + User.getProfile();

                        //start of photo work
                        //delete code
                        String pathOldFile = request.getRealPath("/") + "profile" + File.separator + oldFile;

                        if (!oldFile.equals("default.png")) {
                              helper.deleteFile(pathOldFile);
                        }

                        if (helper.saveFile(part.getInputStream(), path)) {
                              out.println("Profile updated...");
                              Message msg = new Message("Profile details updated...", "success ", " bg-green-100 rounded-lg py-5 px-6 mb-4 text-base text-green-700 mb-3");
                              s.setAttribute("msg", msg);

                        } else {
                              //////////////
                              Message msg = new Message("Something went wrong..", "error", "bg-red-100 rounded-lg py-2 px-6 mb-2 text-base text-red-700 mb-3");
                              s.setAttribute("msg", msg);
                        }

                        //end of phots work
                  } else {
                        out.println("not updated..");
                        Message msg = new Message("Something went wrong..", "error", "bg-red-100 rounded-lg py-2 px-6 mb-2 text-base text-red-700 mb-3");
                        s.setAttribute("msg", msg);

                  }

                  response.sendRedirect("profile.jsp");
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
            try {
                  processRequest(request, response);
            } catch (SQLException ex) {
                  Logger.getLogger(editRegister.class.getName()).log(Level.SEVERE, null, ex);
            }
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
            try {
                  processRequest(request, response);
            } catch (SQLException ex) {
                  Logger.getLogger(editRegister.class.getName()).log(Level.SEVERE, null, ex);
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
