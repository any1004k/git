/**
 * 
 */


$(document).ready(function(){
	
	
	var actionForm = $("#actionForm");
	
	
	
	$(".move").on("click",function(e){
		
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr('href')+"'>");
		actionForm.attr("action","/kteun/board1/talkRead");
		actionForm.submit();
				
	})
	
	$(".write").click(function(e){
	
		e.preventDefault();
		actionForm.attr("action","/kteun/board1/talkRegister")
		actionForm.submit();
	})
	
	
		
})