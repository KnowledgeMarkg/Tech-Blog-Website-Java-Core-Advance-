/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;
import java.sql.*;
/**
 *
 * @author kausar
 */
public class user {
      private int id;
      private String first_name;
      private String last_name;
      private String email;
      private String password;
      private String con_pass;
      private Timestamp dateTime;
      private String profile;

      public user(int id, String first_name, String last_name, String email, String password, String con_pass, Timestamp dateTime) {
            this.id = id;
            this.first_name = first_name;
            this.last_name = last_name;
            this.email = email;
            this.password = password;
            this.con_pass = con_pass;
            this.dateTime = dateTime;
      }

      public user() {
      }

      public user(String first_name, String last_name, String email, String password, String con_pass) {
            this.first_name = first_name;
            this.last_name = last_name;
            this.email = email;
            this.password = password;
            this.con_pass = con_pass;
      }
      
      // Getter And Setter..............

      public int getId() {
            return id;
      }

      public void setId(int id) {
            this.id = id;
      }

      public String getFirst_name() {
            return first_name;
      }

      public void setFirst_name(String first_name) {
            this.first_name = first_name;
      }

      public String getLast_name() {
            return last_name;
      }

      public void setLast_name(String last_name) {
            this.last_name = last_name;
      }

      public String getEmail() {
            return email;
      }

      public void setEmail(String email) {
            this.email = email;
      }

      public String getPassword() {
            return password;
      }

      public void setPassword(String password) {
            this.password = password;
      }

      public String getCon_pass() {
            return con_pass;
      }

      public void setCon_pass(String con_pass) {
            this.con_pass = con_pass;
      }

      public Timestamp getDateTime() {
            return dateTime;
      }

      public void setDateTime(Timestamp dateTime) {
            this.dateTime = dateTime;
      }

      public String getProfile() {
            return profile;
      }

      public void setProfile(String profile) {
            this.profile = profile;
      }
      
}
