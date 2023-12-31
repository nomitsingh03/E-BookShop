<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid bg-custom custom-1"></div>
<div class="container-fluid p-3 ">
  <div class="row justify-content-center">
  <div class="col-md-3 ">
    <h3 class="fst-italic fw-bold ht text-custom"><i class="fa-solid fa-book-open"></i> KITABEN</h3>
  </div>
  <div class="col-md-6">
    <form class="d-flex">
        <input class="form-control me-6 me-4 " type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-secondary me-7" type="submit">Search</button>
      </form>
    </div>
    
    <c:if test="${not empty userObject }">
    <div class="col-md-3 ">
    <a href="checkout.jsp" class="btn btn-secondary ht lr ms-2"><i class="fa-solid fa-cart-shopping"></i></a>
      <a href="login.jsp" class="btn btn-success ht lr ms-2"><i class="fa-solid fa-user"></i> ${userObject.name}</a>
      <a href="logout" class="btn btn-primary ht lr ms-1">Logout <i class="fa-solid fa-right-from-bracket"></i></a>
    </div>
    </c:if>
    
    <c:if test="${empty userObject }">
    <div class="col-md-3 ">
      <a href="login.jsp" class="btn btn-success ht lr ms-2">Login <i class="fa-solid fa-arrow-right"></i></a>
      <a href="register.jsp" class="btn btn-primary ht lr ms-1"><i class="fa-solid fa-user-plus"></i> Register</a>
    </div>
    </c:if>
    
  </div>
  </div>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom sticky-sm-top ">
  <div class="container-fluid">
    <a class="navbar-brand ht" href="#"><i class="fa-solid fa-house"></i></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="allrecentBooks.jsp"><i class="fa-solid fa-book-open-reader"></i> Recent Book</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="allnewbook.jsp"><i class="fa-solid fa-book"></i> New Book</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="allOldBooks.jsp"><i class="fa-solid fa-book"></i> Old Book</a>
        </li>
      </ul>
      <form class="d-flex ">
        
        <a href="" class="btn btn-light bg-light text-dark ht me-3" type="submit"><i class="fa-solid fa-user"></i> Contact Us </a>
        <a href="setting.jsp" class="btn btn-light bg-light text-dark ht me-3" type="submit">Setting <i class="fa-solid fa-gear"></i></a>
      </form>
    </div>
  </div>
</nav>

