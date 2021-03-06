<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK" language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<title>添加车辆类型</title>
		<link type="text/css" rel="stylesheet" href="${basePath}/css/admin.css"/>
		<link type="text/css" rel="stylesheet" href="${basePath}/css/theme.css"/>
		<%@include file="../../include/common.jsp" %>
		<script type="text/javascript">

		function sub(){
			var carType = $("#carType").val();
			jQuery.post("carType_isHasCarType.do?carType.carType="+carType, function(data) {
				if(data == "hasCarType") {
					alert("车辆类型编码已存在！");
					$("#carType").val("");
		    		$("#carType").focus();
		    		return false;
				}else{
					if($("#dataform").valid()){
						document.getElementById("dataform").submit();
					}
				}
			});
		}
		
		function back(){
			window.location.href = "carType_getCarTypeList.do";
		}	
		</script>

	</head>
	<body>
		<div class="body-box">
			<div class="rhead">
				<div class="rpos">当前位置： ${currentPosition}</div>
				<div class="clear"></div>
			</div>
			<form id="dataform" method="post" action="carType_save.do">
				<table width="100%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
                    <tr> 
						<td class="pn-flabel pn-flabel-h">车辆类型编码：</td>
						<td class="pn-fcontent">
						<input class="required isNo_smallint" id="carType"  name="carType.carType"/>
						<span style="color: red">&nbsp;*</span></td>
	
					    <td class="pn-flabel pn-flabel-h">车辆类型名称：</td>
						<td class="pn-fcontent">
						<input type="text" class="required maxlength20" id="carTypeName" name="carType.carTypeName"/>
						<span style="color: red">&nbsp;*</span></td>
			    	</tr>
					<tr>
						<td colspan="4" class="pn-fbutton">
							<input type="button" value=" 保 存 " onclick="sub()"/>&nbsp;
						    <input type="reset" value=" 重 置 "/>&nbsp;
						    <input type="button" value=" 返 回 " onclick="return back()"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>