<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"  %> 

<!DOCTYPE html>
<html lang="ko">
<head>


  <%--  ${session.getAttribute("yesmember")}  --%>

<title>소상공인 커뮤니티: 장가게   </title>

<link rel="stylesheet" href="../resources/css/main.css?v=202007" type="text/css">
<link rel="stylesheet" href="../resources/css/slick.css" type="text/css">
<link href="../resources/img/main.jpg"  type="image/x-icon" rel="shortcut icon" />
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">



<script type="text/javascript"
		src="../resources/js/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery.ajax-cross-origin.min.js"></script>

<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


<script type="text/javascript"
		src="../resources/js/board1/jquery.innerfade.js"></script>	
<script type="text/javascript"
		src="../resources/js/board1/main_impl.js"></script>	
		
				
	
						
</head>


<body>
	     
	
	<script type="text/javascript">
	
 			
	    
			googleNews();   
			    
		 	function googleNews(){	
						$.ajax({
							crossOrigin : true,
					        dataType: "jsonp",
					        url:"http://newsapi.org/v2/top-headlines?country=kr&category=business&apiKey=a7bea765d0644f279012b1e0fb7ee8a5",
					        type: "get",
					        success: function(data){
					        	
					        	var object=JSON.parse(data);
								console.log(object);  
								showNewsImages(object); 
					        }
						        
					  	 });
							
					}	
					
			
			
			if("${alert}"!=""){
				alert("${alert}");
				}
			if("${result}"!=0){
					alert("회원가입에 성공하였습니다.");
					}
			
			
		
		
			function showNewsImages(data){
				var cntImage1=0;
				var cntImage2=0;
				var cntImage3=0;
				var cntTitle=0;
					
				$(data).each(function(i,obj){
					$(obj.articles).each(function(i,obj2){
						
						 if((obj2.urlToImage!=null&&obj2.urlToImage!="") && cntImage1<1){
							var str="";
							
							str= "<a href='"+obj2.url+"' target='_self'><span class='thumb_img'><img src='"+obj2.urlToImage+"' style='width: 168px; height: 97px;'></span><span class='txt'>"+obj2.title+"</span></a>";
			
							$("#newsImg0").append(str);
							
							cntImage1++;						
						} else if((obj2.urlToImage!=null&&obj2.urlToImage!="") && cntImage2<1){
							var str="";
							
							str= "<a href='"+obj2.url+"' target='_self'><span class='thumb_img'><img src='"+obj2.urlToImage+"' style='width: 168px; height: 97px;'></span><span class='txt'>"+obj2.title+"</span></a>";
			
							$("#newsImg1").append(str);
							cntImage2++;	
							
						} else if((obj2.urlToImage!=null&&obj2.urlToImage!="") && cntImage3<1){
							var str="";
							
							str= "<a href='"+obj2.url+"' target='_self'><span class='thumb_img'><img src='"+obj2.urlToImage+"' style='width: 168px; height: 97px;'></span><span class='txt'>"+obj2.title+"</span></a>";
			
							$("#newsImg2").append(str);
							cntImage3++;						
						}
						 
						 
						 if(cntTitle<5){
							var str="";
							str ="<li id='newsTxt_li_"+(i-2)+"'><a href='"+obj2.url+"' target='_self'><strong>"+obj2.title+"</strong></a></li>";
							
							$("#newsTxt_ul_1").append(str);
							cntTitle++;
						}else if(cntTitle>=5 && cntTitle<10){
							var str="";
							str ="<li id='newsTxt_li_"+(i-2)+"'><a href='"+obj2.url+"' target='_self'><strong>"+obj2.title+"</strong></a></li>";
							
							$("#newsTxt_ul_2").append(str);
							cntTitle++;
							
						}else if(cntTitle>=10 && cntTitle<15){
							var str="";
							str ="<li id='newsTxt_li_"+(i-2)+"'><a href='"+obj2.url+"' target='_self'><strong>"+obj2.title+"</strong></a></li>";
							
							$("#newsTxt_ul_3").append(str);
							cntTitle++;
						}
				
				
					
					});//이치2끝
				});//이치2끝
			
		}//showNewsImages끝
		
	
		
	
	</script>


	<div id="mainContainer">
		
			<div id="container">
			<div id="header">		
				




<div id="NateBi" class="area_bi" role="banner">
 
    <h1 class="bi"><a href="/kteun/main/main">장가게</a></h1>
</div>


<div id="divignb" class="area_ignb">
<h2>독립GNB</h2>
<h3>편리한 네이트</h3>
	<ul>     				
		<li><a href="" onmousedown="nc('NBI04');">장가게를 시작페이지로</a></li>
	</ul>	
</div>
		

<div id="cbContainer">
	<div id="cbLayer" class="area_ad08" style="display: none">
	
		<span class="commTxt">한눈에 보는 오늘 <em>NATE</em>와 함께 하루를 시작하세요.</span>
		<a href="javascript:;" title="NATE를 시작페이지로" id="cbLayerLink">NATE를 시작페이지로</a>
	
	
	</div>
</div>







<div class="area_search" role="search">
    <h2>통합검색</h2>
    <form id="search" name="search" action="https://search.daum.net/nate" accept-charset="utf-8" onsubmit="return checkSearchForm()">
		<input type="hidden" id="thr" name="thr" value="sbma" />
		<input type="hidden" id="w" name="w" value="tot" />
        <fieldset>
            <legend>통합검색 입력</legend>
            <div id="acWrap" class="home" >
                <input class="type_text" id="q" name="q" value="" autocomplete="off" type="text" style="ime-mode:active" onkeydown="return checkSearchQEnter(event)"/>
                <input id="acBtn" title="검색" class="type_btn" type="submit" />
                <div id="acDiv" style="display:none;">
                    <iframe id="acIfrm" name="acIfrm" scrolling="no" frameborder="0" marginheight="0" marginwidth="0" src="about:blank" title="자동완성영역"></iframe>
                </div>
            </div>
        </fieldset>
    </form>
    <input type="hidden" id="premiumText" name="premiumText" title="" value="" />
    <input type="hidden" id="premiumLink" name="premiumLink" title="" value="" />
    <input type="hidden" id="statCode" name="statCode" title="" value="" />
	
</div>
	
				




<div id="divGnb" class="area_gnb" role="navigation">
	<h2>GNB</h2>
	<ul>
		<!-- <li class="mail"><a href="" >장가게 소개</a></li> -->
		<li class="news"><a href="" >경제뉴스</a></li>
		<li class="pann"><a href="" >우리고장 정보</a></li>		
		<li class="comics"><a href="/kteun/board1/talkList" >담소</a></li>
		<li class="fortune"><a href="">중고거래마당</a></li>
		<li class="game"><a href="" >유머</a></li>
		
	</ul>
</div>

				





<div class="nHide" id='divWhyArea'>
	
</div>

	
			</div>
			<hr/>
			<div id="content">
			
				<div id="adContainer">
				<h2>광고 영역</h2>
				<div id="ad_layer1"  class="area_ad01">
				
				<ul class="fade">
					<li>
						<img src="../resources/img/ad_main3.png">
					</li>
				    <li>
						<img src="../resources/img/ad_main1.png">
					</li>
					<li>
						<img src="../resources/img/ad_main2.png">
					</li>
				</ul>
				
				
				</div>
			<div id="ad_layer2" class="area_ad02">	
				
				<div id="shopitemMall" class="mall1shop">
		        	<h4 id="joongo" class="menu01 on"><a href="" title="뉴스탭 열기" >중고거래 마당</a></h4>
		        	
					<div id="mall1Box" class="shopmall">
	
					   <strong class="nHide">상품 리스트</strong>
							
						
						
						<section class="imglist" >
							
							<!-- <button class="slick-prev slick-arrow" id="bba" aria-label="Previous" type="button" style>이전</button> -->
							<div>
																
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j1.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
							
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j2.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j3.jpeg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j4.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j5.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j6.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j7.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j8.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								
							</div>
							
							<div>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j9.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j10.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j11.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j12.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j13.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j14.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j15.png" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j1.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j2.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j3.jpeg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								
								
							</div>
							
							<div>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j4.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j5.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j6.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j7.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								<li class="img_li">
									<a href="" class="link">
										<img src="../resources/img/j8.jpg" width="82" height="98" alt="상품썸네일" class="img_thumb">
											<span class="txt">카페정리합니다~</span><span class="txt">소파팔아요</span>
									</a>
								</li>
								
								
							</div>
							<button class="slick-next slick-arrow" id="bbb" aria-label="Next" type="button" style>이전</button>
						</section>
						
						<!-- 	<div class="paging_item">
								<span class="nHide">현재페이지</span><em id="shopping1Index" class="index dtpg_6">2</em> <span class="slash">/ </span><span>4</span>
							</div> -->
					</div>
				</div>				
			</div>
				<div class="area_adual">
					<div class="area_ad03">						
					</div>
					<div class="area_ad04">						
					</div>
				</div>
			</div>	

				


	
			<% if(session.getAttribute("yesmember")==null){ %>
				<div id="UI" class="area_auth">
					<h2>회원 로그인 영역</h2>
					
                     <form id="f_login" name="f_login" action="/kteun/main/login" method="post" target="_top" onsubmit="return SubmitCheck();">
                        	<!-- <input type="hidden" id="redirect" name="redirect" value="https://www.nate.com/" />
                            <input type="hidden" id="PASSWD_RSA" name="PASSWD_RSA" value="" />
                            <input type="hidden" id="domain" name="domain" value="nate.com" />
                            <input type="hidden" name="cpurl" value="www_ndr.nate.com%2Flogin%2F" />
                             -->

                           <fieldset>
								<legend>회원 로그인</legend>
								<label for="ID" class="label_id nHide">아이디 or @이하 모두 입력</label>
								<input type="text" id="ID" name="id" class="input_id" placeholder='아이디 입력' style="ime-mode:disabled;" value="" />
								
								<label for="PASSDM" class="label_pw nHide">비밀번호</label>
								<label for="PASSDM" id="lb_passdm" class="label_pw nHide">비밀번호</label>
								<input type="password" name="password" id="PASSDM" placeholder="비밀번호" maxlength="20" class="input_pw" r/>
  								
								<span class="option01"><input type="checkbox" id="keeplogin" name="keeplogin" class="chk_saveid" onmousedown="nc('NCM94');" onclick="isKeepLogin('on')" /> <label for="keeplogin" class="set_saveid" onmousedown="nc('NCM94');">로그인 유지</label> <i class="bar">|</i> <a href="javascript:xXecurePop.openWin(3);" class="ip" onmousedown="nc('NLI15');" title="새창 열림">IP보안 <strong id="ipLevelText">ON</strong></a></span>
								<input type="submit" id="btnLOGIN" value="로그인" class="icon_login" onkeydown="vkeydownSubmit(event);" />
								<span class="option02"><a href="javascript:onclick_Find();">아이디</a> / <a href="">비밀번호 찾기</a> <i class="bar">|</i> <a href="/kteun/main/memberRegister"><strong>회원가입</strong></a> </span>
							</fieldset>
						</form>

                       <div id="layerXKDisabled" class="overlay_info type_security" style="display: none">
                        <div class="layer_content"></div>
                        </div>
                        
						<div class="overlay_info nHide" id="divNateOn">
							<p>웹 네이트온 로그인은 설치가 필요 없는<br />가벼운 네이트온이 네이트 로그인 만으로<br />함께 로그인 되는 편리한 기능입니다.</p>
							<a href="//nateonweb.nate.com/nateon/download_web.php" onmousedown="nc('NLI75')";>웹 네이트온이란?</a>
							<button type="button" value="알림 레이어 닫기" title="알림 레이어 닫기" class="close" onclick="closeWebNateOnInfo()">알림 레이어 닫기</button>
						</div>
						<div class="overlay_info type_saveid nHide">
							<p>개인정보 보호를 위해<br>개인PC에서만<br>사용해 주세요. <a href="http://erms.nate.com/faq/exSelfFAQA.jsp?PageNo=1&nodeId=NODE0000001300&parentNodeId=NODE0000000595&grandParentNodeId=&nodeDepth=4&checkFaq=0&faqId=FAQS0000012703&index=6" onmousedown="nc('NLI33');" target="_blank">도움말보기 <i class="icon_arrow_right_red"></i></a></p>
							<button type="button" value="알림 레이어 닫기" title="알림 레이어 닫기" class="icon_x_black" onmousedown="nc('NLI32');" onclick="closeKeepLoginLayer()">알림 레이어 닫기</button>
						</div>
				</div> 
				
					<%}else{ %>
						
						<div id="UI_login" class="area_auth"> 
                            <h2>회원 로그인 영역</h2>
        		            <h3>내정보</h3>
        					<div class="my_info">
        						<span class="my_name" id="btnNameNate" onmousedown="ndrMemberType('NMY01','NMY02');"><a href="javascript:EditInfo();"><strong>${yesmember.name}</strong> 님</a></span>
        						<span class="my_function">
        							<button type="button" value="로그아웃" title="로그아웃" class="icon_logout">
        							<a href="/kteun/main/logout">로그아웃</a></button>
        						</span>
        					</div>
        					<div class="svc_list">
        						<span id="liMyInfoSelectedMail" class="mail"><a href="http://mail3.nate.com/#index" onmousedown="ndrMemberType('NMY11', 'NMY12')">메일 <span class="balloon"><em id="mailCount">4<i class="icon_new_white"><span class="nHide">new</span></i></em></span></a></span>
        						<span id="liSetNateon" class="nateon"><i class="icon_nateon_on"></i><a id="aCntBuddyCount" href="javascript:fnOpenWebNateOn();" onmousedown="ndrMemberType('NMZ11', 'NMZ12');" class="" title="새창 열림">네이트온 <span class="balloon"><span class="nHide">메시지수</span><em>0</em></span></a></span>
        					</div>
        					<div class="svc_notify">
        						<span class="notice"><a href="javascript:EditInfo()" onmousedown="ndrMemberType('NMY04','NMY05');" title="내 정보">내 정보</a></span>
        						<span class="dotori"><a href="http://helpdesk.nate.com/userinfo/exMemberInfo.asp?pgcode=myself" onmousedown="nc('NMY50');" title="보안설정">보안설정</a></span>
        					</div>

        					<div id="divOverLayWebNateOnLogin" class="overlay_info type_setnateon" style="display: none;">
        						<p>웹 네이트온에<br>로그인 되었습니다. <a href="http://helpdesk.nate.com/userinfo/exMemberInfo.asp?pgcode=auto_login" onmousedown="nc('NMZ15');">설정 <i class="icon_arrow_right_red"></i></a></p>
        						<button type="button" value="알림 레이어 닫기" title="알림 레이어 닫기" class="icon_x_black" onclick="closeDivOverLayWebNateOn();" onmousedown="nc('NMZ16');">알림 레이어 닫기</button>
        					</div>

        					<div id="divWebNateOnPopup" class="overlay_info type_security" style="display:none;">
        						<p>팝업 차단을 해제해야<br>웹 네이트온 동시 로그인 기능을<br>사용할 수 있습니다.</p>
        						<a href="http://erms.nate.com/faq/exSelfFAQA.jsp?PageNo=1&amp;nodeId=NODE0000001112&amp;parentNodeId=NODE0000001112&amp;grandParentNodeId=&amp;nodeDepth=3&amp;checkFaq=0&amp;faqId=FAQS0000011776&amp;index=8" target="_blank" onmousedown="nc('NMZ14');">자세히보기</a>
        						<button type="button" value="알림 레이어 닫기" title="알림 레이어 닫기" class="close" onclick="closeWebNateOnPopup();">알림 레이어 닫기</button>
        					</div>	

                        </div>
						
					<%}%>
				

				<hr />
				<h2>컨텐츠 영역</h2>
				<div id="news_area" class="area_news">


<h3>뉴스</h3>
<div class="menu" id="newsTabMenu">
	<h4 id="newstab1" class="menu01 on"><a href="javascript:;" title="뉴스탭 열기">경제뉴스 </a></h4>

</div>
<div class="content type_news" id="newsContType" onfocusin="newsBox.rollingStop();" onfocusout="newsBox.rollingStart();">
	<div class="tabCnt">
		
		
			<div class="rankBox" id="div_rank_sisa"></div>
			<div class="rankBox" id="div_rank_spo"></div>
			<div class="rankBox" id="div_rank_ent"></div>
			
			<ul class="type_thumb type02" id="newsImg_ul_1">
				
					<li id="newsImg0">
						
					</li>
				
					<li id="newsImg1">
					
					</li>
				
				
					<li id="newsImg2">
						
					</li>
				
			</ul>
			
			
			

		
			<ul class="type_text" id="newsTxt_ul_1">
				
									
			</ul>
			
			<ul class="type_text" id="newsTxt_ul_2">
				
					
				
			</ul>

			
				
			<ul class="type_text" id="newsTxt_ul_3">
				
					
			</ul>
				
					
					
					
					
					<ul class="type_thumb type01 nHide" id="newsImg_ul_2">
						
							<li id="newsImg3"></li>
						
							<li id="newsImg4"></li>
						
					</ul>
				

				
			

			
				
					<div id="newsPlusItem_1" class="view_nplus type01"></div>
				
				
			
				
					<div id="newsPlusItem_2" class="view_nplus type02"></div>
				
				
			
				
					<div id="newsPlusItem_3" class="view_nplus type03"></div>
				
				
			
				
					<div id="newsPlusItem_4" class="view_nplus type04"></div>
				
				
			
				
					<div id="newsPlusItem_5" class="view_nplus type05"></div>
				
				
			
				
					<div id="newsPlusItem_6" class="view_nplus type06"></div>
				
				
			
				
					<div id="newsPlusItem_7" class="view_nplus type07"></div>
				
				
			
				
					<div id="newsPlusItem_8" class="view_nplus type08"></div>
				
				
			
				
					<div id="newsPlusItem_9" class="view_nplus type09"></div>
				
				
			
				
				
					<div id="newsPlusItem_10" class="view_nplus type10"></div>
				
			
				
				
					<div id="newsPlusItem_11" class="view_nplus type11"></div>
				
			
				
				
					<div id="newsPlusItem_12" class="view_nplus type12"></div>
				
			
				
				
					<div id="newsPlusItem_13" class="view_nplus type13"></div>
				
			
				
				
					<div id="newsPlusItem_14" class="view_nplus type14"></div>
				
			
				
				
					<div id="newsPlusItem_15" class="view_nplus type15"></div>
				
			
			<div id="newsPlusLayer" class="overlay_plus type01" style="display:none">
				<div class="plus_content">
					<iframe id="newsIfr" width="304" height="470" scrolling="no" frameborder="0" title="뉴스플러스 아이프레임" src="about:blank"></iframe>
					<button type="button" value="뉴스플러스 레이어 닫기" title="뉴스플러스 레이어 닫기" class="close" onclick="closeNewsPlus();ndrclick('MEC49','');">뉴스플러스 레이어 닫기</button>
				</div>
			</div>
		
	</div>
	
	

	
		<div id="breakingNews" class="overlay_break" style="display:none;"><dl><dt>코로나19 현황</dt><dd><a href="//news.nate.com/view/20200709n12300?modit=1594258049" onclick="setTabInfo();ndrclick('MED43', '');" target="_self">신규확진 50명, 총 13,293명…완치 12,019명</a></dd></dl><button type="button" value="속보 레이어 닫기" title="속보 레이어 닫기" class="close" onclick="ndrclick('MED44');newsBox.closeSokboLayer();">속보 레이어 닫기</button></div>
	
</div>
<!-- <div class="nav" id="newsOptBtn">
	<span id="newsMoreArea"><em>2</em> / 6</span>
	<button id="newsRollingBtn" type="button" onclick="newsBox.changeRolling();" value="자동전환기능 정지" title="자동전환기능 정지" class="pause">자동전환기능 정지</button>
	<button type="button" onclick="ndrclick('MEC42');newsBox.showPreNext('P');" value="이전 뉴스 보기" title="이전 뉴스 보기" class="prev">이전 뉴스 보기</button>
	<button type="button" onclick="ndrclick('MEC43');newsBox.showPreNext('N');" value="다음 뉴스 보기" title="다음 뉴스 보기" class="next">다음 뉴스 보기</button>
</div> -->
<div id="newsNotice"></div>
	
					<div class="overlay_ticker" id="ticker_lyr" style="display:none">
						<div class="ticker_content">
							<iframe id="ticker_ifm" width="728" scrolling="no" height="318" frameborder="0" title="티커 아이프레임" src="about:blank"></iframe>
							<button type="button" value="티커 닫기" title="티커 닫기" class="close" onclick="nateonTickerClose();">티커 닫기</button>
						</div>
					</div>
				</div>		
								
							
				<!-- <script type="text/javascript">
				//<![CDATA[				
					loadSpecialBiRolling();
				//]]>
				</script> -->
				
				
				<!-- tiles:insertAttribute name="NateQ" /-->
				




<div id="divContentsUpper" class="area_contents">				
	<h3>컨텐츠</h3>
	<div class="menu">
        <h4 class="menu05" id="pannTitle1"><a href="">자유 담소 Top10</a></h4>
        <h4 class="menu06" id="pannTitle2"><a href="" >사업 담소 Top10</a></h4>
        <h4 class="menu07" id="pannTitle3"><a href="" >법률 담소 Top10</a></h4>
    </div>
	<div class="content type_rank">	
		<script>
		 var newslist = "${newslist}";  // 젤 처음 메인 부를때 나왔다 안 나왔다 왔다갔다 거려서 넣어봄.
		 
		</script>	
		<ol class="list_rank" id="pannList1">
		
			
				<c:forEach var="damsolist" items="${newslist}" begin='0' end='9' step='1' varStatus="status">
	
	
				  <li>
				 
						<span class="num_rank top_rank">${status.count}</span>					
						<a href="/kteun/board1/talkRead?bno=${damsolist.bno}" class="link_rank" ><c:out value="${damsolist.title}"/></a>
						
			                <em class="emph">
			                    <span class="nHide">댓글</span>
			                    (<c:out value="${damsolist.replycnt}"/>)
			                </em>
		                
					</li>
				</c:forEach>
				
				
		</ol>
		<ol class="list_rank list_today_talk"  id="pannList2">
			<c:forEach var="damsolist2" items="${newslist}" begin='0' end='9' step='1' varStatus="status2">


			  <li>
			 
					<span class="num_rank top_rank">${status2.count}</span>					
					<a href="/kteun/board1/talkRead?bno=${damsolist2.bno}" class="link_rank" ><c:out value="${damsolist2.title}"/></a>
					
		                <em class="emph">
		                    <span class="nHide">댓글</span>
		                    (<c:out value="${damsolist2.replycnt}"/>)
		                </em>
	                
				</li>
			</c:forEach>
			
		</ol>
		
		<ol class="list_rank list_today_talk"  id="pannList3">
		   <c:forEach var="damsolist2" items="${newslist}" begin='0' end='9' step='1' varStatus="status2">


			  <li>
			 
					<span class="num_rank top_rank">${status2.count}</span>					
					<a href="/kteun/board1/talkRead?bno=${damsolist2.bno}" class="link_rank" ><c:out value="${damsolist2.title}"/></a>
					
		                <em class="emph">
		                    <span class="nHide">댓글</span>
		                    (<c:out value="${damsolist2.replycnt}"/>)
		                </em>
	                
				</li>
			</c:forEach>
	
		</ol>
		
					
	</div>						
</div>

	
	

				
				
				




				
				
			</div>
			
			
			<%@include file="../include/footer.jsp" %>
			