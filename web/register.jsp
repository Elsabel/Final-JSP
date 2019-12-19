<%-- 
    Document   : registrasi
    Created on : Dec 13, 2019, 2:37:32 PM
    Author     : Elsa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="assets/login/header.jsp"></jsp:include>
  <!-- Title Page-->
    <title>Register</title>

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
                            if (flashdata) {
                                   if (message=="username") {
                                swal({
                                    title: flashdata + ' Register',
                                    text: 'Username has been use by other people',
                                    type: 'warning'
                                    });
                                }else if (message=="password") {
                                swal({
                                    title: flashdata + ' Register',
                                    text: 'Password not same, please retype your password',
                                    type: 'warning'
                                    });  
                                    } 
                                };
                        </script>
                    </div>
                        <div class="login-form">
                           <form action="userAccountServlet?action=insert" method="post">
                            <div class="form-group">
                                 <% String name;
                                String cekname = request.getParameter("username");
                                    if (cekname==null) {
                                            name = "";
                                        }else{
                                        name = cekname ;
                                    }
                                 %>
                                 <input class="au-input au-input--full" type="text" id="username" name="username" value="<%= name %>" placeholder="Username">
                            </div>
                            <div class="form-group">
                                 <% String mail;
                                String cekMail = request.getParameter("email");
                                    if (cekMail==null) {
                                            mail = "";
                                        }else{
                                        mail = cekMail ;
                                    }
                                 %>
                                <input class="au-input au-input--full" type="email" id="email" name="email" value="<%= mail %>" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <input class="au-input au-input--full" type="password" id="password" name="password" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <input class="au-input au-input--full" type="password" id="password1" name="password1" placeholder="Retype Password">
                            </div>
                            <div class="login-checkbox">
                                
                            </div>
                            <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">register</button>
                            
                        </form>
                            <div class="register-link">
                                <p>
                                Already have account?
                                <a href="login.jsp">Sign In</a>
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