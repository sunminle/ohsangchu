<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- style -->
<link href="/resources/css/addReview.css" rel="stylesheet">

<div class="modal modal-lg fade" id="modal_addReview" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">리뷰 추가하기</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="img-add">
					<%-- 별점 --%>
					<div class="d-flex justify-content-center">
						<div class="rating d-flex justify-content-center" data-rating="0">
					        <div class="starwi"><span class="star half" data-value="0.5"></span></div>
					        <div class="starwi"><span class="star full" data-value="1.0"></span></div>
					        <div class="starwi"><span class="star half" data-value="1.5"></span></div>
					        <div class="starwi"><span class="star full" data-value="2.0"></span></div>
					        <div class="starwi"><span class="star half" data-value="2.5"></span></div>
					        <div class="starwi"><span class="star full" data-value="3.0"></span></div>
					        <div class="starwi"><span class="star half" data-value="3.5"></span></div>
					        <div class="starwi"><span class="star full" data-value="4.0"></span></div>
					        <div class="starwi"><span class="star half" data-value="4.5"></span></div>
					        <div class="starwi"><span class="star full" data-value="5.0"></span></div>
					    </div>
					</div>
				    <script type="text/javascript">
				    document.addEventListener('DOMContentLoaded', function () {
				        const ratingContainer = document.querySelector('.rating');
				        const stars = ratingContainer.querySelectorAll('.star');
				        
				        selectedRating = null;

				        stars.forEach(star => {
				            star.addEventListener('click', () => {
				                const value = parseFloat(star.getAttribute('data-value'));
				                ratingContainer.setAttribute('data-rating', value.toFixed(1));
				                selectedRating = value;
				                updateStars(value);
				            });

				            star.addEventListener('mouseenter', () => {
				                const value = parseFloat(star.getAttribute('data-value'));
				                updateStars(value);
				            });

				            star.addEventListener('mouseleave', () => {
				                const currentRating = parseFloat(ratingContainer.getAttribute('data-rating'));
				                updateStars(currentRating);
				            });
				        });

				        function updateStars(rating) {
				            stars.forEach(star => {
				                const value = parseFloat(star.getAttribute('data-value'));
				                star.classList.toggle('active', value <= rating);
				            });
				        }
				    });
				    </script>
					
					<%--이미지저장--%>
					<h4><label for="img">사진 추가</label></h4>
					<input type="file" id="img" name="img" class="form-control" accept="image/*" onchange="uploadImg(event);" required multiple="multiple">
					<div class="d-flex justify-content-center">
						<div id="imgBox" class=""></div>
					</div>
					<!-- 설명 -->
					<div>
						<h4>상품 후기</h4>
						<textarea class="form-control" rows="10" cols="40" id="description" placeholder="상품 후기를 작성해주세요!(최소 20자)"></textarea>
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
//이미지 파일 업로드시
//썸네일 보여주기
function uploadImg(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
    	if(document.getElementById('imgBox').children != null){
    		//console.log('기존 이미지 삭제');
    		$('#imgBox').empty();
    	} 
      	var img = document.createElement("img");
      	img.setAttribute("src", event.target.result);
      	document.querySelector("div#imgBox").appendChild(img);
    };

    reader.readAsDataURL(event.target.files[0]);
}


//e.target.files[0]
const fileInput = document.getElementById("img"); //file input btn

const fileEvent = (e) => {
  	const reader = new FileReader();
  	reader.onload = () => {
    console.log('파일 업로드 성공');
  };
  reader.readAsText(fileInput.files[0]);	//파일이하나이므로 첫번째 요소만 read
  uploadFile = fileInput.files[0];
  //console.log(fileInput.files[0]);
}

fileInput.addEventListener('change', fileEvent);//파일(첨부)버튼에 addEventListener

//formData
const upload = () => {
    let formData = new FormData();
    formData.append('uploadFile', e.target.files[0]);
}


//추가하기버튼 클릭시
function addReview(){
	
	//유효성 검사
    //point
	if (selectedRating === null) {
        alert('별점을 선택해주세요!');
        return; // 별점이 선택되지 않았으면 더 이상 진행하지 않음
    }
    if (isNaN(selectedRating) || selectedRating < 0 || selectedRating > 5) {
        alert('별점은 0부터 5까지의 값을 가져야 합니다.');
        return; // 유효하지 않은 별점이면 더 이상 진행하지 않음
    }
	//file
	if(typeof uploadFile=="undefined"){
		var file=null;
	}else{
		var file=uploadFile;
	}
	//des
	if ($("#description").val().length < 20) {
		alert("후기는 20자 이상 입력해주세요!");
		return;
	}
	
	var userId='${sessionScope.usersId}';
	var postingId='${post.id}';
	var des=$('#description').val();
	var point = selectedRating;	
    
	console.log(file);
	console.log("후기 : "+des+", img : "+file+", userId : "+userId+", postingId : "+postingId+", point : "+point);
	
	var formData = new FormData();
	formData.append("content",des);
	formData.append("img", file);
	formData.append("userId", userId);
	formData.append("postingId", postingId);
	formData.append("point", point);
	
	//데이터 저장 및 새로고침
	$.ajax({
		type:"POST",
		url : '/store/add_review',
		//dataType : 'json',
		enctype: 'multipart/form-data',
		contentType: false,
        processData: false,
        //traditional : true,
		cache: false,
		data : formData,	//json일땐, JSON.stringify(data)
		success:function(data){
			if(data.code==1){
				//성공
				alert("리뷰가 업로드 되었습니다");
				//모달 닫기
				$("#modal_addReview").modal('hide');
				location.reload(true);
			}else{
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
	//file 초기화
	$('#img').val(undefined);
	$('#imgBox').empty();
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