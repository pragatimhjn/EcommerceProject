<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.java.ProductDAO"%>  

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
int i=ProductDAO.save(p);  
if(i>0){  
response.sendRedirect("viewProducts.jsp");  
}else{  
response.sendRedirect("error.jsp");  
}  
%>  

</body>
</html>
