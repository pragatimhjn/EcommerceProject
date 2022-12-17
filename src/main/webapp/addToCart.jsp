<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.java.Product,com.java.ProductDAO"%>  
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
 
<%  
String id=request.getParameter("id");  
Product p=ProductDAO.getRecordById(Integer.parseInt(id));  
%>  
        <div class="container-fluid pt-5">
            <div class=" row px-xl-5">
                <div class="col-lg-12 mb-5">
                    <div class="contact-form ">
                        <div id="success"></div>
                        <form action="cart.jsp" method="post">
                            <div class="control-group">
                                <input type="text" class="form-control" id="name" placeholder="Name"
                                    required="required"  name="name" value="<%= p.getName()%>" />
                                <p class="help-block text-danger"></p>
                            </div>
                                                       <div class="control-group">
                                <input type="text" class="form-control" id="category" placeholder="Category"
                                    required="required"  name="category" value="<%= p.getCategory()%>"/>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <input type="text" class="form-control" id="price" placeholder="Price"
                                    required="required"  name="price" value="<%= p.getPrice()%>" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <input type="text" class="form-control" id="qty" placeholder="Quantity"
                                    required="required"  name="qty" value="<%= p.getQty()%>"/>
                                <p class="help-block text-danger"></p>
                            </div>

                            <div class="text-center">
                                <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">Add
                                    </button>
                            </div>
                        </form>
                    </div>
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
