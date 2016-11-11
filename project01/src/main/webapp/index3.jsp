<%@ page 
    contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
      href="node_modules/bootstrap/dist/css/bootstrap.min.css">

<link rel="stylesheet" 
      href="node_modules/bootstrap/dist/css/bootstrap-theme.min.css">

</head>
<body>
<h1>Hello</h1>
<a id="link1" href='#' class="btn btn-info btn-sm">다음카카오</a><br>
<a id="link2" href='#' class="btn btn-info btn-sm">네이버</a><br>
<a id="link3" href='#' class="btn btn-info btn-sm">구글</a><br>

<script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
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





