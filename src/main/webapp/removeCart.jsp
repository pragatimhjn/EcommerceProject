<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.java.Product,com.java.ProductDAO"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="p" class="com.java.Product"></jsp:useBean>  
<jsp:setProperty property="*" name="p"/>  
<%  
ProductDAO.deleteFromCart(p);  
response.sendRedirect("viewCart.jsp");  
%>  



</body>
</html>