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
	<script type="text/javascript" src="../resources/js/board1/talkRegister.js"></script>




<script>
 $(document).ready(function(){
	 
	 
	 (function(){   /* 시작하면 파일 가져오기. */
		 var bno = '<c:out value="${tuple.bno}"/>';

		 
		 if(bno!="0"||bno!="null"){
		 $.getJSON("/kteun/board1/getAttachList"
				 ,{bno:bno}
		 		 ,function(arr){
		 			 console.log(arr);
		 			showUploadResult(arr);
		 		 });//--겟제이슨
		 		 
		 }//if 끝.		 
	 })();//-즉시실행함수
	 
	function showUploadResult(arr){  //디비에서 등록된 tuple을 받아 뿌리는 거임. 
			
			if(!arr|| arr.length==0){return;}
			
			var uploadUL = $(".espresso_attachtoolbar");
			
			var str="";
			
		
			$(arr).each(function(i,obj){
				
				if(obj.filetype==false){ //이미지가 아니면,
					str="";
					var fileCallPath = encodeURIComponent(obj.uploadpath+"/"+obj.uuid+"_"+obj.fileName);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					
					str += "<li data-uploadpath='"+obj.uploadpath+"' data-uuid ='"+ obj.uuid+"' data-filename='"+obj.fileName+"' data-type ='"+obj.filetype+
							"'><div><img src='../resources/img/text.jpg' style='width:20px; height:20px;'>"+obj.fileName;
					str += "<span data-file=\'"+fileCallPath+"\' data-type='file'><img src='../resources/img/x.png'/></span></div></li>";
				
					$(".attach_txt").append(str);
					
				}else{//이미지면,
					str="";
					var fileCallPath = encodeURIComponent(obj.uploadpath+"/s_"+obj.uuid+"_"+obj.fileName);
					var OriginPath = obj.uploadpath+"\\"+obj.uuid+"_"+obj.fileName
					    OriginPath = OriginPath.replace(new RegExp(/\\/g),"/");
				
					str += "<li data-uploadpath='"+obj.uploadpath+"' data-uuid ='"+ obj.uuid+"' data-filename='"+obj.fileName+"' data-type ='"+obj.filetype+"'>" +
							"<div><img src='/kteun/display?fileName="+fileCallPath+"' style='width:50px; height:50px;'>"
					str += "<span data-file=\'"+fileCallPath+"\' data-type='image'><img src='../resources/img/x.png'/></span></div></li>";
					$(".attach_pic").append(str);
				}
				
			});//이치 함수..
			
			
		}//showUploadResult끝
	 
		//글등록 버튼 누르면.
		var formObj = $("#write_form");
		
		$("button[type='button']").click(function(e){
			e.preventDefault();
			var bno ="${tuple.bno}";                              
			var str="";
			
			
			
		if(bno==""||bno==null){ //완전 새글이면
			
				$(".attach_pic li,.attach_txt li").each(function(i,obj){
					var fobj = $(obj);  //이렇게 변수로 꼭 따로 담아줘야 data 값을 뽑아낼 수 있다. 
					
					str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+fobj.data("filename")+"'/>";
					str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+fobj.data("uuid")+"'/>";
					str += "<input type='hidden' name='attachList["+i+"].uploadpath' value='"+fobj.data("uploadpath")+"'/>";
					str += "<input type='hidden' name='attachList["+i+"].filetype' value='"+fobj.data("type")+"'/>";
					
					
				});//--이치함수
			formObj.append(str).submit();  
			  
			
			}else{  //수정이면
				/* alert("수정수정하지"+bno) */
				$(".attach_pic li,.attach_txt li").each(function(i,obj){
					var fobj = $(obj);  //이렇게 변수로 꼭 따로 담아줘야 data 값을 뽑아낼 수 있다. 
					
					str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+fobj.data("filename")+"'/>";
					str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+fobj.data("uuid")+"'/>";
					str += "<input type='hidden' name='attachList["+i+"].uploadpath' value='"+fobj.data("uploadpath")+"'/>";
					str += "<input type='hidden' name='attachList["+i+"].filetype' value='"+fobj.data("type")+"'/>";
					str += "<input type='hidden' name='attachList["+i+"].bno' value='"+bno+"'/>";
					
				});//--이치함수
				
				str += "<input type='hidden' name='bno' value='"+bno+"'/>";
				<%--  <input type="hidden" name="bno" value="<c:out value='${tuple.bno }'/>"> --%>
				formObj.attr("action","/kteun/board1/talkUpdate");
				formObj.append(str).submit();
				
				
			}
			
		})//--글등록 버튼 누르면.
		
		
	
		
		
	 
		//텍스트파일 x클릭하면 삭제되도록.
		
		$(".attach_txt,.attach_pic").on("click","span",function(e){
			/*e.preventDefault();	*/
			var targetFile=$(this).data("file"); //x클릭하면,여러개의 span중 클릭한 span의 data-file의 값(fileCallPath)을 가져와서 넣으세요.
			var type = $(this).data("type");
			var li = $(this).closest("li");
			var uuid = li.data("uuid");
			var bno = "${tuple.bno}";
			
		
			$.ajax({
				url : '/kteun/deleteFile',
				data :{fileName:targetFile, type:type, uuid:uuid , bno:bno},
				dataType :'text', // 서버로부터 텍스트로 받겠다.
				type : 'post',
				success: function(result){ //text형식의 리턴값.
				
					li.remove();
				}			
				
			});//에이젝스끝.
			
			
			
		});//-x클릭하면 삭제 끝.
	 
	 
	 
	 
	 
 });//--다큐먼트 레디.

</script>
	

<style type="text/css">
 .editor { clear:both; float:left; width:807px; margin:7px 0 20px 0; }
</style>

</head>


<body>

	<div class="all_wrap">
 			
   
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
				
				<div class="writearea">
					<h4 class="talk"><span>톡톡쓰기</span></h4>
					<p class="video_w_info">* 장가게 : 담소 글쓰기.</p>

					<form id="write_form" name="write_form" method="post" action="/kteun/board1/talkRegister" accept-charset="utf-8" >
						<input type="hidden" name="pageNum" value="<c:out value='${pageMaker.cri.pageNum }'/>">
		                <input type="hidden" name="amount" value="<c:out value='${pageMaker.cri.amount }'/>">
		                <input type="hidden" name="type" value="<c:out value='${pageMaker.cri.type }'/>">
		                <input type="hidden" name="keyword" value="<c:out value='${pageMaker.cri.keyword }'/>">
		               
						
						

					<div class="f_clear">
						<dl class="w-info">
							<dt id="dtNick">아이디</dt>
							<dd id="ddNick" class="text talk_name">

								<span id="dlNick" style="display:block">
									<label class="nHide" for="nickName">닉네임</label>
									<input type="text" id="nickName" class="type-text name" name="id" value="${yesmember.id}" readonly/>
								</span>
							</dd>
						</dl>

						<dl class="w-info">
							<dt>제목</dt>
							<dd>
								<input type="text" id="title" title="제목" name="title" class="type-text title" value="<c:out value='${tuple.title}'/>">
							</dd>
						</dl>

						
				
					   </div>
					

					<!-- S:auto complete 테스트로 임시 잡아놓은 영역 -->
					<div class="autoList"></div>
					<!-- E: -->

                  

			<div class="editor">
					
 		
		            <ul class="espresso_attachtoolbar" role="button">
		               <li class="src01"><a href="#"> 파일 첨부</a></li>
		                <li class="divbar">|</li>
		                <li><a href="#"> 이미지 첨부</a></li>
								             
		        	
		    		</ul>
		    		
    		
    		
        	
		        	<div style="display:none">
		        		<input class="inputFile" type="file" multiple/>
		        	</div>
        	
        			
        	
		            <div id="abc">	
		            	            
		              
		                <textarea name='content' style="height:500px; width:800px;"><c:out value='${tuple.content}'/></textarea>
		                
		               <div class="espresso_attach_list_attach_list_wrap_wrap">
		                <div id="espresso_attach_list_attach_list_wrap" class="attachWrap" style="width:{$toolbar_width}px;display:block;">
		    			<div class="attachPicWrap">
		    				<ul id="espresso_attach_list_image_list" class="attach_pic">
		    				
		    	
		    					
		    				</ul>
		    			</div>
		    			<ul id="espresso_attach_list_file_list" class="attach_txt">
		    			</ul>
		    		   </div>
		              </div>
		           
					<div class="plus-wrap f_clear">

						<div id="pollView"></div>
				
						<p class="agree-chk" style="display: none;"><input type="checkbox" id="promotion_id" name="promotion_id" value="-1" /><label id="agree_msg" for="scrap2"></label></p>

						<div class="btn-wrap">
							<a href="/kteun/board1/talkList"  class="list">목록</a>
							
							<a href="javascript:;" class="ok" ><button type="button">글등록</button></a>
							<a href="javascript:;" class="cancle"><button type="reset">초기화</button></a>
						
							
						   </div>
					     </div>
					   </div> <!-- 에디터 끝 -->
					</form>
					
				
				</div><!--  라이트에리아 끝 -->

			</div> <!--  컨텐트-sub 끝 -->
		</div> <!-- 컨테이너 끝 -->





				<!-- footer -->
				
				<%@include file="../include/footer.jsp" %>
				
	