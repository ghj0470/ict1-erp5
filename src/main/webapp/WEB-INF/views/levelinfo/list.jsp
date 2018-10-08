
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
	var param = conf.param?conf.param:'{}';
	
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
	if(method!="GET"){
		xhr.setRequestHeader('Content-type','application/json;charset=utf-8'); //json스트링 형태이기 때문에 json으로
	}
	this.send=function(){//json string
		xhr.send(param);
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
				
			//	res.forEach((e) => {  재민이
					//html += '<tr id="lv'+li.linum+'">'; 신방식
					for(var li of res) {
					//	for(var key in e) { 재민이
						html += '<td>'+li.linum+'</td>';
						html += '<td><input type="text" id="lilevel'+li.linum+'" value="' + li.lilevel + '"></td>';
						html += '<td><input type="text" id="liname'+li.linum+'" value="' + li.liname + '"></td>';
						html += '<td><input type="text" id="lidesc'+li.linum+'" value="' + li.lidesc + '"></td>';
						//html += '<td><input type="text" id="e[lilevel]" value="' + lilevel + '"></td>';  전방식 신방식
						//html += '<td><input type="text" id="e" value="' + e[key] + '"></td>'; 재민이
						html += '<td><button type="button" onclick="updateLevelInfo('+ li.linum +')">수정</button><button type="button" onclick="deleteLevelInfo('+li.linum+')">삭제</button></td>';
						html += '</tr>';
					}
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
	<button onclick="addLevelInfo()">레벨추가</button>
	<script>
	function addLevelInfo(){
			var html ='<tr>'; 
			html +=	'<td> &nbsp;</td>';
			html += '<td><input type="text" id="lilevel" value=""></td>';
			html += '<td><input type="text" id="liname" value=""></td>';
			html += '<td><input type="text" id="lidesc" value=""></td>';
			//html += '<td><input type="text" id="e[lilevel]" value="' + lilevel + '"></td>';  전방식 신방식
			//html += '<td><input type="text" id="e" value="' + e[key] + '"></td>'; 재민이
			html += '<td><button onclick="saveLevelInfo()">저장</button></td>';
			html += '</tr>';
			document.querySelector('#liBody').insertAdjacentHTML('beforeend',html);
		}
	function saveLevelInfo(){
		var lilevel = document.querySelector("#lilevel").value;
		var liname = document.querySelector("#liname").value;
		var lidesc = document.querySelector("#lidesc").value;
		var params = {lilevel:lilevel, liname:liname, lidesc:lidesc};
		params = JSON.stringify(params);
		
		var au = new AjaxUtil( {
			url : '/levelinfo/',
			method: 'POST',
			param : params,
			success : function(res){
				if(res=='1'){
					alert('저장완료');
					location.href="/url/levelinfo:list";
					}
	             }
		});
		au.send();
	}
		

		
	function updateLevelInfo(linum){
		var lilevel = document.querySelector("#lilevel" + linum).value;
		var liname = document.querySelector("#liname" + linum).value;
		var lidesc = document.querySelector("#lidesc" + linum).value;
		var params = {lilevel:lilevel, liname:liname, lidesc:lidesc, linum:linum};
		params = JSON.stringify(params);
		
		var au = new AjaxUtil( {
			url : '/levelinfo/'+ linum,
			method: 'PUT',
			param : params,
			success : function(res){
	            alert(res);
			}
		}); 
		au.send();
	}
	function deleteLevelInfo(linum){
				
			var au = new AjaxUtil( {
//				var conf={ 이건 데이터만 가져다주는거
				url : '/levelinfo/'+ linum,
				method:'DELETE',
				success : function(res){
					if(res=='1'){
						alert('삭제완료');
//						initList();
						locationhref="/url/levelinfo:list"; //기존방식 리스트를 다시 들어가는거

					}
				}
			});
//			var au = new AjaxUtil( {
			au.send(); 
	}
	</script>
</body>

</html>