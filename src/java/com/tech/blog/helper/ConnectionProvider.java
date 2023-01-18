/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.sql.*;

/**
 *
 * @author kausar
 */
public class ConnectionProvider {

      private static Connection con;

      public static Connection getConnection() throws SQLException {
            try {
                  if (con == null) {
                        // Driver Class Load 
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        //Create A connection 
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog ", "root", "kausar86");
                  }
            } catch (ClassNotFoundException e) {
                  System.out.println(e);
            }
            return con;
      }
}
