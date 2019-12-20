/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import daos.GeneralDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import models.Job;
import org.apache.taglibs.standard.functions.Functions;
import tools.HibernateUtil;

/**
 *
 * @author USER
 */
public class JobServlet extends HttpServlet {

    private static void JOptionPane(String string) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private GeneralDao dao;

    public JobServlet() {
        this.dao = new GeneralDao(HibernateUtil.getSessionFactory());
    }

    public JobServlet(GeneralDao dao) {
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

        List<Job> jobs = this.dao.select("Job");
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
                    print(request, response);
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

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String jobId = request.getParameter("jobId");
        String jobTitle = request.getParameter("jobTitle");
        dao.delete(new Job(jobId, jobTitle));
        request.setAttribute("flash", "Delete");
        RequestDispatcher rd = request.getRequestDispatcher("jobServlet?action=list");
        rd.forward(request, response);
    }

    private void insert(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String jobTitle = request.getParameter("jobTitle");
        String minSalary = request.getParameter("minSalary");
        String maxSalary = request.getParameter("maxSalary");
        dao.save(new Job(Functions.substring(jobTitle, 0, 2).toUpperCase() + "_" + remVowel(Functions.substring(jobTitle, 0, 5)).toUpperCase(), jobTitle, Integer.parseInt(minSalary), Integer.parseInt(maxSalary)));
        request.setAttribute("flash", "Save");
        RequestDispatcher rd = request.getRequestDispatcher("jobServlet?action=list");
        rd.forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String jobId = request.getParameter("jobId");
        String jobTitle = request.getParameter("jobTitle");
        String minSalary = request.getParameter("minSalary");
        String maxSalary = request.getParameter("maxSalary");
        dao.save(new Job(jobId, jobTitle, Integer.parseInt(minSalary), Integer.parseInt(maxSalary)));
        request.setAttribute("flash", "Update");
        RequestDispatcher rd = request.getRequestDispatcher("jobServlet?action=list");
        rd.forward(request, response);
    }

    private void list(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Job> jobs = this.dao.select("Job");
        request.setAttribute("jobs", jobs);
        RequestDispatcher rd = request.getRequestDispatcher("listJob.jsp");
        rd.forward(request, response);
    }

    private void print(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Job> jobs = this.dao.select("Job");
        request.setAttribute("jobs", jobs);
        RequestDispatcher rd = request.getRequestDispatcher("report/JobReport.jsp");
        rd.forward(request, response);
    }

    public List<Job> getAll() {
        return this.dao.select("Job");
    }

    private void byId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Job job = (Job) this.dao.selectByField("Job", "jobId", id);
        request.setAttribute("jobId", job.getJobId());
        request.setAttribute("jobTitle", job.getJobTitle());
        request.setAttribute("minSalary", job.getMinSalary());
        request.setAttribute("maxSalary", job.getMaxSalary());
        RequestDispatcher rd = request.getRequestDispatcher("editJob.jsp");
        rd.forward(request, response);
    }

    static String remVowel(String str) {
        Character vowels[] = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U', ' ', '_', '-', '&'};
        List<Character> al = Arrays.asList(vowels);
        StringBuilder sb = new StringBuilder(str);
        for (int i = 0; i < sb.length(); i++) {
            if (al.contains(sb.charAt(i))) {
                sb.replace(i, i + 1, "");
                i--;
            }
        }
        return sb.toString();
    }
    /**
     * /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
