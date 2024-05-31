<%@page import="com.entity.Faculty"%>
<%@page import="com.dao.FacultyDao"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- jstl jar -->
   <%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Faculty</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
     body{
        background-color:yellow;
            margin-top:20px;
      
     }
   </style>
</head>
<body>
<c:if test="${userobj.role ne 'admin' }"> 
   <c:redirect url="login.jsp"></c:redirect>
  </c:if>
<%@include file="all_component/navbar.jsp"%>


  <div class="container fluid">
		<div class="row ">
			<div class="col-md-12 ">
				<h5 class="text-center text-primary">All Faculty &nbsp;&nbsp;<i class="fa-solid fa-users"></i></h5>
                         
                          <c:if test="${not empty succMsg }">  <!--Jstl jar codes  -->     
					        <div class="alert alert-success text-center" role="alert">${succMsg}</div>
							<c:remove var="succMsg"/>
							
    					</c:if>
				<div class="card main">
					<div class="card-body">

           <br>
			<%
				FacultyDao dao = new FacultyDao(DBConnect.getConn());
				List<Faculty> list = dao.getAllfaculty();
				for (Faculty j : list) {
			%>
				<div class="card mt-1 main1">
					<div class="card-body"><h6>
							Joining Date: <%=j.getPdate()%></h6>
						<div class="text-center text-primary">
							<hr class="featurette-divider">
						</div>

						<h6>Faculty Name: : &nbsp;<i class="fa-solid fa-user-secret"></i> <%=j.getName()%></h6>

						<%
						if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {
						%>
						<p>Faculty Details:<br> <%=j.getDescription()%></p>
						<%
						} else {
						%>
						<p><%=j.getDescription().substring(0, 120)%>...
						</p>
						<%
						}
						%>
						
	
	
	
	
	
	
						<br>
						<div class="form-row d-flex">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm "
									value="Location: <%=j.getLocation()%>" readonly>
							</div>
							&nbsp;
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm "
									value="Qualification: <%=j.getQualification()%>" readonly>
							</div>
							&nbsp;
							
						</div>
						<br>
						<div class="form-row d-flex">
						  <div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm "
									value="Branch.HOD: <%=j.getBranch()%>" readonly>
							</div>
							&nbsp;
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm "
									value="Email: <%=j.getEmail()%>" readonly>
							</div>
							</div>
							
						</div>
						<br>
						<c:if test="${userobj.role eq 'admin' }">
						<div class="text-center ">
							<a href="Edit_Faculty.jsp?id=<%=j.getId() %>" class="btn btn-sm bg-success text-white">Edit&nbsp;<i class="fa-solid fa-user-pen"></i></a>        

							&nbsp; <a href="deletefaculty?id=<%=j.getId() %>" class="btn btn-sm bg-danger text-white"><i class="fa-solid fa-trash"></i>&nbsp;delete</a>
						</div>
						</c:if>
					</div>
					
					 <%
			           	}
			         %>
					
				</div>
     <br>
			
  
  </div>
  </div>
  </div>
  </div>

    	   

</body>
</html>