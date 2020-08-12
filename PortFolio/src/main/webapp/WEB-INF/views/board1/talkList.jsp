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
	<link rel="stylesheet" type="text/css" href="../resources/css/table.css"></link>
	<link rel=StyleSheet href="../resources/css/talkRegister4.css"  type="text/css" />
	
	
	<script src="../resources/js/jquery.min.js"  type="text/javascript"></script>
	<script src="../resources/js/board1/talkList.js" type="text/javascript"></script>


<script type="text/javascript">

$(document).ready(function(){
	

var pageSpace=$(".paginate-reple");
var allCnt = <c:out value='${pageMaker.total}'/>;
var pageNum = <c:out value='${pageMaker.cri.pageNum}'/>;
showPageNums(allCnt);


function showPageNums(allCnt){ // 밑에 페이지 숫자 나열하는 거.
		var endPage= Math.ceil(pageNum/10.0)*10;
		var startPage = endPage-9;
		var prev = startPage != 1;
		var next = false;
		var str="";
		
		if(endPage*10 >= allCnt){
			endPage=Math.ceil(allCnt/10.0);
		}
	 	if(endPage*10 < allCnt){
	 		next=true;
	 	}
	 	if(prev){    //자바스크립트로 onclick=" " 효과주기. href는 안 씀.
	 		str+="<a href="+(startPage-1)+" class='btn pre'>이전</a>";
	 	}
		 
	 	
	 	for(var i=startPage; i<=endPage; i++){
	 		
	 		var li = pageNum==i? '<strong class="current">'+i+'</strong>' :'<a href="'+i+'" class="page-num">'+i+'</a>';
	 		str+= li;
	 	
	 	}

                
	 	if(next){    //자바스크립트로 onclick=" " 효과주기. href는 안 씀.
	 		str+="<a href="+(endPage+1)+" class='btn next'>다음</a>";
	 	} 

	 	pageSpace.html(str);

}//showPageNums 끝.


       //pagespace부터 a태그까지 클릭할 수 있게 해라.
$(".paginate-reple").on("click",".page-num", function(e){	
	e.preventDefault();
	
	var targetPage = $(this).attr("href");
	$("input[name='pageNum']").val(targetPage);
	$("#actionForm").submit();
	
});


});//--다큐먼트레디

</script>







	
	


<style type="text/css">
.editor { clear:both; float:left; width:800px; margin:7px 0 20px 0; }
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

			<div class="content_list sub">
				<div class="writearea_list">
					<div class="card-body">
              <div class="table-responsive">
              
               <!-- 검색창 만들기 -->
               
               <form id="actionForm" action="/kteun/board1/talkList" method="get">
               	<input type="hidden" name="pageNum" value="<c:out value='${pageMaker.cri.pageNum }'/>">
                <input type="hidden" name="amount" value="<c:out value='${pageMaker.cri.amount }'/>">
                <input type="hidden" name="type" value="<c:out value='${pageMaker.cri.type }'/>">
                <input type="hidden" name="keyword" value="<c:out value='${pageMaker.cri.keyword }'/>">
               </form>
               
               
               <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>                  
	                    <tr>
	                      <th class="th1">번호</th>
	                      <th class="th2">제목</th>
	                      <th class="th3">작성자</th>
	                      <th class="th4">작성일</th>
	                      <th class="th5">수정일</th>	                      
	                    </tr>  
                    </thead>
                                        
                    <tbody>
                      <c:forEach var="board" items="${list}">
                      	<tr>
                      		<td><c:out value="${board.bno}"/></td>
                      		<td><a class="move" href="<c:out value='${board.bno}'/>"><c:out value="${board.title}"/>
                      		    <b class="replycnt">(<c:out value="${board.replycnt}"/>)</b>
                      		    </a>                     		                    		   
                      		</td>
                      		
                      		<td><c:out value="${board.id}"/></td>
                      		<td><c:out value="${board.regdate}"/></td>
                      		<td><c:out value="${board.updatedate}"/></td>
                      	</tr>
                      
  				                    
                      
                      
                      
                      </c:forEach>
                    </tbody>               
                </table>
                
                <!-- 검색창 만들기 -->
                
                <div class="row">
                	<div class= "col-lg-12">
                		<form id="searchForm" action="/kteun/board1/talkList" method="get">
                			<select name="type" >
                				<option value="" selected> -- </option>
   								<option value="T" > 제목 </option>
                				<option value="C" > 내용 </option>
                				<option value="W" > 작성자 </option>
                				<option value="TC" > 제목+내용 </option>
                				<option value="TW" > 제목+작성자 </option>
                				<option value="TWC" > 제목+내용+작성자 </option>
                			</select>
                			<input type="text" name="keyword" value="">
                			<input type="hidden" name="pageNum" value="1">
                			<input type="hidden" name="amount" value="10">
                			<button class="btn btn-default">검색</button>
                		
                		    <button class="write btn">글쓰기</button>
                		</form>
                		
                	</div>
                </div>
                
                
                 <!-- 페이지 번호 만들기. -->
                 
            <!--     <div class="pull-right">
                	<ul class="pagination">
                		
                			<li class='paginate_button active'>
                				<a href="1">1</a>
                			</li>
               			
                		
                			<li class='paginate_button '>
                				<a href="2">2</a>
                			</li>
                		
                	</ul>
                </div> -->
                
                 <div class="paginate-reple">
                       <!--   <strong class="current">1</strong>
                         <a href="#replyArea" onclick="vndr('TRR4'); try{ loadReply(2, '', 'W'); } catch (e) { return false; }" class="page-num" title="2페이지">2</a>
                       
                         <a href="#" onclick="vndr('TRR4'); try{ loadReply(11, '', 'W'); return false; } catch (e) { return false; }" class="btn next">다음</a> -->
                  </div>
                
                
                
                
                
               
              </div>
            </div>
				</div>

			</div>
		</div>


</div>
				<!-- footer -->
				
				<%@include file="../include/footer.jsp" %>
				
		