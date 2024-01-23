
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc" %>

<%
	int year = egovframework.com.utl.DateUtil.getYear();
	pageContext.setAttribute("year", year);
%>

<ccc:constantsMap className="kr.co.unp.bbs.vo.SearchVO" var="SearchVO"/>

<c:if test="${empty result}">
	<c:set var="action" value="/bos/bbs/${paramVO.bbsId}/insert.do" />
</c:if>

<c:if test="${not empty result}">
	<c:set var="action" value="/bos/bbs/${paramVO.bbsId}/update.do" />
</c:if>

<sec:authorize ifAnyGranted="ROLE_SUPER">
	<c:set var="roleSuper" value="Y" />
</sec:authorize>

<script type="text/javascript" src="/crosseditor/js/namo_scripteditor.js"></script>
<script type="text/javascript">
	$(function() {
		$(".sdate").datepicker({showOn: 'button', buttonImage: '/bos/images/calendar.gif', buttonImageOnly: true, changeMonth: true, changeYear: true, showMonthAfterYear:false});
	});

	function checkForm() {
		var form = $("#board")[0];
		var v = new MiyaValidator(form);

	    v.add("nttSj", {
	        required: true
	    });

		var result = v.validate();

		if (!result) {
			alert(v.getErrorMessage());
			v.getErrorElement().focus();
			return;
		}

		if (CrossEditor.GetBodyValue() == "") {
			alert('내용을 입력해 주세요.');
		    CrossEditor.SetFocusEditor(); // 크로스에디터 Focus 이동
		    return;
		}

		if (!confirm('등록하시겠습니까?')) {
			return;
		}

		var cont = CrossEditor.GetBodyValue();
		document.getElementById("nttCn").value= cont;

		form.submit();
	}

	function delPermanently() {
		var form = $("#board")[0];
		form.action = "/bos/bbs/${paramVO.bbsId}/delete.do";
		form.submit();
	}
</script>

<title><c:out value='${masterVO.bbsNm}'/> - 게시글쓰기</title>

<style>
	.bdView table th {
		vertical-align: middle;
	}
</style>
</head>

<div id="content">
	<form id="board" name="board" method="post" enctype="multipart/form-data" action="${action}">
		<input type="hidden" name="pageQueryString" value="${pageQueryString}" />
		<input type="hidden" name="nttId" value="${empty result.nttId ? 0 : result.nttId }" />
		<input type="hidden" name="bbsId" value="${masterVO.bbsId}" />
		<input type="hidden" id="atchFileId" name="atchFileId" value="${result.atchFileId}">
		<input type="hidden" name="htmlYn" value="${result.htmlYn}" />
		<input type="hidden" name="bbsType" value="" />
		<input type="hidden" id="option1" name="option1" value="" />

		<div class="bdView">
			<table summary="<c:if test="${roleSuper eq 'Y'}">완료여부,</c:if>제목,요청내용,상세내용,첨부파일 포함">
				<caption>${masterVO.bbsNm} - ${empty result ? '쓰기' : '수정'}</caption>
				<colgroup>
					<col style="width: 15%" />
					<col />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">
							<label for="nttSj">제목</label>
						</th>
						<td>
							<input type="text" name="nttSj" id="nttSj" style="width: 100%" value="<c:out value="${result.nttSj}" />" /><br/><br/>
							<span style="color: blue;">
								[교육사업명] 요청 내용<br/>
								(작성 예시1) [인사이트] 이벤트 등록 요청의 건<br/>
								(작성 예시2) [창의인재] 사업 소개 내용 수정 요청의 건<br/>
							</span>
						</td>
					</tr>

					<tr>
						<th scope="row" class="con_tit">요청 내용</th>
						<td>
							<textarea name="imgDescCn" id="imgDescCn" cols="120" rows="10" class="col-md-12" title="요청 내용을 입력해 주세요." style="width: 100%">
								${result.imgDescCn}
							</textarea>
						</td>
					</tr>

					<tr>
						<th scope="row" class="con_tit"><label for="nttCn">상세 내용</label></th>
						<td class="outputEditor">
							<span style="color: red;">
								[기타(사업 소개 수정 등)] 요청 건의 경우, 상세 내용을 입력하거나 요청 내용을 파일로 첨부해주시기 바랍니다.<br/>그 외 요청 건은 ‘협조 요청 가이드 및 요청서’ 파일을 반드시 첨부해주시기 바랍니다.
							</span><br />
							<textarea id="nttCn" name="nttCn" cols="150" rows="30" style="display: none;width: 100%" class="textarea">${result.nttCn}</textarea>
							<script type="text/javascript">
								var CrossEditor = new NamoSE("crosseditor");

								CrossEditor.params.Font = {"Nanum Gothic":"나눔고딕", "Dotum":"돋움", "Gulim":"굴림", "Batang":"바탕", "Gungsuh":"궁서"};
								CrossEditor.EditorStart();

								var contentValue = document.getElementById("nttCn").value; // Hidden 값 참조

								function OnInitCompleted() {
									CrossEditor.SetBodyValue(contentValue); // 컨텐츠 내용 에디터 삽입
								}
							</script>
						</td>
					</tr>

					<c:if test="${masterVO.fileAtchPosblAt eq 'Y'}">
						<c:if test="${not empty fileList}">
							<tr>
								<th scope="row">첨부된 첨부파일</th>
								<td><jsp:include page="/WEB-INF/jsp/bos/share/EgovFileList.jsp" flush="true" /></td>
							</tr>
						</c:if>
						<tr>
							<th scope="row">첨부파일</th>
							<td><jsp:include page="/WEB-INF/jsp/bos/share/FileSubmit.jsp" flush="true" /></td>
						</tr>
					</c:if>

					<c:if test="${roleSuper eq 'Y'}">
						<tr>
							<th scope="row">요청 처리</th>
							<td>
								<select id="reqYn" name="option2" title="홍보요청처리여부">
									<option value="A" <c:if test="${paramVO.option2 == 'A'}">selected="selected"</c:if> >접수</option>
									<option value="W" <c:if test="${paramVO.option2 == 'W'}">selected="selected"</c:if> >처리 중</option>
									<option value="X" <c:if test="${paramVO.option2 == 'X'}">selected="selected"</c:if> >미완료</option>
								</select>
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	</form>

	<c:if test="${not empty result}">
		<div class="fl">
			<%--	<a class="btn btn-danger" href="javascript:delPermanently();" onclick="return confirm('정말로 영구삭제하시겠습니까?');"><span>영구삭제</span></a>  --%>
		</div>
	</c:if>

	<div class="fr" >
		<c:choose>
			<c:when test="${empty result}" >
				<a href="javascript:checkForm();" class="btn btn-primary"><span>등록</span></a>
			</c:when>
			<c:otherwise>
				<a class="btn btn-primary" href="javascript:checkForm();"><span>수정</span></a>

				<c:if test="${result.delcode eq '0' }" >
					<a class="btn btn-danger" href="javascript:delPermanently();" onclick="return confirm('정말로 삭제하시겠습니까?');"><span>삭제</span></a>
				</c:if>
			</c:otherwise>
		</c:choose>

		<c:url var="url" value="/bos/bbs/${paramVO.bbsId}/list.do?${pageQueryString}"/>

		<a class="btn btn-primary" href="${url}"><span>목록</span></a>
	</div>
</div>