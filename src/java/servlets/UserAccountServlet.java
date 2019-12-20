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
import models.Region;
import models.UserAccount;
import tools.BCrypt;
import tools.HibernateUtil;
import tools.HtmlSendMail;
import tools.SendMail;
import com.captcha.botdetect.web.servlet.Captcha;

/**
 *
 * @author ASUS
 */
public class UserAccountServlet extends HttpServlet {

    private GeneralDao dao;

    public UserAccountServlet() {
        this.dao = new GeneralDao(HibernateUtil.getSessionFactory());
    }

    public UserAccountServlet(GeneralDao dao) {
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
        String id = request.getParameter("id");
        try {
            switch (action) {
                case "verification":
                    verification(request, response);
                    break;
                case "loginAction":
                    loginAction(request, response);
                    break;
                case "logout":
                    logout(request, response);
                    break;
                case "insert":
                    insert(request, response);
                    break;
                case "edit":
                    showForm(request, response);
                    break;
                case "update":
                    update(request, response);
                    break;
                default:
                    login(request, response);
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void login(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserAccount account = (UserAccount) this.dao.selectByField("UserAccount", "username", username);
        if (account != null) {
            if (account.getStatus() == 0) { //cek status active or not
                request.setAttribute("flash", "Failed");
                request.setAttribute("message", "status");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            } else {
                if (BCrypt.checkpw(password, account.getPassword())) {
                    request.setAttribute("id", account.getId().toString());
                    request.setAttribute("username", account.getUsername());
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
//            response.sendRedirect("mainView.jsp");
                } else {
                    request.setAttribute("flash", "Failed");
                    request.setAttribute("message", "password");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
//            response.sendRedirect("regionServlet?action=list");
                }
            }
        } else {
            request.setAttribute("flash", "Failed");
            request.setAttribute("message", "user");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }

//   private boolean login1(HttpServletRequest request, HttpServletResponse response)
//            throws SQLException, IOException {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        UserAccount account = (UserAccount) this.dao.selectByField("UserAccount", "username", username);
//        if (BCrypt.checkpw(password, account.getPassword())) {
//            boolean tes = response.sendRedirect("regionServlet?action=login");
//            return true = response.sendRedirect("regionServlet?action=login");
//             response.sendRedirect("regionServlet?action=login");
//        } else {
//            return false;
//        }
//    }
//    public String save(int id, String name, String password) {
//        return dao.save(new UserAccount(id, name, BCrypt.hashpw(password, BCrypt.gensalt(5)))) == null ? "Login Success" : "Login Failed";
//    }
    public boolean selectByName(String key) {
        UserAccount account = (UserAccount) this.dao.selectByField("UserAccount", "username", key);
        if (account == null) {
            return true;
        } else {
            return false;
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.delete(new Region(id));
        response.sendRedirect("UserAccountServlet?action=list");
    }

    private void logout(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        response.sendRedirect("login.jsp");
    }

    private void insert(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String password1 = request.getParameter("password1");
        UserAccount account = (UserAccount) this.dao.selectByField("UserAccount", "username", username);
        String terms = request.getParameter("terms");

        String cap = request.getParameter("captchaCode");
        Captcha captcha = Captcha.load(request, "exampleCaptcha");
//        if (cap.equalsIgnoreCase(request.getMethod())) {
        // validate the Captcha to check we're not dealing with a bot
        boolean isHuman = captcha.validate(cap);
//        if (terms == null) {
//            request.setAttribute("flash", "Failed");
//            request.setAttribute("message", "terms");
//            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
//            rd.forward(request, response);
//        } else {
//            request.setAttribute("flash", "Failed");
//            request.setAttribute("message", "terms1");
//            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
//            rd.forward(request, response);
//        }
        if (isHuman) {
            if (account != null) { //cek username
                request.setAttribute("flash", "Failed");
                request.setAttribute("message", "username");
                RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                rd.forward(request, response);
            } else if (terms == null) {
                request.setAttribute("flash", "Failed");
                request.setAttribute("message", "terms");
                RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                rd.forward(request, response);
            } else {
                if (password.equals(password1)) { //cek password
                    HtmlSendMail hsm = new HtmlSendMail();

                    request.setAttribute("flash", "Registered");
                    dao.save(new UserAccount(max(), username, BCrypt.hashpw(password, BCrypt.gensalt(5)), email, 0));
//                ambil id yang didaftarkan berdasarkan username
                    UserAccount userAccount = (UserAccount) dao.selectByField("UserAccount", "username", username);
                    hsm.send(email, userAccount.getId().toString());
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
//            response.sendRedirect("loginView.jsp");
                } else {
                    request.setAttribute("flash", "Failed");
                    request.setAttribute("message", "password");
                    RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                    rd.forward(request, response);
                }
            }
//            System.out.println("berhasil");
//            request.setAttribute("flash", "captchanya kebaca");
//            request.setAttribute("message", "captcha1");
//            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
//            rd.forward(request, response);
        } else {
            request.setAttribute("flash", "Failed");
            request.setAttribute("message", "captcha");
            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
            rd.forward(request, response);
        }

    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String id = request.getParameter("idRegion");
        String name = request.getParameter("nameRegion");
        dao.save(new Region(Integer.parseInt(id), name));
        response.sendRedirect("regionServlet?action=list");
    }

    private void verification(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("id");
        UserAccount userAccount = (UserAccount) dao.selectByField("UserAccount", "id", id);
        dao.save(new UserAccount(Integer.parseInt(id), userAccount.getUsername(), userAccount.getPassword(), userAccount.getEmail(), 1));
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
//        response.sendRedirect("regionServlet?action=list");
    }

    private void loginAction(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("id");
        UserAccount userAccount = (UserAccount) dao.selectByField("UserAccount", "id", id);
        if (userAccount == null) {
            request.setAttribute("id", userAccount.getId());
            request.setAttribute("username", userAccount.getUsername());
            RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }

//        response.sendRedirect("regionServlet?action=list");
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("id");
        String name = request.getParameter("nameRegion");
        Region region = (Region) this.dao.selectByField("Region", "regionId", id);
        String regionId = region.getRegionId().toString();
        String regionName = region.getRegionName();
        request.setAttribute("regionId", regionId);
        request.setAttribute("regionName", regionName);
        RequestDispatcher rd = request.getRequestDispatcher("updateRegion.jsp");
        rd.forward(request, response);
    }

    private void list(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<UserAccount> user = this.dao.select("UserAccount");
        request.setAttribute("UserAccount", user);
        RequestDispatcher rd = request.getRequestDispatcher("listRegion.jsp");
        rd.forward(request, response);
    }

    public int max() {
        if (dao.getNewId("UserAccount", "id") == null) {
            int id = 1;
            return id;
        } else {
            String a = "" + dao.getNewId("UserAccount", "id") + "";
            int max = Integer.parseInt(a);
            int newId = max + 1;

            return newId;

        }
    }
}
