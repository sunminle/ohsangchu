<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">


<script>
$(document).ready(function() {
    $('#summernote').summernote({
        height: 700,
        minHeight: null,
		maxHeight: null,
		focus: true,
        lang: "ko-KR",
        placeholder: '상품의 이미지와 소개를 적어주세요.',
        callbacks: {	//여기 부분이 이미지를 첨부하는 부분
			onImageUpload : function(files) {	
				for(i = 0 ; i < files.length ; i++){
					uploadSummernoteImageFile(files[i],this);
				}
			},
			onPaste: function (e) {
				var clipboardData = e.originalEvent.clipboardData;
				if (clipboardData && clipboardData.items && clipboardData.items.length) {
					var item = clipboardData.items[0];
					if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
						e.preventDefault();
					}
				}
			}
		}
    });
});

function uploadSummernoteImageFile(file, editor) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "/my/uploadSummernoteImageFile",
		contentType : false,
		processData : false,
		dataType: 'json',
		success : function(data) {
        	//항상 업로드된 파일의 url이 있어야 한다.
			$(editor).summernote('insertImage', data.url);
		}
	});
}

$("div.note-editable").on('drop',function(e){
    for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
    	uploadSummernoteImageFile(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
    }
   e.preventDefault();
})
</script>
</head>
<!-- css -->
<link href="/resources/css/main.css" rel="stylesheet">
<!-- bootstrap:css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<center>
	<h2>상품 등록</h2>
	<form action="/my/addProductPro" method = "post" enctype="multipart/form-data">
    상품 이름 : <input type = "text" name = "productName"> <br/>
    상품 가격 : <input type = "number" name = "price"> <br/>
    상품 수량 : <input type = "number" name = "quantity"> <br/>
    상품 소개 <br/> <textarea id="summernote" name = "productIntro"></textarea><br/>
    수량 공개 여부 : 	<select name = "isPublic">
    					<option value = "0">비공개</option>
    					<option value = "1">공개</option>
    				</select> <br/>
    카테고리 : 	<select name = "categoryId">
    				<option value = "100">전자기기</option>
    				<option value = "200">학용품</option>
    			</select> <br/>
    <input type = "submit" value = "등록하기">
    </form>
    </center>
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    