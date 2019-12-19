<%-- 
    Document   : login
    Created on : Dec 13, 2019, 2:32:46 PM
    Author     : Elsa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="assets/login/header.jsp"></jsp:include>

    <title>Login</title>

<body class="animsition">
    <div class="page-wrapper">
        <div class="page-content--bge5">
            <div class="container">
                <div class="login-wrap">
                    <div class="login-content">
                        <div class="login-logo">
                            <a href="#">
                                <img src="assets/assets/images/icon.png" width="80px" height="80px">
                            </a>
                        </div>
                          <div class="flash-data" data-flashdata="<%= request.getAttribute("flash")%>"> 
                        <div class="message-data" data-message="<%= request.getAttribute("message")%>"> 
                            <script>
                                const flashdata = $('.flash-data').data('flashdata');
                                const message = $('.message-data').data('message');
                                if (flashdata === "Registered") {
                                    swal({
                                        title: 'Success ' + flashdata,
                                        text: 'Cek your email to activation your account',
                                        type: 'success'
                                    });
                                } else if (flashdata === "Failed") {
                                    if (message == "status") {
                                        swal({
                                            title: 'Information',
                                            text: 'Your Account is not active',
                                            text: 'Cek your email to activation your account',
                                            type: 'warning'
                                        });
                                    } else if (message == "password") {
                                        swal({
                                            title: 'Information',
                                            text: 'Your Password is not correect',
                                            type: 'warning'
                                        });
                                    } else if (message == "user") {
                                        swal({
                                            title: 'Information',
                                            text: 'Account is not registered',
                                            type: 'warning'
                                        });
                                    }
                                }
                            </script>
                        </div>
                             <div class="login-form">
                            <form action="userAccountServlet?action=login" method="post">
                                <div class="form-group">
                                    <% String name;
                                        String cekname = request.getParameter("username");
                                        if (cekname == null) {
                                            name = "";
                                        } else {
                                            name = cekname;
                                        }
                                    %>
                                    <input class="au-input au-input--full" type="text" id="username" name="username" value="<%= name%>" placeholder="Username" required>
                                </div>
                                <div class="form-group">
                                    <input class="au-input au-input--full" type="password" name="password" placeholder="Password" required>
                                </div>
                               
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">sign in</button>
                            </form>
                            <div class="register-link">
                                <p>
                                    Don't you have account?
                                    <a href="register.jsp">Sign Up Here</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
<jsp:include page="assets/login/footer.jsp"></jsp:include>

</body>

</html>