<%-- 
    Document   : registration
    Created on : Oct 8, 2022, 3:43:10 PM
    Author     : kausar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="https://unpkg.com/@material-tailwind/html@latest/styles/material-tailwind.css" rel="stylesheet"/>
            <!--<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">-->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
                  integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
                  crossorigin="anonymous" referrerpolicy="no-referrer" />
            <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
            <title>Registration</title>
      </head>
      <%@include file="navbar.jsp" %>
      <!-- component -->
      <body class="font-mono">
            <!-- Container -->
            <div class="container mx-auto">
                  <div class="flex justify-center px-6 my-6">
                        <!-- Row -->
                        <div class="w-full xl:w-3/4 lg:w-11/12 flex">
                              <!-- Col -->
                              <div
                                    class="w-full h-auto c hidden mb-2 lg:block lg:w-8/12 bg-cover rounded-l-lg"
                                    style="background-image: url('img/sign.webp')"
                                    ></div>
                              <!-- Col -->
                              <div class="w-full lg:w-7/12 bg-white p-2 rounded-lg lg:rounded-l-none">
                                    <h3 class="pt-4 text-2xl text-center">Create an Account!</h3>
                                    <form class="px-2 lg:px-8 pt-4 pb-2 lg:pb-4 mb-2 bg-white rounded" action="register" method="post" id="reg">
                                          <div class="mb-2  md:flex md:justify-between">
                                                <div class="mb-2 lg:mb-3 md:mr-2 md:mb-0">
                                                      <label class="block mb-2 text-sm font-bold text-gray-700" for="firstName">
                                                            First Name
                                                      </label>
                                                      <input
                                                            class="w-full px-3 py-2 text-sm leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline"
                                                            id="firstName"
                                                            type="text"
                                                            name="first_name"
                                                            placeholder="First Name"
                                                            />
                                                </div>
                                                <div class="md:ml-2">
                                                      <label class="block mb-2 text-sm font-bold text-gray-700" for="lastName">
                                                            Last Name
                                                      </label>
                                                      <input
                                                            class="w-full px-3 py-2 text-sm leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline"
                                                            id="lastName"
                                                            type="text"
                                                            name="last_name"
                                                            placeholder="Last Name"
                                                            />
                                                </div>
                                          </div>
                                          <div>
                                                <label class="block mb-2 text-sm font-bold text-gray-700" for="email">
                                                      Email
                                                </label>
                                                <input
                                                      class="w-full px-3 py-2 mb-2  text-sm leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline"
                                                      id="email"
                                                      type="email"
                                                      name="email"
                                                      placeholder="Email"
                                                      />
                                          </div>
                                          <div class="mb-4 md:flex md:justify-between">
                                                <div class="mb-2 md:mr-2 md:mb-0">
                                                      <label class="block mb-2 text-sm font-bold text-gray-700" for="password">
                                                            Password
                                                      </label>
                                                      <input
                                                            class="w-full px-3 py-2 mb-2  text-sm leading-tight text-gray-700 border border-red-500 rounded shadow appearance-none focus:outline-none focus:shadow-outline"
                                                            id="password"
                                                            type="password"
                                                            name="password"
                                                            placeholder="******************"
                                                            />
                                                      <p class="text-sm italic text-red-500">Choose a password.</p>
                                                </div>
                                                <div class="md:ml-2">
                                                      <label class="block mb-2 text-sm font-bold text-gray-700" for="c_password">
                                                            Confirm Password
                                                      </label>
                                                      <input
                                                            class="w-full px-3 py-2 mb-2 text-sm leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline"
                                                            id="c_password"
                                                            type="password"
                                                            name="con_pass"
                                                            placeholder="******************"
                                                            />
                                                </div>
                                          </div> <div class="flex items-center">
                                                <input id="link-checkbox" name="check" type="checkbox" value="ok" class="w-4 h-4 mb-2 text-blue-600 bg-gray-100 rounded border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                                                <label for="link-checkbox" class="ml-2  text-sm font-medium text-gray-900 dark:text-gray-300">I agree with the <a href="#" class="text-blue-600 dark:text-blue-500 hover:underline">terms and conditions</a>.</label>
                                          </div>
                                          <div class="flex justify-center mb-2" style="display: none;" id="loder" > 
                                                <div class=" w-16 h-16 border-4 border-dashed rounded-full animate-spin border-green-600" ></div>
                                          </div>
                                          <div class=" mb-2  text-center">
                                                <button class="w-full px-4 py-2 font-bold text-white bg-green-600 rounded-full hover:bg-green-900 focus:outline-none focus:shadow-outline" type="submit" id="submit_btn" >
                                                      Register Account
                                                </button>
                                          </div>
                                          <hr class="mb-2  border-t" />
                                          <div class="text-center">
                                                <a class="inline-block text-sm text-blue-500 align-baseline hover:text-blue-800" href="#" >
                                                      Forgot Password?
                                                </a>
                                          </div>
                                          <div class="text-center">
                                                <a
                                                      class="inline-block text-sm text-blue-500 align-baseline hover:text-blue-800"
                                                      href="login.jsp"
                                                      >
                                                      Already have an account? Login!
                                                </a>
                                          </div>
                                    </form>
                              </div>
                        </div>
                  </div>
            </div>
            <%@include file="footer.jsp" %>
            <!--JavaScript .....Code-->
            <script src="https://cdn.tailwindcss.com"></script>
            <script src="https://unpkg.com/@material-tailwind/html@latest/scripts/ripple.js"></script>
            <script src="https://unpkg.com/@material-tailwind/html@latest/scripts/script-name.js"></script>
            <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
            <script src="javaScript/myJavaScript.js" type="text/javascript"></script>
            <script src="javaScript/script.js" type="text/javascript"></script>
            <script>
                  $(document).ready(function () {
                        $('#reg').on('submit', function (event) {
                              event.preventDefault(); // for to go to servlet
                              $("#submit_btn").hide();
                              $("#loder").show();
                              let form = new FormData(this);
                              // Send data to the servlet by the help of ajax function..........
                              $.ajax({
                                    url: "register",
                                    type: 'POST',
                                    data: form,
                                    success: function (data, textStatus, jqXHR) {
                                          console.log(data);
                                          $("#submit_btn").show();
                                          $("#loder").hide();
                                          if(data.trim()==='done'){
                                          swal("Registered Successfully Redirect To Login Page .")
                                                  .then((value) => {
                                                      window.location="login.jsp";
                                                  });
                                            }else{
                                                  swal(data);
                                            }
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                          console.log(jqXHR);
                                          $("#submit_btn").show();
                                          $("#loder").hide();
                                    },
                                    processData: false,
                                    contentType: false
                              });
                        });

                  });
            </script>
      </body>
</html>
