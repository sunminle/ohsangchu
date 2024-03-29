<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet"
	href="/resources/css/summernote/summernote-lite.css">

<style>
	ul li {
		display: inline-block;
		margin: 0 5px;
		font-size: 14px;
		letter-spacing: -.5px;
		}

	form {
		padding-top: 16px;
		}

	ul li.tag-item {
		padding: 4px 8px;
		border: solid 1px #dddd;
		border-radius: 10px;
		color: #000;
		}
	
	ul li.type-item {
		padding: 4px 8px;
		border: solid 1px #dddd;
		border-radius: 10px;
		color: #000;
		}
	
	.tag-item:hover {
		background-color: #dddd;
		color: gray;
		}
		
	.type-item:hover {
		background-color: #dddd;
		color: gray;
		}

	.del-btn {
		font-size: 12px;
		font-weight: bold;
		cursor: pointer;
		margin-left: 8px;
		}
		
		.DeliveryDel-btn {
		font-size: 12px;
		font-weight: bold;
		cursor: pointer;
		margin-left: 8px;
		}
</style>

<script>

	var tags = [];

	$(document).ready(function() {
		$('#summernote').summernote({
			height: 700,
			minHeight: null,
			maxHeight: null,
			focus: true,
        	lang: "ko-KR",
        	placeholder: '상품의 이미지와 소개를 적어주세요 상품정보는 수정이 불가능합니다.',
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
    
    
    //해시태그
    
	var counter = 0;
   
    //태그 추가
	function addTag(value) {
		tag[counter] = value; // 태그를 Object 안에 추가
		counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
		tags.push(value);   //태그값을 tags에 넣기
    };
    //서버에 넘길때 tag값들을 array type 으로 
	function marginTag() {
		return Object.values(tag).filter(function (word) {
			return word !== "";
		});
	};
	
	var self ;
	var tagValue ;
	
	$("#plusTag").on("click", function () {
		self = $("#tag");
		tagValue = self.val(); // 입력값
       //null값이아니라면
		if (tagValue !== "") {
			// 같은 태그가 있는지 검사, 해당값이 array 로 return
			var result = Object.values(tag).filter(function (word) {
				return word === tagValue;
			});

            // 태그 중복 검사
			if (result.length == 0) {
       	   
				$.ajax({
					type: "POST",
					url: "/my/addHashtag",  
					data: { tag: tagValue },
					success: function (response) {
						console.log(response);
						if(response.responseCode === "error"){
							alert("특수문자,공백은 포함할 수 없습니다.");
						}else{
						$("#tag-list").append("<li class='tag-item'>#"
						+ tagValue
						+ "<span class='del-btn close-icon' idx='" + counter + "'>X</span><input type = 'hidden' value = '" + tagValue + "' name = 'hashtag'/></li>");
						addTag(tagValue);
						self.val("");
						}
					},
					error: function (error) {
						console.error(error);
					}
				});
			}else{
				alert("태그값이 중복됩니다.");
				}
			}
		}); 
	
	$("#tag").on("keypress", function(e){
		if(e.which === 13){
			e.preventDefault();
			}
		})
		
		
		
		
		//배달 방식
	var typeCounter = 0;
	var typePriceCounter = 0;
	function addType(value1,value2) {
		type[typeCounter] = value1; // 태그를 Object 안에 추가
		typeCounter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
		types.push(value1);   //태그값을 tags에 넣기
		
		typePrice[typePriceCounter] = value2;
		typePriceCounter++;
		typePrices.push(value2);
    };
    //서버에 넘길때 tag값들을 array type 으로 
	function marginType() {
		return Object.values(type).filter(function (word1) {
			return word1 !== "";
		});
	};
	
	function marginTypePrice() {
		return Object.values(typePrice).filter(function (word2) {
			return word2 !== "";
		});
	};
	
	var selfType ;
	var typeValue ;
	var types = [];
	var selfTypePrice ;
	var typePriceValue ;
	var typePrices = [];
	$("#plusType").on("click", function () {
		selfType = $("#type");
		typeValue = selfType.val(); // 입력값
		selfTypePrice = $("#typePrice");
		typePriceValue = selfTypePrice.val();
       //null값이아니라면
		if (typeValue !== "" && typePriceValue != "") {
			// 같은 태그가 있는지 검사, 해당값이 array 로 return
			var result1 = Object.values(type).filter(function (word1) {
				return word1 === typeValue;
			});
			var result2 = Object.values(typePrice).filter(function (word2) {
				return word2 === typePriceValue;
			});

            // 태그 중복 검사
			if (result1.length == 0) {
       	   
				$.ajax({
					type: "POST",
					url: "/my/addDeliveryType",  
					data: { type: typeValue,
							typePrice : typePriceValue},
					success: function (response) {
						console.log(response);
						if(response.responseCode === "error"){
							alert("오류.");
						}else{
						$("#type-list").append("<li class='type-item'>"
						+ typeValue
						+ "<span class='DeliveryDel-btn close-icon' idx='" + typeCounter + "'>X</span><input type = 'hidden' value = '" + typeValue + "' name = 'deliveryTypeName'/></li>"
						+"<li class='type-item'>"
						+ typePriceValue
						+ "원<span class='DeliveryDel-btn close-icon' idx='" + typePriceCounter + "'>X</span><input type = 'hidden' value = '" + typePriceValue + "' name = 'deliveryTypePrice'/></li>"
						);
						addType(typeValue,typePriceValue);
						selfType.val("");
						selfTypePrice.val("");
						}
					},
					error: function (error) {
						console.error(error);
					}
				});
			}else{
				alert("배달방식이 중복됩니다.");
				}
			}
		}); 
	
	$("#type").on("keypress", function(e){
		if(e.which === 13){
			e.preventDefault();
			}
		})
	
	$("#typePrice").on("keypress", function(e){
		if(e.which === 13){
			e.preventDefault();
			}
		})	
		
		
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
				$("#addProduct").append("<br/><input type='hidden' name='fileName' value='"+data.fileName+"' />");
				console.log(data.fileName);
				//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);;
			}
		});
	}

	$("div.note-editable").on('drop',function(e){
		for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
			uploadSummernoteImageFile(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
		}
		e.preventDefault();
	})

	$(function(){
		$("#plusProduct").click(function(){
			var plus = $("<div class = 'productGroup'>상품명 : <input type='text' name='product' />"+
			" 수량 : <input type = 'number' name = 'quantity'/>"+
			" 가격 : <input type = 'number' name = 'price'/>"+
			"  <input type = 'button' id = 'remove' value = '삭제' /><br/></div>")
			$("#addProduct .productInfo").append(plus);
			plus.find('#remove').click(function(){
				plus.remove();
			});
		});
	}); 

	  // 삭제 버튼:비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
	$(document).on("click", ".del-btn", function (e) {
		var index = $(this).attr("idx");
		tag[index] = "";
		$(this).parent().remove();
		tags.splice(index, 1);
	});
	
	$(document).on("click", ".DeliveryDel-btn", function (e) {
		var index = $(this).attr("idx");
		var itemToRemove = $(this).parent();
	    itemToRemove.prev().remove(); // 이전 형제 노드 (이름 또는 금액)
	    itemToRemove.remove(); // 현재 노드 (x 버튼)
	    tags.splice(index, 2); // 배열에서 이름과 금액 두 개의 요소 삭제
	});

	function validateForm() {
		var title = document.forms["addProduct"]["title"].value;
        var content = document.forms["addProduct"]["content"].value;
        var productGroups = document.querySelectorAll('.productGroup');
        var selectedPaymentType = document.querySelector('input[name="paymentType"]:checked');
        for (var i = 0; i < productGroups.length; i++) {
            var product = productGroups[i].querySelector('input[name="product"]').value;
            var quantity = productGroups[i].querySelector('input[name="quantity"]').value;
            var price = productGroups[i].querySelector('input[name="price"]').value;

            if (product === "" || quantity === "" || price === "") {
                alert("상품 정보를 모두 작성하세요.");
                return false;
            }
        }

        // 초기 폼 필드 확인
        if (title === "") {
            alert("제목을 작성하세요.");
            return false;
        }
        
        if (content === "") {
            alert("내용을 작성하세요.");
            return false;
        }
        
        if (!selectedPaymentType) {
            alert("결제방식을 선택하세요.");
            return false;
        }
        
        
        return true;
    }
	
	
	
	
	
	
	
</script>
</head>
<c:if test="${storeCount > 0}">
<!-- css -->
<link href="/resources/css/include.css" rel="stylesheet">
<!-- bootstrap:css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<center>
	<h2>상품 등록</h2>
	<form action="/my/addProductPro" method="post"
		enctype="multipart/form-data" id="addProduct" onsubmit="return validateForm()">
		제목 : <input type="text" name="title"> <br /> 썸네일 : <input
			type="file" name="thumnails" accept="image/*"><br /> 상품 소개 <br />
		<textarea id="summernote" name="content"></textarea>
		<br /> 상품 정보<br />
		<div class="productInfo">
			<div class="productGroup">
				상품명 : <input type="text" name="product"> 수량 : <input
					type="number" name="quantity"> 가격 : <input type="number"
					name="price">
			</div>
		</div>
		<br /> <input type="button" value="상품추가" id="plusProduct"> <br />
		수량 공개 여부 : <select name="isPublic">
			<option value="0">비공개</option>
			<option value="1">공개</option>
		</select> <br /> 카테고리 : <select name="categoryId">
			<c:forEach var = "cat" items = "${catDTO}">
			<option value="${cat.id}">${cat.categoryName}</option>
			</c:forEach>
			
		</select> <br />
		<!-- 태그추가 -->
		<div class="m-2 d-flex align-items-center justify-content-center">
			<div class="col-1">
				<label for="tag"></label><span style="width: 100px;">해시태그 입력</span>
			</div>
			<div class="col-2">
				<input class=" form-control" type="text" id="tag" size="20" />
			</div>
			<input type="button" value="추가하기" id="plusTag">
		</div>
		<ul id="tag-list"></ul>
		
		<!-- 배달방식 추가 -->
		<div class="m-2 d-flex align-items-center justify-content-center">
			<div class="col-1">
				<label for="type"></label><span style="width: 100px;">배달방식 입력<br/>ex)제주도,택배</span><br/>
				<label for="type"></label><span style="width: 100px;">금액 입력(숫자만)</span>
			</div>
			<div class="col-2">
				<input class=" form-control" type="text" id="type" size="20" /><br/>
				<input class=" form-control" type="number" id="typePrice" size="20" />
			</div>
			<input type="button" value="추가하기" id="plusType">
		</div>
		<ul id="type-list"></ul>
		
		
		<!-- 결제방식 -->
		<h5>결제방식</h5>
		<input type="radio" name="paymentType" value="무통장 입금">무통장 입금<br>
		<input type="radio" name="paymentType" value="카카오 페이">카카오 페이<br/><br/><br/>

		
		<input type="submit" value="등록하기">
	</form>




</center>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</c:if> 

<c:if test="${storeCount == 0 }">
	<script>
		alert("상점개설 후 이용가능합니다.");
		history.go(-1);
	</script>
</c:if>
