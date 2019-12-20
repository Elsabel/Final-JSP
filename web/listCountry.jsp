<%-- 
    Document   : listCountry
    Created on : Dec 18, 2019, 3:23:39 PM
    Author     : Rizky
--%>


<%@page import="models.Country"%>
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
                                <h3>Country Data</h3>
                            </div>
                            <div class="col-3">
                                <button data-toggle="modal" data-target="#additem" class="btn btn-primary btn-block">
                                    <i class="fas fa-plus"></i> Add Item</button>
                            </div>
                            <div class="col-3 offset-6">
                                <a href="countryServlet?action=print" 
                                   data-toggle="tooltip" data-placement="top" class="btn btn-secondary btn-block"
                                   title="Print"><i class="fas fa-print" style=""></i> Print</a>
                            </div>
<!--                             <button class="au-btn au-btn-icon au-btn--blue">
                                 <a href="countryServlet?action=print" 
                                       data-toggle="tooltip" data-placement="top" 
                                       title="Print"><i class="fas fa-print" style=""></i>Print</a></button>-->
                        </div>
                    </div>
                    <div class="card-body">
                        <table id="listItem" class="table table-borderless table-striped table-earning">
                            <% List<Country> countrys = (ArrayList<Country>) request.getAttribute("countries"); %>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Region</th>
                                    <th class="text-right">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Country country : countrys) {%>
                                <tr>
                                    <td><%=country.getCountryId()%></td>
                                    <td><%= country.getCountryName()%></td>
                                    <td>
                                        <%=  country.getRegionId().getRegionName()%>
                                    </td>
                                    <td class="text-right">
                                        <a href="<%= country.getCountryId()%>" class="view_data" 
                                           data-toggle="modal" id="<%= country.getCountryId()%>" data-target="#editModal">
                                            <span class="fas fa-edit fa-lg" data-toggle="tooltip" title="Edit" 
                                                  style="color:#26a65b;"></span>
                                        </a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="countryServlet?action=delete&id=<%= country.getCountryId()%>" 
                                           class="tombol-hapus">
                                            <span class="fas fa-trash fa-lg" data-toggle="tooltip" title="Delete" 
                                                  style="color:#f03434;"></span>
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
                            
                            

<!-- modal country large -->
<div class="modal fade" id="additem" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="largeModalLabel">Add New Country</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="countryServlet?action=insert" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label>Country Name</label>
                        <input class="form-control" type="text" name="countryName" id="countryName" placeholder="Country Name">
                    </div>
                    <div class="form-group">
                        <label>Region Name</label>
                        <% List<Region> regions = (ArrayList<Region>) request.getAttribute("regions"); %>
                        <select class="form-control" name="regionId" id="regionId">
                            <%for (Region region : regions) {%>
                            <option value="<%= region.getRegionId()%>">
                                <%= region.getRegionId()%> - <%= region.getRegionName()%>
                            </option>
                            <% }%>
                        </select>
                    </div>
            </div>
            <div class="modal-footer">
                <input type="submit" name="submit" value="Save" class="btn btn-primary "/>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- end modal large -->


<!-- memulai modal nya. pada id="$myModal" harus sama dengan data-target="#myModal" pada tombol di atas -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">Edit Country</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!-- memulai untuk konten dinamis -->
            <!-- lihat id="data_siswa", ini yang di pangging pada ajax di bawah -->
            <div class="modal-body" id="data">

            </div>
            <!-- selesai konten dinamis -->
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $('#listItem').DataTable(
                {
                    "columnDefs": [
                        {"orderable": false, "targets": 3}
                    ]
                }
        );
    });
    
//      $(document).ready(function () {
//        $("body").on('click', '.view_data', function () {
        $('.view_data').on('click', function () {
            const id = $(this).attr("id");
            $.ajax({
                url: "countryServlet?action=byId&id=" + id,
                type: "POST",
                data: {id: id},
                success: function (data) {
                    $("#data").html(data);
                    $("#editModal").modal('show', {backdrop: 'true'});
                }
            });
        });
//    });
</script>

<script>
    $('.tombol-hapus').on('click', function () {
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
</script>

<jsp:include page="templates/footer.jsp"></jsp:include>