<%-- 
    Document   : detailEmployee
    Created on : Dec 19, 2019, 9:24:10 AM
    Author     : Rizky
--%>

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
    <!-- Container fluid  -->
    <!-- ============================================================== -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-md-9">
                                <h3>Employee Data</h3>
                            </div>

                        </div>
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="hf-email" class=" form-control-label">ID</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" value="<%= request.getAttribute("id")%>" id="id" name="id" placeholder="" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="hf-email" class=" form-control-label">First Name</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" value="<%= request.getAttribute("firstName")%>" id="firstName" name="firstName" placeholder="" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="hf-email" class=" form-control-label">Last Name</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" value="<%= request.getAttribute("lastName")%>" id="lastName" name="lastName" placeholder="" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="hf-email" class=" form-control-label">Email</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" value="<%= request.getAttribute("email")%>" id="email" name="email" placeholder="" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="hf-email" class=" form-control-label">Hire Date</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" value="<%= request.getAttribute("hireDate")%>" id="hireDate" name="hireDate" placeholder="" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="hf-email" class=" form-control-label">Phone Number</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" value="<%= request.getAttribute("phoneNumber")%>" id="phoneNumber" name="phoneNumber" placeholder="" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="hf-email" class=" form-control-label">Commission</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" value="<%= request.getAttribute("commision")%>" id="commision" name="commision" placeholder="" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="hf-email" class=" form-control-label">Salary</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" value="<%= request.getAttribute("salary")%>" id="salary" name="salary" placeholder="" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="hf-email" class=" form-control-label">Job</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" value="<%= request.getAttribute("job")%>" id="job" name="job" placeholder="" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="hf-email" class=" form-control-label">Manager</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" value="<%= request.getAttribute("manager")%>" id="manager" name="manager" placeholder="" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="hf-email" class=" form-control-label">Department</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" value="<%= request.getAttribute("department")%>" id="department" name="department" placeholder="" class="form-control" readonly>
                                </div>
                            </div>

                            <a href="employeeServlet?action=list" class="btn btn-primary btn-sm" data-dismiss="modal">Back

                            </a>

                            <a href="<%= request.getAttribute("id")%>" class="view_data" 
                               data-toggle="modal" id="<%=  request.getAttribute("id")%>" data-target="#editModal">
                                <input type="submit" name="submit" value="Edit"  class="btn btn-primary btn-sm"/>
                            </a>
                        </form>
                    </div>  
                </div>
            </div>
        </div>
    </div>
</div>


<!-- memulai modal nya. pada id="$myModal" harus sama dengan data-target="#myModal" pada tombol di atas -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">Edit Employee</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                </button>
            </div>
            <div class="modal-body" id="data">

            </div>

            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function () {
        $("body").on('click', '.view_data', function () {
            var id = $(this).attr("id");
            $.ajax({
                url: "employeeServlet?action=edit&id=" + id,
                type: "GET",
                data: {id: id},
                success: function (data) {
                    $("#data").html(data);
                    $("#editModal").modal('show', {backdrop: 'true'});
                }
            });
        });
    });
//   
</script>