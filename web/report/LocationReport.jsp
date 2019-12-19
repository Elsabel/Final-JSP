<%-- 
    Document   : LocationReport
    Created on : Dec 19, 2019, 2:35:18 PM
    Author     : Elsa
--%>
<%@page import="models.Country"%>
<%@page import="models.Location"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Region"%>
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
        <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-md-9">
                                <h3>Location Data</h3>
                            </div>
                          
                        </div>
                    </div>
                    <div class="card-body">
                        <table> 
                            <thead>
                                <tr>
                                    <th>Location Id</th>
                                    <th>Street Address</th>
                                    <th>Postal Code</th>
                                    <th>City</th>
                                    <th>State Province</th>
                                    <th>Country Name</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% List<Location> locations = (ArrayList<Location>) request.getAttribute("locations"); %>
                                <%for (Location loc : locations) {%>
                                <tr>
                                    <td><%= loc.getLocationId()%></td>
                                    <td><%= loc.getStreetAddress()%></td>
                                    <td><%= loc.getPostalCode()%></td>
                                    <td><%= loc.getCity()%></td>
                                    <td><% if (loc.getStateProvince() == null) {
                                            out.println("-");
                                        } else {
                                            out.println(loc.getStateProvince());
                                        }
                                        %></td>
                                    <td><%= loc.getCountryId().getCountryName()%></td>
                                    
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>  
                </div>
        
        
    </body>
</html>
