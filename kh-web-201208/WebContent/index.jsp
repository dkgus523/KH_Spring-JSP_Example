<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>index</title>
	<!-- <script src='./lib/jquery-3.5.1.min.js'></script> -->
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<body>
	<%
	// inc
	String inc = "intro.jsp";
	if(request.getParameter("inc") != null) {
		inc = request.getParameter("inc");
	}
	
	// sub
	String sub = "./jquery/menu.jsp";
	if(request.getParameter("sub") != null) {
		sub = request.getParameter("sub");
	}
	
	%>
	<div id='index'>
		<header id='header'>
			<img id='image' src='rupi.png'/>
			<h2>
				<marquee bgcolor="#CC99FF"> 루피의 홈페이지에 오신걸 환영합니다~ </marquee>
			</h2>
			<nav id='nav'>
				<ul>
					<li><a href='index.jsp'>HOME</a></li>
					<li><a href='index.jsp?sub=/jquery/menu.jsp'>JQUERY</a></li>
					<li><a href='index.jsp?sub=/ajax/menu.jsp'>AJAX</a></li>
					<li><a href='index.jsp?sub=/mybatis/menu.jsp'>MYBATIS</a></li>
					<li>방명록</li>
					<li>게시판</li>
					<li>회원관리</li>
				</ul>
			</nav>
		
		</header>
		<section id='contents'>
			<article class='content'>
				<!-- content  -->
				<jsp:include page="<%= inc %>"></jsp:include>	<!-- intro.jsp 파일 내용이 들어왔다!!! -->
				<!-- 페이지 통합하는 코드!!! -->		
			</article>
			
			<aside class='aside'>
				<img src='http://www.placehold.it/150X100'/>
				<div id='sub_menu'>
					<jsp:include page="<%= sub %>"/>
				</div>
			</aside>
			
			
		</section>
		<footer id='footer'>융합 S/W 개발(주)</footer>
	</div>
	<script>
		
		// 모든 기본 태그의 margin과 padding을 0으로 설정. ( 기본 문법: $().css() )
		//$('*').css('margin', '0px');
		//$('*').css('padding', '0px');
		
		// padding의 증가의 영향을 최소화 하기 위한 조치
		$('*').css('box-sizing', 'border-box');

		// link underline 날리기
		$('a').css('text-decoration', 'none');
		
		// index 페이지의 넓이와 중앙 배치
		$('#index').css('width', '800px');
		$('#index').css('margin', 'auto');
		
		// header의 높이와 바탕색 지정
		$('#index > #header').css('height', '150px');
		$('#index > #header').css('background-color', '#ccc');
		$('#index > #header').css('margin-top', '5px');
		// header 영역의 position
		$('#index>#header').css('position', 'relative');

		//이미지 왼쪽에 붙이기
		$('#header>#image').css({
			'width' : '140px',
			'height' : '140px',
			'position' : 'absolute',
			'left' : '30px',
			'top' : '5px'
		});
		// 이미지 클릭시 변경 
		$('#header>#image').on({ 
			'click': function(){ //썸네일이미지를 클릭했을 때
				$('#header>#image').attr('src','blackCat.jpg'); 
				//큰 이미지에 속성 src를 imgSrc로 변경합니다.
			} 
		});
		
		//홈페이지 환영글
		$('#header>h2').css({
			'position' : 'absolute',
			'right' : '90px',
			'top': '40px'
		})
		// position 오른쪽 하단으로 붙이기
		$('#header>#nav').css({
			'position':'absolute',
			'right':'5px',
			'bottom':'5px'
		});
		
		// header>nav
		$('#header>#nav>ul').css({
			'list-style'	:'none',
		});
		
		$('#header>#nav>ul>li').css({
			'display'	: 'inline-block',
			'padding'	: '3px',
			'width'	: '80px',
			'background-color'	: '#99f',
			'text-align'		: 'center'
		});
		
		
		// 메뉴 모양 만들기
		$('#header>#nav>ul>li').first().css('border-radius', '8px 0 0 8px');
		$('#header>#nav>ul>li').last().css('border-radius', '0 8px 8px 0');
		
		// contents는 최소 높이만 지정
		$('#index > #contents').css('min-height', '550px');
		
		// footer 높이와 바탕색, 글자 가운데 정렬 지정
		<!--
		$('#index > #footer').css('height', '100px');
		$('#index > #footer').css('background-color', '#bbb');
		$('#index > #footer').css('text-align', 'center');
		$('#index > #footer').css('line-height', '100px');
		-->
		
		// footer 높이와 바탕색, 글자 가운데 정렬을 JSON 표기법으로 지정
		$('#index > #footer').css({
			'height' 			: '100px',
			'background-color'  : '#bbb',
			'text-align' 		: 'center',
			'line-height' 		: '100px'
		});
		
		// contents 영역 분리 하기
		$('#index > #contents').css({
			'margin-top' 	: '3px',
			'margin-bottom' : '3px',
		});
		
		$('#index > #contents > .content').css({
			'width' 			: '650px',
			'float'				: 'left',
			'height' 			: '250px',
			/* 'border'  			: '1px solid crimson' */
		});
		
		$('#index > #contents > .aside').css({
			'float' : 'left',
			'width' 			: '150px',
		});
		
		$('#index>#contents>.aside>#sub_menu').css({
			'width':'150px',
		});
		
		$('#index>#contents>.aside>#sub_menu>ol').css({
			<!--#sub_menu에서 ol로 바로 접근할 수 있네?!-->
			'margin-left':'17px',
		});
		
	</script>
</body>
</html>