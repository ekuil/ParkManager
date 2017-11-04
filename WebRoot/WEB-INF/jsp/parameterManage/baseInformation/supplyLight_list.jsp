<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK" language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<title>�����ʱ����Ϣ�б�</title>
		<link type="text/css" rel="stylesheet" href="${basePath}/css/admin.css"/>
		<link type="text/css" rel="stylesheet" href="${basePath}/css/theme.css"/>
		<script type="text/javascript" src="${basePath}/js/util.js"></script>
		<script language="javascript">
		if("${result}"=="SUCCESS"){
			alert("�����ʱ����Ϣ���ӳɹ���");
			}
		if("${message}"=="updateSuccess"){
			alert("�޸ĳɹ���");
			}
		if("${message}"=="deleteSuccess"){
			alert("ɾ���ɹ���");
			}
			function del(id,pageSize,currentPage){
				if(confirm("ȷ��Ҫɾ����")){
					window.location.href = "baseInfo_supplyLight_delete.do?supplyLightInformation.startTime="+id+"&pager.pageSize="+pageSize+"&pager.currentPage="+currentPage;
				}
			}
			function add(){
				window.location.href = "baseInfo_supplyLight_add.do";
				}
			function getRowIndex(obj){
				get("pager.rowIndex").value=obj.rowIndex;
				}
			function edit(startTime,pageSize,currentPage){
				window.location.href ="baseInfo_supplyLight_edit.do?supplyLightInformation.startTime="+startTime+"&pager.pageSize="+pageSize+"&pager.currentPage="+currentPage+"&pager.rowIndex="+get("pager.rowIndex").value;
			}
			function setRowBGcolor(){
				var rowIndex="${rowIndex}";
				var pageSize="${pageSize}";
				var currentPage="${currentPage}";
				if(rowIndex!=""&&pageSize!=""&&currentPage!=""){
					var trs=document.getElementById("tb").getElementsByTagName("tr");
					for(var i=0;i<trs.length;i++){
						if(i==rowIndex&&get("pager.pageSize").value==pageSize&&get("pager.currentPage").value==currentPage){
							trs[i].style.backgroundColor="#E6E6E6";
						}
					}
				}
			}		
		</script>
	</head> 
	<body  onload="setRowBGcolor();">
		<div class="body-box">
            <div class="rhead">
				<div class="rpos">��ǰλ�ã� ${currentPosition}</div>
				<div class="clear"></div>
			</div>
			<form  name="tableForm"  method="post" action="baseInfo_supplyLight_list.do">
			<table width="100%" class="pn-ftable" cellpadding="0" cellspacing="1" border="0">
				    <tr align="right">
						<td style="background-color:#FFFFFF;text-align:right;padding-right: 20px;padding-top: 2px;padding-bottom: 2px;">				
						<input style="height: 22px;" type="button"  value="&nbsp;���Ӳ����ʱ����Ϣ&nbsp;"  onclick="add();"/>
						</td>
					</tr>
			
				</table>		
			<table id="tb" class="pn-ltable" width="100%" cellspacing="1" cellpadding="0" border="0">
				<thead class="pn-lthead">
					<tr>						
						<th style="white-space:nowrap;padding-left:5px;padding-right:5px;">��ʼʱ��</th>
						<th style="white-space:nowrap;padding-left:5px;padding-right:5px;">����ʱ��</th>
				    	<th style="white-space:nowrap;padding-left:5px;padding-right:5px;">��&nbsp;&nbsp;��</th>
					</tr>
				</thead>
				<tbody class="pn-ltbody">
					<c:forEach items="${list}" var="item">
						<tr onmouseover="this.className='pn-lhover'" onmouseout="this.className=''" align="center"  onclick="getRowIndex(this)">
							<td style="word-break:break-all;padding-left:5px;padding-right:5px;">${item.startTime}</td>
							<td style="word-break:break-all;padding-left:5px;padding-right:5px;">${item.endTime}</td>
							<td class="pn-lopt" style="white-space:nowrap;padding-left:5px;padding-right:5px;">
							<!--<a href="baseInfo_supplyLight_edit.do?supplyLightInformation.startTime=${item.startTime}" class="pn-loperator">�޸�</a>-->
							<a href="javascript:edit('${item.startTime}',${pager.pageSize},${pager.currentPage})" class="pn-loperator">�޸�</a>
							�� <a href="javascript:del('${item.startTime}',${pager.pageSize},${pager.currentPage})" class="pn-loperator">ɾ��</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<jsp:include page="../../include/pager.jsp"/>
			</form>
		
		</div>
		
	</body>
</html>