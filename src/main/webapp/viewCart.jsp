<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>

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
<!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-light">
        <div class="container-fluid">
          <a class="navbar-brand" href="index.html"><b>Fashion</b></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="index.html">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="viewProducts.jsp">Product List</a>
              </li>
              <li class="nav-item">
                <a href="viewCart.jsp" class="nav-link">Shopping Cart</a>
              </li>

            </ul>
            <form class="d-flex" role="search">
              <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
          </div>
        </div>
      </nav>
    <!-- Navbar End -->
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
url="jdbc:mysql://localhost/ecommerce" user="root" password=""></sql:setDataSource>
<sql:query dataSource="${db}" var="rs">select * from cart</sql:query>
<jsp:include page="cart.html"></jsp:include>  


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
                            <td><a href="removeCart.jsp?id=${table.id}">Remove From Cart</a></td>  
                            
                        </tr>
                        </c:forEach>
                        
                        </tbody>
                </table>
            </div>
            </div>
            </div>
  <!-- Footer Start -->
    <div class="container-fluid bg-light text-dark mt-5 pt-5">
        <div class="row px-xl-5 pt-5">
            <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                <a href="index.html" class="text-decoration-none">
                    <h1 class="mb-4 display-5 font-weight-semi-bold">Fashion</h1>
                </a>
                <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>fashion@gmail.com</p>
                <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>1231231234</p>
            </div>
            <div class="col-lg-8 col-md-12">
                <div class="row">
                    <div class="col-md-4 mb-5">
                        <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                            <a class="text-dark mb-2" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>                            
                            

                          </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        
                    </div>

                  </div>
            </div>
        </div>
        <p class="text-dark mb-2 text-center" href="#">&copy;All Rights Reserved</p>
    </div>

    <!-- Footer End -->
                        
</body>
</html>
