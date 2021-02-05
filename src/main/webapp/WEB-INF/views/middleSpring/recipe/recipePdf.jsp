
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
    color :  #000080;
 	background-color : #F0F8FF;
 	
    }
div1 {
	width : 500px;
	height : 800px;
}
img {

width : 400px;
height : 300px;

}

#conte {
 margin-left : 40px;

}


</style>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript"
	src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
						
<script>
	$(document).ready(
			function() {

				$('#savePdf').on(
						'click',
						function() {

							//PrintDiv(null);

							//pdf_wrap 을 canvas 객체로 변환
							var div = $('#pdf_wrap')[0];
							console.log(div.innerHTML);

							html2canvas($('#pdf_wrap')[0]).then(
									function(canvas) {

										//캔버스를 이미지로 변환
										//downloadURI(canvas, "testImg.png");

										var imgData = canvas
												.toDataURL('image/png');

										//이미지 가로 길이

										var imgWidth = 500;

										//출력 페이지 세로 길이 계산  A4 기준

										var pageHeight = imgWidth * 1.414;

										var imgHeight = canvas.height
												* imgWidth / canvas.width;

										var heightLeft = imgHeight;

										var margin = 0; // 출력 페이지 여백설정

										var doc = new jsPDF('p', 'mm');

										var position = 0;

										console.log("imgHeight  : " + imgHeight
												+ ",  heightLeft: "
												+ heightLeft
												+ ",  pageHeight : "
												+ pageHeight);

										console.log(" canvas.height  : "
												+ canvas.height
												+ ", canvas.width: "
												+ canvas.width);

										//첫 페이지 출력

										//이미지를 기반으로 pdf 생성

										doc.addImage(imgData, 'PNG', margin,
												position, imgWidth, imgHeight);

										heightLeft -= pageHeight;

										console.log("imgHeight  : " + imgHeight
												+ ",  heightLeft: "
												+ heightLeft
												+ ",  pageHeight : "
												+ pageHeight);
										//한 페이지 이상일 경우 루프를 돌면서 출력한다.

										while (heightLeft >= 20) {

											position = heightLeft - imgHeight;

											doc.addPage();

											doc.addImage(imgData, 'png', 0,
													position, imgWidth,
													imgHeight);

											heightLeft -= pageHeight;
										}
										//pdf 저장
										doc.save('Recipe.pdf')
									});

						})

				$('#back').on('click', function() {
					
					var rbcod = $('.imgt').attr('id');
					console.log("rbcod 확인용 : " + rbcod);
					
					 location.href='${cp}/middleController/viewOneRecipe?rbcod=' + rbcod

				})

				//이미지(png)로 다운로드
				function PrintDiv(div) {
					div = $('#pdf_wrap')[0]
					html2canvas(div).then(function(canvas) {
						var myImage = canvas.toDataURL();
						downloadURI(myImage, "저장이미지이름.png")
					});
				}

				function downloadURI(uri, name) {
					var link = document.createElement("a")
					link.download = name;
					link.href = uri;
					//	document.body.appendChild(link);
					document.body.appendChild(uri);
					//	link.click();
				}

			})
</script>

<body>




	
	<div id="div1">
	
		<h2>레시피</h2>
	
		
		<div id="pdf_wrap" style="white-space:pre;">
		<img alt="로딩중" src="${cp}/image/${recipevo.filename}" class="imgt" id="${recipevo.rb_cod}"> 
			<div id="conte">${recipevo.rb_content}</div>
		</div>

	</div>
	<br>
	<input id="savePdf" class="btn btn-warning alert1" type="button" value="pdf 다운로드">
	<input id="back" class="btn btn-warning alert1" type="button" value="뒤로가기">

</body>
</html>