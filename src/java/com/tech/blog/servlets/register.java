/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.useDao;
import com.tech.blog.entities.user;
import com.tech.blog.helper.ConnectionProvider;
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

/**
 *
 * @author kausar
 */
@MultipartConfig
public class register extends HttpServlet {

      /**
       * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
       *
       * @param request servlet request
       * @param response servlet response
       * @throws ServletException if a servlet-specific error occurs
       * @throws IOException if an I/O error occurs
       * @throws java.sql.SQLException
       * @throws java.lang.InterruptedException
       */
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, SQLException, InterruptedException {
            response.setContentType("text/html;charset=UTF-8");
            try ( PrintWriter out = response.getWriter()) {
                Thread.sleep(1000);
                  // User Data From Form .............
                  String checkData = request.getParameter("check");
                  if(checkData==null){
                     out.println("Please Check terms And Condition");
                  }else{
                   String name = request.getParameter("first_name");
                   String l_name= request.getParameter("last_name");
                   String Email = request.getParameter("email");
                   String Password = request.getParameter("password");
                   String con_password = request.getParameter("con_pass");
                   // Create User object and set all value ......
                   user User = new user(name, l_name,Email,Password,con_password);
                   
                   // Create A user DAo Object 
                   
                        useDao dao = new useDao(ConnectionProvider.getConnection());
                      if( dao.saveUser(User)){
                        //save 
                        out.println("done");
                      }else{
                      out.println("error");
                      }
                  }
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
                  Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InterruptedException ex) {
                  Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
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
                  Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InterruptedException ex) {
                  Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
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
