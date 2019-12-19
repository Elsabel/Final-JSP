<%-- 
    Document   : sidebar
    Created on : Dec 18, 2019, 11:45:05 AM
    Author     : Rizky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar" data-sidebarbg="skin5">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav" class="p-t-30">
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" 
                            href="index.jsp" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i>
                            <span class="hide-menu">Dashboard</span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" 
                            href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-receipt"></i>
                            <span class="hide-menu">Management Data </span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="employeeServlet?action=list" class="sidebar-link">
                                        <i class="far fa-address-card"></i><span class="hide-menu"> Employee </span></a>
                                </li>
                                <li class="sidebar-item"><a href="departmentServlet?action=list" class="sidebar-link">
                                       <i class="far fa-building"></i><span class="hide-menu"> Department </span></a>
                                </li>
                                <li class="sidebar-item"><a href="locationServlet?action=list" class="sidebar-link">
                                      <i class="fas fa-map"></i><span class="hide-menu"> Location </span></a>
                                </li>
                                <li class="sidebar-item"><a href="countryServlet?action=list" class="sidebar-link">
                                       <i class="fas fa-globe"></i><span class="hide-menu"> Country </span></a>
                                </li>
                                <li class="sidebar-item"><a href="jobServlet?action=list" class="sidebar-link">
                                      <i class="fas fa-briefcase"></i><span class="hide-menu"> Job </span></a>
                                </li>
                                <li class="sidebar-item"><a href="regionServlet?action=list" class="sidebar-link">
                                    <i class="far fa-compass"></i><span class="hide-menu"> Region </span></a>
                                </li>
                            </ul>
                        </li>
                        
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" 
                            href="login.jsp" aria-expanded="false"><i class="fas fa-power-off"></i>
                            <span class="hide-menu"> Logout</span></a>
                        </li>
                        
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->