<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript">
//<![CDATA[

$(function(){

	$("#pwdConfirmBtn").click(function(){

		if ($("#chkPwd").val() == "") {
			alert("비밀번호를 입력해 주세요.");
			$("#password").focus();
			return;
		}

		$("#pwdConfirmForm").submit();
		return false;
	});


});

//]]>
</script>

<div class="over-hidden sub_contents_header">
	<div class="linemap_wrap"> <!-- fl class 삭제 -->
		<ul class="col-12 linemap_con">
			<li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>회원정보 수정</span></a></li>
		</ul>
	</div>
</div>

<div class="sub_title s_tit02">
	<div class="col-center mw-1280">회원정보 수정</div>
</div>

<div class="col-center mw-1280">
	<!-- <h2 class="fs4">비밀번호를 입력해주시기 바랍니다.</h2> -->
	<form action="/<c:out value="${paramVO.siteName }" />/userMember/forUpdate.do" method="post" name="pwdConfirmForm" id="pwdConfirmForm">
	<div>
		<div class="tbrinfo text-danger clear hide_star_con no_margin"><span class="hide_star"><span class="sr-only">(필수입력)</span></span> 표시 항목은 필수 입력 항목입니다.</div>
		<div class="bdView sub_board_body">
			<input type="hidden" name="menuNo" id="menuNo" value="<c:out value="${param.menuNo }" />" />
			<table class="contents_insight_view">
				<caption>비밀번호 입력</caption>
				<colgroup>
				<col style="width:18%">
				<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" style="border: none;"><label for="chkPwd" class="red_star_text"><span class="hide_star"><span class="sr-only">(필수입력)</span></span> 비밀번호</label></th>
						<td>
							<span class="input_style_1_con">
								<input type="password" name="chkPwd" id="chkPwd" class="input_style_1" style="width:150px" value="">
							</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	</form>

	<div class="board_util_btn_con">
		<a href="#self" id="pwdConfirmBtn" class="btn_style_0 full center short btn-info">비밀번호 확인</a>
	</div>
</div>


