/**
 * document.ready 생략함. (내생각) jsp에서 다큐먼트레디 호출해서, 여기 접근함. */

console.log("replyService입니다.");

	var replyService=(function(){ 
	
	
		function getReplyList(a,b,c){
			
			var bno = a.bno;
			var page = a.page||1;
			
			$.getJSON("/kteun/reply1/pages/"+bno+"/"+page+".json",
					function(data){
						if(b){
							b(data.replyAllCnt, data.list);
						}
					}			
			).fail(function(xhr,status,err){
				if(c){
					c();
					}			
			   });//겟 제이슨 끝			
		};//리스트 함수 끝.
		
		
		function addReply(a,b,c){
					
				$.ajax({
					type:"post",
					url : "/kteun/reply1/new",
					data:  JSON.stringify(a),
					contentType : "application/json; charset=utf=8",
					success : function(d,e,f){
						if(b){
							b(d);
						}
					},
					error : function(xhr, status, er){
						 if(c){
							 c(status);
						 }
					}
									
				});//에이젝스 끝.
					
		 }//에드 함수 끝.
		
		
		function removeReply(a,b,c){
			
			$.ajax({
				type:"delete",
				url : "/kteun/reply1/"+a,
				success : function(d,e,f){
					if(b){
						b(d);
					}
				},
				error: function(g,h,i){
					if(c){
						c(h);
					}
				}
				
				
			});
			
		}
		
		
		function updateReply(a,b,c){
			
			$.ajax({
				type:"put",
				url : "/kteun/reply1/"+a.rno,
				data : JSON.stringify(a),
				contentType : "application/json; charset=utf-8",
				success : function(d,e,f){
					if(b){
						b(d);
					}
				},
				error : function(g,h,i){
					if(c){
						c(h);
					}
				}
				
			});// 에이젝스 끝.
			
		}//업데이트 끝.
		
		function getReplyTuple(a,b,c){ 
			
			$.get("/reply1/"+a+".json", function(d){
				if(b){
					b(d);
				}
			}).fail(function(g,h,i){
				if(c){
					c(h);
				}
			});//제이쿼리겟 끝
		}//겟튜플 끝
		
		function displayTime(timeValue){ 
			var today = new Date();
			var gap = today.getTime()-timeValue;
			var dateObj = new Date(timeValue);
			var str="";
			
			if(gap < (1000*60*60*24)){
				var hh = dateObj.getHours();
				var mm = dateObj.getMinutes();
				var ss = dateObj.getSeconds();
				
				return[(hh>9?"":"0")+hh,':',(mm>9?"":"0")+mm,':',(ss>9?"":"0")+ss].join("");
			}else{
				var y = dateObj.getFullYear();
				var m = dateObj.getMonth()+1; // 겟 먼쓰는 0부터 시작함. 그래서 1더하기.
				var d = dateObj.getDate();
				
				return [(y>9?"":"0")+y,':',(m>9?"":"0")+m,':',(d>9?"":"0")+d].join("");
				
			}
		
		
		}// 디스플래이 타임 끝.
		
		return{
			addReply : addReply,
			getReplyList:getReplyList,
			removeReply : removeReply,
			updateReply : updateReply,
			getReplyTuple : getReplyTuple,
			displayTime : displayTime
		};
		
	})();//replyService 끝.	

	

		
		
		
