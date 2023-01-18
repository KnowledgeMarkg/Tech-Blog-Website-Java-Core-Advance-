<%-- 
    Document   : show_blog_page
    Created on : Oct 13, 2022, 4:38:09 AM
    Author     : kausar
--%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.useDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.user"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page errorPage="error_page.jsp" %>

<%
      user User = (user) session.getAttribute("currentUser");
      if (User == null) {
            response.sendRedirect("login.jsp");
      }
%>

<%
      int post_id = Integer.parseInt(request.getParameter("post_id"));
      PostDao po = new PostDao(ConnectionProvider.getConnection());
      Post d = po.getPostByPostId(post_id);
%>
<%
      useDao ud = new useDao(ConnectionProvider.getConnection());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
      <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title><%=d.getpTitle()%></title>
            <meta name="author" content="David Grzyb">
            <meta name="description" content="">
            <!-- Tailwind -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
            <script src="https://cdn.ckeditor.com/4.20.0/full/ckeditor.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
                  integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
                  crossorigin="anonymous" referrerpolicy="no-referrer" />
            <style>
                  @import url('https://fonts.googleapis.com/css?family=Karla:400,700&display=swap');

                  .font-family-karla {
                        font-family: karla;
                  }
            </style>
            <!-- AlpineJS -->
            <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
            <!-- Font Awesome -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" integrity="sha256-KzZiKy0DWYsnwMF+X1DvQngQ2/FxF7MF3Ff72XcpuPs=" crossorigin="anonymous"></script>
      </head>
      <body class="bg-white font-family-karla">
            <!-- Top Bar Nav -->
            <nav class=" flex  items-center p-2 lg:p-4 lg:px-10 flex-wrap lg:backClip">
                  <a href="#" class="lg:p-2 lg:mr-2  inline-flex items-center">
                        <svg viewBox="0 0 24 24"  xmlns="http://www.w3.org/2000/svg"  class="fill-current text-green-600 h-8 w-16 mr-2 mt-2 pr-1" >
                        <path d="M12.001 4.8c-3.2 0-5.2 1.6-6 4.8 1.2-1.6 2.6-2.2 4.2-1.8.913.228 1.565.89 2.288 1.624C13.666 10.618 15.027 12 18.001 12c3.2 0 5.2-1.6 6-4.8-1.2 1.6-2.6 2.2-4.2 1.8-.913-.228-1.565-.89-2.288-1.624C16.337 6.182 14.976 4.8 12.001 4.8zm-6 7.2c-3.2 0-5.2 1.6-6 4.8 1.2-1.6 2.6-2.2 4.2-1.8.913.228 1.565.89 2.288 1.624 1.177 1.194 2.538 2.576 5.512 2.576 3.2 0 5.2-1.6 6-4.8-1.2 1.6-2.6 2.2-4.2 1.8-.913-.228-1.565-.89-2.288-1.624C10.337 13.382 8.976 12 6.001 12z" />
                        </svg>
                        <span class="text-xl lg:text-3xl lg:px-4 text-black mt-2  font-bold uppercase tracking-wide outline-double outline-3 outline-offset-2 rounded  outline-green-600 hover:text-green-600" >Tech Blog</span>
                  </a>
                  <button
                        class="text-black inline-flex p-3 hover:bg-gray-900 rounded lg:hidden ml-auto hover:text-white outline-none nav-toggler" data-target="#navigation">
                        <i class="fa-solid fa-bars"></i>
                  </button>
                  <div class="hidden top-navbar w-full lg:inline-flex lg:flex-grow lg:w-auto  " id="navigation">
                        <div class="lg:inline-flex lg:flex-row lg:ml-auto lg:w-auto w-full lg:items-center items-start flex flex-col lg:h-auto">
                              <a href="index.jsp" class="text-xl my-2 px-4 lg:inline-flex lg:w-auto w-full px-3 py-2 rounded text-white-400 items-center justify-center hover:bg-gray-900 hover:text-white">Home</a>
                              <a href="aboutus.jsp" class="text-xl px-4 lg:inline-flex lg:w-auto w-full px-3 py-2 rounded text-white-400 items-center justify-center hover:bg-gray-900 hover:text-white">About</a>
                              <a href="#" class="text-xl px-4 lg:inline-flex lg:w-auto w-full px-3 py-2 rounded text-white-400 items-center justify-center hover:bg-gray-900 hover:text-white">Blog</a>
                              <a href="contactUS.jsp" class="text-xl  lg:inline-flex lg:w-auto w-full px-3 py-2 rounded text-white-400 items-center justify-center hover:bg-gray-900 hover:text-white"">Contact</a>
                              <a href="#!" onclick="document.getElementById('myModal').showModal()" id="btn" class="text-xl  lg:mx-4 my-2  px-4 lg:inline-flex lg:w-auto w-full px-3 py-2 rounded text-white-400 items-center justify-center hover:bg-gray-900 hover:text-white text-xl px-4 bg-green-600 py-2 text-white hover:bg-green-800"> <%= User.getFirst_name()%> </a>
                              <a href="logoutServlet" class="text-xl mr-3 mb-2 lg:mb-0  lg:inline-flex lg:w-auto w-full px-4 py-2  rounded text-white-400 items-center justify-center hover:bg-gray-900 hover:text-white text-xl px-4 bg-green-600 py-2 text-white hover:bg-green-800">Logout</a>
                              <a href="#" type="button" data-modal-toggle="authentication-modal" id="btn2" class="text-xl   lg:inline-flex lg:w-auto w-full px-4 py-2 rounded text-white-400 items-center justify-center hover:bg-gray-900 hover:text-white text-xl px-4 bg-green-600 py-2 text-white hover:bg-green-800">DoPost</a>
                        </div>
                  </div>
            </nav> 
            <!-- Topic Nav -->
            <nav class="w-full py-4 border-t border-b bg-white" x-data="{ open: false }">
                  <!--Profile Modal-->
                  <dialog id="myModal" class="h-auto w-11/12 md:w-2/5 lg:w-2/5 p-3 bg-gradient-to-r from-yellow-400 via-gray-50 to-teal-300 rounded-md  ">

                        <div class="flex flex-col w-full h-auto ">
                              <!-- Header -->
                              <div class="flex w-full h-auto justify-center items-center">
                                    <div class="flex w-11/12 lg:w-8/12 h-auto py-2 justify-center items-center text-2xl font-bold ">
                                          Tech Blog With Kausar 
                                    </div>
                                    <div onclick="document.getElementById('myModal').close();" class="flex w-1/12 h-auto justify-center cursor-pointer">
                                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                    </div>
                                    <!--Header End-->
                              </div>
                              <!-- Modal Content-->
                              <div class="flex w-full h-auto py-2 px-2 justify-center items-center flex-col bg-radial from-amber-200 via-violet-600 to-sky-900 rounded text-center text-gray-500">
                                    <img class="w-1/5" src="profile/<%= User.getProfile()%>" alt="alt"/>  
                                    <h1 class="text-2xl text-center text-black font-bold mt-2 mb-4"> <%= User.getFirst_name()%> <%=  User.getLast_name()%></h1>

                                    <!--Table Data--> 

                                    <div id="profile_details" class="overflow-hidden">
                                          <table class="min-w-full">
                                                <thead class=" lg:border-b">
                                                      <tr class= lg:border-b  transition duration-300 ease-in-out hover:bg-gray-100">
                                                            <th scope="col" class="text-lg font-bold text-green-600  lg:px-6 lg:py-4 text-left">
                                                                  ID
                                                            </th>
                                                            <td class=" whitespace-nowrap text-sm font-bold text-green-600"><%=User.getId()%></td>
                                                      </tr>
                                                      <tr class= lg:border-b transition duration-300 ease-in-out hover:bg-gray-100">
                                                            <th scope="col" class="text-lg font-bold text-green-600  lg:px-6 lg:py-4 text-left">
                                                                  First_Name
                                                            </th>
                                                            <td class="text-sm text-gray-900 font-bold  whitespace-nowrap">
                                                                  <%= User.getFirst_name()%>
                                                            </td>
                                                      </tr>
                                                      <tr class= lg:border-b transition duration-300 ease-in-out hover:bg-gray-100">
                                                            <th scope="col" class="text-lg font-bold text-green-600  lg:px-6 lg:py-4 text-left">
                                                                  Last_Name
                                                            </th>
                                                            <td class="text-sm text-gray-900 font-bold  whitespace-nowrap">
                                                                  <%= User.getLast_name()%>
                                                            </td>
                                                      </tr>
                                                      <tr class= lg:border-b transition duration-300 ease-in-out hover:bg-gray-100">
                                                            <th scope="col" class="text-lg font-bold text-green-600  lg:px-6 lg:py-4 text-left">
                                                                  Email
                                                            </th>
                                                            <td class="text-sm text-gray-900 font-bold px-6 py-4 whitespace-nowrap">
                                                                  <%= User.getEmail()%>
                                                            </td>
                                                      </tr>
                                                      <tr class= lg:border-b transition duration-300 ease-in-out hover:bg-gray-100">
                                                            <th scope="col" class="text-lg font-bold text-green-600  lg:px-6 lg:py-4 text-left">
                                                                  Date
                                                            </th>
                                                            <td class="text-sm text-gray-900 font-bold px-6 py-4 whitespace-nowrap">
                                                                  <%=User.getDateTime().toLocalDateTime().toString()%>
                                                            </td>
                                                      </tr>
                                                </thead>

                                          </table>
                                    </div>

                                    <!--Profile Edit--> 
                                    <form action="editRegister" method="post" enctype="multipart/form-data">
                                          <div id="profile_edit" style="display: none;">
                                                <table class="min-w-full"> 
                                                      <tr class= lg:border-b  transition duration-300 ease-in-out hover:bg-gray-100">
                                                            <th scope="col" class="text-sm font-bold text-green-600 px-2 py-2  text-left">
                                                                  ID
                                                            </th>
                                                            <td class=" whitespace-nowrap text-sm font-bold text-green-600"><%=User.getId()%></td>
                                                      </tr>
                                                      <tr class= lg:border-b  transition duration-300 ease-in-out hover:bg-gray-100">
                                                            <th scope="col" class="text-sm font-bold text-green-600 px-2 py-2   text-left">
                                                                  F_Name:
                                                            </th>
                                                            <td class=" whitespace-nowrap text-sm font-bold text-green-600">  <input type="text" name="f_name" class="pr-4 pl-10 py-2 bg-green-100 border focus:ring-gray-500 focus:border-gray-900  sm:text-sm border-gray-300 rounded-md focus:outline-none text-gray-600" value="<%= User.getFirst_name()%>"></td>
                                                      </tr>
                                                      <tr class= lg:border-b  transition duration-300 ease-in-out hover:bg-gray-100">
                                                            <th scope="col" class="text-sm font-bold text-green-600 px-2 py-2  text-left">
                                                                  L_Name:
                                                            </th>
                                                            <td class=" whitespace-nowrap text-sm font-bold text-green-600">  <input type="text" name="l_name" class="pr-4 pl-10 bg-green-100 py-2 border focus:ring-gray-500 focus:border-gray-900  sm:text-sm border-gray-300 rounded-md focus:outline-none text-gray-600" value="<%= User.getLast_name()%>"></td>
                                                      </tr>
                                                      <tr class= lg:border-b  transition duration-300 ease-in-out hover:bg-gray-100">
                                                            <th scope="col" class="text-sm  font-bold text-green-600 px-2 py-2  text-left">
                                                                  Email:
                                                            </th>
                                                            <td class=" whitespace-nowrap text-sm font-bold text-green-600">  <input type="email" name="email" class="pr-4 pl-10 bg-green-100 py-2 border focus:ring-gray-500 focus:border-gray-900  sm:text-sm border-gray-300 rounded-md focus:outline-none text-gray-600" value="<%= User.getEmail()%>"></td>
                                                      </tr>
                                                      <tr class= lg:border-b  transition duration-300 ease-in-out hover:bg-gray-100">
                                                            <th scope="col" class="text-sm font-bold text-green-600  px-2 py-2 text-left">
                                                                  Password:
                                                            </th>
                                                            <td class=" whitespace-nowrap text-sm font-bold text-green-600">  
                                                                  <div  x-data="{ show: true }">

                                                                        <div class="relative">
                                                                              <input name="pass" required placeholder="password" :type="show ? 'password' : 'text'" class="text-md block px-3 py-2 rounded-lg w-full
                                                                                     bg-white border-2 border-gray-300 placeholder-gray-600 shadow-md
                                                                                     focus:placeholder-gray-500
                                                                                     focus:bg-white
                                                                                     focus:border-gray-600
                                                                                     focus:outline-none">
                                                                              <div class="absolute inset-y-0 right-0 pr-3 flex items-center text-sm leading-5">

                                                                                    <svg class="h-6 text-gray-700" fill="none" @click="show = !show"
                                                                                         :class="{'hidden': !show, 'block':show }" xmlns="http://www.w3.org/2000/svg"
                                                                                         viewbox="0 0 576 512">
                                                                                    <path fill="currentColor"
                                                                                          d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z">
                                                                                    </path>
                                                                                    </svg>

                                                                                    <svg class="h-6 text-gray-700" fill="none" @click="show = !show"
                                                                                         :class="{'block': !show, 'hidden':show }" xmlns="http://www.w3.org/2000/svg"
                                                                                         viewbox="0 0 640 512">
                                                                                    <path fill="currentColor"
                                                                                          d="M320 400c-75.85 0-137.25-58.71-142.9-133.11L72.2 185.82c-13.79 17.3-26.48 35.59-36.72 55.59a32.35 32.35 0 0 0 0 29.19C89.71 376.41 197.07 448 320 448c26.91 0 52.87-4 77.89-10.46L346 397.39a144.13 144.13 0 0 1-26 2.61zm313.82 58.1l-110.55-85.44a331.25 331.25 0 0 0 81.25-102.07 32.35 32.35 0 0 0 0-29.19C550.29 135.59 442.93 64 320 64a308.15 308.15 0 0 0-147.32 37.7L45.46 3.37A16 16 0 0 0 23 6.18L3.37 31.45A16 16 0 0 0 6.18 53.9l588.36 454.73a16 16 0 0 0 22.46-2.81l19.64-25.27a16 16 0 0 0-2.82-22.45zm-183.72-142l-39.3-30.38A94.75 94.75 0 0 0 416 256a94.76 94.76 0 0 0-121.31-92.21A47.65 47.65 0 0 1 304 192a46.64 46.64 0 0 1-1.54 10l-73.61-56.89A142.31 142.31 0 0 1 320 112a143.92 143.92 0 0 1 144 144c0 21.63-5.29 41.79-13.9 60.11z">
                                                                                    </path>
                                                                                    </svg>

                                                                              </div>
                                                                        </div>
                                                                  </div>
                                                      </tr>
                                                      <tr class= lg:border-b  transition duration-300 ease-in-out hover:bg-gray-100">
                                                            <th scope="col" class="text-sm font-bold text-green-600 px-2 py-2 text-left">
                                                                  Profile Pic:
                                                            </th>
                                                            <td class=" whitespace-nowrap text-sm font-bold py-2 text-green-600">   <label class="block shadow">
                                                                        <span class="sr-only">Choose File</span>
                                                                        <input name="image" type="file" class="block text-sm file:py-2 file:px-2 text-gray-500 file:rounded file:border-1 file:border-gray-400"/>
                                                                  </label></td>
                                                      </tr>
                                                </table>
                                                <div class="mb-4 flex flex-col mt-1">
                                                      <button type="submit" class="px-4 py-1 rounded-md text-sm font-medium border focus:outline-none focus:ring transition text-green-600 border-green-600 hover:text-white hover:bg-green-600 active:bg-green-700 focus:ring-green-300" >Save</button>
                                                </div>
                                          </div>
                                    </form>
                                    <div class="mb-4 flex flex-col w-4/5 mt-1">
                                          <button id="edit_profile_btn"  class="px-4 py-1 rounded-md text-sm font-medium border focus:outline-none focus:ring transition text-blue-600 border-blue-600 hover:text-white hover:bg-blue-600 active:bg-blue-700 focus:ring-blue-300">Edit</button>  
                                    </div>
                              </div>
                              <!--Profile Edit Colse-->


                              <!-- End of Modal Content-->

                        </div>

                  </dialog>

                  <!--Post Do Modal--> 


                  <!-- component -->


                  <!-- This is an example component -->
                  <div class="w-full rounded-lg ">

                        <!-- Main modal -->
                        <div id="authentication-modal" aria-hidden="true" class="hidden overflow-x-hidden overflow-y-auto fixed  md:h-full top-4 left-0 right-0 md:inset-0 z-50 justify-center items-center">
                              <div class="relative w-full px-4 h-screen">
                                    <!-- Modal content -->
                                    <div class="bg-white rounded-md rounded-lg shadow relative dark:bg-gray-700 ">
                                          <div class="flex justify-end p-4">
                                                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white" data-modal-toggle="authentication-modal">
                                                      <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                                                </button>
                                          </div>
                                          <form method="POST" action="addPostServlet" id="add_post_form" enctype="multipart/form-data">
                                                <!--Categories-->                                             
                                                <div class="mb-3l mx-4">
                                                      <select name="cid" class="form-select appearance-none w-full py-1.5 text-base font-normal  text-gray-700 bg-white bg-clip-padding bg-no-repeat border border-solid border-gray-300  rounded  transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" aria-label="Default select example">
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

                                                <div class="mb-4 mx-4">
                                                      <label class="text-xl text-gray-600">Title <span class="text-red-500">*</span></label></br>
                                                      <input type="text" class="border-2 border-gray-300 px-4 p-2 w-full rounded-lg" name="title" id="title" value="" required>
                                                </div>
                                                <div class="mb-4 mx-4">
                                                      <label class="text-xl text-gray-600">Description</label></br>
                                                      <input type="text" class="border-2 border-gray-300 px-4 p-2 w-full rounded-lg" name="description" id="description" placeholder="(Optional)">
                                                </div>
                                                <div class="mb-8 rounded-lg mx-4">
                                                      <label class="text-xl text-gray-600 rounded-lg">Content <span class="text-red-500">*</span></label></br>
                                                      <textarea class="rounded-lg" cols="80" id="editor1" name="editor1" rows="10" ></textarea>
                                                </div>
                                                <fieldset class="w-full dark:text-gray-100 mx-4">
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
                  </div>

                  <script src="https://unpkg.com/@themesberg/flowbite@1.2.0/dist/flowbite.bundle.js"></script>

                  <div class="block sm:hidden bg-white">
                        <a
                              href="#"
                              class="block md:hidden text-base  font-bold uppercase text-center flex justify-center items-center"
                              @click="open = !open" >
                              Topics <i :class="open ? 'fa-chevron-down': 'fa-chevron-up'" class="fas ml-2"></i>
                        </a>
                  </div>
                  <div :class="open ? 'block': 'hidden'" class="bg-white w-full flex-grow sm:flex sm:items-center sm:w-auto">
                        <div class="w-full container mx-auto bg-white flex flex-col sm:flex-row items-center justify-center text-sm font-bold uppercase mt-0 px-6 py-2">
                              <%PostDao post = new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Category> cat = post.getAllCategories();

                                    for (Category ele : cat) {
                              %>
                              <a href="#" onclick="getPosts(<%=ele.getCid()%>, this)" class="hover:bg-gray-400 rounded py-2 px-4 mx-2">
                                    <%=ele.getName()%>
                              </a>
                              <%                                                }
                              %>
                        </div>
                  </div>
            </nav>
            <div class="container mx-auto flex flex-wrap py-6">
                  <!-- Post Section -->
                  <section class="w-full md:w-2/3 flex flex-col items-center px-3  rounded-lg">
                        <article class="flex flex-col shadow my-4">
                              <!-- Article Image -->
                              <a href="#" class="hover:opacity-75  rounded-lg">
                                    <img class="rounded-lg"  src="https://source.unsplash.com/collection/1346951/1000x500?sig=1">
                              </a>
                              <div class="bg-white flex flex-col justify-start p-6">
                                    <a href="#" class="text-blue-700 text-sm font-bold uppercase pb-4">Technology</a>
                                    <div class="text-center flex space-x-4 mb-8 ">
                                          <a href="#" class=" inline-flex items-center py-2 px-3 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                                <i class="fa-solid fa-comment "> <span>10</span></i>
                                          </a>
                                          <%
                                                LikeDao ldo = new LikeDao(ConnectionProvider.getConnection());
                                          %>
                                          <a href="#" onclick="doLike(<%=d.getPid()%>, <%=User.getId()%>)" class="inline-flex items-center py-2 px-3 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                                <i class="fa-sharp fa-solid fa-thumbs-up "> <span class="like-counter"> <%=ldo.countLikeOnPost(d.getPid())%></span></i>
                                          </a>
                                    </div>
                                    <a href="#" class="text-3xl font-bold hover:text-gray-700 pb-4">  <%=d.getpTitle()%></a>
                                    <p href="#" class="text-sm pb-8">
                                          By <a href="#" class="font-semibold hover:text-gray-800"> <%= ud.getUserByUserId(d.getUserId()).getFirst_name()%>&nbsp;<%= ud.getUserByUserId(d.getUserId()).getLast_name()%></a>, Published on <%=DateFormat.getDateTimeInstance().format(d.getpDate())%>
                                    </p>
                                    <%=d.getpContent()%>
                              </div>
                        </article>
                        <div class="w-full flex pt-6">
                              <a href="#" class="w-1/2 bg-white shadow hover:shadow-md text-left p-6">
                                    <p class="text-lg text-blue-800 font-bold flex items-center"><i class="fas fa-arrow-left pr-1"></i> Previous</p>
                                    <p class="pt-2">Lorem Ipsum Dolor Sit Amet Dolor Sit Amet</p>
                              </a>
                              <a href="#" class="w-1/2 bg-white shadow hover:shadow-md text-right p-6">
                                    <p class="text-lg text-blue-800 font-bold flex items-center justify-end">Next <i class="fas fa-arrow-right pl-1"></i></p>
                                    <p class="pt-2">Lorem Ipsum Dolor Sit Amet Dolor Sit Amet</p>
                              </a>
                        </div>
                        <div class="w-full flex flex-col text-center md:text-left md:flex-row shadow bg-white mt-10 mb-10 p-6">
                              <div class="w-full md:w-1/5 flex justify-center md:justify-start pb-4">
                                    <img src="profile/<%= User.getProfile()%>" class="rounded-full shadow h-32 w-32">
                              </div>
                              <div class="flex-1 flex flex-col justify-center md:justify-start">


                                    <p class="font-semibold text-2xl">  <%= ud.getUserByUserId(d.getUserId()).getFirst_name()%>&nbsp;<%= ud.getUserByUserId(d.getUserId()).getLast_name()%> </p>
                                    <p class="pt-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vel neque non libero suscipit suscipit eu eu urna.</p>
                                    <div class="flex items-center justify-center md:justify-start text-2xl no-underline text-blue-800 pt-4">
                                          <a class="" href="#">
                                                <i class="fab fa-facebook"></i>
                                          </a>
                                          <a class="pl-4" href="#">
                                                <i class="fab fa-instagram"></i>
                                          </a>
                                          <a class="pl-4" href="#">
                                                <i class="fab fa-twitter"></i>
                                          </a>
                                          <a class="pl-4" href="#">
                                                <i class="fab fa-linkedin"></i>
                                          </a>
                                    </div>   
                              </div>
                        </div>
                  </section>
                  <!-- Sidebar Section -->
                  <aside class="w-full md:w-1/3 flex flex-col items-center px-3">
                        <div class="w-full bg-white shadow flex flex-col my-4 p-6">
                              <p class="text-xl font-semibold pb-5">About Us</p>
                              <p class="pb-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas mattis est eu odio sagittis tristique. Vestibulum ut finibus leo. In hac habitasse platea dictumst.</p>
                              <a href="#" class="w-full bg-blue-800 text-white font-bold text-sm uppercase rounded hover:bg-blue-700 flex items-center justify-center px-2 py-3 mt-4">
                                    Get to know us
                              </a>
                        </div>
                        <div class="w-full bg-white shadow flex flex-col my-4 p-6">
                              <p class="text-xl font-semibold pb-5">Instagram</p>
                              <div class="grid grid-cols-3 gap-3">
                                    <img class="hover:opacity-75" src="https://source.unsplash.com/collection/1346951/150x150?sig=1">
                                    <img class="hover:opacity-75" src="https://source.unsplash.com/collection/1346951/150x150?sig=2">
                                    <img class="hover:opacity-75" src="https://source.unsplash.com/collection/1346951/150x150?sig=3">
                                    <img class="hover:opacity-75" src="https://source.unsplash.com/collection/1346951/150x150?sig=4">
                                    <img class="hover:opacity-75" src="https://source.unsplash.com/collection/1346951/150x150?sig=5">
                                    <img class="hover:opacity-75" src="https://source.unsplash.com/collection/1346951/150x150?sig=6">
                                    <img class="hover:opacity-75" src="https://source.unsplash.com/collection/1346951/150x150?sig=7">
                                    <img class="hover:opacity-75" src="https://source.unsplash.com/collection/1346951/150x150?sig=8">
                                    <img class="hover:opacity-75" src="https://source.unsplash.com/collection/1346951/150x150?sig=9">
                              </div>
                              <a href="#" class="w-full bg-blue-800 text-white font-bold text-sm uppercase rounded hover:bg-blue-700 flex items-center justify-center px-2 py-3 mt-6">
                                    <i class="fab fa-instagram mr-2"></i> Follow @dgrzyb
                              </a>
                        </div>
                        <!-- AddToAny BEGIN -->
                        <div class="a2a_kit a2a_kit_size_32 a2a_default_style">
                              <a class="a2a_dd" href="https://www.addtoany.com/share"></a>
                              <a class="a2a_button_facebook"></a>
                              <a class="a2a_button_twitter"></a>
                              <a class="a2a_button_email"></a>
                        </div>
                        <script async src="https://static.addtoany.com/menu/page.js"></script>
                        <!-- AddToAny END -->
                        <iframe src="https://www.powr.io/comments/u/070fd2a0_1665698172#platform=iframe" style="width:100%;" height="700px" frameborder="0"></iframe>
                  </aside>
            </div>

            <footer class="w-full border-t bg-white pb-12">
                  <div class="relative w-full flex items-center invisible md:visible md:pb-12" x-data="getCarouselData()" >
                        <button
                              class="absolute bg-blue-800 hover:bg-blue-700 text-white text-2xl font-bold hover:shadow rounded-full w-16 h-16 ml-12"
                              x-on:click="decrement()">
                              &#8592;
                        </button>
                        <template x-for="image in images.slice(currentIndex, currentIndex + 6)" :key="images.indexOf(image)">
                              <img class="w-1/6 hover:opacity-75" :src="image">
                        </template>
                        <button
                              class="absolute right-0 bg-blue-800 hover:bg-blue-700 text-white text-2xl font-bold hover:shadow rounded-full w-16 h-16 mr-12"
                              x-on:click="increment()">
                              &#8594;
                        </button>
                  </div>
                  <%@include file="footer.jsp" %>
            </footer>
            <script>
                                                function getCarouselData() {
                                                      return {
                                                            currentIndex: 0,
                                                            images: [
                                                                  'https://source.unsplash.com/collection/1346951/800x800?sig=1',
                                                                  'https://source.unsplash.com/collection/1346951/800x800?sig=2',
                                                                  'https://source.unsplash.com/collection/1346951/800x800?sig=3',
                                                                  'https://source.unsplash.com/collection/1346951/800x800?sig=4',
                                                                  'https://source.unsplash.com/collection/1346951/800x800?sig=5',
                                                                  'https://source.unsplash.com/collection/1346951/800x800?sig=6',
                                                                  'https://source.unsplash.com/collection/1346951/800x800?sig=7',
                                                                  'https://source.unsplash.com/collection/1346951/800x800?sig=8',
                                                                  'https://source.unsplash.com/collection/1346951/800x800?sig=9',
                                                            ],
                                                            increment() {
                                                                  this.currentIndex = this.currentIndex === this.images.length - 6 ? 0 : this.currentIndex + 1;
                                                            },
                                                            decrement() {
                                                                  this.currentIndex = this.currentIndex === this.images.length - 6 ? 0 : this.currentIndex - 1;
                                                            },
                                                      }
                                                }
            </script>


            <!--JavaScript Code Here-->
            <script src="https://cdn.tailwindcss.com"></script>
            <!--<script src="https://unpkg.com/@material-tailwind/html@latest/scripts/ripple.js"></script>-->
            <!--<script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>-->
            <!--<script src="https://unpkg.com/@material-tailwind/html@latest/scripts/script-name.js"></script>-->
            <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="javaScript/myJavaScript.js" type="text/javascript"></script>
            <script src="javaScript/script.js" type="text/javascript"></script>
            <script>
                                                $(document).ready(function () {
                                                      let editStatus = false;
                                                      $('#edit_profile_btn ').click(function () {
                                                            if (editStatus === false) {
                                                                  $('#profile_details').hide();
                                                                  $('#profile_edit').show();
                                                                  editStatus = true;
                                                                  $(this).text("Back");
                                                            } else {
                                                                  $('#profile_details').show();
                                                                  $('#profile_edit').hide();
                                                                  editStatus = false;
                                                                  $(this).text("Edit");
                                                            }
                                                      });

                                                });

            </script>

            <!--Now Add Post Js--> 

            <script>
                  $(document).ready(function (e) {
                        $("#add_post_form").on("submit", function (event) {
                              //this code gets called when form is submitted
                              event.preventDefault();
                              let form = new FormData(this);
                              // Now Request to server
                              $.ajax({
                                    url: "addPostServlet",
                                    type: 'POST',
                                    data: form,
                                    success: function (data, textStatus, jqXHR) {
                                          console.log(data);
                                          if (data.trim() == 'done') {
                                                swal("Good job!", "Post Saved Successfully", "success");

                                          } else {
                                                swal("Erro!!", "Something Went Wrong Try Again!", "error");
                                          }
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                          swal("Erro!!", "Something Went Wrong Try Again!", "error");
                                    },
                                    processData: false,
                                    contentType: false
                              });
                        });
                  });
            </script>
            <!--CkEDitor--> 
            <script>
                  CKEDITOR.replace('editor1', {
                        height: 400,
                        baseFloatZIndex: 10005,
                        removePlugins: 'exportpdf'
                  });
            </script>

            <!--Post Loding Code--> 

            <script>
                  function getPosts(catId, temp) {
                        $('#loader').show();
                        $('#post_container').hide();
                        $('c-link').removeClass('bg-blue-700');

                        $.ajax({
                              url: "load_posts.jsp",
                              data: {cid: catId},
                              success: function (data, textStatus, jqXHR) {
                                    $('#loader').hide();
                                    $('#post_container').show();
                                    $('#post_container').html(data);
                                    $('temp').addClass('bg-blue-700');
                              }
                        })
                  }
                  $(document).ready(function () {
                        getPosts(0)
                  })

            </script>
            <script src="javaScript/myJavaScript.js" type="text/javascript"></script>
            <!--JavaScript Code End Here-->
      </body>
</html>