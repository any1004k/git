/**
 * 
 */


$(document).ready(function(){
	
   var str="";  
   
   var a=false;
   var b=false;
   var c=false;
   var d=false;
   var e=false;
   var f=false;
   var g=false;
   var h=false;
   var i=false;
   
   
   
	/*중복아이디 검사 + 아이디 정규식에 맞는지 검사. */
	$("input[name='id']").on("keyup",function(){
		 var str="";      
		var testQ =/^[a-z]{1}[a-z0-9]{4,10}$/;		
		
		if(!testQ.test($("input[name='id']").val())){
			str = "<p>아이디는 영어 소문자로 시작하는, 5~11자 소문자 또는 숫자만 사용 가능합니다.</p>";
			a=false;
		}else{
			str="";
			a=true;
		}

		 $("#idMsg").html(str);
		/*아이디는 영문자로 시작하는, 6~20자 영문자 또는 숫자만 사용 가능합니다.
	
		필수정보입니다.*/
		
	});
	
	
	//다음칸으로 이동시.
	$("input[name='id']").on("blur",function(){
		  var str=""; 
		var checkId=$("input[name='id']").val();
		var testQ =/^[a-z]{1}[a-z0-9]{4,10}$/;
		
		if(!checkId){
			str = "<p>필수정보입니다.</p>";
			 $("#idMsg").html(str);
			 b=false;
		}else if(checkId){
		
			$.getJSON("/kteun/main/checkId",{checkId:checkId}
			,function(result){
				
				if(result==1){
					
					str = "<p>이미 사용중인 아이디입니다.</p>";
					 $("#idMsg").html(str);
					 b=false;
				}else if(result==0 && testQ.test($("input[name='id']").val())){
					str = "<p style='color:blue;'>사용가능한 아이디 입니다.</p>";
					 $("#idMsg").html(str);
					 b=true;
				}else if(!testQ.test($("input[name='id']").val())){
					str = "<p>아이디를 다시 입력해주세요.</p>";
					 $("#idMsg").html(str);
					 b=false;
				}
				
				
			  });//겟제이슨 끝.
			
							/*이미 사용중인 아이디입니다.
							 * 필수정보입니다.*/
			
				}//if 끝.
			
			});
	
	var str="";
	/*비밀번호 정규식에 맞는지 검사*/
	$("input[name='password']").on("keyup",function(){
		
		
		var testQ =  /(?=.*\d{1,50})(?=.*\W{1,50})(?=.*[a-zA-Z]{1,50}).{8,15}$/;

		
		
		
		if(!testQ.test($("input[name='password']").val())){
			
			str = "<p>8~16자 영문 대 소문자, 숫자, 특수문자를 포함해주세요.</p>";	
			
			$("#pw1Msg").html(str);
			c=false;
			
		}else{
			str="<p style='color:blue;'>사용가능한 비밀번호 입니다.</p>";
			$("#pw1Msg").html(str);
			c=true;
		}
					
		/*8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.
		
		필수정보입니다.*/		
		
	});
	
	
	$("input[name='password']").on("blur",function(){
	
	if(!$("input[name='password']").val()){
		str = "<p>필수정보입니다.</p>";
		 $("#pw1Msg").html(str);
		 d=false;
	}else{
		str = "";
		$("#pw1Msg").html(str);
		 d=true;
	}
	
	});
	
	
	
	
	
	
	
	
	
	
	/*비번재확인*/
	$("input[name='pswd2']").on("keyup",function(){
		
		var str="";
		var pass1 = $("input[name='password']").val();
		var pass2 = $("input[name='pswd2']").val();
		
		if(!$("input[name='password']").val()){
			str = "<p>비밀번호를 입력해 주세요.</p>";
			 $("#pswd2Msg").html(str);
			 e=false;
		}else if(pass1==pass2 && c==true){
			str = "<p style='color:blue;'>비밀번호가 일치합니다.</p>";
			$("#pswd2Msg").html(str);
			e=true;
		}else if(pass1==pass2 && c==false){
			str = "<p>비밀번호 형식이 올바르지 않습니다..</p>";
			$("#pswd2Msg").html(str);
			e=false;
		}else{
			str = "<p>비밀번호가 일치하지 않습니다.</p>";
			$("#pswd2Msg").html(str);
			e=false;
		}
		
		
		
	});
	

	
	/*생년월일-년도 검사.*/
	$("input[name='birth_year']").on("keyup",function(){
		
		var testQ=/\d{4}/;
		
		if(!testQ.test($("input[name='birth_year']").val())){
			str = "<p>생년월일을 다시 확인해주세요.</p>";
			 $("#birthdayMsg").html(str);
			 f=false;
		}else {
			str = "";
			$("#birthdayMsg").html(str);
			 f=true;
		}
		
		
		/*생년월일을 다시 확인해주세요.*/
	});
	
	
	
	/*생년월일-일 검사.*/
	$("input[name='birth_day']").on("keyup",function(){
		var testQ=/\d{1,2}/;
		
		if(!testQ.test($("input[name='birth_day']").val())){
			str = "<p>생년월일을 다시 확인해주세요.</p>";
			 $("#birthdayMsg").html(str);
			 g=false;
		
		}else {
			str = "";
			$("#birthdayMsg").html(str);
			g=true;
		}
		
		/*생년월일을 다시 확인해주세요.*/
	});
	
	
	
	/*이메일 정규식에 맞는지 검사*/
	$("input[name='email']").on("keyup",function(){
		
		var testQ =/\w@\w+\.\w/;
		
		if(!testQ.test($("input[name='email']").val())){
			str = "<p>이메일 주소를 다시 확인해주세요.</p>";
			 $("#emailMsg").html(str);
			 h=false;
		}else {
			str = "";
			$("#emailMsg").html(str);
			h=true;
		}
		
		
		/*이메일 주소를 다시 확인해주세요.*/
	});
	
	
	/*휴대폰번호 정규식에 맞는지 검사*/
	$("input[name='phone']").on("keyup",function(){
		var str="";
		var testQ =/\d{3}-\d{3,4}-\d{4}/;
		
		if(!testQ.test($("input[name='phone']").val())){
			str = "<p>000-0000-0000 형식으로 입력해주세요.</p>";
			 $("#phoneNoMsg").html(str);
			 i=false;
		
		}else {
			str = "";
			$("#phoneNoMsg").html(str);
			 i=true;
		}
		
		
		/*휴대폰 번호를 다시 확인해주세요.*/
	});
	
	$("#btnJoin").click(function(){
	
		
		if(a & b & c & d & e & f & g & h & i){
			
			$("#join_form").submit();
		}else{
			alert("기입사항을 다시 확인해주세요.");
			return false;
		}
	});// 버튼을 클릭했을 때.
	
	
	
	
});//다큐먼트 끝.

