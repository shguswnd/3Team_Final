<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>HandsFree main</title>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://webfontworld.github.io/nyj/NYJGothic.css" rel="stylesheet">
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${path}/resources/user/css/user_main.css" rel="stylesheet" />
        
        <!-- 파비콘 -->
        <link rel="icon" href="${path}/resources/admin/img/loca3.png" />
		<!-- Google tag (gtag.js) -->
		<script async
			src="https://www.googletagmanager.com/gtag/js?id=G-R3NH3D2T1E"></script>
		<script>
			window.dataLayer = window.dataLayer || [];
			function gtag() {
				dataLayer.push(arguments);
			}
			gtag('js', new Date());
		
			gtag('config', 'G-R3NH3D2T1E');
		</script>
</head>
    <body id="page-top">
		<!-- header -->
		<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
		
    <!-- 메인 -->
	<form name="bookingform" action="${path}/search" method=get>
		<header class="masthead">
			<div class="container px-5">
				<div class="row gx-5 align-items-center">
					<div class="col-lg-6">
						
						<div class="mb-5 mb-lg-0 text-center text-lg-start">
							<h1 class="display-1 lh-1 mb-3" style="color: #646464;">
								<b>가벼운 여행의 시작</b>
							</h1>
							<h1 class="display-1 lh-1 mb-3" style="color: #5a5a5a;">
								<b>Hands Free</b>
							</h1>
							<div class="mb-3" style="color: #787878; font-weight:bold;">Anywhere, anytime</div>

							<table class="table table-borderless">

									<tr>
										<td style="vertical-align:middle"><i class="bi bi-geo-alt-fill"></i></td>
										<td colspan="3"><input style = "text-align:center;"
									class="form-control" type="text" placeholder="내 위치"
									name="destination" id="destination"></td>
									</tr>
								<tr>
									<td style="vertical-align: middle"><i class="bi bi-shop"></i></td>
									<td><input type="date" class="datebutton form-control" 
										style="text-align: center; color:#646464;" name="sdate" id="sdate" required
										aria-required="true" data-placeholder="맡기는 날" /></td>
									<td style="vertical-align: middle"><i class="bi bi-shop"></i></td>
									<td><input type="date" class="datebutton form-control"
										style="text-align: center; color:#646464;" name="edate" id="edate" required
										aria-required="true" data-placeholder="찾는 날" /></td>
								</tr>
								<tr>
										<td style="vertical-align:middle"><i class="bi bi-handbag"></i></td>
										<td><input type="number" class="datebutton form-control" style = "text-align:center; color:#646464;" name="cnt" id="cnt" min="1" max="100" value="1" /></td>
										<td style="vertical-align:middle">개</td>
										<td style="vertical-align:bottom; text-align:right; color:#646464; font-size:15px"> * 최대 20개까지</td>
									</tr>
							</table>
							
							<div class="d-flex flex-column flex-lg-row align-items-center">
								<button class="custom-btn btn-1">검색하기</button>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<img class="main-img"
							src="${path}/resources/user/assets/img/main.png" alt="main image"
							width="500" height="500">
					</div>
				</div>
			</div>
		</header>
	</form>


	<!-- About us -->
        <section id="about us">
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-8 order-lg-1 mb-5 mb-lg-0">
                        <div class="container-fluid px-5">
                            <div class="row gx-5">
                                <div class="col-md-6 mb-5">
                                 
                                    <!-- Feature item-->
                                    <div class="text-center">
                                        <i class="bi-clock icon-feature text-gradient d-block mb-3"></i>
                                        <h3 class="font-alt">언제, 어디서나</h3>
                                        <p class="text-muted mb-0">여행 루트에 맞는 장소와 시간에 짐을 보관해 가벼운 여행을 즐겨보세요.</p>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-5">
                                    <!-- Feature item-->
                                    <div class="text-center">
                                        
                                        <i class="bi-chat icon-feature text-gradient d-block mb-3"></i>
                                        <h3 class="font-alt">실시간 채팅</h3>
                                        <p class="text-muted mb-0">보관소와의 실시간 1:1 채팅으로 빠르고 <br>원활한 소통이 가능합니다.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-5 mb-md-0">
                                    <!-- Feature item-->
                                    <div class="text-center">
                                        <i class="bi-star icon-feature text-gradient d-block mb-3"></i>
                                        <h3 class="font-alt">숨겨진 핫플</h3>
                                        <p class="text-muted mb-0">보관소에 짐을 맡기며 <br>숨겨진 가게들을 발견해보세요!</p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <!-- Feature item-->
                                    <div class="text-center">
                                        <i class="bi-patch-check icon-feature text-gradient d-block mb-3"></i>
                                        <h3 class="font-alt">고정된 가격</h3>
                                        <p class="text-muted mb-0">10,000원/시간의 고정된 <br> 가격으로 보관 서비스를 이용해보세요.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 order-lg-0">
                        <img class="main-img2"
								src="${path}/resources/user/assets/img/main2.png" alt="main image"
								width="500" height="500">
                    </div>
                </div>
            </div>
        </section>

        <!-- 가격-->
        <section class="bg-light" id = "price">
            <div class="container px-5">
                <div class="row gx-5 align-items-center justify-content-center justify-content-lg-between">
                    <div class="col-12 col-lg-5">
                        <h2 class="display-4 lh-1 mb-4"><b>가격</b></h2>
                        <p class="lead fw-normal text-muted mb-5 mb-lg-0" style="margin:0.4em">시간 당 5,000원</p>
                        <p class="lead fw-normal text-muted mb-5 mb-lg-0" style="margin:0.4em">NO 보증금</p>
                        <p class="lead fw-normal text-muted mb-5 mb-lg-0" style="margin:0.4em">NO 수수료</p>
                    </div>
                    <div class="col-sm-8 col-md-6">
                        <div class="px-5 px-sm-0"><img style="width: 500px; height: 500px; margin-left: 100px;" src="${path}/resources/user/assets/img/coin.png" alt="coin" /></div>
                    </div>
                </div>
            </div>
        </section>


        <section id="about us">
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-8 order-lg-1 mb-5 mb-lg-0">
                        <div class="container-fluid px-5">
                            <div class="row gx-5">
                            </div>
                        </div>
                    </div>
                    
                        <img class="mobile-img"
								src="${path}/resources/user/assets/img/mobile.png" alt="mobile image"
								width="500" height="500">
						<img class="qr-img"
								src="${path}/resources/user/assets/img/qrcode.png" alt="qrcode image"
								width="200" height="200">
						<p class="lead fw-normal text-muted mb-5 mb-lg-0" style="margin:0.4em">qr코드를 스캔해 모바일에서 이용해보세요! </p>
                    
                </div>
            </div>
        </section>
        
        <!-- Footer-->
        <footer class="bg-black text-center py-5">
            <div class="container px-5">
                <div class="text-white-50 small">
                    <div class="mb-2">&copy; Enjo2 2023. All Rights Reserved.</div>
                    <span class="mx-1">&middot;</span>
                    <a href="#!">Git</a>
                    <span class="mx-1">&middot;</span>
                </div>
            </div>
        </footer>
        <!-- Login Modal-->
        <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="feedbackModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-gradient-primary-to-secondary p-4">
                        <h5 class="modal-title font-alt text-white" id="feedbackModalLabel">로그인</h5>
                        <button class="btn-close btn-close-white" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body border-0 p-4">
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- * * SB Forms Contact Form * *-->
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- This form is pre-integrated with SB Forms.-->
                        <!-- To make this form functional, sign up at-->
                        <!-- https://startbootstrap.com/solution/contact-forms-->
                        <!-- to get an API token!-->
                        <form id="contactForm" data-sb-form-api-token="API_TOKEN">
<!--                             Name input
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                                <label for="name">Full name</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                            </div> -->
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                                <label for="email">Email</label>
                                <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                                <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                            </div>
                            <!-- Password input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="password" type="password" placeholder="123!@#abcABC" data-sb-validations="required" />
                                <label for="password">Password</label>
                                <div class="invalid-feedback" data-sb-feedback="password:required">A Password is required.</div>
                            </div>
<!--                             Message input
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="message" type="text" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea>
                                <label for="message">Message</label>
                                <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                            </div> -->
                            <!-- Submit success message-->
                            <!---->
                            <!-- This is what your users will see when the form-->
                            <!-- has successfully submitted-->
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">Form submission successful!</div>
                                    To activate this form, sign up at
                                    <br />
                                    <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                </div>
                            </div>
                            <!-- Submit error message-->
                            <!---->
                            <!-- This is what your users will see when there is-->
                            <!-- an error submitting the form-->
                            <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                            <!-- Submit Button-->
                            <div class="d-grid"><button class="btn btn-primary rounded-pill btn-lg disabled" id="submitButton" type="submit">Submit</button></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Register Modal-->
        <div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="feedbackModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-gradient-primary-to-secondary p-4">
                        <h5 class="modal-title font-alt text-white" id="feedbackModalLabel">회원가입</h5>
                        <button class="btn-close btn-close-white" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body border-0 p-4">
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- * * SB Forms Contact Form * *-->
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- This form is pre-integrated with SB Forms.-->
                        <!-- To make this form functional, sign up at-->
                        <!-- https://startbootstrap.com/solution/contact-forms-->
                        <!-- to get an API token!-->
                        <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                            <!-- Name input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                                <label for="name">Full name</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                            </div>
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" type="email" placeholder="email@example.com" data-sb-validations="required,email" />
                                <label for="email">Email address</label>
                                <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                                <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                            </div>
							<!-- Password input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="password" type="password" placeholder="123abcABC!@#" data-sb-validations="required" />
                                <label for="password">password</label>
                                <div class="invalid-feedback" data-sb-feedback="password:required">Password is required.</div>
                            </div>
<!--                             Phone number input
                            <div class="form-floating mb-3">
                                <input class="form-control" id="phone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />
                                <label for="phone">Phone number</label>
                                <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
                            </div> -->
<!--                             Message input
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="message" type="text" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea>
                                <label for="message">Message</label>
                                <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                            </div> -->
                            <!-- Submit success message-->
                            <!---->
                            <!-- This is what your users will see when the form-->
                            <!-- has successfully submitted-->
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">Form submission successful!</div>
                                    To activate this form, sign up at
                                    <br />
                                    <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                </div>
                            </div>
                            <!-- Submit error message-->
                            <!---->
                            <!-- This is what your users will see when there is-->
                            <!-- an error submitting the form-->
                            <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                            <!-- Submit Button-->
                            <div class="d-grid"><button class="btn btn-primary rounded-pill btn-lg disabled" id="submitButton" type="submit">Submit</button></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${path}/resources/user/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
 </html>
