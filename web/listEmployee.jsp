<%-- 
    Document   : listEmployee
    Created on : Dec 19, 2019, 9:09:57 AM
    Author     : Rizky
--%>

<%@page import="models.Job"%>
<%@page import="models.Department"%>
<%@page import="models.Department"%>
<%@page import="models.Employee"%>
<%@page import="models.Region"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<jsp:include page="templates/header.html"></jsp:include>
<jsp:include page="templates/topbar.jsp"></jsp:include>
<jsp:include page="templates/sidebar.jsp"></jsp:include>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="assets/dist/css/button.css" rel="stylesheet" type="text/css"/>
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
                                <h3>Employee Data</h3>
                            </div>
                            <div class="col-1">
                                <button data-toggle="modal" data-target="#additem" class="btn btn-block"  title="Add">
                                    <i class="fas fa-plus"  style="color:#000000"></i></button>
                            </div>
                            <div class="col-1 offset-10">
                                <a href="regionServlet?action=print" 
                                   data-toggle="tooltip" data-placement="top" class="btn btn-block"
                                   title="Print"><i class="fas fa-print"  style="color:#000000"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <table id="listItem" class="table table-borderless table-striped table-earning">
                            <!--<table id="myTable" class="table table-borderless table-striped table-earning">-->
                            <% List<Employee> employee = (ArrayList<Employee>) request.getAttribute("employee"); %>
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>

                                    <th>Email</th>
                                    <th>Salary</th>

                                    <th class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Employee em : employee) {%>
                                <tr>
                                    <td><%=em.getEmployeeId()%></td>
                                    <td><%= em.getFirstName()%> <%= em.getLastName()%></td>

                                    <td><%= em.getEmail()%></td>
                                    <td><%= em.getSalary()%></td>

                                    <td class="text-center">
                                        <a href="employeeServlet?action=detail&id=<%=em.getEmployeeId()%> "
                                           data-toggle="tooltip" data-placement="top" title="Details"><i class="fas fa-list-alt"></i></a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="<%=em.getEmployeeId()%>" class="view_data" 
                                           data-toggle="modal" id="<%=em.getEmployeeId()%>" data-target="#editModal">
                                            <i class="fas fa-edit fa-lg" style="color:#26a65b;"></i>
                                        </a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="employeeServlet?action=delete&id=<%= em.getEmployeeId()%> " 
                                           class="tombol-hapus" data-toogle="tooltip" title="Delete">
                                            <i class="fas fa-trash"style="color:#f03434;"></i></a>
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
                <h5 class="modal-title" id="smallmodalLabel">Add Employee</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-body card-block">
                        <form action="employeeServlet?action=insert" method="post" class="form-horizontal">
                            <div class="row form-group">
                                <div class="col col-md-3">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="text-input" class=" form-control-label">First Name</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" id="firstName" name="firstName" class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="text-input" class=" form-control-label">Last Name</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" id="lastName" name="lastName" class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="email-input" class=" form-control-label">Email</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="email" id="email" name="email" class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="text-input" class=" form-control-label">Phone Number</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" id="phoneNumber" name="phoneNumber" class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="text-input" class=" form-control-label">Salary</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" id="salary" name="salary" class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="text-input"class=" form-control-label">Commission Pct</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="number" min="0" max="2"  id="commissionPct" name="commissionPct" class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="text-input" class=" form-control-label">Hire Date</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="date" id="hireDate" name="hireDate" class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="selectSm" class=" form-control-label">Job</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <select name="jobId" id="jobId" class="form-control-sm form-control">
                                        <% List<Job> jobId = (ArrayList<Job>) request.getAttribute("jobId"); %>

                                        <option value="0">Please select</option>
                                        <%for (Job em : jobId) {%>
                                        <option value="<%= em.getJobId()%>"><%= em.getJobTitle()%></option>
                                        <%}%>
                                    </select>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="selectSm" class=" form-control-label">Manager</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <select name="managerId" id="managerId" class="form-control-sm form-control">
                                        <% List<Employee> managerId = (ArrayList<Employee>) request.getAttribute("managerId"); %>

                                        <option value="0">Please select</option>
                                        <%for (Employee mn : managerId) {%>
                                        <option value="<%= mn.getEmployeeId()%>"><%= mn.getFirstName()%></option>
                                        <%}%>
                                    </select>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="selectSm" class=" form-control-label">Department</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <select name="departmentId" id="departmentId" class="form-control-sm form-control">
                                        <% List<Department> departmentId = (ArrayList<Department>) request.getAttribute("departmentId"); %>
                                        <option value="0">Please select</option>
                                        <%for (Department dm : departmentId) {%>
                                        <option value="<%= dm.getDepartmentId()%>"><%= dm.getDepartmentName()%></option>
                                        <%}%>
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
        </div>
    </div>
</div>

<!-- Declaration of Datatables -->
<script type="text/javascript">
    $(document).ready(function () {
        $('#listItem').DataTable(
                {
                    "columnDefs": [
                        {"orderable": false, "targets": 4}
                    ]
                }
        );
    });
</script>
<script type="text/javascript">
    function success() {
        swal({
            title: "Success Saved!",
            text: "You Success Saved New Data!",
            icon: "success",
            timer: 2500
        });
    }
</script>


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