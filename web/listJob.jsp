<%-- 
    Document   : listJob
    Created on : Dec 18, 2019, 2:58:06 PM
    Author     : Rizky
--%>

<%@page import="models.Job"%>
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
                            <div class="col-md-9">
                                <h3>Job Data</h3>
                            </div>
                            <div class="col-md-3">
                                <button data-toggle="modal" data-target="#additem" class="btn btn-primary btn-block">
                                    <i class="fas fa-plus"></i> Add Item</button>
                            </div>
                             <button class="au-btn au-btn-icon au-btn--blue">
                                 <a href="jobServlet?action=print" 
                                       data-toggle="tooltip" data-placement="top" 
                                       title="Print"><i class="fas fa-print" style=""></i>Print</a></button>
                        </div>
                    </div>
                    <div class="card-body">
                        <table id="listItem" class="table table-borderless table-striped table-earning">
                            <% List<Job> jobs = (ArrayList<Job>) request.getAttribute("jobs"); %>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Min Salary</th>
                                    <th>Max Salary</th>
                                    <th class="text-right">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Job job : jobs) {%>
                                <tr>
                                    <td><%=job.getJobId()%></td>
                                    <td><%= job.getJobTitle()%></td>
                                    <td><%=job.getMinSalary()%></td>
                                    <td><%= job.getMaxSalary()%></td>
                                    <td class="text-right">
                                        <a href="<%=job.getJobId()%>" class="view_data"
                                           data-toggle="modal" data-placement="top" id="<%=job.getJobId()%>" data-target="#editModal"
                                           title="Edit"><i class="fas fa-edit fa-lg" style="color:#26a65b;"></i>                                     
                                        </a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="jobServlet?action=delete&jobId=<%= job.getJobId()%>&jobTitle=<%=job.getJobTitle()%>" 
                                           class="delete-btn btnDelete" data-toogle="modal" title="Delete">
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
                <h5 class="fas fa-briefcase" id="smallmodalLabel"> Create New Job Data</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="jobServlet?action=insert" method="post" class="form-horizontal">
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="hf-password" class=" form-control-label">Job Title</label>
                        </div>
                        <div class="col-12 col-md-9 m-b-10">
                            <input id="jobTitle" type="text" class="form-control" name="jobTitle" placeholder="Title" required>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-3 mb">
                            <label for="hf-password" class=" form-control-label">Min Salary</label>
                        </div>
                        <div class="col-12 col-md-9 m-b-10">
                            <input id="minSalary" min="0" type="number" class="form-control" name="minSalary" placeholder="Minimal Salary" required>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="hf-password" class=" form-control-label">Max Salary</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input id="maxSalary" min="0" type="number" class="form-control" name="maxSalary" placeholder="Maximal Salary" required>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-12">
                            <center>
                                <input type="submit" name="submit" value="Save" class="btn btn-primary"/>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button> 
                            </center>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
<!-- end modal add item -->

<!-- modal edit item -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Edit Form Job</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body" id="data">
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!-- End modal edit item -->


<script type="text/javascript">
    $(document).ready(function () {
        $('#listItem').DataTable(

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
                url: "jobServlet?action=byId&id=" + id,
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
