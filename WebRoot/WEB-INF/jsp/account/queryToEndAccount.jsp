<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK" language="java" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title></title>
		<link type="text/css" rel="stylesheet" href="${basePath}/css/admin.css"/>
		<link type="text/css" rel="stylesheet" href="${basePath}/css/theme.css"/>
		<link type="text/css" rel="stylesheet" href="${basePath}/css/dtree.css"/>
		<script type="text/javascript" src="${basePath}/js/util.js"></script>
		<script type="text/javascript" src="${basePath}/js/dtree.js"></script>
		<script type="text/javascript">
			if("${result}"=="FAIL")
				alert("帐号状态不是预销户状态，不能办理销户");
				if("${result}"=="FAIL1")
				alert("帐号状态已为挂失（无效）状态，不能再办理销户");
				if("${result}"=="FAIL2")
				alert("帐号状态为黑名单（无效）状态，不能办理销户");
				if("${result}"=="FAIL3")
				alert("帐号状态为其他（无效）状态，不能办理销户");
				if("${result}"=="FAIL4")
				alert("没有此信息账户，请重新输入");
				if("${result}"=="FAIL5")
				alert("你办理的申请销户到现在还不够"+"${param_endAccount_amongTime.pvalue}天");
				if("${result}"=="FAIL6")
				alert("帐号状态为已销户（无效）状态，不能办理销户");			 			 
		       function check(){
		          if(get("account.sys_id").value!=""){
				    var partten = /^\+?[0-9][0-9]*$/;
				    if(partten.test(get("account.sys_id").value)){				              
                    }else{
                       alert("用户账号为数字，请重新输入！");
                       get("account.sys_id").focus();
					   return false;
                    }
                   }		
		       }		      
			 function endAccount(sys_id){
		       		if(confirm("确定要销户吗？")) {
		       			window.location="account_endAccount.do?sys_id="+sys_id+"&account.sys_id="+get("account.sys_id").value+"&account.cardNo="+get("account.cardNo").value+"&user.userName="+get("user.userName").value+"&car.vehPlate="+get("car.vehPlate").value+"&user.credentialsNo="+get("user.credentialsNo").value+"&account.status="+get("account.status").value;
		       		}
		       }
				
		</script>
		
	</head>
	<body>
		<div class="body-box">
			<div class="rhead">
				<div class="rpos">当前位置： ${currentPosition}</div>
				<div class="clear"></div>
			</div>
			<form name="tableForm" method="post" action="account_queryAccountToEndAccount.do" onsubmit="return check();">
				<table width="100%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">				    
					<tr>
						<td  class="pn-flabel pn-flabel-h">用户账号：</td>
						<td  class="pn-fcontent"> <input type="text" name="account.sys_id" value="${account.sys_id}" /></td>
						<td  class="pn-flabel pn-flabel-h">卡&nbsp;&nbsp;&nbsp;&nbsp;号：</td>
						<td class="pn-fcontent"><input type="text" name="account.cardNo" value="${account.cardNo}" /></td>
					</tr>					 
					<tr>						
						<td  class="pn-flabel pn-flabel-h">用&nbsp;户&nbsp;名：</td>
						<td class="pn-fcontent"><input type="text" name="user.userName"  value="${user.userName}"/></td>
						<td   class="pn-flabel pn-flabel-h">车&nbsp;牌&nbsp;号：</td>
						<td   class="pn-fcontent"> <input type="text" name="car.vehPlate"  value="${car.vehPlate}"/></td>
					</tr>
						<tr>
						<td  class="pn-flabel pn-flabel-h">账号状态：</td>
						<td  class="pn-fcontent"> 
						  <select name="account.status" style="width:150px">
								<option value="" <c:if test="${account.status==null}">selected</c:if>>请选择</option>
							    <option value="0" <c:if test="${account.status==0}">selected</c:if>>有效</option>
								<option value="1" <c:if test="${account.status==1}">selected</c:if>>挂失 </option>
								<option value="2" <c:if test="${account.status==2}">selected</c:if>>预销户</option>							  
								<option value="5" <c:if test="${account.status==5}">selected</c:if>>已销户</option>							
								<option value="7" <c:if test="${account.status==7}">selected</c:if>>黑名单</option>
								<option value="4" <c:if test="${account.status==4}">selected</c:if>>其他 </option>
							</select>			
						 
						</td>
						<td  class="pn-flabel pn-flabel-h">证件号码：</td>
						<td class="pn-fcontent"><input type="text" name="user.credentialsNo"  value="${user.credentialsNo}"/></td>
					</tr>						
					<tr>
						<td colspan="4" class="pn-fbutton">
						  <input type="submit"   value=" 查 询 "/>&nbsp;
						  <input type="reset" value=" 重 置 "/>						
						</td>
					</tr>
				</table>
					<table class="pn-ltable" width="100%" cellspacing="1" cellpadding="0" border="0">
				<thead class="pn-lthead">
					<tr>
						<th>用户帐号</th>
						<th>卡&nbsp;&nbsp;号</th>						
						<th>用户名&nbsp;&nbsp;</th>
						<th>证件类型</th>
						<th>证件号码</th>						
						<th>车牌号&nbsp;&nbsp;</th>					
						<th>状态更改时间</th>
						<th>账号状态</th>
						<th>操&nbsp;&nbsp;作</th>						
					</tr>
				</thead>
				<tbody class="pn-ltbody">
					<c:forEach items="${list}" var="item">
						<tr onmouseover="this.className='pn-lhover'" onmouseout="this.className=''" align="center">
							<td>${item.sys_id}</td>
							<td>${item.cardNo}</td>							
							<td>${item.user.userName}</td>
							<td><c:if test="${item.user.credentialsType==0}">身份证</c:if><c:if test="${item.user.credentialsType==1}">其&nbsp;&nbsp;他</c:if></td>
							<td>${item.user.credentialsNo}</td>							
							<td>${item.car.vehPlate}</td>
							<td>${item.statusUpdateTime}</td>
							<td><c:if test="${item.status==0}">有效</c:if><c:if test="${item.status==1}">挂失</c:if><c:if test="${item.status==2}">预销户</c:if><c:if test="${item.status==4}">其他</c:if><c:if test="${item.status==5}">已销户</c:if><c:if test="${item.status==7}">黑名单</c:if></td>
							<c:choose> 
                            <c:when test="${item.status==2}"> 
                              <td><a href="javascript:endAccount(${item.sys_id})" class="pn-loperator">销户</a></td>
                             </c:when>                            
                             <c:otherwise> 
                              <td/> &nbsp;</td>
                             </c:otherwise> 
                            </c:choose>							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<jsp:include page="../include/pager.jsp"/>
			</form> 
		</div>
	</body>
</html>