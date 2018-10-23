<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>SB Admin</title>
  <!-- Bootstrap core CSS-->
  <link href="../resources/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="../resources/admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="../resources/admin/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="../resources/admin/css/sb-admin.css" rel="stylesheet">
   	<script src="../resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="../resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="../resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="../resources/admin/vendor/datatables/jquery.dataTables.js"></script>
    <script src="../resources/admin/vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="../resources/admin/js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="../resources/admin/js/sb-admin-datatables.min.js"></script>
    <script src="../resources/ck/ckeditor/ckeditor.js"></script>
    <!-- 체크박스-->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

	
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<%@ include file="../top/top2.jspf" %>
  <!-- Navigation-->
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">JEJULANTIS</a>
        </li>
        <li class="breadcrumb-item active">보험관리</li>
      </ol>
      <!-- Example DataTables Card-->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i>보험관리</div>
        <div class="card-body">
        <div class="table-responsive">
        	<c:forEach items="${insuranceContent}" var="insuranceContent" varStatus="status">
		    	<table border="0" width="100%"  cellpadding="0" cellspacing="0">
<!-- 					<tr style="color:#808080;font-size:12pt">			 -->
<!-- 						<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">보험코드</th> -->
<!-- 						<th  width="35%" class="text-left"> -->
<%-- 							${insuranceContent.insurance_no} --%>
<!-- 						</th> -->
<!-- 						<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">지점코드</th> -->
<!-- 						<th  width="35%" class="text-left"> -->
<%-- 							${insuranceContent.branch_no} --%>
<!-- 						</th> -->
<!-- 					</tr> -->
<!-- 					<tr style="color:#808080;font-size:12pt"> -->
<!-- 						<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">차종상세코드</th> -->
<!-- 						<th  width="35%" class="text-left"> -->
<%-- 							${insuranceContent.car_kind_no} --%>
<!-- 						</th> -->
<!-- 						<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">차종코드</th> -->
<!-- 						<th  width="35%" class="text-left"> -->
<%-- 							${insuranceContent.car_no} --%>
<!-- 						</th> -->
<!-- 					</tr> -->
					<tr style="color:#808080;font-size:12pt">
						<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">지점명</th>
						<th  width="35%" class="text-left">
							${insuranceContent.branch_name}
						</th>
						<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">차종명</th>
						<th  width="35%" class="text-left">
							${insuranceContent.car_name}
						</th>
					</tr>
					<tr style="color:#808080;font-size:12pt">			
						<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">보험명</th>
						<th  width="35%" class="text-left">
							${insuranceContent.insurance_name}
						</th>
						<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">보험료</th>
						<th  width="35%" class="text-left">
							${insuranceContent.insurance_price}
						</th>
					</tr>
					<tr style="color:#808080;font-size:12pt">			
						<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">보상한도</th>
						<th  width="35%" class="text-left">
							${insuranceContent.insurance_limit}
						</th>
						<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">자가부담</th>
						<th  width="35%" class="text-left">
							${insuranceContent.insurance_burden_price}
						</th>
					</tr>
					<tr style="color:#808080;font-size:12pt">			
						<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">규정나이</th>
						<th  width="35%" class="text-left">
							${insuranceContent.insurance_limit_age}
						</th>
						<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">규정경력</th>
						<th  width="35%" class="text-left">
							${insuranceContent.insurance_limit_carrier}
						</th>
					</tr>
					<tr style="font-size:10pt" height="60px">
						<td align="center"></td>
						<td align="right">
							<button type="button" class="btn btn-primary"><a href="insuranceList.do?manager_id=${managerlog.manager_id}" style="color:white">목록</a></button>
						</td>
					</tr>
				</table>
			</c:forEach>
	    </div>
	    </div>
    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
    </div>
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © Your Website 2018</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="login.do">Logout</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript-->

  </div>
</body>

</html>
