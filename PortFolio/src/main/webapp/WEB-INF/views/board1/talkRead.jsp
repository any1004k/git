<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"  %>    

<!DOCTYPE HTML>
<html lang="ko">
    <head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=10,9,8,7" />

<title>담소쓰기 : 장가게</title>
<link href="/favicon.ico?m=3.0.9"  type="image/x-icon" rel="shortcut icon" />
 
 
	<link href="../resources/css/talkRegister1.css"  rel="stylesheet" type="text/css" media="all" charset="utf-8" />
	<link href="../resources/css/talkRegister2.css"  rel="stylesheet" type="text/css" media="all" charset="utf-8" />
	<link href="../resources/css/talkRegister3.css"  rel="stylesheet" type="text/css" media="all" charset="utf-8" />
	<link rel=StyleSheet href="../resources/css/talkRegister4.css"  type="text/css" />

	<script type="text/javascript"
			src="../resources/js/jquery.min.js"></script>
	<script type="text/javascript"
			src="../resources/js/board1/talkRead.js"></script>
	
<script>
		$(document).ready(function(){
			
			
			var bno = '<c:out value="${tuple.bno}"/>';
			var id = '<c:out value="${tuple.id}"/>';
			
		
			var replyUL= $(".cmt_list");
			var rePage=1;
			
			
			showList(1);//read페이지 열리면 댓글은 무조건 1페이지 보이게 만들어라.
			
			
			function showList(page){ // 댓글 테두리 만들기+데이터 넣기.
				
				replyService.getReplyList({bno:bno, page:page||1},function(replyAllCnt,list){
					/* console.log("서버->ajax->jsp의 제이쿼리//이 글의 댓글 총 객수는 :" + replyAllCnt);
					console.log("서버->ajax->jsp의 제이쿼리//선택된 페이지의 댓글 목록 : "+ list);*/
				 
					if(page==-1){ //전체 댓글 수 다시 계산해서 마지막 페이지 보여주고 싶을 때.
						
						rePage = Math.ceil(replyAllCnt/10.0);
						showList(rePage);
					}
					
					
					var str ="";
					if(list ==null || list.length==0){ //만약 list에 받은게 없으면 아무것도 출력하지 말고,
						replyUL.html(str); 
					   
					}
					
					
					for(var i=0, length=list.length||0 ; i<length ; i++){
						
						str +="<dl class='cmt_item f_line' id='content_area_dl_550974857'>";
						str +='<dt><span class="nameui">'+list[i].id+'</span>';
						str += "<i>"+replyService.displayTime(list[i].updatedate)+"</i></dt>";
						str +='<dd id="content_area_550974857" class="usertxt"><span>'+list[i].reply+'</span></dd></dl>';
						
		
					}
						replyUL.html(str); //댓글테두리 만들면서 데이터 넣고
						showReplyPage(replyAllCnt);//댓글 페이지도 출력하고.
				
				});//getReplyList 파라미터 끝.
			}//쇼리스트 끝.
			
			
			var pageSpace=$(".paginate-reple");
			
			function showReplyPage(allReplyCnt){ // 밑에 페이지 숫자 나열하는 거.
					var endPage= Math.ceil(rePage/10.0)*10;
					var startPage = endPage-9;
					var prev = startPage != 1;
					var next = false;
					var str="";
					
					if(endPage*10 >= allReplyCnt){
						endPage=Math.ceil(allReplyCnt/10.0);
					}
				 	if(endPage*10 < allReplyCnt){
				 		next=true;
				 	}
				 	if(prev){    //자바스크립트로 onclick=" " 효과주기. href는 안 씀.
				 		str+="<a href="+(startPage-1)+" class='btn pre'>이전</a>";
				 	}
					
				 	for(var i=startPage; i<=endPage; i++){
				 		
				 		var li = rePage==i? '<strong class="current">'+i+'</strong>' :'<a href="'+i+'" class="page-num">'+i+'</a>';
				 		str+= li;
				 	
				 	}
/*  <a href="#replyArea" onclick="vndr('TRR4'); try{ loadReply(2, '', 'W'); } catch (e) { return false; }" class="page-num" title="2페이지">2</a> */
                            
				 	if(next){    //자바스크립트로 onclick=" " 효과주기. href는 안 씀.
				 		str+="<a href="+(endPage+1)+" class='btn next'>다음</a>";
				 	} 

				 	pageSpace.html(str);

			}//showReplyPage 끝.
			
			
			       //pagespace부터 a태그까지 클릭할 수 있게 해라.
		 $(".paginate-reple").on("click",".page-num", function(e){	
				e.preventDefault();
				
				var targetPage = $(this).attr("href");
				rePage=targetPage;
				showList(rePage);			
				
			});
			
		    
		     
			$(".replyAdd").on("click",function(){
				var replyTextArea = $("textarea").val();	
			   replyService.addReply({reply:replyTextArea, id:"${sessionId}", bno:bno}); 
			   $("textarea").val("");
			   /* showList(1); */
			   location.reload();
			});
			
			
			
			/* 목록버튼 클릭하면, 목록 컨트롤러 부르기. */
			$("#listClick1, #listClick2").click(function(){
				
				var modify="${modify}";
				if(modify==1){ //글수정 후 read화면 뜬거면,
					$("#actionForm2").submit();
				}else{ // 그 외 
				$("#actionForm").submit();
				}
				
				
			});//--목록	
			
			
			
			
			
			/* 수정버튼 클릭하면, 수정화면으로 이동하기. */
			$(".a1").click(function(e){
				
				e.preventDefault();
				$("#actionForm").attr("action","/kteun/board1/talkRegister");
				$("#actionForm").submit();
				
			});//--글수정
			
			
			/* 글삭제버튼 누르면 */
			 $(".a2").click(function(e){
				
				e.preventDefault();
				$("#actionForm").attr("action","/kteun/board1/delete?bno=${tuple.bno}");
				$("#actionForm").submit();
				
					
				}); 
			
			
		}); //다큐먼트레디 끝
		
		
		
	
	</script>	
	
	
	<script>
	$(document).ready(function(){
		
		(function(){
			var bno ='<c:out value="${tuple.bno}"/>';
			
			$.getJSON("/kteun/board1/getAttachList",{bno:bno},function(arr){
				
				showUploadResult(arr);
			});//--겟제이슨
			
	
		})();//--즉시실행함수 끝.
		
		
		
		
		function showUploadResult(arr){
			
			if(!arr|| arr.length==0){return;}
			
			var uploadUL = $(".espresso_attachtoolbar");
			
			var str_wrap="<div id='espresso_attach_list_attach_list_wrap' class='attachWrap' style='width:{$toolbar_width}px;display:block;'>";
			var str_text="<ul id='espresso_attach_list_file_list' class='attach_txt'>";
			var str_image="<div class='attachPicWrap'><ul id='espresso_attach_list_image_list' class='attach_pic'>";
			
			var str_text_end="</ul>";
			var str_image_end="</ul></div>";
			var str_final_end="</div>";
			
			
			var str1="";
			var str2="";
			
		
			$(arr).each(function(i,obj){
				
				if(!obj.filetype){ //이미지가 아니면,
					var fileCallPath = encodeURIComponent(obj.uploadpath+"/"+obj.uuid+"_"+obj.fileName);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					
									
					str1 += "<li data-uploadpath='"+obj.uploadpath+"' data-uuid ='"+ obj.uuid+"' data-filename='"+obj.fileName+"' data-type ='"+obj.filetype+
							"'><div><img src='../resources/img/text.jpg' style='width:20px; height:20px;'>"+obj.fileName;
					str1 += "<span data-file=\'"+fileCallPath+"\' data-type='file'><img src='../resources/img/arrow.png'/></span></div></li>";
							
				
					
				}else if(obj.filetype){//이미지면,
					
					var fileCallPath = encodeURIComponent(obj.uploadpath+"/s_"+obj.uuid+"_"+obj.fileName);
					var OriginPath = obj.uploadpath+"\\"+obj.uuid+"_"+obj.fileName
					    OriginPath = OriginPath.replace(new RegExp(/\\/g),"/");
				
					
					str2 += "<li data-uploadpath='"+obj.uploadpath+"' data-uuid ='"+ obj.uuid+"' data-filename='"+obj.fileName+"' data-type ='"+obj.filetype+"'>" +
							"<a><img src='/kteun/display?fileName="+fileCallPath+"' style='width:50px; height:50px;'>"
					str2 += "<span data-file=\'"+fileCallPath+"\' data-type='image'><img src='../resources/img/arrow.png'/></span></a></li>";
					
				}
				
			});//이치 함수..
			$(".espresso_attach_list_attach_list_wrap_wrap").append(str_wrap + str_image + str2 + str_image_end + str_text + str1 + str_text_end + str_final_end);
			
		}//showUploadResult끝
		
		
		
		
		//다운로드 버튼 클릭하면!
		$(".espresso_attach_list_attach_list_wrap_wrap").on("click","li",function(){
			
			
			
			var uploadpath = $(this).data("uploadpath");
			var uuid = $(this).data("uuid");			
			var filename = $(this).data("filename");
			var path = encodeURIComponent(uploadpath+"/"+uuid+"_"+filename);
			
			self.location="/kteun/download?fileName="+path;
						
			
		})//--다운로드버튼 클릭
		
		
		
		
		
	});//--다큐먼트레디 끝.
	
	
	
	</script>

<style type="text/css">
.editor { clear:both; float:left; width:800px; margin:7px 0 20px 0; }
</style>

</head>


<body>


	<div class="all_wrap">
	
	  <form id="actionForm" action="/kteun/board1/talkList" method="get">
               	<input type="hidden" name="pageNum" value="<c:out value='${pageMaker.cri.pageNum }'/>">
                <input type="hidden" name="amount" value="<c:out value='${pageMaker.cri.amount }'/>">
                <input type="hidden" name="type" value="<c:out value='${pageMaker.cri.type }'/>">
                <input type="hidden" name="keyword" value="<c:out value='${pageMaker.cri.keyword }'/>">
                <input type="hidden" name="bno" value="<c:out value='${tuple.bno}'/>">
               
               </form>
               
       <form id="actionForm2" action="/kteun/board1/talkList" method="get">
               
                <input type="hidden" name="pageNum" value="<c:out value='${afterUpdate_pageMaker.cri.pageNum }'/>">
                <input type="hidden" name="amount" value="<c:out value='${afterUpdate_pageMaker.cri.amount }'/>">
                <input type="hidden" name="type" value="<c:out value='${afterUpdate_pageMaker.cri.type }'/>">
                <input type="hidden" name="keyword" value="<c:out value='${afterUpdate_pageMaker.cri.keyword }'/>">
               </form>      
               
               
               
               

   
	<!-- Header -->
	
	<div id="header" role="banner">
	  
	<%@include file ="../include/header.jsp"  %>
	 
	  
	  <!-- navigation -->
	  <div class="navWrap">
		<div class="snbArea" role="navigation">
		  <h2 class="hide">판 메뉴</h2>
		  <ul>
			<li class=""><a href="/kteun/main/main"  onclick="vndr('NPG01'); return true;" >홈</a></li>
			<li class="on"><a href="/kteun/board1/talkList"  onclick="vndr('NPG07'); return true;" aria-current="page">자유 담소</a></li>
			<li class=""><a href="#"  onclick="vndr('NPG65'); return true;" >사업 담소</a></li>
			<li><a href="#">법률 담소</a></li>
			
		  </ul>

		  <div class="svcLink">
			<a href="#"  onclick="vndr('NPG14'); if(checkLoginAndRedirect()) { location.href = '/my'; } return true;" class="my">내가 쓴 글 보기</a>
		  </div>
		</div>
	  </div>
	</div>	  
	
	<!-- Header : E -->	

		<hr />

				<div id="container" class="f_clear">
			<div class="issue-sub">
				<h3 class="tit-sub hide">write</h3>
			</div>

			<div class="content sub">
				 <div class="viewarea">
                        <!-- S : 헤드라인 배너 -->
                        <!-- E : 헤드라인 배너 -->
                        <!-- view-wrap -->
                        <div class="view-wrap">
                            <!-- google_ad_section_start(name=post) -->
                            <!-- 본문 타이틀&정보 -->
                            
                            <form action="/kteun/board1/modify" method="get">
                            <div class="post-tit-info emblem rank">
                                <h4 title="제목">
                                    <img src="../resources/img/jang_bi3.png" class="emblem" alt="톡커들의 선택"/>
                                      <span name="title"><c:out value="${tuple.title}"/></span>
                                </h4>
                                <div class="info">
                                     
                                    <a href="#" class="writer" name="id"><c:out value="${tuple.id}"/></a>
                                    
                                    <span class="bar">|</span>
						<span class="date"><c:out value="${tuple.updatedate}"/> </span>
                                    <span class="count">
                                        <span class="tit">조회</span>
                                        77,148
                                    </span>
                                </div>
                                <div class="ranking">
                                    <a href="/talk/ranking">
                                        
                                    </a>
                                </div>
                                <div class="post-navi">
                                    <!-- <span class="location">
                                        <a href=" " class="home">세상살이 담소</a>
                                        <a href="/talk/c20038">10대 이야기</a>
                                        <a href="/talk/c20038/channel/68203">드루와</a>
                                    </span> -->
                                    <div class="btn">
                                        <a href="#" class="list" id="listClick1">목록</a>
                                        <a href="#" class="prev" onclick="return false;">이전글</a>
                                        <a href="#" class="next" onclick="return false;">다음글</a>
                                    </div>
                                </div>
                            </div>
                            <!-- 이어지는 판 -->
                            <dl class="espresso_attach_list_attach_list_wrap_wrap">
                          <!--   <div id="espresso_attach_list_attach_list_wrap" class="attachWrap" style="width:{$toolbar_width}px;display:block;">
					    			<div class="attachPicWrap">
					    				<ul id="espresso_attach_list_image_list" class="attach_pic">
					    				
					    					
					    				</ul>
					    			</div>
					    			<ul id="espresso_attach_list_file_list" class="attach_txt">
					    			</ul> 
				    		     </div> 
                               -->
                            </dl>
                            
                            
                            
                            <div class="posting">
                               <table>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div id="contentArea">
                                                 	<p class="writer" name="content"><c:out value="${tuple.content}"/></p>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
	                             
                            </div>
                            
                         
                         
                           
                            <!-- 내보내기 -->
                            <div class="btn-wrap">
                                <ul class="social_send">
                                
                                <c:set var="sessionId" value="${sessionId}"/>
                                <c:set var="id" value="${tuple.id}"/>
                                                                
                                <c:if test="${id eq sessionId}">
                                	<a href="" class="a1">글수정</a>
                                	<span class="bar" style="color: #d8d8d8;">|</span>
                                	<a href="" class="a2">글삭제</a>
                                 </c:if>
                               </ul> 
                            </form>
                               
                               
                                <div class="btn">
                                    <a href="#" class="list" id="listClick2">목록</a>
                                    <span class="bar">|</span>
                                   
                                    <a href="#" class="prev" onclick="return false;">이전글</a>
                                    <a href="#" class="next" onclick="return false;">다음글</a>
                                </div>
                                <form name="pannFrm" method="get" action="/talk/pann/modify">
                                    <input type="hidden" name="pannId" value="352959667"/>
                                </form>
                            </div>
                            <!-- 배너 영역 -->
                            <div class="view_banner"></div>
                            
                            <!-- 댓글 영역 -->
                            <div class="commentBox" style="display:block;" id="commentBox">
                               
                                <!-- S: 댓글 입력폼 -->
                                <fieldset class="cmt_write">
                                    <legend>댓글 입력 영역</legend>
                                    <div class="reply_wing_banner"></div>
                                    
                                    <dl class="re_write">
                                        <dt>댓글쓰기</dt>
                                        
                                        <dd class="write_ifm">
                                             <textarea id="replyForm" name="replyForm" style="width:619px;height:121px" ></textarea>
                                            <button class="replyAdd">등록</button>
                                        </dd>
                                       
                                    </dl>
                                </fieldset>
                                <!-- E: 댓글 입력폼 -->
                                <!-- S: 댓글영역 -->
                                <div class="cmtList-wrap" id="replyArea">
                                    <!-- S : 댓글탭 -->
                                    <div class="cmt_tab" id="cmtTab">
                                        <ul>
                                            <li class="new selected">
                                                <a href="#replyArea" id="timeOrder" onclick="tabSelect(this,'W');vndr('TVI14');">최신순</a>
                                            </li>
                                            <li class="recommend">
                                                <a href="#replyArea" id="recmdOrder" onclick="tabSelect(this,'R');vndr('TVI15');">추천순</a>
                                            </li>
                                            <!-- <li class="spare">
                                                <a href="#replyArea" id="prebepleOrder" onclick="tabSelect(this,'P');vndr('TRR1');">
                                                    예비베플 <span>10</span>
                                                </a>
                                            </li>
                                            <li class="argument">
                                                <a href="#replyArea" id="proconOrder" onclick="tabSelect(this,'C');vndr('TRR2');">
                                                    찬반대결 <span>3</span>
                                                </a>
                                            </li>
                                            <li class="pic">
                                                <a href="#replyArea" id="imageOrder" onclick="tabSelect(this,'I');vndr('TRR3');">
                                                    사진댓글 <span>99+</span>
                                                </a>
                                            </li> -->
                                        </ul>
                                        <p class="search">
                                            <a href="#" id="searchButton" class="hide" onclick="searchToggle(); return false;">작성자 찾기</a>
                                        </p>
                                        <!-- S : 댓글 검색 -->
                                        <div class="cmt_search" style="display:none;">
                                            <label for="penm">작성자명</label>
                                            <input type="text" id="penm" value="" onkeypress="if(event.keyCode == 13){searchReply(); return false;}" class="type-text" title="작성자 입력"/>
                                            <button type="button" onclick="searchReply(); return false;">
                                                <span>검색</span>
                                            </button>
                                        </div>
                                        <!-- S : 댓글 검색 -->
                                    </div>
                                    <!-- E : 댓글탭 -->
                                    <!-- S: 일반 댓글 -->
                                    <div id="commentDiv">
                                        <div class="cmt_list">
                                           
                                            <!-- S : 댓글 리스트 -->
                                           
                                                
                                              <!--   댓글 좋아요 싫어요 누르기 -->
                                               <!--  <dd class="opinion">
                                                    <dl>
                                                        <dt class="good">
                                                            <a href="#" title="추천" onclick="reputeReply(550974857, 'R', ''); return false;">추천</a>
                                                        </dt>
                                                        <dd id="R_cnt_550974857" name="R_cnt_550974857" class="n_good">0</dd>
                                                        <dt class="bad">
                                                            <a href="#" title="반대" onclick="reputeReply(550974857, 'O', ''); return false;">반대</a>
                                                        </dt>
                                                        <dd id="O_cnt_550974857" name="O_cnt_550974857" class="n_bad">0</dd>
                                                        <dt class="report">
                                                            <a href="#" title="신고 (새창으로 이동)" onclick="popupSingo('R', '352959667', '550974857'); return false;">신고 (새창으로 이동)</a>
                                                        </dt>
                                                    </dl>
                                                </dd> -->
                                               
                                                
                                                <!-- 답글에 답글달기 -->
                                               <!--  <dd id="modify_area_550974857" class="reples modify" style="display:none">
                                                    <fieldset class="replewrite">
                                                        <legend>답글 입력 영역</legend>
                                                        <iframe title="답글입력창" id="cmt_content_modify_550974857" name="cmt_content_modify_550974857" style="display:none; height:0px;" src="about:blank" frameborder="0" scrolling="no" marginwidth="0" marginheight="0"></iframe>
                                                    </fieldset>
                                                </dd>
                                                <dd id="children_dd_550974857" class="reples">
                                                    <a href="#" class="cmtsum hide" onclick="repleToggle(550974857, 0); return false;">
                                                       	 답글 <em>0</em>
                                                      		 개
				
                                                    </a>
                                                    <a href="#" class="cmt_w" onclick="vndr('TVI49');repleToggle(550974857, 0); return false;">답글쓰기
													</a>
                                                    S : 답글이 Ajax로 로드되는 영역
                                                    <div class="hiddenreple" id="reply_toggle_550974857" style="display:none"></div>
                                                    E : 답글이 Ajax로 로드되는 영역
                                                </dd>
                                            </dl> -->
                                            <!-- E : 댓글 리스트 -->
                                            
                                        </div>
                                        <!-- S : 페이징 -->
                                        <div class="paginate-reple">
                                          <!--   <strong class="current">1</strong>
                                            <a href="#replyArea" onclick="vndr('TRR4'); try{ loadReply(2, '', 'W'); } catch (e) { return false; }" class="page-num" title="2페이지">2</a>
                                          
                                            <a href="#" onclick="vndr('TRR4'); try{ loadReply(11, '', 'W'); return false; } catch (e) { return false; }" class="btn next">다음</a> -->
                                        </div>
                                        <!-- E : 페이징 -->
                                    </div>
                                    <!-- E: 일반 댓글 -->
                                </div>
                                <!-- E: 댓글영역 -->
                            </div>
                           
                            <!-- 댓글 영역 -->
                        </div>
                        <!-- //view-wrap -->
                        <div class="page_navi_btn">
                            <!-- <a href="/talk" id="page_navi_btn_talkhome">톡톡 홈으로</a>
                            |
				<a href="/talk/c20038" id="page_navi_btn_list">전체목록</a>
                            |
				<a href="#" id="page_navi_btn_top" onclick="return false;">맨위로</a> -->
                        </div>
                        
                    </div>
			</div>
		</div>



</div>

				<!-- footer -->
				
				<%@include file="../include/footer.jsp" %>
				
		