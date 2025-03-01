<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>persfume</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
 
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: sans-serif;
         
        }


        .header{
            width: 100%;
            height: 90px;
            position: fixed;
            z-index: 999;
            display: flex;
            justify-content: space-around;
            background-color: rgba(240, 240, 240, 30%);
        }

        #search_form {
            width : 100%;
            height : 20%;
            margin : auto;
        
        }
        #search_form *{
            display: inline;
        }
         #search_form input {
            width: 80%;
            border: 1px solid lightgrey;
            font-size: 14px;      
            border-radius: 10px;   
               height: 100%;   
        }    
         #search_form img {
            border: 1px solid pink;
            width: 10%;
         
        }
        #search_button {
            width: 10%;
            height: 10%;
            cursor: pointer;
        }


        /* 여기서부턴 공통 스타일? (아마도) */
		.content-area {
		text-align: center;
		}
		.content-area>div{
		text-align: center;
		
		}
	
        .content-title{
            background: url(resources/images/perfume-subtitle.jpg);
            height: 320px;
            background-size: cover;
            background-position: center;
            object-fit: cover;
            text-align: center;
            line-height: 320px;
            font-size: 50px;
        	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
            color: white;
            width: 100%;
        }

        .content-main{
            width: 1400px;
            display: inline-block;
            text-align: center;
        }
        .content-main>div{   
        display: inline-block;
           float: left;
        }
 
        .content-left{
            height: 700px;
            width: 17%;

        }
        #a2{
        width: 83%;}
        .content-right{
           

        }
        .content-right div{
            float: left;
           
        }
       .content-sort{
        width: 100%;
        height: 20px;
        text-align: right;     
        float: right;
       }
       .content-sort *{
        margin-right: 10px;
        text-decoration: none;
        color: black;
       }

        /* 여기서부턴 개별 스타일? (아마도) */

        .oneday-class{
            display: inline-block;
            width: 250px;
            height: 390px;
            margin: 12px 14px;
            transition: all .5s ease;
        }

        .onHover{
            cursor: pointer;
            border-radius: 10px;
            border-color: rgba(0, 0, 0, 0.2);
            opacity: 85%;
            transform: scale(1.04);
            box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);
        	/* box-shadow: 0 4px 8px rgba(0,0,0,0.2); */
        }

        .oneday-class>.class-img{
            width: 100%;
            height: 60%;
        }

        .oneday-class>.class-img>img{
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 10px;
        }

        .oneday-class>.class-title{
            width: 245px;
            height: 70px;
            line-height: 20px;
            font-size: 13px;
            font-weight: 200; 
            word-wrap: break-word;

        }

        .oneday-class .class-price{
            font-size: 25px;
            text-align: right;
            font-weight: bold;
            color: black;
        }

        .oneday-class .class-teacher{
            width: 245px;
            font-size: 14px;
            line-height: 35px;
            font-weight: 650;
            display: flex;
            flex-direction: row;
            justify-content: start;
            align-items: center;
            margin-left: 5px;
            gap: 10px;
        }

        .oneday-class .class-teacher>div{
            width: 30px;
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .oneday-class .class-teacher>div>img{
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
        }

        .oneday-class .class-location{
            color: lightgray;
            border-radius: 5px;
            font-size: 15px;
            font-weight: 700;
            
        }
        .oneday-class .class-discount{
            color: red;
            font-size: 15px;
            font-weight: bold;

        }
        .oneday-class .class-data{
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            height: 10%;
            width: 250px;
        }
      

    .gender-li {
    list-style-type: none;
    }    
    .note-check {
        
      width: 230px;
   
      padding: 5px; 
    }

    .note-element{
    
      list-style-type: none;
      padding: 0;
      margin: 0;
      overflow-y: auto;
      text-align: left;
    }

    .note-element-li {

      margin-bottom: 5px; 
      list-style-type: none;
      height: 200px;
    }
 
    .swiper {
        width: 1000px;
        height: 300px;
        margin: 30px;
    }

    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
        width : 100%;
        height : 100%;
        object-fit : fill;
    }

    /* 화살표 버튼색 변경 (기본색은 파란색) */
    div[class^=swiper-button] {
        color : white;
         display : none; 
    }
    .wishlist-badge {
    display: inline-block;
    background-color: #ff6f61;
    color: #fff;
    padding: 5px 10px;
    border-radius: 20px;
    font-size: 14px;
    font-weight: bold;
    margin-top: 10px;
}

.wishlist-badge span {
    font-size: 16px;
    color: #fff;
}
  /* gpt가 꾸며준 css 부분*/
  .content-left {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);

}

/* 제목 스타일 설정 */
.content-left > div {
    font-size: 18px;
    font-weight: 600;

    margin-bottom: 10px;
}

/* 성별 검색 스타일 설정 */
.gender {
    list-style: none;
    padding: 0;
    margin: 0 0 10px 0;
}

.gender-li {
    margin-bottom: 10px;
}

.gender-li input[type="checkbox"] {
    margin-right: 10px;
}

.gender-li label {
    font-size: 16px;
}

/* 성분 검색 스타일 설정 */
.note-element {
    margin-bottom: 20px;
}

.note-check {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.note-element-li {
    list-style: none;
    padding: 0;
    width: 100%;
}

.note-element-li > li {
    margin-bottom: 10px;
}

.note-element-li .topnote,
.note-element-li .middlenote,
.note-element-li .basenote {
    font-size: 16px;
    font-weight: 600;
    width: 100%;
    margin-top: 10px;
}

.note-element-li input[type="checkbox"] {
    margin-right: 10px;
}

.note-element-li label {
    font-size: 14px;
}

/* 결과 내 검색 스타일 설정 */
#header_2 {
    margin-top: 10px;
}

.search {
    display: flex;
}

.search input[type="text"] {
    width: 70%;
	height: 100%;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
}

.search button {
    background-color: #4CAF50;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    height:25px;
    width:25px;
}

.search button:hover {
    background-color: #45a049;
}
/* 페이징 바 */
#pagingArea {
    margin-left: 40%;
    margin-top: 20px;
    position: relative;
    width: 100%;
}

.pagination {
    list-style: none;
    padding: 0;
    display: inline-block;
    text-align: center;
}

.page-item {
    display: inline;
    margin: 0 5px;
}

.page-item a {
    text-decoration: none;
    color: #007bff;
    padding: 5px 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.page-item a:hover {
    background-color: #f0f0f0;
}

.page-item.disabled a {
    color: #999;
    pointer-events: none;
}

.page-item.active a {
    background-color: #007bff;
    color: white;
    pointer-events: none;
}
/* sort부분  */
.content-sort a {
    font-size: 16px;
    color: #333;
    text-decoration: none;
    padding: 8px 15px;
    border-radius: 5px;
    transition: background-color 0.3s, color 0.3s;
    
}

.content-sort a:hover {
    background-color: navy;
    color: white;
}
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />

  
    <div class="content-area" style="text-align:center;">
        <div class="content-title" id="home">Perfume</div>
<div class="content-subtitle">
    <div id="content_1">
     
        <div class="swiper">
        
            <div class="swiper-wrapper" >
         
              <div class="swiper-slide"><img src="resources/images/banner2.jpg"></div>
                <div class="swiper-slide"><img src="resources/images/banner3.jpg"></div>
                <div class="swiper-slide"><img src="resources/images/banner4.jpg"></div>
                <div class="swiper-slide"><img src="resources/images/banner5.jpg"></div>
            </div>
        
  
            <div class="swiper-pagination"></div>
        
        
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        
   
            
        </div>
    </div>

    
</div>
        <div class="content-main" style=" text-align:center;">

            <div class="content-left"> 
                <div  style="font-size: 18px; font-weight: 600; text-align: center;" > 성별 검색 </div>
                <ul class="gender">
                    <li class="gender-li">
                        <input name="search_form[option_data][]" id="man" value="남자" type="checkbox"> 
                            <label for="man">남성</label>
                    </li>
                    <li class="gender-li">
                        <input name="search_form[option_data][]" id="woman" value="여자" type="checkbox"> 
                            <label for="woman">여성</label>
                    </li>
                </ul>

                <div  style="font-size: 18px; font-weight: 600; text-align: center;" > 성분 검색 </div>

                <div class="note-element">
                  
                         <div class="note-check">
                                 <ul class="note-element-li">                                   
                                        <li class="topnote" style="font-size: 16px; font-weight: 600; text-align: center;">탑노트</li>
                                         <c:forEach var="t" items="${ requestScope.topN }" varStatus="status">
                                            <li>
                                                <input name="search_form[option_data][]" id="${t.topNote}" value="${t.topNote}" type="checkbox"> 
                                                <label for="${t.topNote}">${t.topNote}</label>
                                            </li>
                                            	</c:forEach>
                                      
                                        <li class="middlenote"  style="font-size: 16px; font-weight: 600; text-align: center;">미들노트</li>
                                              <c:forEach var="m" items="${ requestScope.midN }" varStatus="status">
                                            <li>
                                                <input name="search_form[option_data][]" id="${m.middleNote}" value="${m.middleNote}" type="checkbox"> 
                                                <label for="${m.middleNote}">${m.middleNote}</label>
                                            </li>
                                            	</c:forEach>
                                        <li class="basenote"  style="font-size: 16px; font-weight: 600; text-align: center;">베이스노트</li>
                                               <c:forEach var="b" items="${ requestScope.BaseN }" varStatus="status">
                                            <li>
                                                <input name="search_form[option_data][]" id="${b.baseNote}" value="${b.baseNote}" type="checkbox"> 
                                                <label for="${b.baseNote}">${b.baseNote}</label>
                                            </li>
                                            	</c:forEach>       

                                 </ul>
                         </div>
                </div>               
               
               <div  style="font-size: 18px; font-weight: 600; text-align: center;"> 결과 내 검색  </div>
               <div id="header_2">
                <form id="search_form" action="search.do" method="get">
                    <div class="search">
                        <input type="text" name="text" id="searchtext" placeholder=" 검색어 입력">
                        <button type="submit">
                     <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" onclick="searching();"
                             id="search_button" style="color: black; height:10px;"></button>
                    </div>
                </form>
            </div>
                <!-- 검색창 클릭 기능 구현 JS 스크립트-->
                <script> 
                document.getElementById("search_button").addEventListener("click", function() {
                document.getElementById("search_form").submit(); });
                </script>
           
             </div>
			
			  <div id="a2"> 
				<div id="a">
             <div class="content-right"> 
               <div class="content-sort" style="display: block;" >
           
                    <p>
                        <a href="list.po">신상순</a>
                        <a href="poplist.po">판매순</a>
                        <a href="desclist.po">고가순</a>
                        <a href="asclist.po">저가순</a>
                    </p>
              </div>

           
        
               <c:if test="${ requestScope.list == null }"> <div>검색결과가 없습니다.</div> </c:if>
		<c:forEach var="p" items="${ requestScope.list }" varStatus="status">
		
            <div class="oneday-class" name="${p.productNo}">
                <div class="class-img">
                    <img src="../persfumeAdmin/${ilist[status.index].productImgPath}" alt="상품이미지">
                </div>

                <div class="class-data">
                    <div class="class-teacher"> 
                      ${p.productName}
                    </div>
                      <div class="wishlist-badge">LIKE: <span>${falist[status.index]}</span></div>
                </div>
                
                <div class="class-title">  ${p.productExplain}
                </div>
                <div class="class-data">
                    <div class="class-location"><s> <fmt:formatNumber value="${p.productPrice}" type="number" />원</s></div>
                    <div class="class-discount">${p.discount}%</div>
                    <div class="class-price"><fmt:formatNumber value="${p.productPrice * (100-(p.discount))/100}" type="number" />원</div>
                </div>
            </div>
                   </c:forEach>   
        
        

                     
             <div id="pagingArea" style="text-align:center;  " >
                <ul class="pagination" style="text-align:center;">
                
                	<c:choose>
                	<c:when test="${ requestScope.pi.currentPage eq 1 }">	
                    	<li class="page-item disabled">
                    		<a class="page-link" href="#">Previous</a>
                    	</li>
                    </c:when>
                    <c:otherwise>
                    	<li class="page-item">
                    		<a class="page-link" 
                    		   href="list.po?cpage=${ requestScope.pi.currentPage - 1 }">
                    			Previous
                    		</a>
                    	</li>
                    </c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ requestScope.pi.startPage }"
                    		   end="${ requestScope.pi.endPage }"
                    		   step="1">
                    	
                    	<c:choose>	   
                    	<c:when test="${ requestScope.pi.currentPage ne p }">
                    		<li class="page-item">
		                    	<a class="page-link" href="list.po?cpage=${ p }">
									${ p }
								</a>
		                    </li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item active">
		                    	<a class="page-link">
									${ p }
								</a>
		                    </li>
                    	</c:otherwise>
	                    </c:choose>
                    </c:forEach>
                    
                    <c:choose>
                    <c:when test="${ requestScope.pi.currentPage eq requestScope.pi.maxPage }">
	                    <li class="page-item disabled">
	                    	<a class="page-link" href="#">
	                    		Next
	                    	</a>
	                    </li>
                    </c:when>
                    <c:otherwise>
	                    <li class="page-item">
	                    	<a class="page-link" 
	                    	   href="list.po?cpage=${ requestScope.pi.currentPage + 1 }">
	                    		Next
	                    	</a>
	                    </li>
	                </c:otherwise>
                    </c:choose>
                </ul>
           		 </div>
            </div>
        </div>
          </div>
    </div>
  
   
 </div>


      <jsp:include page="../common/footer.jsp" />
  
    <script>
        $(function(){
            $(".oneday-class").hover(function(){
                $(this).toggleClass("onHover");
            });

        });

    </script>
   
   <script>
    // 슬라이더 동작 정의
    const swiper = new Swiper('.swiper', {
        autoplay : {
            delay : 3000 // 3초마다 이미지 변경
        },
        loop : true, //반복 재생 여부
        slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
        pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
            el: '.swiper-pagination',
            clickable: true
        },
        navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
            prevEl: '.swiper-button-prev',
            nextEl: '.swiper-button-next'
        }
    }); 
</script>
<!--  클릭 하면 상품 상세 조회로 넘어가는 스크립트 -->
<script>
	$(function() {
		
		$(".oneday-class").click(function() {
		
			let pno = $(this).attr('name');
			
			console.log(pno);
			
			location.href = "detail.po?pno=" + pno;
		});
	});
</script>
<script>
function searching(){
	var searchtext =  document.getElementById('searchtext').value;
	location.href = "search.do?text="+searchtext;
}
</script>

<script>
    $(document).ready(function() {
        $('input[name="search_form[option_data][]"]').on('change', function() {
            var selectedValues = [];
            $('input[name="search_form[option_data][]"]:checked').each(function() {
                selectedValues.push($(this).val());
            });

            if (selectedValues.length > 0) {
                var queryString = selectedValues.join(',');
                var searchUrl = 'searchNote.no?notes=' + encodeURIComponent(queryString);
                
                
        		$.ajax({
    				url : "searchNote.no",
    				type : "get",
    				data : {
    					notes : queryString
    				},
    				success : function(result) {
    					$('#a').remove();
    					$('#a2').html(result);
    				console.log(result);
    					
    					
    				},
    				error : function() {
    					console.log("ajax 통신 실패!");
    				}
    			});
                
                
           
            }
        });
    });
</script>

</body>
</html>