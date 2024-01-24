<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- style 
<link href="" rel="stylesheet">-->

<div class="modal modal-lg fade" id="modal_addReview" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">장소 추가하기</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<h4>
					<b>지도에서 선택하기</b>
				</h4>
				<%--지도검색--%>
				<div class="modal-search">
					<div class="map_wrap">
						<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

						<div id="menu_wrap" class="bg_white">
							<div class="option">
								<div>
									<form onsubmit="searchPlaces(); return false;">
										키워드 : <input type="text" placeholder="검색어를 입력하세요." name="keyword" id="keyword" size="15">
										<button type="submit">검색하기</button>
									</form>
								</div>
							</div>
							<hr>
							<ul id="placesList"></ul>
							<div id="pagination"></div>
						</div>
					</div>
					<%-- 지도선택시 인포박스 --%>
					<div id="selectedMap" class="noShow"></div>


					<form id="img-add">
						<%--이미지저장--%>
						<h4>
							<label for="img"><b>사진 추가</b></label>
						</h4>
						<input type="file" id="img" name="img" class="form-control" accept="image/*" onchange="uploadImg(event);" required multiple="multiple">
						<div class="d-flex justify-content-center">
							<div id="imgBox" class=""></div>
						</div>
						<!-- 장소설명 -->
						<div>
							<h4>
								<b>장소 설명</b>
							</h4>
							<textarea class="form-control" rows="10" cols="40" id="description" placeholder="장소에 대해 설명해주세요!"></textarea>
						</div>
					</form>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" onclick="addPlace()">추가하기</button>
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
//파일 업로드
/*
const fileInput = document.getElementById("img");
const handleFiles = () => {
	const selectedFile = fileInput.files[0];	//여러파일인경우 [...fileInput.files];
	console.log(selectedFile);
};
fileInput.addEventListener("change", handleFiles);	//파일(첨부)버튼에 addEventListener
*/


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


var modalPlace = {};


//추가하기버튼 클릭시
function addPlace(){
	var des = $('#description').val();
	var place = [place_id,lat,longi,place_name,address_name,des];
	var file = uploadFile;

	modalPlace = place;
	
	//console.log(modalPlace);
	
	var placeList = document.getElementById('placeList');
	var aPlace = document.createElement("div");
	aPlace.innerHTML = "<div class='places p-3 d-flex justify-content-between'>"
		+"<div>"
		+"<h4 id=''>"+place[3]+"</h4>"
		+"<div class='des'><small>"+des+"</small></div>"
		+"</div><div><span class='delPlace'>X</span>"
		+"</div>";
	placeList.append(aPlace);
	
	//본문 places 에 추가
	places.push(modalPlace);
	imgs.push(file);
	
	//input reset
	initialize();
	
	//모달 닫기
	$("#modal_addPlace").modal('hide');
}

//초기화
function initialize(){
	//지도 초기화
	reMap();
	//file 초기화
	$('#img').val(undefined);
	$('#imgBox').empty();
	//설명 초기화
	$('#description').val(undefined);
}

//다시선택하기 버튼 클릭시
function reMap(){
	console.log("지도다시선택");
	//info창 삭제
	$('#selectedMap').addClass('noShow');
	//지도 열기
	$('.map_wrap').removeClass('noShow');
	$('#menu_wrap').removeClass('noShow');
};

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
	var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
	imgOptions = {
		spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		offset : new kakao.maps.Point(13, 37)
	// 마커 좌표에 일치시킬 이미지 내에서의 좌표
	}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
			imgOptions), marker = new kakao.maps.Marker({
		position : position, // 마커의 위치
		image : markerImage
	});

	marker.setMap(map); // 지도 위에 마커를 표출합니다
	markers.push(marker); // 배열에 생성된 마커를 추가합니다

	return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
	}
	markers = [];
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

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
	var content = '<div style="padding:5px;z-index:1;">' + title
			+ '</div>';

	infowindow.setContent(content);
	infowindow.open(map, marker);
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {
	while (el.hasChildNodes()) {
		el.removeChild(el.lastChild);
	}
}
</script>