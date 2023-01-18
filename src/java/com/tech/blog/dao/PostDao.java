/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kausar
 */
public class PostDao {

      Connection con;

      public PostDao(Connection con) {
            this.con = con;
      }

      public ArrayList<Category> getAllCategories() {
            ArrayList<Category> list = new ArrayList<>();
            try {
                  String q = "select * from categories";
                  Statement st = this.con.createStatement();
                  ResultSet set = st.executeQuery(q);
                  while (set.next()) {
                        int cid = set.getInt("cid");
                        String name = set.getString("name");
                        String description = set.getString("description");
                        Category c = new Category(cid, name, description);
                        list.add(c);
                  }

            } catch (Exception e) {
                  e.printStackTrace();
            }

            return list;

      }

      public boolean savePost(Post p) {
            boolean f = false;

            try {
                  String q = "insert into posts(pTitle,pDescription,pContent,pPic,catId,userId) values(?,?,?,?,?,?)";
                  PreparedStatement pstmt = con.prepareStatement(q);
                  pstmt.setString(1, p.getpTitle());
                  pstmt.setString(2, p.getpDescription());
                  pstmt.setString(3, p.getpContent());
                  pstmt.setString(4, p.getpPic());
                  pstmt.setInt(5, p.getCatId());
                  pstmt.setInt(6, p.getUserId());
                  pstmt.executeUpdate();
                  f = true;
            } catch (Exception e) {
                  e.printStackTrace();
            }
            return f;

      }

//      Get All The Post
      public List<Post> getAllPosts() {
            List<Post> list = new ArrayList<>();
//      Fetch All  Post
            try {
                  PreparedStatement pstmt = con.prepareStatement("select * from posts order by pid desc ");
                  ResultSet rst = pstmt.executeQuery();
                  while (rst.next()) {
                        int pid = rst.getInt("pid");
                        String pTitle = rst.getString("pTitle");
                        String pDescription = rst.getString("pDescription");
                        String pContent = rst.getString("pContent");
                        String pPic = rst.getString("pPic");
                        Timestamp pDate = rst.getTimestamp("pDate");
                        int catId = rst.getInt("catId");
                        int userId = rst.getInt("userId");
                        Post post = new Post(pid, pTitle, pDescription, pContent, pPic, pDate, catId, userId);
                        list.add(post);
                  }
            } catch (Exception e) {
                  e.printStackTrace();
            }
            return list;
      }

      public List<Post> getPostByCatId(int catId) {
            List<Post> list = new ArrayList<>();
//          Fetch All Post By CatId
            try {
                  PreparedStatement pstmt = con.prepareStatement("select * from posts where catId=?");
                  pstmt.setInt(1, catId);
                  ResultSet rst = pstmt.executeQuery();
                  while (rst.next()) {
                        int pid = rst.getInt("pid");
                        String pTitle = rst.getString("pTitle");
                        String pDescription = rst.getString("pDescription");
                        String pContent = rst.getString("pContent");
                        String pPic = rst.getString("pPic");
                        Timestamp pDate = rst.getTimestamp("pDate");
                        int userId = rst.getInt("userId");
                        Post post = new Post(pid, pTitle, pDescription, pContent, pPic, pDate, catId, userId);
                        list.add(post);
                  }
            } catch (Exception e) {
                  e.printStackTrace();
            }
            return list;

      }

      public Post getPostByPostId(int post_id) {
            Post post = null;
            String q = "select * from posts where pid=?";
            try {
                  PreparedStatement p = con.prepareStatement(q);
                  p.setInt(1, post_id);
                  ResultSet rst = p.executeQuery();
                  while (rst.next()) {
                        int pid = rst.getInt("pid");
                        String pTitle = rst.getString("pTitle");
                        String pDescription = rst.getString("pDescription");
                        String pContent = rst.getString("pContent");
                        String pPic = rst.getString("pPic");
                        Timestamp pDate = rst.getTimestamp("pDate");
                        int catId = rst.getInt("catId");
                        int userId = rst.getInt("userId");
                        post = new Post(pid, pTitle, pDescription, pContent, pPic, pDate, catId, userId);
                  }
            } catch (SQLException ex) {
                  Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
            }

            return post;

      }
}
