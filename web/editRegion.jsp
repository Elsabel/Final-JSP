<%-- 
    Document   : editRegion
    Created on : Dec 18, 2019, 2:25:42 PM
    Author     : Rizky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal-body">
    <form action="regionServlet?action=update" method="post" class="form-horizontal">
        <div class="row form-group">
            <div class="col col-md-3">
                <label for="hf-password" class=" form-control-label">Region Name</label>
            </div>
            <div class="col-12 col-md-9">
                <input type="text" id="regionId" readonly value="<%= request.getAttribute("regionId")%>" name="regionId" placeholder="Enter Region Name..." class="form-control">
            </div>
        </div>
        <div class="row form-group">
            <div class="col col-md-3">
                <label for="hf-password" class=" form-control-label">Region Name</label>
            </div>
            <div class="col-12 col-md-9">
                <input type="text" id="regionName" value="<%= request.getAttribute("regionName")%>" name="regionName" placeholder="Enter Region Name..." class="form-control">
            </div> 
        </div>
    </form>
</div>
<div class="modal-footer">
        <button type="submit" class="btn btn-primary btn-sm" style="float: right;">
            <i class="fas fa-save"></i> Save
        </button>    
    </div>