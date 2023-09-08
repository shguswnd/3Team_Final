$(document).ready(function() {
		/* 기본정보 */
		$('#admin').click(function(){
			$.ajax({
				type : "GET",
				url : "/admin",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
				
			});
		});
		/* 예약현황 */
		$('#reserve').click(function(){
			$.ajax({
				type : "GET",
				url : "/admin/reserve",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
				
			});
		});
		/* 채팅관리 */
		$('#chatting').click(function(){
			$.ajax({
				type : "GET",
				url : "/admin/chatting",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
				
			});
		});
		/* 리뷰관리 */
		$('#review').click(function(){
			$.ajax({
				type : "GET",
				url : "/admin/review",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
				
			});
		});
		/* 메일서비스 */
		$('#mail').click(function(){
			$.ajax({
				type : "GET",
				url : "/admin/mail",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
				
			});
		});
		/* 메일서비스 폼 */
		$('#mailForm').click(function(){
			$.ajax({
				type : "GET",
				url : "/admin/mailForm",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
			});
		});
		/* 일정관리 */
		$('#calendar').click(function(){
			$.ajax({
				type : "GET",
				url : "/admin/calendar",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
				
			});
		});
		/* 통계 */
		$('#chart').click(function(){
			$.ajax({
				type : "GET",
				url : "/admin/chart",
				dataType : "html",
				error : function(){
					alert("새로고침 해주세요");
				},
				success : function(data){
					$("#main").empty();
					$("#main").append(data);
				}
				
			});
		});
	});