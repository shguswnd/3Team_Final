
window.onload = function(){
   

   
/*   var hostIndex = location.href.indexOf(location.host) + location.host.length;
   var contextPath = location.href.substring(hostIndex, location.href.indexOf ('/', hostIndex + 1));*/
   
   
   //DragAndDrop
   //태그값 가져오려면  document.getElementById("menu_wrap");
   var chatData = $('#menu_wrap')[0];
   var storeId = '';
   chatData.addEventListener("dragstart", dragStart);
   chatData.addEventListener("drag", drag);
   chatData.addEventListener("dragover", dragOver);
   chatData.addEventListener("dragend", dragEnd);

   
   function dragStart(e){}
   
   function drag(e){
      this.style.left = e.clientX - this.offsetWidth + 'px';
      this.style.top = e.clientY - this.offsetHeight + 'px';
   }
   
   function dragOver(e){
   }
   
   function dragEnd(e){
      this.style.left = e.clientX - this.offsetWidth + 'px';
      this.style.top = e.clientY - this.offsetHeight + 'px';
   }   
   
   
   
   
   //클릭 이벤트
   $(document).on("click", "#detailBtn", function(){
/*             var data = $(this).parent();
      console.log(data);
      var data1 = $(this).parents()
      console.log(data1); */
//      $("#chatBtn").css('display', 'inline-block');
      var length = '';
      var list_data = $(this).parents().eq(1);
      var title = list_data.find("h4").text();
      storeId = $(this).closest('div').data('obj');

      var data = {
            title : list_data.find("h4").text(),
            name : 'asd',
            storeId : storeId
      };
      $.ajax({
         type : "get",
         url : 'item',
         data:data,
         success : function(data){
        	 /*detailBtn*/
        	console.log(data);
            createForm(data);
            var dataFirst = {
                    title : title,
                    type : 'information',
                    storeId : storeId
            };
            $.ajax({
                type : "get",
                url : 'item/information',
                data:dataFirst,
                success : function(data){
                   createTabView(data, 'information');
                   console.log(data);
                },
                error:function (request, status, error){
                          console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
                   }
             }) 
         },
         error:function (request, status, error){
                   console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
            }
      }) 
   });

   
   $(document).on("click", "#reservationBtn", function(){
      storeId = $(this).closest('div').data('obj');
   });
   
   
   $(document).on("click", "#information", function(){
      var list_data = $(this).parents().eq(1);
      var title = list_data.find("h4").text();
      
      var data = {
            title : title,
            type : 'information',
            storeId : storeId
      };
      
      $.ajax({
         type : "get",
         url : 'item/information',
         data:data,
         success : function(data){
            createTabView(data, 'information');
            console.log(data);
         },
         error:function (request, status, error){
                   console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
            }
      }) 
   });
   
   $(document).on("click", "#review", function(){
      var list_data = $(this).parents().eq(1);
      var title = list_data.find("h4").text();
      $('#tabView').empty();
      var data = {
            title : title,
            type : 'review',
            storeId : storeId
      };

      $.ajax({
            type : "get",
            url : 'item/review',
            data:data,
            success : function(data){
               length = data.length;
               var twoData = data; 
               
               itemTab = `
                   <div class="comments">
                     <div class="d-flex resume-review">
                              <span class="type-point">
                                     •
                                 </span>
                                 (${length}) reviews
                      </div>
                    <div>
                             <hr class="nanny-s<div class=" nanny-opinions">
                             `;
                 $('#tabView').append(itemTab);
               
            $.each(data, function(index, obj){
            
               var date = new Date(obj.EDATE);
               var year = String(date.getYear()).substring(1);
               var month = date.getMonth() + 1;
               var day = date.getDate(); 
               var time = String(date.getHours()).padStart(2, "0") 
               + ":" 
               + String(date.getMinutes()).padStart(2, "0");
               var sumDate = year + "-" + month + "-" + day + "   " + time;
               obj.USEREDATE = sumDate;
               obj.EDATE = sumDate;
               if(obj.PARENT === null || obj.PARENT === undefined)
            	   createTabView(obj, 'review');

               $.each(twoData, function(index, replyObj){
            	   if(obj.IDX === replyObj.PARENT){
                       var date = new Date(replyObj.EDATE);
                       var year = String(date.getYear()).substring(1);
                       var month = date.getMonth() + 1;
                       var day = date.getDate(); 
                       var time = String(date.getHours()).padStart(2, "0") 
                       + ":" 
                       + String(date.getMinutes()).padStart(2, "0");
                       sumDate = year + "-" + month + "-" + day + "   " + time;
                      
            		   replyObj.EDATE = sumDate;
            		   createReplyView(replyObj)                		   
            	   }
               })

            	  

            })
               
            },
            error:function (request, status, error){
                      console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
               }
         }) 
   });
   
   
   $(document).on("click", "#backBtn", function(){
	   $('#itemDetails').remove();
	   $('#listGroup').children().show();
   })

   
   
   function createTabView(data, type){
//      $('#tabView').children().hide();
	   console.log(data);
      let itemTab = '';
      if(type === 'information')
      {
    	 $('#tabView').empty();
         itemTab = `
                  <div class="detail">`
                  if(data[0].NOTICE === null || data[0].NOTICE === undefined)
            	  {
                	  itemTab += `<div id=""><i class="bi bi-megaphone-fill"></i>&nbsp;공지가 없습니다.</div><br>`;
            	  }
                  else{
                	  itemTab += `<div id=""><i class="bi bi-megaphone-fill"></i>&nbsp;${data[0].NOTICE}</div><br>`;                	  
                  }
                	  itemTab+= `
                     <div id=""><i class="bi bi-geo-alt-fill"></i>&nbsp;${data[0].ADDRESS}</div><br>
                     <div id=""><i class="bi bi-telephone-fill"></i>&nbsp;${data[0].PHONE}</div><br>
                     <div id=""><i class="bi bi-clock-fill"></i>&nbsp; 월~금 : ${data[0].MANAGE_WEEK_TIME}</div><br>
                     <div id="">&nbsp;&nbsp;&nbsp;&nbsp;          토요일 : ${data[0].MANAGE_SAT_TIME}</div><br>
                     <div id="">&nbsp;&nbsp;&nbsp;&nbsp;       일요일 : ${data[0].MANAGE_SUN_TIME}</div><br>
                        <se:authorize access="hasRole('ROLE_USER')"> 
	                        <img class="chatBtn" id="chatBtn"  data-obj=${data.STOREID}
	                             src="/resources/user/assets/img/chatBtn.png"
	                             alt="이미지 없어유">
                        </se:authorize access>
                      <br>
                  </div>
                  `;
      }else if(type == 'review'){
         itemTab = `
            <div class="nanny-opinions">
                     <div class="comments">
                         <div class="comment">
                             <div class="top-part d-flex justify-content-between align-items-center">
                                 <div class="d-flex">
                                     <div class="user-infos">
                                         <div class="picture"
                                             style="background-image: url(&quot;/img/avatars/default_avatar.svg&quot;);">
                                         </div>
                                     </div>
                                     <div class="name-date">
                                         <div class="name"><b>사용자 ${data.USERNAME}</b>
                                         </div>
                                         <div class="date">
                                             ${data.EDATE}
                                         </div>
                                     </div>
                                 </div>
                                 <div class="stars">
                                     <div class="score">
                                         ${data.STAR}.0
                                     </div>
								<div class="all-stars">`
	        	let startNum = data.STAR
	        	for(j = 0; j<startNum; j++){
	        		itemTab += `<div class="nanny-icon star yellow"></div>&nbsp`
	        	}
				itemTab +=`</div>
                                 </div>
                             </div>
                             <div class="comment-content">${data.USERCONTENT}
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div> `;
      }     
      
      $('#tabView').append(itemTab);
   }
   
   function createReplyView(data){
	   console.log(data);
	   itemTab = `
	      <div class="reply">
		   <i class="bi bi-arrow-return-right"></i> 
		   	<div class = "replyinfo">
			   <div class="namedate"><b>점주</b></div>
			   <div class="namedate">${data.EDATE}</div><br>
			    <div class="comment-content"> ${data.USERCONTENT}</div>
		   	</div>
             
             </div>
             
         </div>
	   `;
	   $('#tabView').append(itemTab);
   }
  
   
   
   //Json 전용 table 생성
   function createForm(data, way){
      $('#listGroup').children().hide();
      console.log(data);
      const itemDetail =`
                  <table id="itemDetails" class="itemDetails table table-borderless">
                      <tr>
                          <th>
                          <button id="backBtn" class="backBtn"><i class="bi bi-backspace-fill"></i></button>
                              <img class="item_img" alt="없음" src="${data.PROFILE_PATH}">
                          </th>
                      </tr>
                  
                      <tr>
                          <th>
                              <div class="detailsHeader">
    	  							보관소 🏠 <br>
                                  <h4>${data.NAME}</h4>
                                   
                              </div>
                          </th>
                      </tr>
                  
                      <tr class="nav nav-pills nav-justified" id="pills-tab" role="tablist">
                          <th class="nav-item" role="presentation">
                           <a id="firstTab" class="nav-link firstTab" aria-current="page" onclick="activateTab('first')">
            					<div id="information"><b>정보</b></div>
                          </th>
                         
                          <th class="nav-item" role="presentation">
							  <a id="secondTab" class="nav-link" aria-current="page" onclick="activateTab('second')">
							            <div id="review" data-obj=${data.storeId}><b>리뷰</b></div>
							  </a>
                          </th>
                      </tr>
                      </th>
                      </tr>
                      <tr>
                          <th>
                              <div id="tabView"></div>
                          </th>

                      </tr>
                  </table>         
                  </div>
                  `;
      $('#listGroup').append(itemDetail);
   }

   
   
}