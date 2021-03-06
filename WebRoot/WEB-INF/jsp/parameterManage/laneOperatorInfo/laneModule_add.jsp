<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK" language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<title>添加车道模块信息</title>
		<%@include file="../../include/common.jsp" %>
		<link type="text/css" rel="stylesheet" href="${basePath}/css/admin.css"/>
		<link type="text/css" rel="stylesheet" href="${basePath}/css/theme.css"/>	
		<script type="text/javascript" src="${basePath}/js/util.js"></script>	
		<script type="text/javascript">	
		if("${message}"=="exitLaneModule"){
			alert("模块编码已存在！");
			}
        //返回首页
		function back(){
			window.location.href = "laneModule_list.do";
			}
	
		</script>

	</head>
	<body>
		<div class="body-box">
			<div class="rhead">
				<div class="rpos">当前位置： ${currentPosition}</div>
				<div class="clear"></div>
			</div>
			<form id="dataform" method="post" action="laneModule_save.do" >
				<table width="100%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
					<tr>
						<td class="pn-flabel pn-flabel-h">模块编码：</td>
						<td class="pn-fcontent"><input type="text" class="required maxlength10" id="moduleNo" name="laneModule.moduleNo" value="${laneModule.moduleNo}" size="24"/><span style="color: red">&nbsp;*</span></td>
					  	<td class="pn-flabel pn-flabel-h">模块名称：</td>
						<td class="pn-fcontent"><input type="text" class="required maxlength24" name="laneModule.moduleName" value="${laneModule.moduleName}" size="24"/><span style="color: red">&nbsp;*</span></td>
					</tr>
	     			<tr>
						<td class="pn-flabel pn-flabel-h">备&nbsp;&nbsp;注：</td>
						<td colspan="4" class="pn-fcontent"><textarea class=maxlength100 name="laneModule.remark"  rows="3" cols="48">${laneModule.remark}</textarea></td>
					</tr>
					<tr>
						<td colspan="4" class="pn-fbutton">
							<input type="submit" value=" 保 存 "/>&nbsp;
						    <input type="reset" value=" 重 置 "/>&nbsp;
						    <input type="button" value=" 返 回 " onclick="return back()"/>
						</td>
						    
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>