<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.java.Product,com.java.ProductDAO"%>  
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

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


</body>
</html>