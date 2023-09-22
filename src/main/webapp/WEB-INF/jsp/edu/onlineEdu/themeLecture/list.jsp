<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc"%>

<link href="/edu/css/new/videojs/video-js.css" rel="stylesheet">
<script src="/edu/js/new/videojs/videojs-ie8.js"></script>
<script src="/edu/js/new/videojs/video.js"></script>

<!--content-->
<!-- 스타일 500***.jsp 파일에 넣을 것 -->
<!-- <style type="text/css">
.lnb_wrap{display:none;}
.sub_contents_wrap .sub_contents{padding-left:0;}
</style> -->

<div class="over-hidden sub_contents_header">
	<div class="linemap_wrap"> <!-- fl class 삭제 -->
		<ul class="col-12 linemap_con">
			<li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>카테고리</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>테마과정</span></a></li>
		</ul>
	</div>
</div>

<div class="sub_title s_tit02" style="margin-bottom: 0;">
	<div class="col-center mw-1280">테마과정</div>
</div>

<div class="col-center roadmap_box">
	<div class="sub_theme_process">
		<div class="col-12 dark_search_box">
			<div class="inner-box">
				<div class="txt_ct">
					<p><strong>에듀코카 테마과정으로 주요 콘텐츠 한 눈에 보기</strong></p>
					<p>내가 원하는 콘텐츠를 주제별로 골라보세요!</p>
				</div>
				<div class="col-12 board_sorting_con">
					<form id="frm" name="frm" action="/edu/onlineEdu/themeLecture/list.do" method="post" class="form-inline col-12">
						<input type="hidden" name="pageQueryString" value='<c:out value="${pageQueryString }" escapeXml="false"/>' >
						<input type="hidden" name="menuNo" value='<c:out value="${param.menuNo }" escapeXml="false"/>' >
						<input type="hidden" name="pageIndex" id="pageIndex" value='<c:out value="${param.pageIndex }" escapeXml="false"/>' >
						<fieldset>
							<legend></legend>
							<span class="tl input_search_con" style="padding-right:0;">
							<input type="text" class="board_search" name="searchWrd" id="searchWrd" title="키워드를 입력해서 테마 과정을 검색해 보세요." placeholder="키워드를 입력해서 테마 과정을 검색해 보세요." value="<c:out value="${param.searchWrd}" />">
							<a href="javascript:void(0);" onclick="fnCmdSearchList(); return false;" class="search_summit nav_search_btn">검색</a>
								<!-- 						<input type="submit" class="search_summit" id="" name="" value=""> -->
						</span>
						</fieldset>
					</form>
				</div>
			</div>

		</div>

<%--			<div class="col-12" >--%>
<%--				<ul class="tab-inner-box">--%>
<%--					<li>--%>
<%--						<button type="button" class="btn-lightgray">전체</button>--%>
<%--					</li>--%>
<%--					<li>--%>
<%--						<button type="button" class="btn-lightgray">방송&bull;영상</button>--%>
<%--					</li>--%>
<%--					<li>--%>
<%--						<button type="button" class="btn-lightgray">게임</button>--%>
<%--					</li>--%>
<%--					<li>--%>
<%--						<button type="button" class="btn-lightgray">애니메이션</button>--%>
<%--					</li>--%>
<%--					<li>--%>
<%--						<button type="button" class="btn-lightgray">웹툰</button>--%>
<%--					</li>--%>
<%--					<li>--%>
<%--						<button type="button" class="btn-lightgray">음악</button>--%>
<%--					</li>--%>
<%--					<li>--%>
<%--						<button type="button" class="btn-lightgray">창작</button>--%>
<%--					</li>--%>
<%--				</ul>--%>
<%--			</div>--%>

			<div class="mw-1280 col-center">

				<div class="tema-list-box01">
					<h2 class="main_title">방송&bull;영상</h2>
					<div class="temacard01 swiper-container">
						<div class="swiper-wrapper">
							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

						</div>
					</div>

					<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
					<div class="swiper_btn_box">
						<div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
						<div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
					</div>

				</div>

				<div class="tema-list-box02">
					<h2 class="main_title">게임</h2>
					<div class="temacard02 swiper-container">
						<div class="swiper-wrapper">
							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

						</div>
					</div>

					<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
					<div class="swiper_btn_box">
						<div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
						<div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
					</div>

				</div>

				<div class="tema-list-box03">
					<h2 class="main_title">애니메이션</h2>
					<div class="temacard03 swiper-container">
						<div class="swiper-wrapper">
							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

						</div>
					</div>

					<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
					<div class="swiper_btn_box">
						<div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
						<div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
					</div>

				</div>

				<div class="tema-list-box04">
					<h2 class="main_title">웹툰</h2>
					<div class="temacard04 swiper-container">
						<div class="swiper-wrapper">
							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

						</div>
					</div>

					<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
					<div class="swiper_btn_box">
						<div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
						<div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
					</div>

				</div>

				<div class="tema-list-box05">
					<h2 class="main_title">음악</h2>
					<div class="temacard05 swiper-container">
						<div class="swiper-wrapper">
							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

						</div>
					</div>

					<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
					<div class="swiper_btn_box">
						<div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
						<div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
					</div>

				</div>

				<div class="tema-list-box06">
					<h2 class="main_title">창작</h2>
					<div class="temacard06 swiper-container">
						<div class="swiper-wrapper">
							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='<c:out value="${url }" />&amp;${pageQueryString }'>
									<div class="col-5 img_box">
										<img src="${result.img }" alt="${result.title }">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<span class="h_desc5">조회수 1.2만</span>
										</div>
									</div>
								</a>
							</div>

						</div>
					</div>

					<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
					<div class="swiper_btn_box">
						<div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
						<div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
					</div>

				</div>

			</div>

		<c:forEach items="${resultList }" var="result" varStatus="status" >
			<c:url var="url" value="/edu/onlineEdu/themeLecture/view.do">
				<c:param name="pId" value="${result.id }"/>
			</c:url>

			<div class="col-12 col-sm-6 sub_theme_process_list">
				<a class="border_box" href='<c:out value="${url }" />&amp;${pageQueryString }'>
					<div class="col-5 img_box">
						<img src="${result.img }" alt="${result.title }">
					</div>
					<div class="col-12 text_box">
						<h5>${result.title }</h5>
						<p class="h_desc5">${result.description }</p>
					</div>
				</a>
			</div>
		</c:forEach>

		</div>

	<!--//content-->
</div>

<script type="text/javascript">
	$(document).ready(function(){
		//과정 조회 enter key
		$("#searchWrd").keydown(function(e) {
		    if (e.keyCode == 13) fnCmdSearchList();

		});

		var myPlayer;
		$("#themeCoursePreview").on("click", function(){
			$("body").prepend($("<div/>").addClass("bg_popup themeCoursePreviewPopup").append([
				$("<div/>").append(
					$("<div/>").addClass("popup_box").append([
						$("<span/>").addClass("btn_popupClose").text("X"),
						$("<video/>").attr({id: "my-video", controls: true}).addClass("video-js").data("setup", {})
					])
				)
			]));

			$(".sub_layout_page").css({"position":"fixed"});
			myPlayer = videojs('my-video', {"controls" : true, "autoplay" : true, "preload" : "auto", "loop" : false});
			myPlayer.src({type:"video/mp4", src:"http://vod.kbrainc.com/kbrain/kocca/pr_video/pr_video_theme_course.mp4"});
		})

		$(document).on('click', '.btn_popupClose, .themeCoursePreviewPopup.bg_popup', function(e){
			if (e.target == this) {
				myPlayer.dispose();
				$(".themeCoursePreviewPopup.bg_popup").empty();
				$(".themeCoursePreviewPopup.bg_popup").remove();
				$(".sub_layout_page").css({"position":""});
			}
		});
	});

	function fnCmdSearchList(){
		$("#pageIndex").val("1");
		$("#frm").attr({
					action:"/edu/onlineEdu/themeLecture/list.do",
					method:"post",
					target:"_self"
					});
		$("#frm").submit();
	}

	//테마 Tab 버튼 active
	$('.tab-inner-box .btn-lightgray').click(function (){
		$('.tab-inner-box .btn-lightgray').removeClass('active');
		$(this).addClass('active');
	});



</script>
<style>
.edu_youtube_subtitle_view_btn_con{text-align: right; margin-bottom: 40px;}
.edu_youtube_subtitle_view_btn_con .edu_youtube_subtitle_view_btn{font-size:14px; font-size:1.4rem; line-height:20px; line-height:2.0rem; color:#fff; display:inline-block; border-radius:1px; cursor: pointer;
    text-align: left; padding-right:41px; padding-left:12px; padding-top:9px; padding-bottom:8px; background-image:url('/edu/images/bm/edu_yotubue_subtitle_view.png'); background-repeat: no-repeat; background-position: right 12px center; background-color: #1da28d; box-sizing: border-box;}
.edu_youtube_subtitle_view_btn_con .edu_youtube_subtitle_view_btn .edu_view_default{display:inline-block;}
.edu_youtube_subtitle_view_btn_con .edu_youtube_subtitle_view_btn .edu_view_active{display:none;}
.edu_youtube_subtitle_view_btn_con .edu_youtube_subtitle_view_btn .edu_view_close_btn{display:none; float:right; width:17px; height:17px; background-image: url('/edu/images/bm/edu_yotubue_subtitle_close.png');}
.edu_youtube_subtitle_view_btn_con.active .edu_youtube_subtitle_view_btn{overflow:hidden; display:block; width:100%; padding-left:25px; background-image:none; padding-right:25px;}
.edu_youtube_subtitle_view_btn_con.active .edu_youtube_subtitle_view_btn .edu_view_default{display:none;}
.edu_youtube_subtitle_view_btn_con.active .edu_youtube_subtitle_view_btn .edu_view_active{display:inline-block;}
.edu_youtube_subtitle_view_btn_con.active .edu_youtube_subtitle_view_btn .edu_view_close_btn{display:inline-block; }
.edu_youtube_subtitle_view_btn_con .edu_youtube_subtitle_view_text{font-size: 14.5px; font-size: 1.45rem; line-height: 26px; line-height: 2.6rem; color: #999999; letter-spacing: -0.025em;
    padding-top:20px; padding-left:25px; padding-right:25px; padding-bottom:20px; border:2px solid #5ac9b7; text-align: left; display:none; max-height:300px; overflow-y: auto;}
.edu_youtube_subtitle_view_btn_con.active .edu_youtube_subtitle_view_text{display:block;}
</style>
