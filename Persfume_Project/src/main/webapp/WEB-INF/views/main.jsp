<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

/* Swiper 관련 영역 */
        /* 이미지 영역 사이즈 조절 */
        .swiper {
            width: 100%;
            height: 80vh;
        }

        .swiper-slide{
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            align-items: center;
        }

        /* 이미지 사이즈 조절 */
        .swiper-slide>.swiper-img{
            width : 30%;
        }

        .swiper-img>img{
            width: 100%;
        }

        /* 화살표 버튼색 변경 (기본색은 파란색) */
        div[class^=swiper-button] {
            display: none;
            color : white;
            /* display : none; */ /* 아니면 안보이게 숨기기도 가능 */
        }


        /* 섹션 관련 영역 */


        .main-section{
            position: relative;
            width: 100vw;
            height: 100vh;
            /* border: 1px solid red; */
            /* position: relative; */
        }

        .main-section:not(#home, #four) {
            padding-top: 120px;
        }
        

        /* 섹션 이동 버튼 관련 영역 */
        .nav-bar {
            position: fixed;
            z-index: 999;
            top: 50%;
            right: 50px;
            transform: translateY(-50%);
        }

        .nav-bar .nav-menu {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }

        .nav-bar .nav-menu li {
            position: relative;
            min-width: 200px;
            text-align: right;
            margin: 20px 0;
        }

        .nav-bar .nav-menu li .dot {
            display: block;
            color: #fff;
            padding: 5px 0;
        }

        .nav-bar .nav-menu li .dot::before{
            display: block;
            position: absolute;
            content: '';
            border-radius: 50%;
            top: 50%;
            transition: all .5s ease;
        }

        .nav-bar .nav-menu li .dot::before {
            width: 5px;
            height: 5px;
            right: 0;
            border: 2px solid #072f57;
            background-color: rgba(217, 93, 48, 1);
            transform: translateY(-50%);
        }

        .nav-bar .nav-menu li .dot.active::before,
        .nav-bar .nav-menu li:hover .dot::before {
            background: rgba(217, 93, 48, 1);
            border: #072f57;
        }

        .nav-bar .nav-menu li .dot.active::after,
        .nav-bar .nav-menu li:hover .dot::after {
            transform: translateY(-50%) scale(1);
        }


        /* End Nav Styles */

        /* 각 영역 관련 스타일 */

        .main-section-text,
        .main-section-text a{
            color: white;
            text-align: center;
            text-decoration: none;
        }

        #one1{
            background-color: white;
            height: 50vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 15px;
        }
        
        #one1>.main-section-text{
            color: black;
        }
        #one1>.main-section-content{
            width: 70%;
            text-align: center;
        }


        #one2{
            height: 50vh;
            display: flex;
            flex-direction: row;

        }
        #one2>img{
            height: 100%;
            width: 50%;  
            object-fit: fill;
        }

        
        /* #one2>.main-section-text{
            color: white;
        } */

        #two{
            /* background: rgb(151,151,151);
            background: radial-gradient(circle, rgba(151,151,151,1) 0%, rgba(99,99,99,1) 15%, rgba(41,41,41,1) 31%, rgba(0,0,0,1) 100%); */
            background-color: white;
            color: black;

        }

        #two, #two *{
            color: black;
        }


        #three{
            background: url(resources/images/bg.png) fixed;
            background-size: cover;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        #three>.main-section-text{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 100px;
            width: 80%;
            font-size: 20px;
        }
        #three h1{
            font-size: 70px;
        }

        #three *{
            width: 80%;
        }
        

        #four{
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;

            /* background-image: url(main-class.png);
            background-size: cover;
            back */
        }

        #four>#four-bg{
            background: rgb(125,177,230);
            background: radial-gradient(circle, rgba(125,177,230,1) 0%, rgba(49,91,134,1) 23%, rgba(7,47,87,1) 44%, rgba(4,32,60,1) 100%);
            width: 30%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            z-index: -100;
        }

        #four>.main-section-text{
            /* background: rgb(125,177,230);
            background: radial-gradient(circle, rgba(125,177,230,1) 0%, rgba(49,91,134,1) 23%, rgba(7,47,87,1) 44%, rgba(4,32,60,1) 100%); */
            width: 30%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 150px;
        }
        #four>.main-section-text *:not(button){
            transform: rotate(-90deg);
            text-align: start;
        }

        #four>.main-section-text button{
            color: white;
            width: 130px;
            padding: 10px 25px;
            border: 2px solid white;
            font-weight: 500;
            background: transparent;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
        }
        #four>.main-section-text button {
            transition: all 0.3s ease;
            overflow: hidden;
        }
        #four>.main-section-text button:after {
            position: absolute;
            content: " ";
            top: 0;
            left: 0;
            z-index: -1;
            width: 100%;
            height: 100%;
            transition: all 0.3s ease;
            -webkit-transform: scale(.1);
            transform: scale(.1);
        }
        #four>.main-section-text button:hover {
            color: black;
        }
        #four>.main-section-text button:hover:after {
            background: white;
            -webkit-transform: scale(1);
            transform: scale(1);
        }

        /* ---------------------------- */


        #four>.main-section-content{
            height: 100%;
            width: 70%;

        }
        
        #four>.main-section-content>.main-section-content-img,
        #four>.main-section-content>.main-section-content-img>img{
            width: 100%;
        }
        #four>.main-section-content>.main-section-content-img{
            height: 75%;
            object-fit: cover;
        }
        #four>.main-section-content>.main-section-content-img>img{
            height: 100%;
        }

        #four>.main-section-content>.main-section-content-text{
            height: 25%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #four>.main-section-content>.main-section-content-text *:not(h1){
            color: black;
            font-weight: 400;
            font-size: 15px;
            text-align: center;
        }

        #four>.main-section-content>.main-section-content-text h1{
            font-weight: 900;
            font-size: 40px;    
        }


        #four>.main-section-text>p{
            text-align: left;
        }

        #four h1{
            font-size: 70px;
        }


         배경 영상 관련 스타일
         #home {
            display: flex;
            justify-content: center;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            overflow: hidden;
            z-index: -1;
            opacity: 80%;
        }

        #bgVideo {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 100%;
            height: 100%;   
            transform: translate(-50%, -50%);
            background-size: cover;
            object-fit: fill;
        }

        #home-text{
            position:absolute; 
            top:50%; 
            left:25%; 
            transform:translate(-50%,-50%);
            z-index: 999;
            color: white;
        }

        #home-text>h1{
            font-size: 70px;
        }

</style>

</head>
<body>

	<jsp:include page="common/header.jsp"/>

	<!-- 
        * 여기부터 메인 페이지 영역
    -->

    <!-- Start Nav Section -->
    <nav id="nav-bar" class="nav-bar">
        <ul class="nav-menu">
        <li>
            <a data-scroll="home" href="#home" class="dot active">
            
            </a>
        </li>
        <li>
            <a data-scroll="one1" href="#one1" class="dot">
            
            </a>
        </li>
        <li>
            <a data-scroll="two" href="#two" class="dot">
            
            </a>
        </li>
        <li>
            <a data-scroll="three" href="#three" class="dot">
            
            </a>
        </li>
        <li>
            <a data-scroll="four" href="#four" class="dot">
            
            </a>
        </li>
        </ul>
    </nav>




    <div class="content-area">

        <div class="main-section" id="home">
            <video autoplay muted loop id="bgVideo">
                <source src="resources/images/perfume1.mp4" type="video/mp4">
            </video>
            <div id="home-text">
                <h1>간단한 소개 텍스트</h1>
            </div>
            <div id="home-bg"></div>
        </div>
    

        <div class="main-section left" id="one1">
            
            <div class="main-section-text animate__animated animate__slow">
                <h1 class="animate__animated animate__slower">NOTICE</h1>
            </div>

            <div class="main-section-content">
                <table class="table table-striped">
                    <tr>
                        <th>1</th>
                        <th>1</th>
                        <th>1</th>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>2</td>
                        <td>2</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>3</td>
                        <td>3</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>4</td>
                        <td>4</td>
                    </tr>

                </table>
            </div>
        </div>

        <div class="main-section" id="one2">
            <img src="https://cf.bysuco.net/aa42a4399152647e08868f088bc763df.jpg?w=2400&f=webp" alt="">
            <img src="https://cf.bysuco.net/aa42a4399152647e08868f088bc763df.jpg?w=2400&f=webp" alt="">
        </div>


        <div class="main-section down" id="two">
            <div class="main-section-text animate__animated animate__slow">
                <h1 class="animate__animated animate__slower">
                    BEST ITEM
                </h1>
            </div>
            <div class="main-section-content">
                <div id="content_1">
                    <div class="swiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="swiper-img"><img src="resources/images/bg.png" alt=""></div>
                                <div class="swiper-img"><img src="resources/images/bg.png" alt=""></div>
                                <div class="swiper-img"><img src="resources/images/bg.png" alt=""></div>
                            </div>
                            <div class="swiper-slide">
                                <div class="swiper-img"><img src="resources/images/bg.png" alt=""></div>
                                <div class="swiper-img"><img src="resources/images/bg.png" alt=""></div>
                                <div class="swiper-img"><img src="resources/images/bg.png" alt=""></div>
                            </div>
                            <div class="swiper-slide">
                                <div class="swiper-img"><img src="resources/images/bg.png" alt=""></div>
                                <div class="swiper-img"><img src="resources/images/bg.png" alt=""></div>
                                <div class="swiper-img"><img src="resources/images/bg.png" alt=""></div>
                            </div>
                            <div class="swiper-slide">
                                <div class="swiper-img"><img src="resources/images/bg.png" alt=""></div>
                                <div class="swiper-img"><img src="resources/images/bg.png" alt=""></div>
                                <div class="swiper-img"><img src="resources/images/bg.png" alt=""></div>
                            </div>
                        </div>
                    
                        <div class="swiper-pagination"></div>
                    
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    
                        <div class="swiper-scrollbar"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="main-section down" id="three">
            <div class="main-section-text animate__animated animate__slower">
                <h1>What's your scent.</h1>
                <p>
                    당신만의 개성과 취향을 반영한 퍼스널 향수를 추천해주는 자가진단 서비스입니다. 간단한 질문을 통해 당신의 라이프스타일, 좋아하는 향기, 감정 등을 분석하여 최적의 향수를 찾아드립니다. 지금 바로 시작하여 나만의 특별한 향기를 발견해보세요!
                </p>
                <h4> > <a href=""> 바로가기 </a></h4>
            </div> 
        </div>

        <div class="main-section left" id="four">
            
            <div class="main-section-text animate__animated animate__slow">
                <h1 class="animate__animated animate__slower">Oneday <br> Class</h1>
                <button onclick="location.href=''"> > List</button>
            </div>
            <div id="four-bg"></div>

            <div class="main-section-content">
                <div class="main-section-content-img">
                    <img src="resources/images/oneday.jpg" alt="">
                </div>
                <div class="main-section-content-text">
                    <div>
                        <h1>
                            자신만의 독창적인 향기를 창조해보세요. <br>
                        </h1>
                        <br>
                        이 클래스에서는 나만의 향수를 직접 만들 수 있는 특별한 기회를 제공합니다.<br>
                        초보자도 쉽게 따라할 수 있으며, 완성된 향수는 소중한 추억이 될 것입니다.
                    </div>
                </div>
                
            </div>
        </div>

    </div>
    
    <!-- 네비게이션 바 스타일 스크립트 -->
    <script>
        $(document).ready(function() {
            var jbOffset = $('.content-area>#home').offset().top + $('.content-area>#home').height();
            $(window).scroll(function() {
                if ($(document).scrollTop() > jbOffset/2) {
                    $('#header').addClass('jbFixed-after');
                    $('#header').removeClass('jbFixed-before');
                } else {
                    $('#header').addClass('jbFixed-before');
                    $('#header').removeClass('jbFixed-after');
                }
            });

            $("#header").hover(function(){
                $('#header').addClass('jbFixed-after');
                $('#header').removeClass('jbFixed-before');   
            }, function(){
                $('#header').addClass('jbFixed-before');
                $('#header').removeClass('jbFixed-after');
            });
        });
    </script>

    <!-- Main Page 관련 스크립트 -->
    <script>
        $(function(){

            var link = $('#nav-bar a.dot');
            link.on('click',function(e){
                
                //href 속성을 통해, section id 타겟을 잡음
                var target = $($(this).attr('href')); 
                
                //target section의 좌표를 통해 꼭대기로 이동
                $('html, body').animate({
                    scrollTop: target.offset().top
                },600);
                
                //active 클래스 부여
                $(this).addClass('active');

                //앵커를 통해 이동할때, URL에 #id가 붙지 않도록 함.
                e.preventDefault();
            });

            $(window).on('scroll',function(){
                findPosition();
            });

            function findPosition(){
                $('.main-section').each(function(){
                    if( ($(this).offset().top - $(window).scrollTop() ) < 20){
                        link.removeClass('active');
                        $('#nav-bar').find('[data-scroll="'+ $(this).attr('id') +'"]').addClass('active');
                    }
                });
            }

            findPosition();
        });

        // 슬라이더 동작 정의
        const swiper = new Swiper('.swiper', {
            autoplay : {
                delay : 8000 // 3초마다 이미지 변경
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


        let observer = new IntersectionObserver(
            (e)=>{
                e.forEach((entry)=>{
                    if(entry.isIntersecting){
                        if(entry.target.classList.contains('down')){
                            entry.target.querySelector('.main-section-text').classList.remove('animate__fadeOutDown');
                            entry.target.querySelector('.main-section-text').classList.add('animate__fadeInDown');

                        } else{
                            entry.target.querySelector('.main-section-text').classList.remove('animate__fadeOutLeft');
                            entry.target.querySelector('.main-section-text').classList.add('animate__fadeInLeft');
                        }

                    } else{

                        if(entry.target.classList.contains('down')){
                            entry.target.querySelector('.main-section-text').classList.remove('animate__fadeInDown');
                            entry.target.querySelector('.main-section-text').classList.add('animate__fadeOutDown');

                        } else{
                            entry.target.querySelector('.main-section-text').classList.remove('animate__fadeInLeft');
                            entry.target.querySelector('.main-section-text').classList.add('animate__fadeOutLeft');
                        }
                    }
                })
            }

        );

        let mainSection = document.querySelectorAll('.main-section:not(#home)');

        observer.observe(mainSection[0]);
        observer.observe(mainSection[1]);
        observer.observe(mainSection[2]);
        observer.observe(mainSection[3]);
        observer.observe(mainSection[4]);

    </script>

	<jsp:include page="common/footer.jsp"></jsp:include>

</body>
</html>