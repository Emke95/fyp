<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Friends</title>

    <!-- Bootstrap core CSS -->
    <link href="resources/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="resources/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="resources/assets/js/fancybox/jquery.fancybox.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        
    <!-- Custom styles for this template -->
    <link href="resources/assets/css/style.css" rel="stylesheet">
    <link href="resources/assets/css/style-responsive.css" rel="stylesheet">
    <script src="resources/assets/js/jquery.js"></script>
    <script src="resources/assets/js/custom/search.js"></script>

  </head>

  <body>

  <section id="container" >
      <!--TOP BAR CONTENT & NOTIFICATIONS -->
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa-white fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="index.html" class="logo"><b>TW</b></a>
            <!--logo end-->
            <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
                <ul class="nav top-menu">
                    <!-- settings start -->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                            <i class="fa-white fa-th-list"></i>
                            <span class="badge bg-theme">${notificationCount}</span>
                        </a>
                        <ul class="dropdown-menu extended tasks-bar">
                            <div class="notify-arrow notify-arrow-green"></div>
                            <li>
                                <p class="green">You have ${notificationCount} notifications</p>
                            </li>
                            
                            <#list notificationList as notification>
	                            <li>
	                                <a href="post?postId=${notification.posts.postId}">
	                                    <div class="task-info">
	                                        <div class="desc">${notification.notification}</div>
	                                    </div>
	                                </a>
	                            </li>
                            </#list>
                            <li class="external">
                                <a href="#">See All Tasks</a>
                            </li>
                        </ul>
                    </li>
                    <!-- settings end -->
                    <!-- inbox dropdown start-->
                    <li id="header_inbox_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                            <i class="fa-white fa-envelope-o"></i>
                            <span class="badge bg-theme">${messageCount}</span>
                        </a>
                        <ul class="dropdown-menu extended inbox">
                            <div class="notify-arrow notify-arrow-green"></div>
                            <li>
                                <p class="green">You have ${messageCount} new messages</p>
                            </li>
                            
							<#list messageList as person>   
	                            <li>
	                                <a href="getMessage?personId=${person.pId}">
	                                    <div class="task-info">
	                                        <div class="desc">${person.firstName} ${person.lastName}</div>
	                                    </div>
	                                </a>
	                            </li>
	                        </#list>
                            
                            
                            <li>
                                <a href="index.html#">See all messages</a>
                            </li>
                        </ul>
                    </li>
                    <!-- inbox dropdown end -->
                    <!-- Search Bar -->
                    <li>
                    <div class="pull-left">
                	  <form class="form-inline"  role="form">
                          <div class="form-group">
                              <input type="text" style="width:500px;" class="form-control" id="search" placeholder="Search">
                          </div>
                          <button type="submit" class="btn btn-theme">Search</button>
                      </form>
          			</div><!-- /form-panel -->
          			</li>
                </ul>
                <!--  notification end -->	
                
                
            </div>
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="logout">Logout</a></li>
            	</ul>
            </div>
        </header>
      <!--header end-->
      
      <!-- 
      MAIN SIDEBAR MENU
       -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="profile?personId=${user.person.pId}"><img src="${user.person.profilePicPath}" class="img-circle" width="60" />
              	  <h5 class="centered">${user.person.firstName} ${user.person.lastName}</h5></a></p>
              	  	
                  <li class="mt">
                      <a href="index">
                          <i class="fa fa-stack-exchange"></i>
                          <span>Home</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-child"></i>
                          <span>Friends</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="friends">Friends</a></li>
                          <li><a  href="friendRequests">Friend Requests</a></li>
                          <li class="active"><a  href="pendingRequests">Pending Requests</a></li>
                      </ul>
                  </li>

				<li class="sub-menu">
                      <a href="inbox" >
                          <i class="fa fa-calendar"></i>
                          <span>Inbox</span>
                      </a>
                  </li>   
                  

              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      <!-- 
      MAIN CONTENT
       -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper site-min-height">
            <div class="row">
              <div class="col-lg-9" id="searchArea">
          	<#if personList ??>
              <#list personList as person>
              <div class="row mtpost">
                <div class="form-panel">
                  <form:form method="GET" action="profile">
                        <h3><i class="fa fa-angle-right"></i> 
                        <#if person.profilePicPath??><img src="${person.profilePicPath}" width=150 height=150 class="img-circle" />
                        <#else><img src="" width=150 height=150 class="img-circle" /></#if>
                        ${person.firstName} ${person.lastName}
                        <button type="submit" disabled class="pull-right btn btn-danger btn-sm">Friend Request Sent</button></h3>
                        <input type="hidden" name="personId" value="${person.pId}" />
                  </form:form>
                </div>
              </div>
              </#list>
              <#else></#if>

        <!--<div class="row mtpost">
                    <div class="form-panel">
                      <h4>Keep Calm and Share On....</h4>
                      <form class="form-horizontal tasi-form" role="form">
                          <div class="form-group">
                              <textarea class="form-control form-post" id="status" placeholder="Interest your buddies"></textarea>
                          </div>
                          <button type="submit" class="btn btn-theme">Spread it!</button>
                      </form>
                    </div>
                  </div>-->
      </div>
			<!-- RIGHT SIDEBAR CONTENT -->                  
                  
                  <div class="col-lg-3 ds">
                    <!--COMPLETED ACTIONS DONUTS CHART-->
            
                       <!-- USERS ONLINE SECTION -->
            <h3>Friends Online</h3>
                      
                  </div><!-- /col-lg-3 -->
              </div><! --/row -->

      <!--main content end-->
  </section>
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              2018 - Travel Wise              <a href="blank.html#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="resources/assets/js/jquery.js"></script>
    <script src="resources/assets/js/bootstrap.min.js"></script>
    <script src="resources/assets/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="resources/assets/js/jquery.ui.touch-punch.min.js"></script>
    <script class="include" type="text/javascript" src="resources/assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="resources/assets/js/jquery.scrollTo.min.js"></script>
    <script src="resources/assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="resources/assets/js/fancybox/jquery.fancybox.js"></script>    


    <!--common script for all pages-->
    <script src="resources/assets/js/common-scripts.js"></script>

    <!--script for this page-->
  
  <script type="text/javascript">
      $(function() {
        //    fancybox
          jQuery(".fancybox").fancybox();
      });
    </script>
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>
