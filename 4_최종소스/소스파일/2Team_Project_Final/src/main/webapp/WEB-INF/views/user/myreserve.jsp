<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html
    lang="en-US"
    dir="ltr"
    data-n-head="%7B%22lang%22:%7B%22ssr%22:%22en-US%22%7D,%22dir%22:%7B%22ssr%22:%22ltr%22%7D%7D"
    style="--height-screen:1185px;">
   <link href="${path}/resources/user/css/myreserve.css" rel="stylesheet" /> 
   <link href="https://webfontworld.github.io/nyj/NYJGothic.css" rel="stylesheet">
   <!-- CSS only -->
   <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous">
   <!-- JavaScript Bundle with Popper -->
   
   <!-- Jquery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"></script>
      	    <!--파비콘-->
        <link rel="icon" href="${path}/resources/admin/img/loca3.png" /> 
   
   <!-- 별css -->
   <link href="${path}/resources/admin/css/star.css" rel="stylesheet" />
	<!-- Google tag (gtag.js) -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-R3NH3D2T1E"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'G-R3NH3D2T1E');
	</script>
<head>
        <title>예약내역 👜</title>
          <meta data-n-head="ssr" charset="utf-8">
          
          <style type="text/css">
          </style>
        
        <script type="text/javascript">
        
           function activateReviewForm(idx, status) {
              
              if (status > 0) {
                 // 이미 댓글을 달았음
                 return;
              }
              
              let reviewform = "#reviewFormTr" + idx;
              let cancelTr = "#cancelTr" + idx;
              let reviewTr = "#reviewTr" + idx;
              $(reviewform).show();
              $(cancelTr).show();
              $(reviewTr).hide();
           }
           function deActivateReviewForm(idx) {
              let reviewform = "#reviewFormTr" + idx;
              let cancelTr = "#cancelTr" + idx;
              let reviewTr = "#reviewTr" + idx;
              let textarea = "#textarea" + idx;
              $(reviewform).hide();
              $(cancelTr).hide();
              $(reviewTr).show();
              $(textarea).val('');
           }
           
         function activateReview(idx) {
              $("#cancelButton" + idx).show();
              $(".reviewContent" + idx).show();
              $("#reviewButton" + idx).hide();
           }
           function deActivateReview(idx) {
              $("#cancelButton" + idx).hide();
              $(".reviewContent" + idx).hide();
              $("#reviewButton" + idx).show();
           }
        </script>
        
    </head>
    <body class="bodymargin">
        <noscript data-n-head="ssr" data-hid="gtm-noscript" data-pbody="true">
            <iframe
                src="https://www.googletagmanager.com/ns.html?id=GTM-MX4P352&"
                height="0"
                width="0"
                style="display:none;visibility:hidden"
                title="gtm"></iframe>
        </noscript>
        
      <%
      pageContext.include("/WEB-INF/views/include/header.jsp");
      %>


   <div id="__nuxt">
            <div id="__layout">
                    <div
                        class="content-row nanny-reservations-container base-nanny-container"
                        data-v-55ac5990="">
                        <!---->
                        <div class="mt-md-5 content">
                            <div class="row">
                                <div class="col-12 col-md-6 content-col">
                                    <h1 class="color-nanny-dark">
                                           	예약 내역 🗒️
                                    </h1>
                                </div>
                                
                                <div class="col-12 content-col">
                                    <div>
                                        <div class="table" style="text-align:center; ">
                                            <div class="row filters-row">
                                                <div class="col-12 col-md-12 col-lg-6">
                                                    <div class="listing-menu-container">
                                                        <div class="l-button" style="display:none;">
                                                            <span class="nanny-icon left-icon"></span></div>
                                                        <div class="r-button" style="display:none;">
                                                            <span class="nanny-icon right-icon"></span></div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-md-12 col-lg-6">
                                                    <div class="row">
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <table class="table table-hover">
                                   <thead>
                                     <tr>
                                       <th scope="col">✔️</th>
                                       <th scope="col">가게 이름</th>
                                       <th scope="col">물품수</th>
                                       <th scope="col">결제 금액</th>
                                       <th scope="col">결제일</th>
                                       <th scope="col">시작일</th>
                                       <th scope="col">종료일</th>
                                       <th scope="col">리뷰</th>
                                     </tr>
                                   </thead>
                                   <tbody>
                                      <c:forEach var="item" items="${list}" varStatus="s">
                                      <!-- 한 세트 -->
                                     <tr>
                                       <th scope="row" style="vertical-align: middle">${s.count}</th>
                                       <td style="vertical-align: middle">${item.storeName}</td>
                                       <td style="vertical-align: middle">${item.cnt}</td>
                                       <td style="vertical-align: middle">${item.price}</td>
                                       <td style="vertical-align: middle">${item.pdate}</td>
                                       <td style="vertical-align: middle">${item.sdate}</td>
                                       <td style="vertical-align: middle">${item.edate}</td>
                                       <c:choose>
                                          <c:when test="${item.userContent eq null}">
                                             <td id="reviewTr${item.idx}" style="display: block">
                                                <button class="btn btn-primary" onclick="activateReviewForm(${item.idx}, ${item.reviewstatus})">리뷰작성</button>
                                             </td>
                                             <td id="cancelTr${item.idx}" style="display: none">
                                                <button class="btn btn-danger" onclick="deActivateReviewForm(${item.idx})">취소</button>
                                             </td>
                                     </tr>
                                    <tr id="reviewFormTr${item.idx}" style="display: none">
                                                 <form action="/users/reviews?idx=${item.idx}" method="post">
                                                 <td colspan="7">
                                                    <div style="height: 50px;">
                                                       <label for="textarea${item.idx}" style="float: left; margin: 5px 0px 0px 0px; padding-right: 20px;" class="form-label">
                                                          [Hands Free] ${item.storeName}에 댓글을 남겨주세요
                                                       </label>
                                                       <select name="grade" class="form-select" style="width:153px; color:#ff7613;" aria-label="Default select example">
                                                           <option selected>별점 선택</option>
                                                           <option value="1">★</option>
                                                           <option value="2">★★</option>
                                                           <option value="3">★★★</option>
                                                           <option value="4">★★★★</option>
                                                           <option value="5">★★★★★</option>
                                                      </select>
                                                      <br>
                                                    </div>
                                                    <textarea name="content" class="form-control" id="textarea${item.idx}" rows="3" placeholder="댓글과 별점을 입력해주세요"></textarea>
                                                 </td>
                                                 <td colspan="1">
                                                   <button type="submit" style="margin-top: 95px;" class="btn btn-primary">제출하기</button>
                                                 </td>
                                                 </form>
                                    </tr>
                                          </c:when>
                                          
                                          <c:otherwise>
                                             <td id="reviewButton${item.idx}" style="display: block">
                                                <button class="btn btn-warning" onclick="activateReview(${item.idx})">리뷰보기</button>
                                             </td>
                                             <td id="cancelButton${item.idx}" style="display: none">
                                                <button class="btn btn-warning" onclick="deActivateReview(${item.idx})">접기</button>
                                             </td>
                                     </tr>
                                     <!-- 후기 보이는 부분 -->
                                    <tr class="reviewContent${item.idx}" style="display: none">
                                    	  <td colspan="1">
                                          </td>
                                          <td colspan="1">
                                          	<i class="bi bi-arrow-return-right"></i> 나의 후기
                                          </td>
                                           <td colspan="4">
                                              <i class="bi bi-check2-square"></i>
                                              ${item.userContent}
                                           </td>
                                           <td colspan="1">
                                          	<c:forEach begin="${1}" end="${item.grade}" step="${1}">
                                                <div class="nanny-icon star yellow"></div>
											                      </c:forEach>
                                          </td>
                                          <td colspan="1">
                                          	<form action="/users/reviews/${item.reviewstatus}" method="post">
                                          		<button class="btn btn-danger" type="submit">삭제</button>
                                          	</form>
                                          </td>
                                    </tr>
                                    <c:if test="${item.storeContent ne null}">
                                    <tr class="reviewContent${item.idx}" style="display: none">
	                                      <td colspan="2">
	                                      </td>
                                          <td colspan="1">
                                             	<i class="bi bi-arrow-return-right"></i>
                                             	 점주 답글
                                          </td>
                                           <td colspan="5">
                                           	  <i class="bi bi-check2-square"></i>
                                              ${item.storeContent}
                                           </td>
                                    </tr>
                                    </c:if>
                                          </c:otherwise>
                                          
                                          
                                       </c:choose>
                                     <!-- 한 세트 -->
                                      </c:forEach>
                                   </tbody>
                                 </table>                             
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="bottom-mobile"></div>
                    </div>
                    <!---->
                </div>
            </div>
        </div>

        <iframe
            name="_hjRemoteVarsFrame"
            title="_hjRemoteVarsFrame"
            tabindex="-1"
            aria-hidden="true"
            id="_hjRemoteVarsFrame"
            src="https://vars.hotjar.com/box-e031119f9e9e307a08fa610f85dbfb52.html"
            style="display: none !important; width: 1px !important; height: 1px !important; opacity: 0 !important; pointer-events: none !important;"></iframe>
    </body>
</html>