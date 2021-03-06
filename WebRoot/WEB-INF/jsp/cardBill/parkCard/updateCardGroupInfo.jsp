 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK" language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<title></title>
		<%@include file="../../include/common.jsp" %>
		<link type="text/css" rel="stylesheet" href="${basePath}/css/admin.css"/>
		<link type="text/css" rel="stylesheet" href="${basePath}/css/theme.css"/>
        <script type="text/javascript" src="${basePath}/datePicker/WdatePicker.js"></script>		
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
		<script type="text/javascript">
		</script>
	</head>
	<body>
		<div class="body-box">
			<div class="rhead">
				<div class="rpos">当前位置： ${currentPosition}</div>
				<div class="clear"></div>
			</div>
			<form  id="dataform" method="post" action="parkCard_updateCardGroupInfoEdit.do" onsubmit="return check();">  				  
				<table width="100%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0" height="100">					 			
					<tr>
					   <td class="pn-flabel pn-flabel-h">组名：</td>
					   <td class="pn-fcontent"><input type="text" name="cardGroupInfo.groupName" value="${cardGroupInfo.groupName}" class="required maxlengthTwenty"/></td>
					   <td class="pn-flabel pn-flabel-h">车位数：</td>
					   <td class="pn-fcontent"><input type="text" name="cardGroupInfo.parkSum" value="${cardGroupInfo.parkSum}" class="required digits max2147483647"/></td>
					</tr>										
					<tr>
						<td colspan="4" class="pn-fbutton">
						<input type="submit" value=" 保 存 "/> &nbsp;
						<input type="reset" value=" 重 置 "/> &nbsp;
						<input type="button" value=" 返 回 " onclick="history.back();"/>
						<input type="hidden" name="cardGroupInfo.groupNo"  value="${cardGroupInfo.groupNo}" >
						</td>
					</tr>															
			 </table>					
			</form>
		</div>
	</body>
</html>
