<%-- 
    Document   : listDepartment
    Created on : Dec 19, 2019, 8:26:33 AM
    Author     : Rizky
--%>

<%@page import="models.Location"%>
<%@page import="models.Employee"%>
<%@page import="models.Department"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.html"></jsp:include>
<jsp:include page="templates/topbar.jsp"></jsp:include>
<jsp:include page="templates/sidebar.jsp"></jsp:include>
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
                                <h3>Department Data</h3>
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
                        <table id="listItem" class="table table-striped table-bordered">
                            <% List<Department> departments = (ArrayList<Department>) request.getAttribute("departments"); %>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Manager</th>
                                    <th>City</th>
                                    <th class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Department department : departments) {%>
                                <tr>
                                    <td><%= department.getDepartmentId()%></td>
                                    <td><%= department.getDepartmentName()%></td>
                                    <td>
                                        <% if (department.getManagerId() == null) {
                                                out.println("-");
                                            } else {
                                                out.println(department.getManagerId().getFirstName());
                                            }
                                        %>
                                    </td>
                                    <td><%= department.getLocationId().getCity()%></td>
                                    <td class="text-center">
                                        <a href="<%= department.getDepartmentId()%>" class="view_data"
                                           data-toggle="modal" data-target="#editModal" data-placement="top" id="<%= department.getDepartmentId()%>"
                                           title="Edit">
                                            <i class="fas fa-edit fa-lg" style="color:#26a65b;"></i>
                                        </a>                                       
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="departmentServlet?action=delete&id=<%=department.getDepartmentId()%>" 
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
                <h5 class="modal-title" id="smallmodalLabel">Add Modal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="departmentServlet?action=insert" method="post" class="form-horizontal">
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="hf-password" class=" form-control-label">Name</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input type="text" id="nameDepartment" name="nameDepartment" placeholder="Enter Department Name" class="form-control">
                        </div>
                    </div>

                    <% List<Employee> employees = (ArrayList<Employee>) request.getAttribute("employees"); %>
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="managerId" class=" form-control-label">Manager</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <select name="manager" class="form-control" required>
                                <option value="">Choose Manager</option>
                                <% for (Employee employee : employees) {%>
                                <option value="<%= employee.getEmployeeId()%>"> <%= employee.getEmployeeId()%> - <%= employee.getFirstName()%></option>
                                <% }%>
                            </select>
                        </div>
                    </div>
                    <% List<Location> locations = (ArrayList<Location>) request.getAttribute("locations"); %>
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="locationId" class=" form-control-label">Manager</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <select name="city" class="form-control" required>
                                <option value="">Choose City</option>
                                <% for (Location location : locations) {%>
                                <option value="<%= location.getLocationId()%>"> <%= location.getLocationId()%> - <%= location.getCity()%></option>
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

<!-- modal edit item -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="smallmodalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel">Update Department</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="data">
                <!-- ini diisi form edit, dari editDepatment-->
            </div>
        </div>
    </div>
</div>
<!-- end modal edit item -->


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
                url: "departmentServlet?action=edit&id=" + id,
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