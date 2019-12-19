<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.Job"%>
<%@page import="models.Department"%>
<%@page import="models.Department"%>
<%@page import="models.Employee"%>
<%@page import="models.Region"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
        <title>Metrodata System</title>
        <!-- Custom CSS -->
        <link href="assets/assets/libs/flot/css/float-chart.css" rel="stylesheet">

        <link rel="stylesheet" type="text/css" href="assets/assets/extra-libs/multicheck/multicheck.css">
        <!-- datatables-->
        <link href="assets/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="assets/dist/css/style.min.css" rel="stylesheet">
        
        
        <script src="assets/assets/libs/jquery/dist/jquery.min.js"></script>
        <!--Wave Effects -->
        <script src="assets/dist/js/waves.js"></script>
        <!--Menu sidebar -->
        <script src="assets/dist/js/sidebarmenu.js"></script>
        <!--Custom JavaScript -->
        <script src="assets/dist/js/custom.min.js"></script>
        <script src="assets/assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>
        <script src="assets/assets/extra-libs/multicheck/jquery.multicheck.js"></script>
        <script src="assets/assets/extra-libs/DataTables/datatables.min.js"></script>

        <!-- Bootstrap tether Core JavaScript -->
        <script src="assets/assets/libs/popper.js/dist/umd/popper.min.js"></script>
        <script src="assets/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="assets/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
        <script src="assets/assets/extra-libs/sparkline/sparkline.js"></script>

        <!-- sweetalert js-->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>


        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

        <!-- CSS PRINT-->
        <link href="assets/dist/css/print.css" rel="stylesheet" type="text/css" media="print"/>
    </head>
    <body>
        <script>
            $(function () {
                window.print();
            });
        </script>

        <!-- MAIN CONTENT-->
        <div class="main-content">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">


                        </div>
                    </div>
                    <div class="row m-t-25">
                        <div class="col-12">
                            <center><h2>Employee Data</h2></center><br><br>
                            <!--<div class="table-responsive table--no-card m-b-30">-->
                            <table>
                                <!--<table id="myTable" class="table table-borderless table-striped table-earning">-->
                                <% List<Employee> employee = (ArrayList<Employee>) request.getAttribute("employee"); %>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>NAME</th>
                                        <th>EMAIL</th>
                                        <th>SALARY</th>
                                        <th>HIRE DATE</th>
                                        <th>PHONE NUMBER</th>
                                        <th>COMMISSION PCT</th>
                                        <th>JOB</th>
                                        <th>MANAJER</th>
                                        <th>DEPARTMENT</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (Employee em : employee) {%>
                                    <tr>
                                        <td><%=em.getEmployeeId()%></td>
                                        <td><%= em.getFirstName()%> <%= em.getLastName()%></td>
                                        <td><%= em.getEmail()%></td>
                                        <td><%= em.getSalary()%></td>
                                        <td><%
                                            DateFormat df = new SimpleDateFormat("dd/MM/yyyy"); 
                                        %>
                                        <%= df.format(em.getHireDate())%></td>                              
                                        <td><%= em.getPhoneNumber()%></td>
                                        <td>
                                            <%
                                                if (em.getCommissionPct() == null) {
                                                    out.print("-");
                                                } else {
                                                    out.print(em.getCommissionPct());
                                                }
                                            %>
                                        </td>
                                        <td><%= em.getJobId().getJobTitle()%></td>
                                        <td><%= em.getManagerId().getFirstName()%></td>
                                        <td><%= em.getDepartmentId().getDepartmentName()%></td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                            <!--</div>-->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MAIN CONTENT-->

    </body>
</html>
