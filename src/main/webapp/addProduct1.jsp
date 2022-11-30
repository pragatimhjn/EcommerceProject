<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="css//owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->

    <link href="css//style.css" rel="stylesheet">

</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
url="jdbc:mysql://localhost/ecommerce" user="root" password=""></sql:setDataSource>

<sql:query dataSource="${db}" var="rs">select * from products</sql:query>


 <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>ID</th>
                            <th>NAME</th>
                            <th>CATEGORY</th>
                            <th>PRICE</th>
                            <th>QUANTITY</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    <c:forEach var="table" items="${rs.rows}">
                    
                        <tr>
                            <td class="align-middle"><c:out value="${table.id}"/> </td>
                            <td class="align-middle"><c:out value="${table.name}"/></td>
                            <td class="align-middle"><c:out value="${table.category}"/></td>
                            <td class="align-middle"><c:out value="${table.price}"/></td>
                            <td class="align-middle"><c:out value="${table.qty}"/></td>
                        </tr>
                        </c:forEach>
                        
                                            </tbody>
                </table>
            </div>
            </div>
            </div>
       
</body>
</html>