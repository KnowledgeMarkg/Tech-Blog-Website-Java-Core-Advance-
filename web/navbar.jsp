<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                  <a href="contactUS.jsp" class="text-xl px-4 lg:inline-flex lg:w-auto w-full px-3 py-2 rounded text-white-400 items-center justify-center hover:bg-gray-900 hover:text-white"">Contact</a>
                  <a href="registration.jsp" class="text-xl  lg:mx-4 my-2  px-4 lg:inline-flex lg:w-auto w-full px-3 py-2 rounded text-white-400 items-center justify-center hover:bg-gray-900 hover:text-white text-xl px-4 bg-green-600 py-2 text-white hover:bg-green-800">Sign Up</a>
                  <a href="login.jsp" class="text-xl  px-4 lg:inline-flex lg:w-auto w-full px-3 py-2 rounded text-white-400 items-center justify-center hover:bg-gray-900 hover:text-white text-xl px-4 bg-green-600 py-2 text-white hover:bg-green-800">Login</a>
            </div>
      </div>
</nav>