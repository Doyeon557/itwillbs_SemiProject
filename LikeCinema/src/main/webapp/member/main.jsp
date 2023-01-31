




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!--     <meta charset="UTF-8"> -->
<!--     <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"> -->
<!--     <meta http-equiv="X-UA-Compatible" content="ie=edge"> -->
<!--     <meta name="format-detection" content="telephone=no"> -->
<!--     <meta name="author" content="webstoryboy"> -->
<!--     <meta name="description" content="메가박스 사이트 따라하면서 배우는 튜토리얼입니다."> -->
<!--     <meta name="keywords" content="메가박스, 유투브, 영화, 최신영화, 영화관, CGV, 롯데시네마, 웹스토리보이, 웹스, 사이트 만들기, 따라하기, 이미지 슬라이드"> -->
    <title>라이크 시네마</title>

    <!-- css -->
<!--     <link rel="stylesheet" href="assets/css/reset19.css"> -->
<!--     <link rel="stylesheet" href="assets/css/style19.css"> -->
<!--     <link rel="stylesheet" href="assets/css/swiper.css"> -->
    
    <!-- 파비콘 -->
    <link rel="shortcut icon" href="assets/icons/favicon.ico">
    <link rel="apple-touch-icon-precomposed" href="assets/icons/favicon_72.png" />
    <link rel="apple-touch-icon-precomposed" sizes="96x96" href="assets/icons/favicon_96.png" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/icons/favicon_144.png" />
    <link rel="apple-touch-icon-precomposed" sizes="192x192" href="assets/icons/favicon_192.png" />
    
    <!-- 페이스북 메타 태그 -->
    <meta property="og:title" content="메가박스 사이트 만들기" />
    <meta property="og:url" content="https://github.com/webstoryboy/megabox2019" />
    <meta property="og:image" content="https://webstoryboy.github.io/megabox2019/mega.jpg" />
    <meta property="og:description" content="메가박스 사이트 따라하면서 배우는 튜토리얼입니다." />
   
    <!-- 트위터 메타 태그 -->
    <meta name="twitter:card" content="summary">
    <meta name="twitter:title" content="메가박스 사이트 만들기">
    <meta name="twitter:url" content="https://github.com/webstoryboy/megabox2019/">
    <meta name="twitter:image" content="https://webstoryboy.github.io/megabox2019/mega.jpg">
    <meta name="twitter:description" content="메가박스 사이트 따라하면서 배우는 튜토리얼입니다.">
    
    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">
    
    <!-- HTLM5shiv ie6~8 -->
    <!--[if lt IE 9]> 
      <script src="assets/js/html5shiv.min.js"></script>
      <script type="text/javascript">
         alert("현재 브라우저는 지원하지 않습니다. 크롬 브라우저를 추천합니다.!");
      </script>
   <![endif]-->
   
</head>

<body>
    <jsp:include page="top.jsp"></jsp:include>
    
    <!-- //header -->
    
    <section id="banner">
        <div class="slider">
           <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide ss1">
                        <div class="container">
                            <div class="row">
                                <h3>아바타2 : 물의길</h3>
                                <p> </p>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide ss2">
                        <div class="container">
                            <div class="row">
                                <h3>장화신은 고양이</h3>
                                <p> </p>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide ss3">
                        <div class="container">
                            <div class="row">
                                <h3>영웅</h3>
<!--                                 <p>역대 최단 기간 1000만 관객 돌파 기록 </p> -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
    </section>
    <!-- //banner -->
    
    
    <section id="movie">
        <div class="container">
            <div class="row">
                <h2 class="ir_so">영화 예매</h2>
                <div class="movie">
                    <div class="movie_title">
                        <ul class="clearfix">
                            <li class="active">
                            	<a href="#">최신개봉작</a></li>
                            <li><a href="#">상영예정작</a></li>
                        </ul>
                    </div>
                    <div class="movie_chart">
                        <div class="swiper-container2">
                           <div class="chart_cont1 swiper-wrapper">
                               <div class="swiper-slide">
                                   <div class="poster">
                                       <figure>
                                           <img src="./img/avatar2.jpg" srcset="./member/assets/img/poster01@2.jpg 2x" alt="침묵">
                                       </figure>
                                       <div class="rank"><strong>1</strong></div>
                                       <div class="mx">
                                           <span class="icon m ir_pm">MX</span>
                                           <span class="icon b ir_pm">Boutique</span>
                                       </div>
                                   </div>
                                   <div class="infor">
                                       <h3><span class="icon a15 ir_pm">12세 이상 관람</span> <strong>아바타2</strong></h3>
                                       <div class="infor_btn">
                                           <a href="./MovieDetail.in?movie_ID=20225061">상세정보</a>
                                           <a href="./Reservation.re">예매하기</a>
                                       </div>
                                   </div>
                               </div>
                               <div class="swiper-slide">
                                   <div class="poster">
                                       <figure>
                                           <img src="./img/Hero.jpg" srcset="./member/assets/img/poster02@2.jpg 2x" alt="신세계">
                                       </figure>
                                       <div class="rank"><strong>2</strong></div>
                                       <div class="mx">
                                           <span class="icon m ir_pm">MX</span>
                                       </div>
                                   </div>
                                   <div class="infor">
                                       <h3><span class="icon a15 ir_pm">12세 이상 관람</span> <strong>영웅</strong></h3>
                                       <div class="infor_btn">
                                           <a href="./MovieDetail.in?movie_ID=20196478">상세정보</a>
                                           <a href="./Reservation.re">예매하기</a>
                                       </div>
                                   </div>
                               </div>
                               <div class="swiper-slide">
                                   <div class="poster">
                                       <figure>
                                           <img src="./img/SWITCH.jpg" srcset="./member/assets/img/poster03@2.jpg 2x" alt="마스터">
                                       </figure>
                                       <div class="rank"><strong>3</strong></div>
                                       <div class="mx">
                                           <span class="icon m ir_pm">MX</span>
                                       </div>
                                   </div>
                                   <div class="infor">
                                       <h3><span class="icon a15 ir_pm">12세 이상 관람</span> <strong>스위치</strong></h3>
                                       <div class="infor_btn">
                                           <a href="./MovieDetail.in?movie_ID=20215315">상세정보</a>
                                           <a href="./Reservation.re">예매하기</a>
                                       </div>
                                   </div>
                               </div>
                               <div class="swiper-slide">
                                   <div class="poster">
                                       <figure>
                                           <img src="./img/PussinBoots.jpg" srcset="./member/assets/img/poster04@2.jpg 2x" alt="마약왕">
                                       </figure>
                                       <div class="rank"><strong>4</strong></div>
                                       <div class="mx">
                                           <span class="icon m ir_pm">MX</span>
                                       </div>
                                   </div>
                                   <div class="infor">
                                       <h3><span class="icon all ir_pm">전체관람가</span> <strong>장화신은 고양이</strong></h3>
                                       <div class="infor_btn">
                                           <a href="./MovieDetail.in?movie_ID=20224109">상세정보</a>
                                           <a href="./Reservation.re">예매하기</a>
                                       </div>
                                   </div>
                               </div>
                               <div class="swiper-slide">
                                   <div class="poster">
                                       <figure>
                                           <img src="./img/TheNightOwl.jpg" srcset="./member/assets/img/poster05@2.jpg 2x" alt="마약왕">
                                       </figure>
                                       <div class="rank"><strong>5</strong></div>
                                       <div class="mx">
                                           <span class="icon m ir_pm">MX</span>
                                       </div>
                                   </div>
                                   <div class="infor">
                                       <h3><span class="icon a19 ir_pm">15세 이상 관람</span> <strong>올빼미</strong></h3>
                                       <div class="infor_btn">
                                           <a href="./MovieDetail.in?movie_ID=20227762">상세정보</a>
                                           <a href="./Reservation.re">예매하기</a>
                                       </div>
                                   </div>
                               </div>
                           </div>
                        </div>
                        <!-- //chart_cont1-->
                        
                       <div class="swiper-container2">
                            <div class="chart_cont2 swiper-wrapper">
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="./img/TheLine.jpg" srcset="./member/assets/img/poster07@2.jpg 2x" alt="라인">
                                        </figure>
                                        <div class="rank"><strong>1</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                            <span class="icon b ir_pm">Boutique</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">15세 이상 관람</span> <strong>라인</strong></h3>
                                        <div class="infor_btn">
                                            <a href="./MovieDetail.in?movie_ID=20228868">상세정보</a>
                                            <a href="#"  style="background: grey;" onclick="return false;">개봉예정</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="./img/gUcLeOarUIjPGCQwrwzr4fPBQprc885l.jpg" srcset="./member/assets/img/poster08@2.jpg 2x" alt="유령">
                                        </figure>
                                        <div class="rank"><strong>2</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">15세 이상 관람</span> <strong>유령</strong></h3>
                                        <div class="infor_btn">
                                            <a href="./MovieDetail.in?movie_ID=20214823">상세정보</a>
                                            <a href="#"  style="background: grey;" onclick="return false;">개봉예정</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="./img/PM_MAIN final_R web.jpg" srcset="./member/assets/img/poster07@2.jpg 2x" alt="교섭">
                                        </figure>
                                        <div class="rank"><strong>3</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a15 ir_pm">12세 이상 관람</span> <strong>교섭</strong></h3>
                                        <div class="infor_btn">
                                            <a href="./MovieDetail.in?movie_ID=20190808">상세정보</a>
                                            <a href="#" style="background: grey;" onclick="return false;">개봉예정</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="poster">
                                        <figure>
                                            <img src="./img/megan.jpg" srcset="./member/assets/img/poster08@2.jpg 2x" alt="메간">
                                        </figure>
                                        <div class="rank"><strong>4</strong></div>
                                        <div class="mx">
                                            <span class="icon m ir_pm">MX</span>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h3><span class="icon a19 ir_pm">15세 이상 관람</span> <strong>메간</strong></h3>
                                        <div class="infor_btn">
                                            <a href="./MovieDetail.in?movie_ID=20229205">상세정보</a>
                                            <a href="#"  style="background: grey;" onclick="return false;">개봉예정</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                        <!-- //chart_cont4-->
                    </div>
                </div>
            </div>
    </section>  
    <!-- //movie -->
    
    
<!-- ening -->
    
    
    <section id="new">
        <div class="container">
            <div class="row">
                <div class="new">
                    <h2><em>새로운 영화</em></h2>
                    <div class="new_left">
                        <div class="play" id="showTrailer" data-youtube="WscLMTs-9Rw">
                            <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            viewBox="0 0 120 120" style="enable-background:new 0 0 120 120;" xml:space="preserve">
                                <circle class="st0" cx="60" cy="60.4" r="56"/>
                                <path class="st1" d="M81,65.4c4.8-2.8,4.8-7.2,0-10L53.5,39.6c-4.8-2.8-8.7-0.5-8.7,5v31.7c0,5.5,3.9,7.8,8.7,5L81,65.4z"/>
                            </svg>
                        </div>
                    </div>
                    <div class="new_right">
                        <h3 class="title">아바타2 : 물의길</h3>
                        <span class="release">2022년 12월 16일</span>
                        <div class="star">
                            <span class="icon star1"></span>
                            <span class="icon star1"></span>
                            <span class="icon star1"></span>
                            <span class="icon star2"></span>
                            <span class="icon star0"></span>
                            <strong>9/10</strong>
                        </div>
                        <ul class="summary">
                            <li class="genre"><span class="bar">액션, 어드벤처</span><span>미국</span></li>
                            <li class="age"><span class="bar">192분</span><span>12세 이상 관람가</span></li>
                            <li class="desc">아바타: 물의 길은 판도라 행성에서 제이크 설리와 네이티리가 이룬 가족이 겪게 되는 무자비한 위협과 살아남기 위해 떠나야 하는 긴 여정과 전투, 그리고 견뎌내야 할 상처에 대한 이야기를 그렸다.</li>
                        </ul>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //new -->
    
    
  
    
    
   <jsp:include page="bottom.jsp"></jsp:include>
    <!-- //footer -->
    

    <!-- 트레일러 -->
    <aside role="complementary" id="blackout" class="overlay">
        <div id="trailerModal" class="modal">
            <div id="trailer"></div><!-- YouTube 플레이어로 대체되는 부분 -->
        </div>
        <button id="hideTrailer" class="modal_close">닫기</button>
    </aside>
    
    
    <!-- 자바스크립트 라이브러리 -->
    <script src="./member/assets/js/jquery.min_1.12.4.js"></script>
    <script src="./member/assets/js/modernizr-custom.js"></script>
    <script src="./member/assets/js/ie-checker.js"></script>
    <script src="./member/assets/js/swiper.min.js"></script>
    <script src="./member/assets/js/iframe_api.js"></script>
    <script src="./member/assets/js/movie.js"></script>
    <script>
        //배너 이미지 슬라이드
        var swiper = new Swiper('.swiper-container',{
            pagination: {
                el: '.swiper-pagination',
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            autoplay: {
                delay: 5000,
            },
        });
        
        //영화차트 이미지 슬라이드
        var swiper = new Swiper('.swiper-container2',{
            slidesPerView: 4,
            spaceBetween: 24,
//            mousewheel: {
//                invert: true,
//            },
            keyboard: {
                enabled: true,
                onlyInViewport: false,
            },
            autoplay: {
                delay: 6000,
            },
            breakpoints: {
                600: {
                    slidesPerView: 1.4,
                    spaceBetween: 24
                },
                768: {
                    slidesPerView: 2,
                    spaceBetween: 24
                },
                960: {
                    slidesPerView: 3,
                    spaceBetween: 24
                }
            }
        });
        
        //영화차트 탭 메뉴
        var movBtn = $(".movie_title > ul > li");    
        var movCont = $(".movie_chart > div");  

        movCont.hide().eq(0).show();

        movBtn.click(function(e){
            e.preventDefault();
            var target = $(this);         
            var index = target.index();  
            movBtn.removeClass("active");   
            target.addClass("active");    
            movCont.css("display","none");
            movCont.eq(index).css("display","block");
        });
        
        //공지사항 탭 메뉴
        var tabMenu = $(".notice");

        //컨텐츠 내용을 숨겨주세요!
        tabMenu.find("ul > li > ul").hide();
        tabMenu.find("li.active > ul").show();

        function tabList(e){
            e.preventDefault();       //#의 기능을 차단
            var target = $(this);
            target.next().show().parent("li").addClass("active").siblings("li").removeClass("active").find("ul").hide();
            //버튼을 클릭하면 ~ div를 보여주고
            //부모의 li 태그에 클래스 추가하고
            //형제의 li 태그에 클래스 제거하고
            //제거한 자식의 div 태그를 숨겨줌 
        }

        tabMenu.find("ul > li > a").click(tabList).focus(tabList);
        
    </script>
</body>
</html>