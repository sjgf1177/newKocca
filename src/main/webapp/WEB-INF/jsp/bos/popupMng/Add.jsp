<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.unp.co.kr/util" prefix="util" %>

<c:if test="${empty result}">
	<c:set var="action" value="/bos/popupMng/insert.do" />
</c:if>
<c:if test="${not empty result}">
	<c:set var="action" value="/bos/popupMng/update.do" />
</c:if>

<script type="text/javascript">

	$(function() {
		if($("#link1")[0].checked)
	    {
			$("#linkaddress").hide();
			$("#map").hide();
	    }
		else if($("#link2")[0].checked)
	    {
			$("#map").hide();
	    }
		if($("#link3")[0].checked)
	    {
			$("#linkaddress").hide();
	    }
		$("input[name=link]").click(function(){
			if(this.value == "I")
			{
				$("#linkaddress").show();
				$("#map").hide();
			}
			else if(this.value == "M")
			{
				$("#map").show();
				$("#linkaddress").hide();
			}
			else
			{
				$("#map").hide();
				$("#linkaddress").hide();

			}

		});

		$.datepicker.setDefaults($.datepicker.regional['ko']);
		$("#sdate").datepicker({showOn: 'button', buttonImage: '/bos/images/calendar.gif', buttonImageOnly: true, changeMonth: true, changeYear: true, showMonthAfterYear:false});
		$("#edate").datepicker({showOn: 'button', buttonImage: '/bos/images/calendar.gif', buttonImageOnly: true, changeMonth: true, changeYear: true, showMonthAfterYear:false});
	});

	function checkForm() {
		var form = $("#board")[0];
		var v = new MiyaValidator(form);
		var regFlag = "${empty result ? 'Y' : 'N'}";

	    v.add("title", {
	        required: true
	    });
	    v.add("siteId", {
	        required: true
	    });
	    v.add("useflag", {
	        required: true
	    });
	    v.add("sdate", {
	        required: true
	    });
	    v.add("edate", {
	        required: true
	    });
	    v.add("width", {
	        required: true,
	        option: "number"
	    });
	    v.add("height", {
	        required: true,
	        option: "number"
	    });
	    v.add("top", {
	        required: true,
	        option: "number"
	    });
	    v.add("pleft", {
	        required: true,
	        option: "number"
	    });
	    v.add("scroll", {
	        required: true
	    });
	    v.add("closeUseYn", {
	        required: true
	    });
	    v.add("link", {
	        required: true
	    });
		if(regFlag == "Y"){
		    v.add("file1", {
				required: true
		    });
		}
	    if($("#link2").attr("checked"))
	    {
		    v.add("linkaddress", {
		        required: true
		    });
	    }
	    if($("#link3").attr("checked"))
	    {
		    v.add("map", {
		        required: true
		    });
	    }

		var result = v.validate();
		if (!result) {
			alert(v.getErrorMessage());
			v.getErrorElement().focus();
			return;
		}

		if (!confirm('?????????????????????????')) {
			return;
		}

		form.submit();
	}

</script>


<form id="board" name="board" method="post" enctype="multipart/form-data" action="${action}">
	<input type="hidden" name="pageQueryString" value="${pageQueryString}" />
	<input type="hidden" name="menuNo" value="${paramVO.menuNo}" />
	<input type="hidden" name="pno" value="${paramVO.pno}" />
	<input type="hidden" id="atchFileId" name="atchFileId" value="${result.atchFileId}">

<div class="bdView">
<table>
	<caption>????????? ??????</caption>
	<colgroup>
		<col width="15%"/>
		<col width="35%"/>
		<col width="15%"/>
		<col width="*%"/>
	</colgroup>
	<tbody>
		<tr>
			<th scope="row"><label for="title">????????????</label></th>
			<td colspan="3">
				<input type="text" name="title" id="title"  class="iput_txt wi100per" value="${result.title}" />
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="siteId">???????????????</label></th>
			<td colspan="3">
 				<c:forEach var="site" items="${siteList}" varStatus="status">
					<c:set var="siteId"><util:fz source="${site.siteId}" resultLen="2" isFront="true" /></c:set>
					<input type="checkbox" id="siteNmes${status.count}" name="siteId" value="${siteId}" <c:if test="${fn:indexOf(result.siteId, siteId) ne -1}">checked</c:if> />
				 	${site.siteDesc}
					<c:if test="${status.count % 3 == 0}"><br/></c:if>
				</c:forEach>
				<br/>
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="useflag1">??????????????????</label></th>
			<td colspan="3">
				<input type="radio" name="useflag" id="useflag1" class="input_radio" value="Y" <c:if test="${result.useflag == 'Y'}"> checked</c:if> /> <label for="useflag1">??????</label>
				<input type="radio" name="useflag" id="useflag2" class="input_radio" value="N" <c:if test="${result.useflag == 'N'}"> checked</c:if> /> <label for="useflag2">??????????????????</label>
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="sdate">?????????</label></th>
			<td>
				<input type="text" name="sdate" id="sdate" style="width:100px" class="board1" value="${result.sdate}" />
			</td>
			<th scope="row"><label for="edate">?????????</label></th>
			<td>
				<input type="text" name="edate" id="edate" style="width:100px" class="board1" value="${result.edate}" />
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="width">??????(WIDTH)</label></th>
			<td>
				<input type="text" name="width" id="width" style="width:100px" class="board1" value="${result.width}" /> px
			</td>
			<th scope="row"><label for="height">??????(HEIGHT)</label></th>
			<td>
				<input type="text" name="height" id="height" style="width:100px" class="board1" value="${result.height}" /> px
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="top1">????????????(TOP)</label></th>
			<td>
				<input type="text" name="top" id="top1" style="width:100px" class="board1" value="${result.top}" /> px
			</td>
			<th scope="row"><label for="pleft">????????????(LEFT)</label></th>
			<td>
				<input type="text" name="pleft" id="pleft" style="width:100px" class="board1" value="${result.pleft}" /> px
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="scroll1">?????????????????????</label></th>
			<td colspan="3">
				<input type="radio" name="scroll" id="scroll1" class="input_radio" value="yes" <c:if test="${result.scroll == 'yes'}"> checked</c:if> /> <label for="scroll1">??????</label>
				<input type="radio" name="scroll" id="scroll2" class="input_radio" value="no" <c:if test="${result.scroll == 'no'}"> checked</c:if> /> <label for="scroll2">??????????????????</label>
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="closeUseYn1">???????????????</label></th>
			<td colspan="3">
				<input type="radio" name="closeUseYn" id="closeUseYn1" class="input_radio" value="Y" <c:if test="${result.closeUseYn == 'Y'}"> checked</c:if> /> <label for="closeUseYn1">??????</label>
				<input type="radio" name="closeUseYn" id="closeUseYn2" class="input_radio" value="N" <c:if test="${result.closeUseYn == 'N'}"> checked</c:if> /> <label for="closeUseYn2">??????????????????</label>
			</td>
		</tr>
		<tr>
			<th class="row"><label for="link1">????????????</label></th>
			<td colspan="3">
				<label><input type="radio" id="link1" name="link" value="N" <c:if test="${result.link eq 'N'}"> checked</c:if> checked/> ????????????</label>
				<label><input type="radio" id="link2" name="link" value="I" <c:if test="${result.link eq 'I'}"> checked</c:if> /> ???????????????</label>
				<label><input type="radio" id="link3" name="link" value="M" <c:if test="${result.link eq 'M'}"> checked</c:if> /> MAP??????</label>
			</td>
		</tr>
		<tr id="linkaddress">
			<th class="row"><label for="linkaddress">???????????????</label></th>
			<td colspan="3">
				<input type="text" size="60" name="linkaddress" value="${result.linkaddress}" id="linkaddress" />
			</td>
		</tr>
		<tr id="map">
			<th class="row"><label for="map">?????????</label></th>
			<td colspan="3">&lt;map name=&quot;popMap&quot;&gt;<br />
				<textarea rows="5" cols="60" name="map" id="map">${result.map}</textarea>
				<br />&lt;/map&gt;
				<br />
          		<br /><b>???????????? :</b> &lt;area shape=&quot;rect&quot; coords=&quot;?????????&quot; href=&quot;??????&quot; target=&quot;_blank&quot; &gt;
          		<b><br /><font color="red">
          			* ????????? ????????? ?????? area ????????? ???????????? ??????
          		</font></b>
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="file1">?????????</label></th>
			<td  colspan="3" >
			<jsp:include page="/WEB-INF/jsp/bos/share/ImageFileList.jsp" flush="true" />
				<input id="file1" name="file1" type="file" title="????????????1" class="board1" size="50" style="width:90%" /><br/>
				??????????????? : <input type="text" id="file_cn" name="file_cn" title="???????????? ??????" class="Input_file_infor"/>
				<br/>
				*??????????????? ?????????<br/>
			</td>
		</tr>
	<c:if test="${not empty result}">
		<tr>
			<th scope="row">????????????</th>
			<td>${result.regDate}</td>
		</tr>
	</c:if>
	</tbody>
</table>
</div>
</form>

	<div class="btn_set">
	<c:choose>
	<c:when test="${empty result}" >
		<a class="btn btn-primary" href="javascript:checkForm();"><span>??????</span></a>
	</c:when>
	<c:otherwise>
		<a class="btn btn-info" href="javascript:checkForm();"><span>??????</span></a>
		<a class="btn btn-danger"  href="/bos/popupMng/delete.do?siteId=${result.siteId}&pno=${result.pno}&menuNo=${param.menuNo}" onclick="return confirm('????????? ?????????????????????????');"><span>??????</span></a>
	</c:otherwise>
	</c:choose>
		<c:url var="url" value="/bos/popupMng/list.do?menuNo=${param.menuNo}" />
		<a class="btn btn-primary" href="${url}"><span>??????</span></a>
	</div>

