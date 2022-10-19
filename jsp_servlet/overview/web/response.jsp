<%--
  Created by IntelliJ IDEA.
  User: gennect_3
  Date: 10/19/22
  Time: 7:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("UTF-8");
<<<<<<< HEAD:jsp_servlet/jsp_overview/web/response.jsp
=======

>>>>>>> origin/master:jsp_servlet/overview/web/response.jsp
  String name = "";
  if (request.getParameter("name") != null) {
    name = request.getParameter("name");
  }
<<<<<<< HEAD:jsp_servlet/jsp_overview/web/response.jsp
=======

>>>>>>> origin/master:jsp_servlet/overview/web/response.jsp
  String age = "";
  if (request.getParameter("age") != null) {
    age = request.getParameter("age");
  }
%>

<html>
<head>
  <meta charset="UTF-8">
  <title>Request</title>
  <link href="./css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<header><jsp:include page="header.jsp"/></header>

<main>
  <h1>RESPONSE</h1>
  <div>
    <p>성함: <%=name%></p>
    <p>나이:  <%=age%></p>
  </div>
</main>

<footer class="main__nav__next"><jsp:include page="footer.jsp"/></footer>
</body>
<<<<<<< HEAD:jsp_servlet/jsp_overview/web/response.jsp
</html>
=======
</html>
>>>>>>> origin/master:jsp_servlet/overview/web/response.jsp
