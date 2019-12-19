<%-- 
    Document   : listRegion
    Created on : Dec 18, 2019, 1:22:36 PM
    Author     : Rizky
--%>
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
                            <!--                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                                                        <li class="breadcrumb-item active" aria-current="page">Library</li>-->
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
                            <div class="col-md-9">
                                <h3>Region Data</h3>
                            </div>
                            <div class="col-md-3">
                                <button data-toggle="modal" data-target="#additem" class="btn btn-primary btn-block">
                                    <i class="fas fa-plus"></i> Add Item</button>
                                    
                            </div>
                            <a href="regionServlet?action=print" 
                                       data-toggle="tooltip" data-placement="top" class="btn btn-primary btn-block"
                                       title="Print"><i class="fas fa-print" style=""></i> Print</a>
                        </div>
                    </div>
                    <div class="card-body">

                        <table id="listItem" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>Region ID</th>
                                    <th>Region Name</th>
                                    <th class="text-right">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% List<Region> regions = (ArrayList<Region>) request.getAttribute("regions"); %>
                                <% for (Region region : regions) {%>
                                <tr>
                                    <td><%=region.getRegionId()%></td>
                                    <td><%= region.getRegionName()%></td>
                                    <td class="text-right">
                                        <a href="<%= region.getRegionId()%>" class="view_data" 
                                           data-toggle="modal" id="<%= region.getRegionId()%>" data-target="#editModal">
                                            <i class="fas fa-edit fa-lg" style="color:#26a65b;"></i>
                                        </a>

                                        <a href="regionServlet?action=delete&id=<%= region.getRegionId()%> " 
                                            data-toogle="tooltip" title="Delete" class="btnDelete">
                                           <i class="fas fa-trash fa-lg" style="color:#f03434;"></i>
                                        </a>

<!--                                        <a href="regionServlet?action=edit&id=<%= region.getRegionId()%>" 
                                           data-toggle="tooltip" data-placement="top" 
                                           title="Edit"><i class="fas fa-edit fa-lg" style="color:#26a65b;"></i></a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="regionServlet?action=delete&id=<%=region.getRegionId()%> " 
                                           data-toggle="tooltip" data-placement="top" 
                                           title="Delete"><i class="fas fa-trash fa-lg" style="color:#f03434;"></i></a>-->
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
                <h5 class="modal-title" id="smallmodalLabel">Add Data</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="regionServlet?action=insert" method="post" class="form-horizontal">
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="hf-password" class=" form-control-label">Region Name</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input type="text" id="nameRegion" name="nameRegion" placeholder="Enter Region Name..." class="form-control">
                        </div>
                    </div>
                    <center>
                        <input type="submit" name="submit" value="Save" class="btn btn-primary"/>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </center>
                </form>
            </div>
            <div class="modal-footer">

                <!--<button type="button" class="btn btn-primary">Confirm</button>-->
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
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!-- end edit modal-->


<script type="text/javascript">
    $(document).ready(function () {
        $('#listItem').DataTable(
                {
                    "columnDefs": [
                        {"orderable": false, "targets": 2}
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
                url: "regionServlet?action=edit&id=" + id,
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
