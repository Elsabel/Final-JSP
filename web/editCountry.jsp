<%-- 
    Document   : editCountry
    Created on : Dec 18, 2019, 3:22:47 PM
    Author     : Rizky
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.Region"%>
<%@page import="java.util.List"%>

<form action="countryServlet?action=update" method="post" class="form-horizontal">
    <div class="form-group">
        <label>ID</label>
        <input class="form-control" class="au-input au-input--full" type="text" name="countryId" id="countryId" value="<%= request.getAttribute("countryId")%>" readonly>
    </div>
    <div class="form-group">
        <label>Country</label>
        <input class="form-control" type="text" name="countryName" id="countryName" value="<%= request.getAttribute("countryName")%>" placeholder="Country Name">
    </div>
    <div class="form-group">
        <label>Region</label>
        <% List<Region> regions = (ArrayList<Region>) request.getAttribute("regions");%>
        <select class="form-control" name="regionId" id="regionId">
            <option value="<%= request.getAttribute("regionId")%>">
                <%= request.getAttribute("regionId")%> - <%= request.getAttribute("regionName")%>
            </option>

            <option>----------------</option>

            <%for (Region region : regions) {%>

            <option value="<%= region.getRegionId()%>">
                <%= region.getRegionId()%> - <%= region.getRegionName()%>
            </option>
            <% }%>
        </select>
    </div>
</form>
<div class="modal-footer">
    <div class="col-12">
        <button type="submit" class="btn btn-primary btn-sm" style="float: right;">
            <i class="fas fa-save"></i> Save
        </button>    
    </div>
</div>