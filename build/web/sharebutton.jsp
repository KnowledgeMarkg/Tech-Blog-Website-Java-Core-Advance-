<%-- 
    Document   : sharebutton
    Created on : Oct 9, 2022, 3:14:40 AM
    Author     : kausar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

      <head>
            <meta charset="UTF-8" />
            <title>Sticky Share Buttons</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <meta http-equiv="X-UA-Compatible" content="ie=edge" />
            <link href="Css/myCss.css" rel="stylesheet" type="text/css"/>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      </head>

      <body>
            <div class="sticky_share_btn ">
                  <div class="fixed_share">
                        <ul class="listing">
                              <li class="facebook">
                                    <a href="https://www.facebook.com/stackfindover" target="_blank">
                                          <i class="fa fa-facebook-square"></i>
                                    </a>
                              </li>
                              <li class="twitter">
                                    <a href="https://twitter.com/stackfindover" target="_blank">
                                          <i class="fa fa-twitter"></i>
                                    </a>
                              </li>
                              <li class="pinterest">
                                    <a href="https://in.pinterest.com/stackfindover/" target="_blank">
                                          <i class="fa fa-pinterest"></i>
                                    </a>
                              </li>
                              <li class="linkedin">
                                    <a href="https://www.linkedin.com/in/stackfindover/" target="_blank">
                                          <i class="fa fa-linkedin-square"></i>
                                    </a>
                              </li>
                              <li class="linkedin">
                                    <a href="http://blogs.stackfindover.com/" target="_blank">
                                          <i class="fa fa-globe"></i>
                                    </a>
                              </li>

                              <li class="whatsapp">
                                    <a href="https://dev.to/stackfindover" target="_blank">
                                          <i class="fa fa-whatsapp"></i>
                                    </a>
                              </li>
                        </ul>
                        <span class="share-toggle">
                              <i class="fa fa-share-alt"></i>
                        </span>
                  </div>
            </div>
            <script>
                  jQuery(".sticky_share_btn").click(function () {
                        jQuery(".listing").fadeToggle(600);
                  });
            </script>
      </body>
</html>
