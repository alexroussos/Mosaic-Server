<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
  <jsp:include page="head.jsp" /> <%-- has author, keywords, charset, title, css --%>
  <title>404</title>
</head>
<body>
  <jsp:include page="header.jsp" />
  <div class="container">
    <h2>The page you requested does not exist.</h2>
  </div>
  <jsp:include page="footer.jsp" /> 
</body>
</html>

