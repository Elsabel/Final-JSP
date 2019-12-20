<%-- 
    Document   : listLocation
    Created on : Dec 18, 2019, 2:42:33 PM
    Author     : Rizky
--%>

<%@page import="models.Country"%>
<%@page import="models.Location"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Region"%>
<%@page import="java.util.List"%>
<jsp:include page="templates/header.html"></jsp:include>
<jsp:include page="templates/topbar.jsp"></jsp:include>
<jsp:include page="templates/sidebar.jsp"></jsp:include>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- ============================================================== -->
<!-- Page wrapper  -->
<!-- ============================================================== -->
<div class="page-wrapper">
    <!-- ============================================================== -->
    <!-- Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
                <h4 class="page-title">Management Data</h4>
                <div class="ml-auto text-right">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- End Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Flash data Start -->
    <!-- ============================================================== -->
    <div class="flash-data" data-flashdata="<%= request.getAttribute("flash")%>"> 
        <script>
            const flashdata = $('.flash-data').data('flashdata');
            if (flashdata) {
                swal({
                    title: 'Information',
                    text: 'Success ' + flashdata,
                    type: 'success'
                });
            }
        </script>
    </div>
    <!-- ============================================================== -->
    <!-- Flash data End -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Container fluid  -->
    <!-- ============================================================== -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <h3>Location Data</h3>
                            </div>
                            <div class="col-3">
                                <button data-toggle="modal" data-target="#additem" class="btn btn-primary btn-block">
                                    <i class="fas fa-plus"></i> Add Item</button>
                            </div>
                            <div class="col-3 offset-6">
                                <a href="regionServlet?action=print" 
                                   data-toggle="tooltip" data-placement="top" class="btn btn-secondary btn-block"
                                   title="Print"><i class="fas fa-print" style=""></i> Print</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <table id="listItem" class="table table-responsive table-borderless table-striped table-earning"> 
                            <thead>
                                <tr>
                                    <th>Location Id</th>
                                    <th>Street Address</th>
                                    <th>Postal Code</th>
                                    <th>City</th>
                                    <th>State Province</th>
                                    <th>Country Name</th>
                                    <th class="text-center" width="10%">Action</th>
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
                                    <td class="text-center">

                                        <a href="<%= loc.getLocationId()%>" class="view_data" 
                                           data-toggle="modal" id="<%= loc.getLocationId()%>" data-target="#editModal">
                                            <i class="fas fa-edit fa-lg" style="color:#26a65b;"></i>
                                        </a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="locationServlet?action=delete&idLoc=<%= loc.getLocationId()%> " 
                                           data-toogle="tooltip" title="Delete" class="delete-btn tombol-hapus">
                                            <i class="fas fa-trash fa-lg" style="color:#f03434;"></i>
                                        </a>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>  
                </div>
            </div>
        </div>
    </div>
</div>



<!-- modal add item -->
<div class="modal fade" id="additem" tabindex="-1" role="dialog" aria-labelledby="smallmodalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel">Add Location</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="locationServlet?action=insert" method="post" class="form-horizontal">
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="locationAddress" class=" form-control-label">Street Address</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input type="text" id="streetAddress" name="streetAddress" placeholder="Enter Street Address..." class="form-control" required="">
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="Postal Code" class=" form-control-label">Postal Code</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input type="text" id="postalCode" name="postalCode" placeholder="Enter Postal Code..." class="form-control" required="">
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="City" class=" form-control-label">City</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input type="text" id="city" name="city" placeholder="Enter City..." class="form-control" required="">
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="stateProvince" class=" form-control-label">State Province</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input type="text" id="stateProvince" name="stateProvince" placeholder="Enter State Province..." class="form-control">
                        </div>
                    </div>
                    <% List<Country> countries = (ArrayList<Country>) request.getAttribute("countries"); %>
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="countryId" class=" form-control-label">Country</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <select name="countryId" class="form-control" required>
                                <option value="">Choose A Country</option>
                                <% for (Country coun : countries) {%>
                                <option value="<%= coun.getCountryId()%>"><%= coun.getCountryId()%> - <%= coun.getCountryName()%></option>
                                <% }%>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <div class="col-12">
                    <button type="submit" class="btn btn-primary btn-sm" style="float: right;">
                        <i class="fas fa-save"></i> Save
                    </button>    
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end modal add item -->


<!--edit modal-->
<!-- memulai modal nya. pada id="$myModal" harus sama dengan data-target="#myModal" pada tombol di atas -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">Edit Location</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!-- memulai untuk konten dinamis -->
            <!-- lihat id="data_siswa", ini yang di pangging pada ajax di bawah -->
            <div class="modal-body" id="data">
            </div>
            <!-- selesai konten dinamis -->
        </div>
    </div>
</div>
<!-- end edit modal-->

<script type="text/javascript">
    $(document).ready(function () {
        $('#listItem').DataTable(
                {
                    "columnDefs": [
                        {"orderable": false, "targets": 6}
                    ]
                }
        );
    });

    $('.btnDelete').on('click', function () {
        event.preventDefault();
        const href = $(this).attr("href");
        swal({
            title: 'Are you sure?',
            text: "Delete Data",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes'
        }).then((result) => {
            if (result.value) {
                window.location.href = href;
            }
        });
    });

    $(document).ready(function () {
        $("body").on('click', '.view_data', function () {
            var id = $(this).attr("id");
            $.ajax({
                url: "locationServlet?action=edit&id=" + id,
                type: "GET",
                data: {id: id},
                success: function (data) {
                    $("#data").html(data);
                    $("#editModal").modal('show', {backdrop: 'true'});
                }
            });
        });
    });
</script>

<jsp:include page="templates/footer.jsp"></jsp:include>