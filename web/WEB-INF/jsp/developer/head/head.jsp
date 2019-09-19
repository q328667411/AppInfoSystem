<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>

</head>
<div class="col-md-3 left_col menu_fixed">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="/dev/list" class="site_title"><i class="fa fa-paw"></i> <span>APP
								BMS</span>
            </a>
        </div>

        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        <div class="profile">
            <div class="profile_pic">
                <img
                        src="${pageContext.request.contextPath }/statics/images/img.jpg"
                        alt="..." class="img-circle profile_img">
            </div>
            <div class="profile_info">
                <span>Welcome,</span>
                <h2>test001</h2>
            </div>
        </div>
        <!-- /menu profile quick info -->

        <br />

        <!-- sidebar menu -->
        <div id="sidebar-menu"
             class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <h3>${devUser.devName}</h3>
                <ul class="nav side-menu">
                    <li><a><i class="fa fa-home"></i> APP账户管理 <span
                            class="fa fa-chevron-down"></span>
                    </a>
                        <ul class="nav child_menu">
                            <li><a href="javascript:;">APP开发者账户申请</a>
                            </li>
                            <li><a href="javascript:;">个人账户信息维护</a>
                            </li>
                        </ul></li>
                    <li><a><i class="fa fa-edit"></i> APP应用管理<span
                            class="fa fa-chevron-down"></span>
                    </a>
                        <ul class="nav child_menu">
                            <li><a href="/dev/list">APP维护</a>
                            </li>
                        </ul></li>
                </ul>
            </div>


        </div>
        <!-- /sidebar menu -->

        <!-- /menu footer buttons -->
        <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a> <a data-toggle="tooltip" data-placement="top" title="FullScreen">
            <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
        </a> <a data-toggle="tooltip" data-placement="top" title="Lock"> <span
                class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
        </a> <a data-toggle="tooltip" data-placement="top" title="Logout"
                href="/dev/exit"> <span
                class="glyphicon glyphicon-off" aria-hidden="true"></span> </a>
        </div>
        <!-- /menu footer buttons -->
    </div>
</div>

<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i>
                </a>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <li class=""><a href="javascript:;"
                                class="user-profile dropdown-toggle" data-toggle="dropdown"
                                aria-expanded="false"> <img
                        src="${pageContext.request.contextPath }/statics/images/img.jpg"
                        alt="">${devUser.devCode}<span
                        class=" fa fa-angle-down"></span> </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                        <li><a
                                href="/dev/exit"><i
                                class="fa fa-sign-out pull-right"></i> Log Out</a>
                        </li>
                    </ul></li>

                <li role="presentation" class="dropdown">

                    <ul id="menu1" class="dropdown-menu list-unstyled msg_list"
                        role="menu">
                        <li><a> <span class="image"><img
                                src="${pageContext.request.contextPath }/statics/images/img.jpg"
                                alt="Profile Image" />
                            </span> <span> <span>John Smith</span> <span class="time">3
                                        mins ago</span> </span> <span class="message"> Film festivals used
                                    to be do-or-die moments for movie makers. They were where...
                            </span> </a></li>
                        <li><a> <span class="image"><img
                                src="${pageContext.request.contextPath }/statics/images/img.jpg"
                                alt="Profile Image" />
                            </span> <span> <span>John Smith</span> <span class="time">3
                                        mins ago</span> </span> <span class="message"> Film festivals used
                                    to be do-or-die moments for movie makers. They were where...
                            </span> </a></li>
                        <li><a> <span class="image"><img
                                src="${pageContext.request.contextPath }/statics/images/img.jpg"
                                alt="Profile Image" />
                            </span> <span> <span>John Smith</span> <span class="time">3
                                        mins ago</span> </span> <span class="message"> Film festivals used
                                    to be do-or-die moments for movie makers. They were where...
                            </span> </a></li>
                        <li><a> <span class="image"><img
                                src="${pageContext.request.contextPath }/statics/images/img.jpg"
                                alt="Profile Image" />
                            </span> <span> <span>John Smith</span> <span class="time">3
                                        mins ago</span> </span> <span class="message"> Film festivals used
                                    to be do-or-die moments for movie makers. They were where...
                            </span> </a></li>
                        <li>
                            <div class="text-center">
                                <a> <strong>See All Alerts</strong> <i
                                        class="fa fa-angle-right"></i> </a>
                            </div></li>
                    </ul></li>
            </ul>
        </nav>
    </div>
</div>

<!-- /top navigation -->