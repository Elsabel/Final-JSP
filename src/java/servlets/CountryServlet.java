/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daos.GeneralDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Country;
import models.Region;
import org.apache.taglibs.standard.functions.Functions;
import tools.HibernateUtil;

/**
 *
 * @author Rizky
 */
public class CountryServlet extends HttpServlet {

    private GeneralDao dao;

    public CountryServlet() {
        this.dao = new GeneralDao(HibernateUtil.getSessionFactory());
    }

    public CountryServlet(GeneralDao dao) {
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
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet CountryServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet CountryServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
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

        String action = request.getParameter("action");
        try {
            switch (action) {
                case "insert":
                    insert(request, response);
                    break;
                case "delete":
                    delete(request, response);
                    break;
                case "update":
                    update(request, response);
                    break;
                case "byId":
                    byId(request, response);
                    break;
                case "print":
                    print(request,response);
                default:
                    list(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
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
    }

    private void list(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Country> countries = this.dao.select("Country");
        request.setAttribute("countries", countries);
        List<Region> regions = this.dao.select("Region");
        request.setAttribute("regions", regions);

        RequestDispatcher rd = request.getRequestDispatcher("listCountry.jsp");
        rd.forward(request, response);
    }
    private void print(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Country> countries = this.dao.select("Country");
        request.setAttribute("countries", countries);
        List<Region> regions = this.dao.select("Region");
        request.setAttribute("regions", regions);

        RequestDispatcher rd = request.getRequestDispatcher("report/CountryReport.jsp");
        rd.forward(request, response);
    }
    
    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String countryId = request.getParameter("id");
        dao.delete(new Country(countryId));
        request.setAttribute("flash", "Delete");
        RequestDispatcher rd = request.getRequestDispatcher("countryServlet?action=list");
        rd.forward(request, response);
//        response.sendRedirect("countryServlet?action=list");
    }

    private void insert(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String countryName = request.getParameter("countryName");
        String regionId = request.getParameter("regionId");
        dao.save(new Country(Functions.substring(countryName, 0, 2).toUpperCase(), countryName, new Region(Integer.parseInt(regionId))));
        request.setAttribute("flash", "Save");
        RequestDispatcher rd = request.getRequestDispatcher("countryServlet?action=list");
        rd.forward(request, response);
//        response.sendRedirect("countryServlet?action=list");
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String countryName = request.getParameter("countryName");
        String countryId = request.getParameter("countryId");
        String regionId = request.getParameter("regionId");
        request.setAttribute("flash", "Update");
        dao.save(new Country(countryId, countryName, new Region(Integer.parseInt(regionId))));
        RequestDispatcher rd = request.getRequestDispatcher("countryServlet?action=list");
        rd.forward(request, response);
    }

    private void byId(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        
        String countryId = request.getParameter("id");
        Country country = (Country) this.dao.selectByField("Country", "countryId", countryId);
        List<Region> regions = this.dao.select("Region");
        request.setAttribute("regions", regions);
        String regionId = country.getRegionId().getRegionId().toString();
        String regionName = country.getRegionId().getRegionName();
        String countryName = country.getCountryName();
        
        request.setAttribute("countryId", countryId);
        request.setAttribute("countryName", countryName);
        request.setAttribute("regionId", regionId);
        request.setAttribute("regionName", regionName);
        
        RequestDispatcher rd = request.getRequestDispatcher("editCountry.jsp");
        rd.forward(request, response);
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