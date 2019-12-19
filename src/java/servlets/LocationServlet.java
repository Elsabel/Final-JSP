/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Location;
import daos.GeneralDao;
import java.math.BigDecimal;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import models.Country;
import models.Department;
import models.Employee;
import tools.HibernateUtil;

/**
 *
 * @author Rizky
 */
public class LocationServlet extends HttpServlet {

    private GeneralDao dao;

    public LocationServlet() {
        this.dao = new GeneralDao(HibernateUtil.getSessionFactory());
    }

    public LocationServlet(GeneralDao dao) {
        this.dao = dao;
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Location> locations = this.dao.select("Location");

        String redirect = "";
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "insert":
//                    redirect = "listRegion.jsp";
//                    request.setAttribute("regions", regions);
                    insert(request, response);
                    break;
//            case "/insert":
//                insertBook(request, response);
//                break;
                case "delete":
//                    redirect = "listRegion.jsp";
//                    request.setAttribute("regions", regions);
                    delete(request, response);
                    break;
                case "edit":
                    showForm(request, response);
                    break;
                case "update":
                    update(request, response);
                    break;
                case "print":
                    print(request, response);
                    break;  
                default:
//                    redirect = "listRegion.jsp";
//                    request.setAttribute("regions", regions);
                    list(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
//        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
//        processRequest(request, response);
    }

    private void list(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Location> locations = this.dao.select("Location");
        request.setAttribute("locations", locations);
        List<Country> countries = this.dao.select("Country");
        request.setAttribute("countries", countries);
        List<Employee> employee = this.dao.select("Employee");
        request.setAttribute("employee", employee);
        List<Department> dept = this.dao.select("Department");
        request.setAttribute("department", dept);
        RequestDispatcher rd = request.getRequestDispatcher("listLocation.jsp");
        rd.forward(request, response);
    }
     private void print(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Location> locations = this.dao.select("Location");
        request.setAttribute("locations", locations);
        List<Country> countries = this.dao.select("Country");
        request.setAttribute("countries", countries);
        List<Employee> employee = this.dao.select("Employee");
        request.setAttribute("employee", employee);
        List<Department> dept = this.dao.select("Department");
        request.setAttribute("department", dept);
        RequestDispatcher rd = request.getRequestDispatcher("report/LocationReport.jsp");
        rd.forward(request, response);
    }

    private void insert(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String name = request.getParameter("streetAddress");
        String postal = request.getParameter("postalCode");
        String city = request.getParameter("city");
        String state = request.getParameter("stateProvince");
        String country = request.getParameter("countryId");
        dao.save(new Location(new BigDecimal(max()), name, postal, city, state, new Country(country)));
//        response.sendRedirect("locationServlet?action=list");
        request.setAttribute("flash", "Save");
        RequestDispatcher rd = request.getRequestDispatcher("locationServlet?action=list");
        rd.forward(request, response);
        
    }

    public int max() {
        if (dao.getNewId("Location", "locationId") == null) {
            int id = 1;
            return id;
        } else {

            String a = "" + dao.getNewId("Location", "locationId") + "";
            int max = Integer.parseInt(a);
            int newId = max + 100;

            return newId;

        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("idLoc");
        dao.delete(new Location(new BigDecimal(id)));
        request.setAttribute("flash", "Delete");
        RequestDispatcher rd = request.getRequestDispatcher("locationServlet?action=list");
        rd.forward(request, response);
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String idLoc = request.getParameter("id");
        Location loc = (Location) this.dao.selectByField("Location", "locationId", idLoc);
        List<Country> countryAll = this.dao.select("Country");

        request.setAttribute("locationId", loc.getLocationId().toString());
        request.setAttribute("streetAddress", loc.getStreetAddress());
        request.setAttribute("postalCode", loc.getPostalCode());
        request.setAttribute("city", loc.getCity());
        request.setAttribute("stateProvince", loc.getStateProvince());
        request.setAttribute("countryId", loc.getCountryId().getCountryId());
        request.setAttribute("countryName", loc.getCountryId().getCountryName());

        request.setAttribute("countryAll", countryAll);

        RequestDispatcher rd = request.getRequestDispatcher("editLocation.jsp");
        rd.forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("locationId");
        String name = request.getParameter("streetAddress");
        String postal = request.getParameter("postalCode");
        String city = request.getParameter("city");
        String state = request.getParameter("stateProvince");
        String country = request.getParameter("countryId");
        dao.save(new Location(new BigDecimal(id), name, postal, city, state, new Country(country)));
        request.setAttribute("flash", "Update");
        RequestDispatcher rd = request.getRequestDispatcher("locationServlet?action=list");
        rd.forward(request, response);
//        response.sendRedirect("locationServlet?action=list");
    }


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}