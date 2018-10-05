
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />

</head>
<script>
var AjaxUtil = function(conf){
	var xhr = new XMLHttpRequest(); //객체를 사용해 서버와 상호작용을 할 수 있습니다. 페이지 전체의 데이터를 새로 받아오지 않고도 특정 URL로부터 데이터를 받아올 수 있습니다. 
                                             	//이를 이용해 웹페이지는 사용자를 방해하지 않고도 페이지의 일부분만을 업데이트할 수 있습니다. XMLHttpRequest는 Ajax 프로그래밍에 주로 사용됩니다.
	var url = conf.url;
	var method = conf.method?conf.method:'GET';
	var param = conf.param;
	
	var success= conf.success?conf.success:function(res){
		alert(res);
	}
	var error = conf.error?conf.error:function(res){
		alert(res);
	}
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){
			if(xhr.status=="200"){
				success(xhr.responseText);
			}else{
				error(xhr.responseText);
			}
		}
	}
	xhr.open(method,url);
	this.send=function(){
		xhr.send();
	}
}


/*window.addEventListener('load',onload1(){
	   var liBody = document.querySelector('#liBody');
	   alert(liBody);
		alert('나 서버에 갔다오는 작업을 함')
	});                 addeventlisterner를 사용하면  순서대로 이벤트를 실행 가능하다*/ 
window.addEventListener('load',function(){
		var au = new AjaxUtil( {
			url : '/levelinfo',
			success : function(res){
				res = JSON.parse(res);
				var html = '';
				
				res.forEach((e) => {
					html += '<tr>';
					for(var key in e) {
						html += '<td>' + e[key] + '</td>';
					}
					html += '<td><button type="button" onclick="updateLevelInfo(linum)"">수정</button><button type="button" onclick="deleteLevelInfo(linum)">삭제</button></td>';
					html += '</tr>';
				});		
				
				document.querySelector('#liBody').insertAdjacentHTML('beforeend',html);
			}
		});
		au.send();
	});

</script>
<body>
	liname :
	<input type="text" name="liname">
	<button>검색</button>
	<table border="1">
		<thead>
			<tr>
				<th>linum</th>
				<th>lilevel</th>
				<th>liname</th>
				<th>lidesc</th>
				<th>수정/삭제</th>
			</tr>
		</thead>
		<tbody id="liBody">

		</tbody>
	</table>
	<script>
	function updateLevelInfo(linum){
		var lilevel = document.querySelector("input[name=lilevel" + linum + "]").value;
		var liname = document.querySelector("input[name=liname" + linum + "]").value;
		var lidesc = document.querySelector("input[name=lidesc" + linum + "]").value;
		alert(lilelve + "," + liname + "," +lidesc);
	}
	function deleteLevelInfo(linum){
		var lilevel
	}
	</script>
</body>

</html>