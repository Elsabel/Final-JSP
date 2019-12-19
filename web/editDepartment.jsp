<%-- 
    Document   : editDepartment
    Created on : Dec 19, 2019, 8:28:59 AM
    Author     : Rizky
--%>
<%@page import="models.Location"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Employee"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<form action="departmentServlet?action=update" method="post" class="form-horizontal">
    <div class="row form-group">
        <div class="col col-md-3">
            <label for="hf-email" class=" form-control-label">Id</label>
        </div>
        <div class="col-12 col-md-9">
            <input type="text" id="idDepartment" name="idDepartment" value="<%= request.getAttribute("idDepartment")%>" placeholder="Enter Department Id" class="form-control" readonly>
        </div>
    </div>
        
    <div class="row form-group">
        <div class="col col-md-3">
            <label for="hf-password" class=" form-control-label">Name</label>
        </div>
        <div class="col-12 col-md-9">
            <input type="text" id="nameDepartment" name="nameDepartment" value="<%= request.getAttribute("nameDepartment")%>" placeholder="Enter Department Name" class="form-control">
        </div>
    </div>

    <% List<Employee> employees = (ArrayList<Employee>) request.getAttribute("employees");%>
    <div class="row form-group">
        <div class="col col-md-3">
            <label for="managerId" class=" form-control-label">Manager</label>
        </div>
        <div class="col-12 col-md-9">
            <select name="manager" class="form-control" required>
                <option value="<%= request.getAttribute("manager")%>">
                    <%= request.getAttribute("manager")%> - <%= request.getAttribute("nameFirst")%>
                </option>
                <option value="<%= request.getAttribute("manager")%>">
                    ----- Choose Manager -----
                </option>
                <% for (Employee employee : employees) {%>
                <option value="<%= employee.getEmployeeId()%>"> <%= employee.getEmployeeId()%> - <%= employee.getFirstName()%></option>
                <% }%>
            </select>
        </div>
    </div>
            
    <% List<Location> locations = (ArrayList<Location>) request.getAttribute("locations"); %>
    <div class="row form-group">
        <div class="col col-md-3">
            <label for="locationId" class=" form-control-label">City</label>
        </div>
        <div class="col-12 col-md-9">
            <select name="cityId" class="form-control" required>
                <option value="<%= request.getAttribute("cityId")%>">
                    <%= request.getAttribute("cityId")%> - <%= request.getAttribute("city")%>
                </option>
                <option value="<%= request.getAttribute("cityId")%>">
                    ----- Choose City -----
                </option>
                <% for (Location location : locations) {%>
                <option value="<%= location.getLocationId()%>"> <%= location.getLocationId()%> - <%= location.getCity()%></option>
                <% }%>
            </select>
        </div>
    </div>
    <center>
         <button class="btn btn-primary" type="submit" name="submit"><i class="fas fa-save"></i> Save</button>
        <button type="button" data-dismiss="modal"class="btn btn-danger"> <i class="fas fa-window-close"></i> Cancel</button>
    </center>
</form>
