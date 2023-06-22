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
    <div class="col-md-3 ">
    <c:if test="${not empty userObject }">
    <a href="home.jsp" class="btn btn-success"><i class="fa-solid fa-user"></i> ${userObject.name}</a>
    <button class="btn btn-primary ht lr ms-1" data-bs-toggle="modal" data-bs-target="#exampleModal">Logout <i class="fa-solid fa-right-from-bracket"></i></button>
    </c:if>
    <c:if test="${empty userObject}">
      <a href="../login.jsp" class="btn btn-success ht lr ms-2">Login <i class="fa-solid fa-arrow-right"></i></a>
      <a href="../register.jsp" class="btn btn-primary ht lr ms-1"><i class="fa-solid fa-user-plus"></i> Register</a>
      </c:if>
    </div>
  </div>
  </div>
 

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center">
        <h4>Do you want Logout</h4>
      
      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <a href="../logout" type="button" class="btn btn-success">Logout</a>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom sticky-sm-top ">
  <div class="container-fluid">
    <a class="navbar-brand ht" href="../index.jsp"><i class="fa-solid fa-house"></i></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="../index.jsp"><i class="fa-solid fa-book"></i> Home</a>
        </li>
      </ul>
      
    </div>
  </div>
</nav>

