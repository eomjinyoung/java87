<%@ page 
    contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Hello</h1>
<a id="link1" href='#'>다음카카오</a><br>
<a id="link2" href='#'>네이버</a><br>
<a id="link3" href='#'>구글</a><br>
<script>
var link1 = document.getElementById("link1");
link1.onclick = function(event) {
	event.preventDefault();
	location.href = "http://www.daum.net"
}

var link2 = document.getElementById("link2");
link2.onclick = function(event) {
	event.preventDefault();
  location.href = "http://www.naver.com"
}

var link3 = document.getElementById("link3");
link3.onclick = function(event) {
	event.preventDefault();
  location.href = "http://www.google.com"
}
</script>
</body>
</html>





