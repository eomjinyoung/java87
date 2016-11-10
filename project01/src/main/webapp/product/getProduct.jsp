<%-- <%@page import="com.model2.mvc.service.purchase.vo.PurchaseVO"%>
<%@page import="com.model2.mvc.service.product.vo.ProductVO"%> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsp/jstl/core" %>
<%
/* 	Product product = (Product)request.getAttribute("product");
System.out.println("============== "+product); */
/* ProductVO vo = (ProductVO)request.getAttribute("vo");

System.out.println("========= "+vo);

String menu = (String)request.getParameter("menu");
String add = (String)request.getParameter("add");

System.out.println("readMenu "+menu);
System.out.println("add "+add); */
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상품조회</title>
<link rel="stylesheet" href="/css/admin.css" type="text/css">
</head>
<script type="text/javascript">
function productGet(){ // 구매화면
	document.detailForm.action='/getPurchase.do?';
	document.detailForm.submit();
}

function updateProduct() { // 수정
	document.detailForm.action='/product/updateProduct';
	document.detailForm.submit();
}

</script>
<body bgcolor="#ffffff" text="#000000">
<form name="detailForm"  method="post" >
<input type="hidden" name="prodNo" value="${product.prodNo }">
<input type="hidden" name="add" value="${add}">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="93%" class="ct_ttl01">상품등록</td>
				<td width="20%" align="right">&nbsp;</td>
			</tr>
		</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif" width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				<h:if test="${empty product.proTranCode }">
				<h:if test="${param.menu== 'manage' }">
				<td><input 	type="text" name="prodName"  class="ct_input_g" value="${product.prodName }"
                  				style="width:180px; height:19px"  maxLength='50'/></td>
                 </h:if>
                 <h:if test="${param.menu != 'manage'}">
					<td width="105">${product.prodName }</td>
				</h:if>
				</h:if>
				
				<h:if test="${!empty product.proTranCode }">
					<td width="105">${product.prodName }</td>
				</h:if>
				
					<td>	</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			상품상세정보 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<h:if test="${empty product.proTranCode }">
		<h:if test="${param.menu== 'manage' }">
				<td><input 	type="text" name="prodDetail"  class="ct_input_g" value="${product.prodDetail }"
                  				style="width:180px; height:19px"  maxLength='50'/></td>
       </h:if>
        <h:if test="${param.menu != 'manage'}">
				<td class="ct_write01">${product.prodDetail }</td>
		</h:if>
		</h:if>
		
		<h:if test="${!empty product.proTranCode }">
					<td width="105">${product.prodDetail }</td>
		</h:if>
				
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
		제조일자 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<h:if test="${empty product.proTranCode }">
		<h:if test="${param.menu== 'manage' }">
				<td><input 	type="text" name="manuDate"  class="ct_input_g" value="${product.manuDate}"
                  				style="width:180px; height:19px"  maxLength='50'/></td>
        </h:if>
        <h:if test="${param.menu != 'manage'}">
				<td class="ct_write01">${product.manuDate}	</td>
		</h:if>
		</h:if>
		
		<h:if test="${!empty product.proTranCode }">
					<td width="105">${product.manuDate }</td>
		</h:if>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			가격<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<h:if test="${empty product.proTranCode }">
		<h:if test="${param.menu== 'manage' }">
				<td><input 	type="text" name="price"  class="ct_input_g" value="${product.price}"
                  				style="width:180px; height:19px"  maxLength='50'/>원</td>
        </h:if>
        <h:if test="${param.menu != 'manage'}">
				<td class="ct_write01">${product.price} 원</td>
		</h:if>
		</h:if>
		
		<h:if test="${!empty product.proTranCode }">
					<td width="105">${product.price }</td>
		</h:if>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
		상품이미지<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<img src = "/images/uploadFiles/${product.fileName}" id="fileName">${product.fileName}
		</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
					
					<h:if test="${empty product.proTranCode }">
					<h:if test="${param.menu== 'manage' }">
						<a href="javascript:updateProduct();">수정</a>
					</h:if>
					<h:if test="${add == 'add'  }">
						<a href="/listProduct.do" >확인</a>
					</h:if>
					<h:if test="${add != 'add' && param.menu != 'manage' }">
						<a href="javascript:productGet()">구매</a>
					</h:if>
					</h:if>
					
					<%-- <h:if test="${user.userId }">
						
					</h:if> --%>
					
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>