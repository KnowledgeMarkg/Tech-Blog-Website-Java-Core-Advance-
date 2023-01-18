<%-- 
    Document   : blogPost
    Created on : Oct 10, 2022, 8:54:36 PM
    Author     : kausar
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

      <head>
            <meta charset="utf-8">
            <meta name="robots" content="noindex, nofollow">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
                  integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
                  crossorigin="anonymous" referrerpolicy="no-referrer" />
            <link rel="shortcut icon" href="#" />
            <title>Blog</title>
            <script src="https://cdn.ckeditor.com/4.20.0/full/ckeditor.js"></script>
      </head>
      <body>
            <%@include file="navbar.jsp" %>
            <div class="w-full mx-auto sm:px-6 lg:px-8">
                  <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg rounded-lg">
                        <div class="p-2 bg-white border-b border-gray-200">
                              <form method="POST" action="addPostServlet" id="add_post_form" enctype="multipart/form-data">

                                    <!--Categories-->                                             

                                    <div class="mb-3 w-full">
                                          <select name="cid" class="form-select appearance-none block w-full px-3 py-1.5 text-base font-normal  text-gray-700 bg-white bg-clip-padding bg-no-repeat border border-solid border-gray-300  rounded  transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" aria-label="Default select example">
                                                <option selected disabled>Select category</option>

                                                <%
                                                      PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                                      ArrayList<Category> list = postd.getAllCategories();
                                                      for (Category elem : list) {
                                                %>
                                                <option value="<%=elem.getCid()%>"><%=elem.getName()%></option>

                                                <%                                                }
                                                %>

                                          </select>
                                    </div>

                                    <!--end Category-->

                                    <div class="mb-4">
                                          <label class="text-xl text-gray-600">Title <span class="text-red-500">*</span></label></br>
                                          <input type="text" class="border-2 border-gray-300 p-2 w-full rounded-lg" name="title" id="title" value="" required>
                                    </div>

                                    <div class="mb-4">
                                          <label class="text-xl text-gray-600">Description</label></br>
                                          <input type="text" class="border-2 border-gray-300 p-2 w-full rounded-lg" name="description" id="description" placeholder="(Optional)">
                                    </div>

                                    <div class="mb-8 rounded-lg">
                                          <label class="text-xl text-gray-600 rounded-lg">Content <span class="text-red-500">*</span></label></br>

                                          <textarea class="rounded-lg" cols="80" id="editor1" name="editor1" rows="10" ></textarea>
                                    </div>
                                    <fieldset class="w-full dark:text-gray-100">
                                          <label for="files" class="block text-sm font-medium">Attachments</label>
                                          <div class="flex">
                                                <input type="file" name="files" id="files" class="px-4 py-2 border-2 border-dashed rounded-md dark:border-gray-700 dark:text-gray-400 dark:bg-gray-800">
                                          </div>
                                    </fieldset>

                                    <div class="flex p-1">
                                          <select class="border-2 border-gray-300 border-r p-3 rounded-lg ml-3" name="action">
                                                <option>Save and Publish</option>
                                                <option>Save Draft</option>
                                          </select>
                                          <button role="submit" class="p-3 bg-blue-500 text-white hover:bg-blue-400 rounded-lg ml-2" required>Submit</button>
                                    </div>
                              </form>
                        </div>
                  </div>
            </div>
            <%@include file="footer.jsp" %>
            <!--JavaScript .....Code-->
            <!--<script src="https://cdn.tailwindcss.com"></script>-->
            <script src="https://unpkg.com/@material-tailwind/html@latest/scripts/ripple.js"></script>
            <!--<script src="https://unpkg.com/@material-tailwind/html@latest/scripts/script-name.js"></script>-->
            <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
            <script src="javaScript/myJavaScript.js" type="text/javascript"></script>
            <script src="javaScript/script.js" type="text/javascript"></script>
            <script>
                  CKEDITOR.replace('editor1', {
                        height: 400,
                        baseFloatZIndex: 10005,
                        removeButtons: 'PasteFromWord',
                        removePlugins: 'exportpdf'
                  });
            </script>
            <script>
                  $(document).ready(function (e) {
                        $("#add_post_form").on("submit", function (event) {
                              //this code gets called when form is submitted
                              event.preventDefault();
                              console.log("You Are Great");
                              let form = new FormData(this);
                              // Now Request to server
                              $.ajax({
                                    url: "addPostServlet",
                                    type: 'POST',
                                    data: form,
                                    success: function (data, textStatus, jqXHR) {
                                          console.log(data);
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {

                                    },
                                    processData: false,
                                    contentType: false
                              });
                        });
                  });
            </script>
      </body>
</html>