<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.java.ProductDAO"%>  

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fashion E-commerce</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

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
