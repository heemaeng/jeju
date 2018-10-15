<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
  	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Tour Template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />

  <!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="resources/rentcar/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="resources/rentcar/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="resources/rentcar/css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="resources/rentcar/css/magnific-popup.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="resources/rentcar/css/flexslider.css">

	<!-- Owl Carousel -->
	<link rel="stylesheet" href="resources/rentcar/css/owl.carousel.min.css">
	<link rel="stylesheet" href="resources/rentcar/css/owl.theme.default.min.css">
	
	<!-- Date Picker -->
	<link rel="stylesheet" href="resources/rentcar/css/bootstrap-datepicker.css">
	<!-- Flaticons  -->
	<link rel="stylesheet" href="resources/rentcar/fonts/flaticon/font/flaticon.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="resources/rentcar/css/style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<!-- Modernizr JS -->
	<script src="resources/rentcar/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	<!-- jQuery -->
	<script src="resources/rentcar/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="resources/rentcar/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="resources/rentcar/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="resources/rentcar/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="resources/rentcar/js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="resources/rentcar/js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="resources/rentcar/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/rentcar/js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="resources/rentcar/js/bootstrap-datepicker.js"></script>
	<!-- Stellar Parallax -->
	<script src="resources/rentcar/js/jquery.stellar.min.js"></script>

	<!-- Main -->
	<script src="resources/rentcar/js/main.js"></script>
		<script src="resources/rentcar/js/sidebarsearchcar.js"></script>
<script>
	function settime(){
		if(!${requirements.errorFlag}){
		if(${requirements.searchFlag}){
 			var sel = document.getElementById("Checkintime");
			var val;
			for(i=0; i<sel.options.length; i++) {
				if(sel.options[i].value == "${requirements.rent_reserve_startTime}") {
					val = sel.options[i];
					val.selected="true";
					break;
				}
			}
			sel = document.getElementById("Checkouttime");
			for(i=0; i<sel.options.length; i++) {
				if(sel.options[i].value == "${requirements.rent_reserve_endTime}") {
					val = sel.options[i];
					val.selected="true";
					break;
				}
			}
			sel = document.getElementById("carname");
			if("${requirements.car_name}"!="")
			sel.value="${requirements.car_name}";
		}else{
			alert("검색결과가 없습니다.");
			location.href="car.do";
		}
		}else{
			alert("${requirements.errorMsg}");
			location.href="car.do";
		}
	}
	function selectgoods(goodstype){
		document.getElementById("goodstype").value = goodstype;
		document.getElementById("reservform").submit();
	}
	</script>
	</head>
	<body onload="settime()">
	<%@ include file="../top/top.jspf" %>
	<div class="colorlib-loader"></div>

	<div id="page">
		<aside id="colorlib-hero">
			<div class="flexslider">
				<ul class="slides">
			   	<li style="background-image: url(resources/rentcar/images/cover-img-4.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
				   				<div class="slider-text-inner text-center">
				   					<h2>by colorlib.com</h2>
				   					<h1>Hotel Overview</h1>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			  	</ul>
		  	</div>
		</aside>
		<div id="board">
			<table border="0" width="100%"  cellpadding="0" cellspacing="0">	
				<tr style="color:#8c9094;background-color:white;font-size:10pt">			
					<th  height="60px" class="text-center" width="15%">1. 차량/대여업체 선택</th>
					<th  class="text-center" width="10%" style="color:#ffdd01">2. 요금선택</th>
					<th  class="text-center" width="15%">3. 고객 정보 입력 & 결제</th>
					<th  class="text-center" width="10%">4. 예약 완료</th>
					<th  class="text-center"></th>
				</tr>
			</table>
		</div>				
		
		<div class="colorlib-wrap" style="height:800px;background-color:#eef2f5">
			<div class="container">
				<div class="row">
					<div class="col-md-9">
						<div class="row">
							<div class="wrap-division">
								<div class="row">
								<div class="col-md-6 col-sm-6 animate-box" style="width:100%;padding:0px">
									<table border="0" style="width:100%;height:50px">
									<tr>
										<td style="width:6%;background-color:black" align="center">
											<a class="glyphicon glyphicon-chevron-left" style="color:white" href="car.do"></a>
										</td>
										<td style="background-color:white">
											&nbsp;&nbsp;&nbsp;
											<span style="font-size:16pt">${requirements.rent_reserve_startDaterentcarview}</span>
											<span>${requirements.rent_reserve_startTime}</span>&nbsp;&nbsp;&nbsp;
											<span class="glyphicon glyphicon-arrow-right" style="color:black"></span>
											&nbsp;&nbsp;&nbsp;
											<span style="font-size:16pt">${requirements.rent_reserve_endDaterentcarview}</span>
											<span>${requirements.rent_reserve_endTime}</span>
										</td>
									</tr>
									</table></br>
								</div>
							</div>
						</div>
						</div>
						<div class="row">
							<div class="wrap-division">
								<div class="row">
								<div class="col-md-6 col-sm-6 animate-box" style="width:40%;padding:0px">
									<div class="hotel-entry" style="background-color:#f8fafb;padding:15px;height:410px"></br>
										<span style="color:black;font-size:18pt">${rentcar.car.car_name }</span><span style="color:black">(${rentcar.car.car_fuel })</span>
										<img width="100%" weight="200" src="resources/car/${rentcar.car.car_image}"/>
										<div class="desc">
											<p align="center" style="color:#0090f0"></p>
										</div>
										</br>
										<div class="desc">
											<p align="center">
												<span class="glyphicon glyphicon-road">${rentcar.car.car_type }</span>
												<span class="glyphicon glyphicon-user">${rentcar.car.car_passenger }인승</span>
												<span class="glyphicon glyphicon-tint">${rentcar.car.car_fuel }</span>
											</p>
										</div>
									</div>
								</div>

								<div class="col-md-6 col-sm-6 animate-box" style="padding:0px;width:60%">
									<div class="hotel-entry" style="background-color:white">
										<div class="desc" style="padding:15px;height:410px"></br>
											<span style="font-size:18pt;color:black">${rentcar.branch.branch_name }</span>
											
											<p class="star"><span><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i></span> 545 Reviews</p>
											<div id="board">
											<h5 style="font-weight: bold">대여 규정</h5>
												<table border="0" width="70%">
													<tr align="center" style="background-color: #fafafa;font-weight:bold">
														<td style="width:33%">나이</td>
														<td style="width:33%">운전경력</td>
														<td>면허종류</td>
													<tr>
													<tr align="center">
														<td>만 21세 이상</td>
														<td>1년 이상</td>
														<td>2종보통 이상</td>
													<tr>
												</table></br>
												<h5 style="font-weight: bold">${rentcar.insurance_name } 보험 규정</h5>
												<table border="0" width="70%">
													<tr align="center" style="background-color: #fafafa;font-weight:bold">
														<td style="width:33%">나이</td>
														<td style="width:33%">운전경력</td>
														<td style="background-color:white"></td>
													<tr>
													<tr align="center">
														<td>만 ${rentcar.insurance_limit_age }세 이상</td>
														<td>${rentcar.insurance_limit_carrier }년 이상</td>
														<td></td>
													<tr>
												</table></br>
												
												<table border="1" width="100%" height="100px">
													<tr>
													<th colspan="5" width="48%" style="border-right: hidden;border-left: hidden;border-top: hidden">보상한도</th>
													<th style="border-right: hidden;border-top: hidden;border-bottom: hidden"></th>
													<th width="48%" style="border-top: hidden;border-right: hidden">고객부담금</th>
													</tr>
													<tr align="center">
														<td style="color:white;background-color:black">100만원</td>
														<td>200만원</td>
														<td>300만원</td>
														<td>400만원</td>
														<td >무제한</td>
														<td style="border-bottom: hidden">&nbsp;</td>
														<td style="background-color:#2d2f3f;color:white;font-size:10pt">보상한도까지 수리비, 면책금, 휴차보상료 면제</td>
													<tr>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</div>
					</div>

					<!-- SIDEBAR-->
					<div class="col-md-3">
						<div class="sidebar-wrap">
							<div class="side search-wrap animate-box">
								<h3 class="sidebar-heading">차량검색</h3>
								<form action="car.do" method="post" class="colorlib-form" id="searchform" >
				              	<div class="row">
				                <div class="col-md-12">
				                  <div class="form-group">
				                    <label for="date">대여일</label>
				                    <div class="form-field">
				                      <i class="icon icon-calendar2"></i>
				                      <input type="text" id="date1" name="Checkindate" class="form-control date" placeholder="Check-in date" value="${requirements.rent_reserve_startDate }"/>
				                    </div>        
				                  </div>
				                </div>
				                <div class="col-md-12">
				                  <div class="form-group">
				                    <label for="guests">대여시간</label>
				                    <div class="form-field">
				                      <i class="icon icon-arrow-down3"></i>
				                      <select name="Checkintime" id="Checkintime" class="form-control">
				                        <option value="08:00" style="color:black">08:00</option>
				                        <option value="09:00" style="color:black">09:00</option>
				                        <option value="10:00" style="color:black">10:00</option>
				                        <option value="11:00" style="color:black">11:00</option>
				                        <option value="12:00" style="color:black">12:00</option>
				                        <option value="13:00" style="color:black">13:00</option>
				                        <option value="14:00" style="color:black">14:00</option>
				                        <option value="15:00" style="color:black">15:00</option>
				                        <option value="16:00" style="color:black">16:00</option>
				                        <option value="17:00" style="color:black">17:00</option>
				                        <option value="18:00" style="color:black">18:00</option>
				                        <option value="19:00" style="color:black">19:00</option>
				                        <option value="20:00" style="color:black">20:00</option>
				                      </select>
				                    </div>
				                  </div>
				                </div>
				                <div class="col-md-12">
				                  <div class="form-group">
				                    <label for="date">반납일</label>
				                    <div class="form-field">
				                      <i class="icon icon-calendar2"></i>
				                      <input type="text" id="date2" name="Checkoutdate" class="form-control date" placeholder="Check-out date" value="${requirements.rent_reserve_endDate }"/>
				                    </div>
				                  </div>
				                </div>
				                <div class="col-md-12">
				                  <div class="form-group">
				                    <label for="guests">반납시간</label>
				                    <div class="form-field">
				                      <i class="icon icon-arrow-down3"></i>
				                      <select name="Checkouttime" id="Checkouttime" class="form-control">
				                        <option value="08:00" style="color:black">08:00</option>
				                        <option value="09:00" style="color:black">09:00</option>
				                        <option value="10:00" style="color:black">10:00</option>
				                        <option value="11:00" style="color:black">11:00</option>
				                        <option value="12:00" style="color:black">12:00</option>
				                        <option value="13:00" style="color:black">13:00</option>
				                        <option value="14:00" style="color:black">14:00</option>
				                        <option value="15:00" style="color:black">15:00</option>
				                        <option value="16:00" style="color:black">16:00</option>
				                        <option value="17:00" style="color:black">17:00</option>
				                        <option value="18:00" style="color:black">18:00</option>
				                        <option value="19:00" style="color:black">19:00</option>
				                        <option value="20:00" style="color:black">20:00</option>
				                      </select>
				                    </div>
				                  </div>
				                </div>
				                <div class="col-md-12">
				                  <div class="form-group">
				                    <label for="guests">자동차 모델</label>
				                    <div class="form-field">
				                      <input type="text" name="car_name" id="car_name" class="form-control" placeholder="모델명 입력" value=""/>
				                    </div>
				                  </div>
				                </div>
				                <div class="col-md-12">
				                  <input type="button" id="searchbutton" value="차량검색" class="btn btn-primary btn-block" style="background-color:#ffdd00">
				                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				                </div>
				              </div>
				            </form>
							</div>			
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="colorlib-blog" style="background-color:#eef2f5">
			<div class="container" style="margin-top:-100px">
				<div class="row" style="margin-top:-20px;margin-bottom:20px">	
						<h2>요금선택</h2>		
				</div>
				<div class="blog-flex">
					<table border="0" width="45%" style="background-color:white">
						<!-- <뿌려주기 start> -->
						<tr>
							<td colspan="2" width=33%><p style="margin-left:20px; margin-right:20px;margin-top:20px;font-weight: bold;">이코노미</p></td>
						</tr>
						<tr>
							<td>
								<h2 style="margin-left:20px; margin-right:20px;color:#868c98; font-weight: bold;">${rentcar.totaleconomyView }원</h2>
								<span style="margin-left:20px; margin-right:20px;color:#868c98">차량 대여료 ${rentcar.totalrenteconomy }원</span></br>
								<span style="margin-left:20px; margin-right:20px;color:#868c98">보험료 ${rentcar.totalinsuranceView }원</span>
							</td>
						</tr>
						<tr>
							<td colspan="2"><p style="margin-left:20px; margin-right:20px;margin-top:20px;font-weight: bold;">예약취소</p>
								<span style="margin-left:20px; margin-right:20px;color:black;">결제 24시간 이내 :</span><span style="color:red">수수료 없음 </span></br>
								<span style="margin-left:20px; margin-right:20px;color:black;">결제 24시간 이후 :</span><span style="color:red">수수료 30%</span></br>
								<span style="margin-left:20px; margin-right:20px;color:black;">대여 24시간 이내 :</span><span style="color:red">수수료 30%</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<p style="margin-left:20px; margin-right:20px;margin-top:20px;font-weight: bold;">일정변경</p>
								<span style="margin-left:20px; margin-right:20px;color:red;">변경 불가</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<p style="margin-left:20px; margin-right:20px;margin-top:60px;font-weight: bold;">예약부도(No-show)</p>
								<span style="margin-left:20px; margin-right:20px;color:red;">환불 불가</span>
							</td>
						</tr>
						<tr>
							<td>
							<div class="col-md-15" style="margin-top:40px" align="center">
				                  <button class="btn btn-default" 
				                  <c:if test="${log == '' or log == null}">disabled</c:if>>
				                   <a href="#" onclick="selectgoods(2);return false;" style="color:black;text-decoration:none">예약하기</a></button>
				                </div>
							</td>
						</tr>
						</table>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
					<table border="0" width="45%" style="background-color:white">
						<!-- <뿌려주기 start> -->
						<tr>
							<td colspan="2" width=33%><p style="margin-left:20px; margin-right:20px;margin-top:20px;font-weight: bold; color:#ffdd00;">스탠다드</p></td>
						</tr>
						<tr>
							<td>
								<h2 style="margin-left:20px; margin-right:20px;color:#868c98; font-weight: bold; color:#ffdd00;">${rentcar.totalpriceView }원</h2>
								<span style="margin-left:20px; margin-right:20px;color:#868c98; color:#ffeb5f;">차량 대여료 ${rentcar.totalrentView }원</span></br>
								<span style="margin-left:20px; margin-right:20px;color:#868c98; color:#ffeb5f;">보험료 ${rentcar.totalinsuranceView }원</span>
							</td>
						</tr>
						<tr>
							<td colspan="2"><p style="margin-left:20px; margin-right:20px;margin-top:20px;font-weight: bold;">예약취소</p>
								<span style="margin-left:20px; margin-right:20px;color:black;">대여 72시간 이전 :</span><span style="color:red">수수료 없음 </span></br>
								<span style="margin-left:20px; margin-right:20px;color:black;">대여 72시간 이내 :</span><span style="color:red">수수료 30%</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<p style="margin-left:20px; margin-right:20px;margin-top:35px;font-weight: bold;">일정변경</p>
								<span style="margin-left:20px; margin-right:20px;color:black;">대여 72시간 이전 :</span><span style="color:red">수수료 없음 </span></br>
								<span style="margin-left:20px; margin-right:20px;color:black;">대여 72시간 이내 :</span><span style="color:red">수수료 3,000원</span></br>
								<span style="margin-left:20px; margin-right:20px;color:black;">대여 24시간 이내 :</span><span style="color:red">변경불가</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<p style="margin-left:20px; margin-right:20px;margin-top:20px;font-weight: bold;">예약부도(No-show)</p>
								<span style="margin-left:20px; margin-right:20px;color:red;">취소수수료 50%</span></br>
							</td>
						</tr>
						<tr>
							<td>
								<div class="col-md-15" style="margin-top:40px" align="center">
				                  <button class="btn btn-primary" style="background-color:#ffdd00"><a href="#" onclick="selectgoods(1);return false;" style="color:white;text-decoration:none">예약하기</a></button>
				                </div>
							</td>
						</tr>
						</table>	
				</div>
				<div class="row" style="margin-top:30px">	
						<span><span style="color:red">*</span> 차량 옵션은 동일하며, 요금에 따라 취소 / 변경 수수료가 상이합니다.</span></br>
						<span style="font-weight: bold"><span style="color:red">*</span> 이코노미 요금은 온라인 회원 전용이며, 대여 24시간 이내 예약 후에는 취소 시 수수료가 발생합니다.</span></br>
						<span><span style="color:red">*</span> [일정변경]은 날짜와 시간 변경만 가능하며, 예약 후에는 차량 및 대여업체를 변경할 수 없습니다.</span></br>
						<span><span style="color:red">*</span> [예약부도]는 예약된 일정에 사전 연락 없이 차량을 인수받지 않은 경우로, 요금 규정에 따라 취소수수료가 발생합니다.</span></br>
						<span><span style="color:red">*</span> 08:00~20:00 외 차량 대여 / 반납은 일부 업체만 가능하며, 추가요금이 발생하거나 완전자차 보험가입이 필요할 수 있습니다.</span>	
				</div></br></br></br>
				<table border="0" width="100%" style="background-color:white">
					<tr>
						<td rowspan="2" width="50%" height="500px">
						<div id="map" style="width:600px">
							<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0cfd90b11f1fceed206c4f201756973"></script>
							<script>
// 							    var mapContainer = document.getElementById('map')//, // 지도를 표시할 div
// 							        mapOption = {
// 							           center: new daum.maps.LatLng("${rentcar.branch.branch_lati}", "${rentcar.branch.branch_long}"), // 지도의 중심좌표
// 							           level: 5 // 지도의 확대 레벨
// 							        };
// 							    //지도를 미리 생성
// 							    	var map = new daum.maps.Map(mapContainer, mapOption);
// 							    //주소-좌표 변환 객체를 생성
// 							    var geocoder = new daum.maps.services.Geocoder();
// 							    //마커를 미리 생성
// 							    var marker = new daum.maps.Marker({
// 							       position: new daum.maps.LatLng("${rentcar.branch.branch_lati}", "${rentcar.branch.branch_long}"),
// 							       map: map
// 							    });
// 								// 지도를 보여준다.
// 		                        mapContainer.style.display = "block";
// 		                        map.relayout();
		                        // 지도 중심을 변경한다.
		                        /* map.setCenter(coords); */
		                        // 마커를 결과값으로 받은 위치로 옮긴다.
		                        /* marker.setPosition(coords); */
		                        
		                        
		                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							    mapOption = { 
							        center: new daum.maps.LatLng("${rentcar.branch.branch_lati}", "${rentcar.branch.branch_long}"), // 지도의 중심좌표
							        level: 3 // 지도의 확대 레벨
							    };
							
								var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
								
								// 마커가 표시될 위치입니다 
								var markerPosition  = new daum.maps.LatLng("${rentcar.branch.branch_lati}", "${rentcar.branch.branch_long}"); 
								
								// 마커를 생성합니다
								var marker = new daum.maps.Marker({
								    position: markerPosition
								});
								
								// 마커가 지도 위에 표시되도록 설정합니다
								marker.setMap(map);
							</script>
							</div>
						</td>
						
					</tr>
					<tr>
						<td colspan="2" width="50%">
							<h3 style="margin-left:20px; margin-right:20px;color:#868c98; font-weight: bold; color:black;">차량 인수/반납 장소</h3>
							<h3 style="margin-left:20px; margin-right:20px;margin-top:20px;">${rentcar.branch.branch_name }</h3>
								<span style="margin-left:20px; margin-right:20px;color:#8c9094;">셔틀타는곳</span></br></br>
								<span style="margin-left:20px; margin-right:20px;color:black;">${rentcar.branch.branch_busspot }</span></br></br>
								<span style="margin-left:20px; margin-right:20px;color:#8c9094;">셔틀 운행간격</span></br>
								<span style="margin-left:20px; margin-right:20px;color:black;">${rentcar.branch.branch_bustime }분</span></br></br>
								<span style="margin-left:20px; margin-right:20px;color:#8c9094;">소요시간</span></br>
								<span style="margin-left:20px; margin-right:20px;color:black;">${rentcar.branch.branch_busgap }분</span></br></br>
								<span style="margin-left:20px; margin-right:20px;color:#8c9094;">주소</span></br>
								<span style="margin-left:20px; margin-right:20px;color:black;">${rentcar.branch.branch_local }</span></br></br>
								<span style="margin-left:20px; margin-right:20px;color:#8c9094;">전화번호</span></br>
								<span style="margin-left:20px; margin-right:20px;color:black;">${rentcar.branch.branch_tel }</span></br>
						</td>				
					</tr>
				</table>	
			</div>
		</div>
			<form id="reservform" action="input.do" method="post">
				<input type="hidden" id="searchstartdate" name="rentstartdate" value="${requirements.rent_reserve_startDateTime }">
				<input type="hidden" id="searchenddate" name="rentenddate" value="${requirements.rent_reserve_endDateTime }">
				<input type="hidden" id="inputno" name="inputno" value="${rentcar.branch.branch_no },${rentcar.car.car_no },${rentcar.car_kind_no },${rentcar.insurance_no }" />
				<input type="hidden" id="goodstype" name="goodstype" />
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</form>
		
		<footer id="colorlib-footer" role="contentinfo">
			<div class="container">
				<div class="row row-pb-md">
					<div class="col-md-3 colorlib-widget">
						<h4>Tour Agency</h4>
						<p>Facilis ipsum reprehenderit nemo molestias. Aut cum mollitia reprehenderit. Eos cumque dicta adipisci architecto culpa amet.</p>
						<p>
							<ul class="colorlib-social-icons">
								<li><a href="#"><i class="icon-twitter"></i></a></li>
								<li><a href="#"><i class="icon-facebook"></i></a></li>
								<li><a href="#"><i class="icon-linkedin"></i></a></li>
								<li><a href="#"><i class="icon-dribbble"></i></a></li>
							</ul>
						</p>
					</div>
					<div class="col-md-2 colorlib-widget">
						<h4>Book Now</h4>
						<p>
							<ul class="colorlib-footer-links">
								<li><a href="#">Flight</a></li>
								<li><a href="#">Hotels</a></li>
								<li><a href="#">Tour</a></li>
								<li><a href="#">Car Rent</a></li>
								<li><a href="#">Beach &amp; Resorts</a></li>
								<li><a href="#">Cruises</a></li>
							</ul>
						</p>
					</div>
					<div class="col-md-2 colorlib-widget">
						<h4>Top Deals</h4>
						<p>
							<ul class="colorlib-footer-links">
								<li><a href="#">Edina Hotel</a></li>
								<li><a href="#">Quality Suites</a></li>
								<li><a href="#">The Hotel Zephyr</a></li>
								<li><a href="#">Da Vinci Villa</a></li>
								<li><a href="#">Hotel Epikk</a></li>
							</ul>
						</p>
					</div>
					<div class="col-md-2">
						<h4>Blog Post</h4>
						<ul class="colorlib-footer-links">
							<li><a href="#">The Ultimate Packing List For Female Travelers</a></li>
							<li><a href="#">How These 5 People Found The Path to Their Dream Trip</a></li>
							<li><a href="#">A Definitive Guide to the Best Dining and Drinking Venues in the City</a></li>
						</ul>
					</div>

					<div class="col-md-3 col-md-push-1">
						<h4>Contact Information</h4>
						<ul class="colorlib-footer-links">
							<li>291 South 21th Street, <br> Suite 721 New York NY 10016</li>
							<li><a href="tel://1234567920">+ 1235 2355 98</a></li>
							<li><a href="mailto:info@yoursite.com">info@yoursite.com</a></li>
							<li><a href="#">yoursite.com</a></li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 text-center">
						<p>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart2" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></span> 
							<span class="block">Demo Images: <a href="http://unsplash.co/" target="_blank">Unsplash</a> , <a href="http://pexels.com/" target="_blank">Pexels.com</a></span>
						</p>
					</div>
				</div>
			</div>
		</footer>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>

	</body>
</html>

