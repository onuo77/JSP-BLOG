function deleteById(boardId){
	//ajax로 delete 요청
	var data = {
		boardId:boardId
	};
	
	$.ajax({
		type:"POST",
		url:"/jspblog/board?cmd=delete&boardId="+boardId,
		dataType:"json"
	}).done((result)=>{
		if(result.statusCode == 1){
			alert('Deleted');
			location.href="/jspblog/";
		}else{
			alert('Delete Failed');
		}	
	});		
}

function replySave(userId, boardId) {
	var data = {
		userId: userId,
		boardId: boardId,
		content: $("#reply__write__form").val()
	}
	
	$.ajax({
		type: "post",
		url: "/jspblog/reply?cmd=save",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(function(result){
		if (result.statusCode == 1) {
			addReply(result.data);
			$("#reply__write__form").val("");
			location.reload();
		} else {
			alert("댓글 작성 실패");
		}
	});
}


function addReply(data){
	var replyList = $("#reply__list");
	
	var newLi = document.createElement("li");
	newLi.id = "reply-"+data.id;
	newLi.className = "media";
	newLi.setAttribute("userId", data.userId);
	
	var liDetail =  `<div class="media-body">`;
	liDetail += `<strong class="text-primary">${data.username}</strong>`;
	liDetail += `<p>${data.content}</p>`;		
	liDetail += `</div><div class="m-2">`;	
	liDetail += `<i onclick="deleteReply(${data.id})" class="material-icons">DELETE</i>`;		
	liDetail += `</div>`;		
	
	newLi.innerHTML = liDetail;
	
	replyList.prepend(newLi);
	
}

function deleteReply(replyId){
	var userId = $("#loginUserId").val();
	
	var data = {
		userId : userId,
		replyId: replyId
	};
	
	$.ajax({
		type:"post",
		url:"/jspblog/reply?cmd=delete",
		data:JSON.stringify(data),
		contentType:"application/json; charset=utf-8",
		dataType:"json"
	}).done((result)=>{
		if(result.statusCode == 1){
			alert('Deleted');
			$("#reply-"+replyId).remove();
		}else{
			alert("Delete failed");
		}
	});
}
