/**
 * 
 */
$(document).ready(function(){
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5메가바이트
	
	function checkExtension(fileName, fileSize){
		
		if(fileSize>= maxSize){
			alert("파일 사이즈 초과");
			return false;			
		}
		
		if(regex.test(fileName)){ // 내생각 : fileName이 정규식에 부합하면 true 반환하나 보다.
			
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		
		return true;
				
	}//checkExtension끝
	

	
	
	function showUploadResult(result){
		
		if(!result|| result.length==0){return;}
		
		var uploadUL = $(".espresso_attachtoolbar");
		
		var str="";
		
		$(result).each(function(i,obj){
			
			if(!obj.image){ //이미지가 아니면,
				str="";
				var fileCallPath = encodeURIComponent(obj.uploadpath+"/"+obj.uuid+"_"+obj.filename);
				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				
				str += "<li data-uploadpath='"+obj.uploadpath+"' data-uuid ='"+ obj.uuid+"' data-filename='"+obj.filename+"' data-type ='"+obj.image+
						"'><div><img src='../resources/img/text.jpg' style='width:20px; height:20px;'>"+obj.filename;
				str += "<span data-file=\'"+fileCallPath+"\' data-type='file'><img src='../resources/img/x.png'/></span></div></li>";
			
				$(".attach_txt").append(str);
				
			}else{//이미지면,
				str="";
				var fileCallPath = encodeURIComponent(obj.uploadpath+"/s_"+obj.uuid+"_"+obj.filename);
				var OriginPath = obj.uploadpath+"\\"+obj.uuid+"_"+obj.filename
				    OriginPath = OriginPath.replace(new RegExp(/\\/g),"/");
			
				str += "<li data-uploadpath='"+obj.uploadpath+"' data-uuid ='"+ obj.uuid+"' data-filename='"+obj.filename+"' data-type ='"+obj.image+"'>" +
						"<div><img src='/kteun/display?fileName="+fileCallPath+"' style='width:50px; height:50px;'>"
				str += "<span data-file=\'"+fileCallPath+"\' data-type='image'><img src='../resources/img/x.png'/></span></div></li>";
				$(".attach_pic").append(str);
			}
			
			
		});//이치 함수..
		
	}//showUploadResult끝
	
	
	
	
	//파일첨부 클릭하면 인풋파일 자동클릭 되도록
	$(".espresso_attachtoolbar").click(function(e){
		e.preventDefault();
		$("input[type='file']").click();
	});
	
	
	
	
	
	
	
	// inut 파일에 파일이 추가 되면, 화면에 그 자료를 제이슨으로 보내주도록.
	$("input[type='file']").change(function(e){   
		
		var formData = new FormData();
		var inputFile = $("input[type='file']");
		
		
		var files = inputFile[0].files;
		
		for(var i=0; i<files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;	
			}
			formData.append("UploadFile",files[i]);
			
		}
		
		
		$.ajax({
			url:'/kteun/uploadAjaxAction',
			processData : false,
			contentType :false,
			data : formData,   // File형으로 만들어서 보내니까, 받는 컨트롤러도 파라미터에서 멀티파트로 받아야함.
			type :'POST',
			dataType :'json',  // (내생각)컨트롤러에서 제이슨 타입으로 받는다. 
			success : function(result){
				console.log("하이");
				console.log(result);
				showUploadResult(result);
			}
		
			
		});//-- 에이잭스
				
	});//-- 체인지 
	
	


	
	
});//레디 끝.