<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- style -->
<link href="/resources/css/addReview.css" rel="stylesheet">

<div class="modal modal-lg fade" id="modal_addReviewAnswer" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">답글 달기</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="img-add">
					<!-- 설명 -->
					<div>
						<h4>답글</h4>
						<textarea class="form-control" rows="10" cols="40" id="description" placeholder="답글을 작성해주세요!(최소 20자)"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" onclick="addReview()">작성완료</button>
			</div>
		</div>
		
	</div>
</div>

<script>



//추가하기버튼 클릭시
function addReview(){
	//des
	if ($("#description").val().length < 20) {
		alert("후기는 20자 이상 입력해주세요!");
		return;
	}
	
	var userId='${sessionScope.usersId}';
	var reviewId = $("#modal_addReviewAnswer").data('reviewId');
	var des=$('#description').val();
    
	console.log("후기 : "+des+", userId : "+userId+ ", reviewId : "+reviewId);
	
	var formData = new FormData();
	formData.append("content",des);
	formData.append("userId", userId);
	formData.append("reviewId", reviewId);

	
	//데이터 저장 및 새로고침
	$.ajax({
		type:"POST",
		url : '/my/addReviewAnswer',
		//dataType : 'json',
		contentType: false,
        processData: false,
        //traditional : true,
		cache: false,
		data : formData,	//json일땐, JSON.stringify(data)
		success:function(data){
			
			if(data.code==1){
				initialize();
				//성공
				alert("리뷰가 업로드 되었습니다");
				//모달 닫기
				$("#modal_addReview").modal('hide');
				location.reload(true);
			}else if(data.code==2){
				initialize();
				alert("이미 답변을 등록하셨습니다.")
				$("#modal_addReview").modal('hide');
			}
			else{
				//실패
				alert(data.errorMessage);
			}
		}
		,error:function(e){
			console.log("리뷰업로드 실패")
		}
	});
	
}

//초기화
function initialize(){
	//설명 초기화
	$('#description').val(undefined);
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
	var paginationEl = document.getElementById('pagination'), fragment = document
			.createDocumentFragment(), i;

	// 기존에 추가된 페이지번호를 삭제합니다
	while (paginationEl.hasChildNodes()) {
		paginationEl.removeChild(paginationEl.lastChild);
	}

	for (i = 1; i <= pagination.last; i++) {
		var el = document.createElement('a');
		el.href = "#";
		el.innerHTML = i;

		if (i === pagination.current) {
			el.className = 'on';
		} else {
			el.onclick = (function(i) {
				return function() {
					pagination.gotoPage(i);
				}
			})(i);
		}

		fragment.appendChild(el);
	}
	paginationEl.appendChild(fragment);
}

</script>