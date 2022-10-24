<%@ page import="util.Status" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP</title>
    <link href="./css/style.css" rel="stylesheet" type="text/css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<header>
    <jsp:include page="header.jsp"/>
</header>
<%

    if (session.getAttribute("login") != null) {
        if (session.getAttribute("login") == Status.FAIL) {
%>
<script>alert("Login Fail!")</script>
<%

} else if (session.getAttribute("login") == Status.NULL) {

%>
<script>alert("Sign Up First.")</script>
<%
        }
        session.removeAttribute("login");
    }
%>

<%

    if (session.getAttribute("signup") != null) {

        if (session.getAttribute("signup") == Status.SUCCESS) {

%>
<script>alert("Sign Up Success!")</script>
<%
        }
        session.removeAttribute("signup");
    }
%>

<%-- 쿠키를 통해 자동 로그인 시도 --%>
<%

    String uId = "";
    String uPw = "";
    String uHashPw = "";

    Cookie[] cookies = request.getCookies();
    boolean isCookieValue = false;
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName() != null) {
                if (cookie.getName().equals("COOKIE_ID")) {
                    uId = cookie.getValue();
                } else if (cookie.getName().equals("COOKIE_PW")) {
                    uPw = cookie.getValue();
                } else if (cookie.getName().equals("COOKIE_HASH_PW")) {
                    uHashPw = cookie.getValue();
                    isCookieValue = true;
                }
            }
        }
    }
    if(!uId.equals("") && !uPw.equals("")&& !uHashPw.equals("")){
        response.sendRedirect("./DoAutoLoginServlet");
    }

//    String uPwView = "";
//    if (isCookieValue) {
//        uPwView = uPw;
//    }

%>

<script>
    //input tag에 새로운 입력이 생기면 #isChanged value 가 true
    //쿠키에서 패스워드를 자동완성을 했는데 추가적인 패스워드 입력이 있을 수 있음
    //쿠키에서 패스워드를 자동완성 했기 떄문에 바로 로그인 success하는것을 방지

    $(() => {
        $("#uPwView").change(() => {
            $("#isChanged").val("true");
        });
    });
</script>

<main>
    <h1>LOGIN</h1>
    <div>
        <form id="login__form" method="post" action="./DoLoginServlet">
            <div class="form__list">
                <label for="uId">ID: </label>
                <%-- key-value (name-value)   --%>
                <input type="text" id="uId" name="uId" placeholder="INPUT YOUR ID" required/>
            </div>

            <div class="form__list">
                <label for="uPw">PASSWORD: </label>
                <input type="password" id="uPw" name="uPw" placeholder="INPUT YOUR PASSWORD" required/>
            </div>

            <div class="checkbox__form">
                <label for="save">AUTO LOGIN: </label>
                <input id="save" type="checkbox" name="save"/>
            </div>
            <input id="submit" type="submit" name="submit" value="Submit">
        </form>
    </div>
</main>

<footer class="main__nav__next">
    <jsp:include page="footer.jsp"/>
</footer>
</body>
</html>
