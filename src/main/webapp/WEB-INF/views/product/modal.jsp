<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- style -->
<link href="/resources/css/addReview.css" rel="stylesheet">

<div class="modal modal-lg fade" id="modal_addReview" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">장소 추가하기</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="img-add">
					<%-- 별점 --%>
					<div claa="d-flex">
						<div class="rating" data-rating="0">
					        <span class="star" data-value="1">☆</span>
					        <span class="star" data-value="2">☆</span>
					        <span class="star" data-value="3">☆</span>
					        <span class="star" data-value="4">☆</span>
					        <span class="star" data-value="5">☆</span>
					    </div>
					</div>
				    <script type="text/javascript">
				    document.addEventListener('DOMContentLoaded', function () {
				        const stars = document.querySelectorAll('.star');

				        stars.forEach(star => {
				            star.addEventListener('click', () => {
				                const rating = star.getAttribute('data-value');
				                setRating(rating);
				            });
				        });

				        function setRating(rating) {
				            stars.forEach(star => {
				                const value = star.getAttribute('data-value');
				                star.classList.toggle('active', value <= rating);
				            });

				            document.querySelector('.rating').setAttribute('data-rating', rating);
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

		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			<button type="button" class="btn btn-primary" onclick="addReview()">작성완료</button>
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
	var des = $('#description').val();
	var file = uploadFile;
	console.log()
	
	//데이터 저장 및 새로고침
	
	
	//모달 닫기
	//$("#modal_addPlace").modal('hide');
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