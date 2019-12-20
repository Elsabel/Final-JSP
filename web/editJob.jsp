<%-- 
    Document   : jobList
    Created on : Dec 16, 2019, 5:16:46 PM
    Author     : Rizky
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Job"%>
<%@page import="java.util.List"%>


<form action="jobServlet?action=update" method="post" class="form-horizontal">
    <div class="row form-group">
        <div class="input-group col-12 col-md-8 m-b-10">
            <input type="text" id="jobId" value="<%= request.getAttribute("jobId")%>" name="jobId" placeholder="Enter Job ID" class="form-control" readonly="">
        </div>
    </div>
    <div class="row form-group">
        <div class="input-group col-12 col-md-10 m-b-10">
            <input type="text" id="jobTitle" value="<%= request.getAttribute("jobTitle")%>" name="jobTitle" placeholder="Enter Job Title..." class="form-control" required="">
        </div>
    </div>
    <div class="row form-group">
        <div class="input-group col-12 col-md-10 m-b-10">
            <input type="number" min="0" id="minSalary" value="<%= request.getAttribute("minSalary")%>" name="minSalary" placeholder="Enter Minimal Salary..." class="form-control" required="">
        </div>
    </div>
    <div class="row form-group">
        <div class="input-group col-12 col-md-10 m-b-10">
            <input type="number" min="0" id="maxSalary" value="<%= request.getAttribute("maxSalary")%>" name="maxSalary" placeholder="Enter Maximal Salary..." class="form-control" required="">
        </div>
    </div>
</form>
<div class="modal-footer">
    <div class="col-12">
        <button type="submit" class="btn btn-primary btn-sm" style="float: right;">
            <i class="fas fa-save"></i> Save
        </button>    
    </div>
</div>


