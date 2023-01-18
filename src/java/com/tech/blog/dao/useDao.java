/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.user;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kausar
 */
public class useDao {

      private Connection con;

      public useDao(Connection con) {
            this.con = con;
      }

      // Craete Function to save USer  Data into DataBase
      public boolean saveUser(user User) {
            boolean f = false;
            try {
                  // Create A Query ....
                  String q = "insert into user(first_name , last_name , email, password, con_pass) values(?,?,?,?,?)";
                  PreparedStatement pstmt = this.con.prepareStatement(q);
                  pstmt.setString(1, User.getFirst_name());
                  pstmt.setString(2, User.getLast_name());
                  pstmt.setString(3, User.getEmail());
                  pstmt.setString(4, User.getPassword());
                  pstmt.setString(5, User.getCon_pass());
                  pstmt.executeUpdate();
                  f = true;
            } catch (SQLException e) {
                  System.out.println(e);
            }
            return f;
      }

      // Get User By userEmail And UsePassword
      public user getUserByEmailAndPassword(String email, String password) {
            user User = null;

            try {
                  String q = "select * from user where email=? and password=?";
                  PreparedStatement pstmt = con.prepareStatement(q);
                  pstmt.setString(1, email);
                  pstmt.setString(2, password);
                  ResultSet rst = pstmt.executeQuery();
                  if (rst.next()) {
                        User = new user();
                        User.setFirst_name(rst.getString("first_name"));
                        User.setId(rst.getInt("user_id"));
                        User.setEmail(rst.getString("email"));
                        User.setPassword(rst.getString("password"));
                        User.setCon_pass(rst.getString("con_pass"));
                        User.setLast_name(rst.getString("last_name"));
                        User.setDateTime(rst.getTimestamp("reg_date"));
                        User.setProfile(rst.getString("profile"));

                  }

            } catch (SQLException e) {
                  System.out.println(e);
            }
            return User;

      }

      public boolean updateUser(user User) {
            boolean f = false;
            try {
                  String s = "update user set first_name=? , last_name=?, email=?, password=?,con_pass=?, profile=? where user_id=? ";
                  PreparedStatement pstmt = con.prepareStatement(s);
                  pstmt.setString(1, User.getFirst_name());
                  pstmt.setString(2, User.getLast_name());
                  pstmt.setString(3, User.getEmail());
                  pstmt.setString(4, User.getPassword());
                  pstmt.setString(5, User.getPassword());
                  pstmt.setString(6, User.getProfile());
                  pstmt.setInt(7, User.getId());
                  pstmt.executeUpdate();
                  f = true;
            } catch (SQLException e) {
                  e.printStackTrace();
            }
            return f;
      }

     public user getUserByUserId(int userId) {
        user User = null;
        try {
            String q = "select * from user where user_id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet rst = ps.executeQuery();
            if (rst.next()) {
                User = new user();
                  User.setFirst_name(rst.getString("first_name"));
                  User.setId(rst.getInt("user_id"));
                  User.setEmail(rst.getString("email"));
                  User.setPassword(rst.getString("password"));
                  User.setCon_pass(rst.getString("con_pass"));
                  User.setLast_name(rst.getString("last_name"));
                  User.setDateTime(rst.getTimestamp("reg_date"));
                  User.setProfile(rst.getString("profile"));
            }
            } catch (SQLException ex) {
                  Logger.getLogger(useDao.class.getName()).log(Level.SEVERE, null, ex);
                  ex.printStackTrace();
            }
            return User;

      }
}
