
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc" %>

<ccc:constantsMap className="kr.co.unp.bbs.vo.SearchVO" var="SearchVO"/>

<script type="text/javascript">

	function del(){
		var form = $("#board")[0];
		form.action = "/bos/bbs/${paramVO.bbsId}/delete.do";
		form.submit();
	}

	function restore(){
		var form = $("#board")[0];
		form.action = "/bos/bbs/${paramVO.bbsId}/restore.do";
		form.submit();
	}

	function delPermanently(){
		var form = $("#board")[0];
		form.action = "/bos/bbs/${paramVO.bbsId}/delPermanently.do";
		form.submit();
	}

</script>

<title><c:out value='${masterVO.bbsNm}'/> - 게시글쓰기</title>



<div id="content">
	<form id="board" name="board" method="post" enctype="multipart/form-data" action="${action}">
	<input type="hidden" name="pageQueryString" value="${pageQueryString}"/>
	<input type="hidden" name="nttId" value="${empty result.nttId ? 0 : result.nttId }" />
	<input type="hidden" name="bbsId" value="${masterVO.bbsId}" />
	<input type="hidden" id="atchFileId0" name="atchFileId" value="${result.atchFileId}">
			<h4>■ 상담자정보</h4>
			<div class="bdView">
				<table>
					<caption>
					상담자정보
					</caption>
					<colgroup>
					<col style="width:15%" />
					<col style="width:35%" />
					<col style="width:15%" />
					<col />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">회원여부</th>
							<td>${result.option1}</td>
							<th scope="row">아이디</th>
							<td>${result.ntcrId}</td>
						</tr>
						<tr>
							<th scope="row" >성명</th>
							<td colspan="3">${result.option4}</td>
						</tr>
						<tr>
							<th scope="row">성별</th>
							<td>${result.option2}</td>
							<th scope="row">생년월일</th>
							<td>${result.option3}</td>
						</tr>
						<tr>
							<th scope="row">학교</th>
							<td>${result.option4}</td>
							<th scope="row">학과</th>
							<td>${result.option5}</td>
						</tr>
							<tr>
							<th scope="row">자택</th>
							<td>${result.ntcrTel}</td>
							<th scope="row">휴대폰</th>
							<td>${result.ntcrHp}</td>
						</tr>
						<tr>
							<th scope="row" >이메일</th>
							<td colspan="3">${result.ntcrEmail}</td>
						</tr>
						<tr>
							<th scope="row" >주소</th>
							<td colspan="3">${result.ntcrAddr1}</td>
						</tr>
					</tbody>
				</table>
			</div>

			<h4>■ 상담내용	</h4>
			<div class="bdView">
				<table>
					<caption>

					</caption>
					<colgroup>
					<col style="width:15%" />
					<col style="width:35%" />
					<col style="width:15%" />
					<col />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" >희망직종</th>
							<td> ${result.option11 }</td>
							<th scope="row" >희망시기</th>
							<td>010-1234-1234</td>
						</tr>
						<tr>
							<th scope="row" >상담일</th>
							<td>${result.option6 }</td>
							<th scope="row" >담당컨설턴트</th>
							<td>test@nate.com</td>
						</tr>
						<tr>
							<th scope="row" >상담신청내용</th>
							<td colspan="3">${result.option13 }</td>
						</tr>
						<tr>
							<th scope="row"  colspan="4">상담내용</th>
						</tr>
						<tr>
							<td scope="row"  colspan="4">
							<div class="outputEditor" id="dbdata">
							<c:choose>
								<c:when test="${result.htmlYn=='Y'}">${result.nttCn}</c:when>
								<c:otherwise>
									<% pageContext.setAttribute("crlf", "\n"); %>
									${fn:replace(result.nttCn, crlf, "<br/>")}
								</c:otherwise>
							</c:choose>
							</div>
							</td>
						</tr>

					</tbody>
				</table>
			</div>
			</div>
			</form>
<c:if test="${result.delcode eq '1'}">
	<div class="fl">
		<a class="btn btn-danger" href="javascript:delPermanently();" onclick="return confirm('정말로 영구삭제하시겠습니까?');"><span>영구삭제</span></a>
	</div>
</c:if>

<div class="btnSet">
	<div class="fl">
		<c:if test="${not empty result}">
		<a class="btn btn-danger" href="javascript:delPermanently();" onclick="return confirm('정말로 영구삭제하시겠습니까?');"><span>영구삭제</span></a>
		</c:if>

		<c:if test="${prevNextMap['PREV'].prevNttId > 0}">
		<a class="btn btn-default" href="/bos/bbs/${paramVO.bbsId}/view.do?nttId=${prevNextMap['PREV'].prevNttId}&${pageQueryString}"><span>이전글</span></a>
	    </c:if>
		<c:if test="${prevNextMap['NEXT'].nextNttId > 0}">
		<a class="btn btn-default" href="/bos/bbs/${paramVO.bbsId}/view.do?${prevNextMap['NEXT'].nextNttId}.do&${pageQueryString}"><span>다음글</span></a>
	    </c:if>
	</div>
	<div class="fr" >
		<a class="btn btn-primary" href="/bos/bbs/${paramVO.bbsId}/forUpdate.do?nttId=${result.nttId}&${pageQueryString}&${result.delcode}"><span>수정</span></a>
	<c:if test="${result.delcode eq '0' }" >
		<a class="btn btn-danger" href="javascript:del();" onclick="return confrm('정말로 삭제하시겠습니까?');"><span>삭제</span></a>
	</c:if>
	<c:if test="${result.delcode eq '1' }" >
		<a class="btn btn-inverse" href="javascript:restore();" onclick="return confirm('정말로 복구하시겠습니까?');"><span>원글복구</span></a>
	</c:if>
		<c:url var="url" value="/bos/bbs/${paramVO.bbsId}/list.do?${pageQueryString}"/>
		<a class="btn btn-primary" href="${url}"><span>목록</span></a>
	</div>
</div>


			<!-- board list end //-->




