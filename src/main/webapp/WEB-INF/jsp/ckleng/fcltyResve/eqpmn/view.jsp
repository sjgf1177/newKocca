<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<h2><c:out value="${result.eqpmnNmEn }" /></h2>
<!-- thumbGallery -->
<div class="visualSysSet">
	<div class="visualCtrl">
		<a href="#self" class="prevVs"><img src="/ckl/images/sub/prevVs.gif" width="60" height="60" alt="previous" /></a>
		<a href="#self" class="nextVs"><img src="/ckl/images/sub/nextVs.gif" width="60" height="60" alt="next" /></a>
	</div>
	<div class="visualSys">
		<div class="thumbs" id="vsThumbs">
			<c:forEach var="fileVO" items="${fileList}" varStatus="status">
			<div> <a href="#self"><img src="/cmm/fms/getImage.do?atchFileId=${fileVO.atchFileId}&fileSn=${fileVO.fileSn}" width="710" height="468" alt="<c:out value="${fileVo.orignlFileNm }" />(big ${status.count } Image)" /></a></div>
			</c:forEach>
		</div>
		<div class="thumbsList" id="thumbsList">
			<ul>
				<c:forEach var="fileVO" items="${fileList}" varStatus="status">
					<li> <a href="#self"><img src="/cmm/fms/getImage.do?atchFileId=${fileVO.atchFileId}&fileSn=${fileVO.fileSn}" width="170" height="115"  alt="<c:out value="${fileVo.orignlFileNm }" />(small  ${status.count } Image)" /></a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript">
//<![CDATA[
$(function() {
	 $('#thumbsList ul').carouFredSel({
	 	width:710,
		items		:{
			visible : <c:out value="${fn:length(fileList)}" />
		},
		direction: 'left',
		scroll      :{
			items		:1,
			pauseOnHover	: true
		},
		auto: {
			play: false,
			duration: 750,
			timeoutDuration: 2000,
			easing: 'quadratic',
			onBefore: function() {
				var index = $(this).triggerHandler( 'currentPosition' );
				if ( index == 0 ) {
					index = $(this).children().length;
				}
				$('#vsThumbs').trigger('slideTo', [ index, {
					fx: 'directscroll'
				}, 'prev' ]);
				 $('#thumbsList ul').find( 'li' ).eq(index).addClass( 'selected' );
			}

		},
		next : ".nextVs",
		prev : ".prevVs"
	 });

	var thumbsList = $('#thumbsList ul li');
	thumbsList.bind("click", function(){
		var index =  thumbsList.index(this);
		$('#vsThumbs').trigger('slideTo', [ index, {
			fx: 'directscroll'
		}, 'prev' ]);
	});

	 $('#vsThumbs').carouFredSel({
		items: 1,
		direction: 'up',
		width:710,
		height:468,
		scroll :{
			items : 1
		},
		auto: {
			play: false,
			duration: 750,
			easing: 'directscroll'
		}
	 });
});
//]]>
</script>

<!-- //thumbGallery -->



<div class="revInfo ml40 posr">
	<dl class="mt20">
		<dt>
			<span><span class="icons icoDetail"></span>Details  : </span>
		</dt>
		<dd class="mt5">
			<% pageContext.setAttribute("crlf", "\n"); %>
			${fn:replace(result.dtlsInfoEn, crlf, "<br/>")}
		</dd>
	</dl>

	<dl class="dl-horizontal pt20 pb20 mt20">
		<dt>
			<span><span class="icons ico6"></span>Quantity </span><span class="dib ml20">:
			</span>
		</dt>
		<dd><c:out value="${result.eqpmnQy }" />EA</dd>
	</dl>
	<c:if test="${not empty result.resveImprtyResn }">
	<dl>
		<dt class="text-danger pt20">
			<span class="icons icoAlert"></span>Comment
		</dt>
		<dd><c:out value="${result.resveImprtyResn }" /></dd>
	</dl>
	</c:if>

	<div class="mt20 tar">
		<a href="/ckleng/fcltyResve/eqpmn/list.do?${pageQueryString }" class="btn btn-md btn-primary pr30">List</a>
	</div>
</div>

