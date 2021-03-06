<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<%@ include file="../top/top2.jspf" %>
  <!-- Navigation-->
	<script>
          function check(){
        	         	  
            if(f.branch_name.value ==""){
               alert("업체명을 채워주세요");
               f.branch_name.focus();
               return;
            }
            if(f.branch_tel.value ==""){
                alert("업체번호를 채워주세요");
                f.branch_tel.focus();
                return;
             }
            if(f.branch_fax.value ==""){
                alert("업체팩스를 채워주세요");
                f.branch_fax.focus();
                return;
             }
            if(f.branch_local.value ==""){
                alert("업체주소를 채워주세요");
                f.branch_local.focus();
                return;
             }
            if(f.branch_business_no.value ==""){
                alert("사업자번호를 채워주세요");
                f.branch_business_no.focus();
                return;
             }
            if(f.branch_boss.value ==""){
                alert("대표자명을 채워주세요");
                f.branch_boss.focus();
                return;
             }
            if(f.branch_bankaccount.value ==""){
                alert("계좌번호를 채워주세요");
                f.branch_bankaccount.focus();
                return;
             }
            if(f.branch_member_name.value ==""){
                alert("담당자명을 채워주세요");
                f.branch_member_name.focus();
                return;
             }
            if(f.branch_member_tel.value ==""){
                alert("담당자전화번호1을 채워주세요");
                f.branch_member_tel.focus();
                return;
             }
            if(f.branch_email.value ==""){
                alert("담당자이메일을 채워주세요");
                f.branch_email.focus();
                return;
             }
            if(f.branch_comfee.value ==""){
                alert("수수료율을 채워주세요");
                f.branch_comfee.focus();
                return;
             }
            if(f.branch_rating.value ==""){
                alert("업체평점을 채워주세요");
                f.branch_rating.focus();
                return;
             }
            var isChecked = "";
      	  
        	if($("input:checkbox[id='topYn']").is(":checked")){	// 쳬크 되어있으면
        		isChecked = "Y"
        	} else {
        		isChecked = "N"
        	}
        	
        	jQuery("#branch_today").val(isChecked);
            document.f.submit();
         }
     </script>
     <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	 <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0cfd90b11f1fceed206c4f201756973&libraries=services"></script>
     <script>
		var mapContainer = document.getElementById('map')//, // 지도를 표시할 div
		var geocoder = new daum.maps.services.Geocoder();
		function DaumPostcode() {
		   new daum.Postcode({
		       oncomplete: function(data) {
		           // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		           var fullAddr = data.address; // 최종 주소 변수
		           var extraAddr = ''; // 조합형 주소 변수
		           // 기본 주소가 도로명 타입일때 조합한다.
		           if(data.addressType === 'R'){
		               //법정동명이 있을 경우 추가한다.
		               if(data.bname !== ''){
		                   extraAddr += data.bname;
		               }
		               // 건물명이 있을 경우 추가한다.
		               if(data.buildingName !== ''){
		                   extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		               }
		               // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		               fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		           }
		           // 주소 정보를 해당 필드에 넣는다.
		           document.getElementById("address").value = fullAddr;
		           // 주소로 상세 정보를 검색
		           geocoder.addressSearch(data.address, function(results, status) {
		               // 정상적으로 검색이 완료됐으면
		               if (status === daum.maps.services.Status.OK) {
		                    var result = results[0]; //첫번째 결과의 값을 활용
		                    // 해당 주소에 대한 좌표를 받아서
		                    var coords = new daum.maps.LatLng(result.y, result.x);
		                    //alert(coords);
		                    result.y
		                    var lan = ""+result.y;
		                 	var lon = ""+result.x;
		                 	document.getElementById("branch_lati").value = lan;
		                 	document.getElementById("branch_long").value = lon;
		   					//alert(lan);
		               }
		           });
		       }
		   }).open();
		}
	  </script>
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">JEJULANTIS</a>
        </li>
        <li class="breadcrumb-item active">업체관리</li>
      </ol>
      <!-- Example DataTables Card-->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i>업체관리</div>
        <div class="card-body">
          <div class="table-responsive">
          <form name="f" action="branchModify.do" method="post">
          	<input type="hidden" name="branch_today" id="branch_today"/>
          	<c:forEach items="${subject}" var="subject">
            <table border="0" width="100%"  cellpadding="0" cellspacing="0">
				<h3 style="color:#007bff">업체수정</h3>
				<tr style="color:#808080;font-size:12pt">			
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">업체명<a style="color:red">*</a></th>
					<th  width="35%" class="text-left">
						<input name="branch_name"type="text" size="30" value='${subject.branch_name}'>
						<input type="hidden" name="branch_lati" id="branch_lati"/>
						<input type="hidden" name="branch_long" id="branch_long"/>
						<input type="hidden" value='${subject.branch_no}' name="branch_no">
					</th>
				</tr>
				<tr style="color:#808080;font-size:12pt">			
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">업체전화번호<a style="color:red">*</a></th>
					<th  width="35%" class="text-left">
						<input name="branch_tel"type="text" size="30" value='${subject.branch_tel}'>
					</th>
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">업체팩스<a style="color:red">*</a></th>
					<th  width="35%" class="text-left">
						<input name="branch_fax"type="text" size="30" value='${subject.branch_fax}'>
					</th>
				</tr>
				<tr style="color:#808080;font-size:12pt">			
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">업체주소<a style="color:red">*</a></th>
					<th  width="35%" class="text-left">
						<input name="branch_local"type="text" size="30" value='${subject.branch_local}' id="address">
						<input type="button" onclick="DaumPostcode()" value="주소 검색">
					</th>
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">업체평점<a style="color:red">*</a></th>
					<th  width="35%" class="text-left">
						<input name="branch_rating" type="text" size="30" value='${subject.branch_rating}'>
					</th>
				
				</tr>
				<tr style="color:#808080;font-size:12pt">			
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">사업자번호<a style="color:red">*</a></th>
					<th  width="35%" class="text-left">
						<input name="branch_business_no"type="text" size="30" value='${subject.branch_business_no}'>
					</th>
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">대표자명<a style="color:red">*</a></th>
					<th  width="35%" class="text-left">
						<input name="branch_boss"type="text" size="30" value='${subject.branch_boss}'>
					</th>
				</tr>
				<tr style="color:#808080;font-size:12pt">			
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">계좌번호<a style="color:red">*</a></th>
					<th  width="35%" class="text-left">
						<input name="branch_bankaccount"type="text" size="30" value='${subject.branch_bankaccount}'>
					</th>
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">담당자명<a style="color:red">*</a></th>
					<th  width="35%" class="text-left">
						<input name="branch_member_name"type="text" size="30" value='${subject.branch_member_name}'>
					</th>
				</tr>
				<tr style="color:#808080;font-size:12pt">			
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">담당자전화번호1<a style="color:red">*</a></th>
					<th  width="35%" class="text-left">
						<input name="branch_member_tel"type="text" size="30" value='${subject.branch_member_tel}'>
					</th>
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">담당자전화번호2</th>
					<th  width="35%" class="text-left">
						<input name="branch_member_tel2"type="text" size="30" value='${subject.branch_member_tel2}'>
					</th>
				</tr>
				<tr style="color:#808080;font-size:12pt">			
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">업체로고</th>
					<th  width="35%" class="text-left">
						<input name="branch_logo"type="text" size="30" value='${subject.branch_logo}'>
					</th>
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">담당자이메일<a style="color:red">*</a></th>
					<th  width="35%" class="text-left">
						<input name="branch_email"type="text" size="30" value='${subject.branch_email}'>
					</th>
				</tr>
				<tr style="color:#808080;font-size:12pt">			
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">셔틀소요시간</th>
					<th  width="35%" class="text-left">
						<input name="branch_bustime"type="text" size="30" value='${subject.branch_bustime}'>
					</th>
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">당일예약가능여부<a style="color:red">*</a></th>
					<th  width="35%" class="text-left">
						<input type="checkbox" id="topYn" name="topYn" <c:if test="${subject.branch_today eq 'Y' }">checked</c:if>>가능
					</th>
				</tr>
				<tr style="color:#808080;font-size:12pt">			
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">셔틀탑승장소</th>
					<th  width="35%" class="text-left">
						<input name="branch_busspot"type="text" size="30" value='${subject.branch_busspot}'>
					</th>
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">당일예약가능시간</th>
					<th  width="35%" class="text-left">
						<input name="branch_todaytime"type="text" size="30" value='${subject.branch_todaytime}'>
					</th>
				</tr>
				<tr style="color:#808080;font-size:12pt">			
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">셔틀간격</th>
					<th  width="35%" class="text-left">
						<input name="branch_busgap"type="text" size="30" value='${subject.branch_busgap}'>
					</th>
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">수수료율<a style="color:red">*</a></th>
					<th  width="35%" class="text-left">
						<input name="branch_comfee"type="text" size="30" value='${subject.branch_comfee}'>
					</th>
				</tr>
				<tr style="color:#808080;font-size:12pt">			
					<th  height="60px" width="10%" class="text-center" style="background-color: #fafafa">일반규정</th>
					<th  width="35%" class="text-left" colspan="3">
						<textarea class="ckeditor" rows="8" cols="110" name="branch_rule" id="branch_rule">${subject.branch_rule}</textarea>
					</th>
				</tr>
				<tr style="font-size:10pt" height="60px">
					<td align="center"></td>
					<td align="right">
					</td>
					<td align="center"></td>
					<td align="right">
						<button type="button" class="btn btn-primary"><a href="enter.do" style="color:white">목록</a></button>
						<button type="button" class="btn btn-primary" onclick="check()">수정완료</button>&nbsp;&nbsp;&nbsp;
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</td>
				</tr>
			</table>
			</c:forEach>
			</form>
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
   <script>
	    CKEDITOR.replace('announ_content',{
	            /* toolbar: 'Full',
	            uiColor: '#9AB8F3', */
	        }
	    );
	</script>
  </div>
</body>

</html>
