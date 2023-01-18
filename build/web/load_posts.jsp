<%@page import="com.tech.blog.entities.user"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post" %>
<%@page import="java.util.List" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%
      user User = (user) session.getAttribute("currentUser");
      if (User == null) {
            response.sendRedirect("login.jsp");
      }
%>
<section class="pt-4 lg:pt-[100px] pb-4 lg:pb-10">
      <div class="container">

            <div class="flex flex-wrap justify-center -mx-4 ">
                  <div class="w-full px-4">
                        <div class="text-center mx-auto mb-[40px] lg:mb-8 max-w-[510px] ">
                              <h2 class=" text-3xl sm:text-4xl md:text-[40px] text-green-600 font-bold mb-4">
                                    Our Recent Blogs
                              </h2>
                        </div>
                  </div>
            </div>
            <div class="flex flex-wrap -mx-4">

                  <% PostDao d = new PostDao(ConnectionProvider.getConnection());
                        int cid = Integer.parseInt(request.getParameter("cid"));
                        List<Post> posts = null;
                        if (cid == 0) {
                              posts = d.getAllPosts();
                        } else {
                              posts = d.getPostByCatId(cid);
                        }

                        if (posts.size() == 0) {
                              out.println("<h2 class='font-medium leading-tight text-4xl mt-0 mb-2 text-blue-600 text-center mx-auto'>No Post Availabe On this Category</h2>");

                              return;
                        }
                        for (Post p : posts) {
                  %>
                  <div class="w-full md:w-1/2 lg:w-1/3 px-4 gap-1 min-h-fit">
                        <div class="max-w-[370px] mx-auto mb-10 bg-white rounded-lg min-h-fit ">
                              <div class="rounded overflow-hidden mb-8">
                                    <img src="blog_pic/<%= p.getpPic()%>"
                                         alt="image" class="object-fill w-full rounded-lg rounded-b-none md:h-56" />
                              </div>
                              <div>
                                    <span
                                          class="bg-green-600 rounded inline-block text-center py-1 px-4 text-xs leading-loose font-semibold text-white mb-4">
                                          <%= p.getpDate()%>
                                    </span>
                                    <h3>
                                          <a href="javascript:void(0)"
                                             class="font-semibold text-xl sm:text-2xl lg:text-xl xl:text-2xl mb-4 inline-block text-dark hover:text-primary">
                                                <%= p.getpTitle().trim()%>
                                          </a>
                                    </h3>
                                    <p class="text-base text-body-color mb-4">
                                          <%= p.getpDescription().trim()%>
                                    </p>
                              </div>
                              <hr class="border-gray-300" />

                              <div class="text-center">
                                    <%
                                          LikeDao ldo =new LikeDao(ConnectionProvider.getConnection());
                                    %>
                                    <a href="#" class="inline-flex items-center py-2 px-3 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                          <i class="fa-solid fa-comment "> <span>10</span></i>
                                    </a>
                                    <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="inline-flex items-center py-2 px-3 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                          Read more
                                          <svg aria-hidden="true" class="ml-2 -mr-1 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                                    </a>
                                    <a href="#" onclick="doLike(<%=p.getPid()%>, <%=User.getId()%>)" class="inline-flex items-center py-2 px-3 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                          <i class="fa-sharp fa-solid fa-thumbs-up "> <span class="like-counter"><%=ldo.countLikeOnPost(p.getPid()) %></span></i>
                                    </a>
                              </div>
                        </div>

                  </div>
                  <% }%>
            </div>
      </div>
</section>