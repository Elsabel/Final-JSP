/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daos.GeneralDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Department;
import models.Employee;
import models.Location;
import tools.HibernateUtil;

/**
 *
 * @author Rizky
 */
public class DepartmentServlet extends HttpServlet {

    private GeneralDao dao;

    public DepartmentServlet() {
        this.dao = new GeneralDao(HibernateUtil.getSessionFactory());
    }

    public DepartmentServlet(GeneralDao dao) {
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
//            out.println("<title>Servlet DepartmentServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet DepartmentServlet at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        List<Department> department = this.dao.select("Department");

        String redirect = "";
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "insert":
                    insert(request, response);
                    break;
                case "delete":
                    delete(request, response);
                    break;
                case "edit":
                    showForm(request, response);
                    break;
                case "update":
                    update(request, response);
                    break;
                case "addForm":
                    addForm(request, response);
                    break;
                case "print":
                    print(request, response);
                default:
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
//        processRequest(request, response);
        doGet(request, response);
    }

    // Delete sudah bisa -> belum sweet alert
    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
//        int id = Integer.parseInt(request.getParameter("id"));
        String id = request.getParameter("id");
        dao.delete(new Department(new Short(id)));
        request.setAttribute("flash", "Delete");
        RequestDispatcher rd = request.getRequestDispatcher("departmentServlet?action=list");
        rd.forward(request, response);
    }

    private void insert(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
//        String id = request.getParameter("idDepartment"); // tidak perlu lagi karena id sudah pakai method max untuk auto-increament
        String name = request.getParameter("nameDepartment");
        String manager = request.getParameter("manager");
        String city = request.getParameter("city");
        dao.save(new Department(new Short((short) max()), name, new Employee(new Integer(manager)), new Location(new BigDecimal(city))));
        request.setAttribute("flash", "Save");
        RequestDispatcher rd = request.getRequestDispatcher("departmentServlet?action=list");
        rd.forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("idDepartment");
        String name = request.getParameter("nameDepartment");
        String manager = request.getParameter("manager");
        String city = request.getParameter("cityId");
        dao.save(new Department(new Short(id), name, new Employee(new Integer(manager)), new Location(new BigDecimal(city))));
        request.setAttribute("flash", "Update");
        RequestDispatcher rd = request.getRequestDispatcher("departmentServlet?action=list");
        rd.forward(request, response);
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("id");
        Department department = (Department) this.dao.selectByField("Department", "departmentId", id);
        List<Employee> employees = this.dao.select("Employee");
        List<Location> locations = this.dao.select("Location");

        request.setAttribute("idDepartment", department.getDepartmentId());
        request.setAttribute("nameDepartment", department.getDepartmentName());
        request.setAttribute("manager", department.getManagerId().getEmployeeId());
        request.setAttribute("nameFirst", department.getManagerId().getFirstName());
        request.setAttribute("cityId", department.getLocationId().getLocationId());
        request.setAttribute("city", department.getLocationId().getCity());
        request.setAttribute("employees", employees);
        request.setAttribute("locations", locations);

        RequestDispatcher rd = request.getRequestDispatcher("editDepartment.jsp");
        rd.forward(request, response);
    }

    private void list(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Department> departments = this.dao.select("Department");
        request.setAttribute("departments", departments);
        List<Employee> employees = this.dao.select("Employee");
        request.setAttribute("employees", employees);
        List<Location> locations = this.dao.select("Location");
        request.setAttribute("locations", locations);
        RequestDispatcher rd = request.getRequestDispatcher("listDepartment.jsp");
        rd.forward(request, response);
    }
    private void print(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Department> departments = this.dao.select("Department");
        request.setAttribute("departments", departments);
        List<Employee> employees = this.dao.select("Employee");
        request.setAttribute("employees", employees);
        List<Location> locations = this.dao.select("Location");
        request.setAttribute("locations", locations);
        RequestDispatcher rd = request.getRequestDispatcher("report/DepartmentReport.jsp");
        rd.forward(request, response);
    }

    private void addForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Department> departments = this.dao.select("Department");
        request.setAttribute("departments", departments);
        List<Employee> employees = this.dao.select("Employee");
        request.setAttribute("employees", employees);
        List<Location> locations = this.dao.select("Location");
        request.setAttribute("locations", locations);
        RequestDispatcher rd = request.getRequestDispatcher("createDepartment.jsp");
        rd.forward(request, response);
    }

    // Untuk auto-increament ID dengan kelipatan 10 -> belum bisa
    public int max() {
        if (dao.getNewId("Department", "departmentId") == null) {
            int id = 1;
            return id;
        } else {

            String a = "" + dao.getNewId("Department", "departmentId") + "";
            int max = Integer.parseInt(a);
            int newId = max + 10; // max + 10 karena auto-increament setiap id kelipatan 10, tapi belum bisa karena tipe data Short

            return newId;

        }
    }

    public List<Department> getAll() {
        return this.dao.select("Department");
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
