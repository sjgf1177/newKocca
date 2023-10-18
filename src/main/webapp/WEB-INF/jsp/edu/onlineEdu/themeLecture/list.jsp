<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc"%>

<jsp:useBean id="todayNow" class="java.util.Date"/>
<fmt:formatDate value="${todayNow}" var="today" pattern="yyyy-MM-dd"/>

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
					<p><strong>에듀코카 테마과정으로<br class="moview"> 주요 콘텐츠 한 눈에 보기</strong></p>
					<p>내가 원하는 콘텐츠를<br class="moview"> 주제별로 골라보세요!</p>
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
					<h2 class="main_title">방송기획</h2>
					<div class="temacard01 swiper-container">
						<div class="swiper-wrapper">
							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=92&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										<img src="/upload/themeupload/L92.png" alt="시청은 핑계고! 베테랑 제작진 레벨 테스트">
										<%--<img src="/edu/images/renew2022/L92.png" alt="시청은 핑계고! 베테랑 제작진 레벨 테스트">--%>
									</div>
									<div class="col-12 text_box">
										<h5>시청은 핑계고! 베테랑 제작진 레벨 테스트</h5>

										<!-- 신규과정 일때 사용할 것 2주뒤 자동제거 기능 필요-->

										<c:set var='now_dt' value='${today}'/>
										<c:set var='chk_dt' value='2023-10-31'/>
										<fmt:parseDate value="${now_dt}" var="pd_now_dt" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${pd_now_dt.time / (1000*60*60*24)}" integerOnly="true" var="pn_now_dt"></fmt:parseNumber>
										<fmt:parseDate value="${chk_dt}" var="pd_chk_dt" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${pd_chk_dt.time / (1000*60*60*24)}" integerOnly="true" var="pn_chk_dt"></fmt:parseNumber>

										<c:choose>
											<c:when test='${ (pn_chk_dt - pn_now_dt) >= 0 }'>
												<span class="tag new">NEW</span>
											</c:when>
											<c:otherwise>
												<span class="tag">NEW</span>
											</c:otherwise>
										</c:choose>

										<div class="col-12 sub_text_box">
											<span><b>3 COURSES</b></span>
											<%--<span class="h_desc5">조회수 1.2만</span>--%>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=68&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										<img src="/upload/themeupload/1001.png" alt="현장에서 통하는 방송 기획">
										<%--<img src="/edu/images/renew2022/1001.png" alt="현장에서 통하는 방송 기획">--%>
									</div>
									<div class="col-12 text_box">
										<h5>현장에서 통하는 방송 기획</h5>
										<div class="col-12 sub_text_box">
											<span><b>7 COURSES</b></span>
											<%--<span class="h_desc5">조회수 1.2만</span>--%>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=58&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										<img src="/upload/themeupload/1002.png" alt="다큐멘터리 글쓰기">
										<%--<img src="/edu/images/renew2022/1002.png" alt="다큐멘터리 글쓰기">--%>
									</div>
									<div class="col-12 text_box">
										<h5>다큐멘터리 글쓰기</h5>
										<div class="col-12 sub_text_box">
											<span><b>5 COURSES</b></span>
											<%--<span class="h_desc5">조회수 1.2만</span>--%>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=75&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										<img src="/upload/themeupload/1003.png" alt="방송 미디어 인사이트">
										<%--<img src="/edu/images/renew2022/1003.png" alt="방송 미디어 인사이트">--%>
									</div>
									<div class="col-12 text_box">
										<h5>방송 미디어 인사이트</h5>
										<div class="col-12 sub_text_box">
											<span><b>5 COURSES</b></span>
											<%--<span class="h_desc5">조회수 1.2만</span>--%>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=74&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										<img src="/upload/themeupload/1004.png" alt="OSMU 원작과 창작의 성공적 사례">
										<%--<img src="/edu/images/renew2022/1004.png" alt="OSMU 원작과 창작의 성공적 사례">--%>
									</div>
									<div class="col-12 text_box">
										<h5>OSMU 원작과 창작의 성공적 사례</h5>
										<div class="col-12 sub_text_box">
											<span><b>4 COURSES</b></span>
											<%--<span class="h_desc5">조회수 1.2만</span>--%>
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
					<h2 class="main_title">방송제작</h2>
					<div class="temacard02 swiper-container">
						<div class="swiper-wrapper">
							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=81&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										<%--<img src="${result.img }" alt="${result.title }">--%>
										<img src="/upload/themeupload/81_368_230.jpg" alt="슬기로운 글로벌 콘텐츠 제작 생활">
									</div>
									<div class="col-12 text_box">
										<h5>슬기로운 글로벌 콘텐츠 제작 생활</h5>
										<div class="col-12 sub_text_box">
											<span><b>6 COURSES</b></span>
											<%--<span class="h_desc5">조회수 1.2만</span>--%>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=78&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										<%--<img src="${result.img }" alt="${result.title }">--%>
										<img src="/upload/themeupload/78_368_230.jpg" alt="당신의 상상은 현실이 된다, 리얼타임 엔진과 기술">
									</div>
									<div class="col-12 text_box">
										<h5>당신의 상상은 현실이 된다, 리얼타임 엔진과 기술</h5>
										<div class="col-12 sub_text_box">
											<span><b>5 COURSES</b></span>
											<%--<span class="h_desc5">조회수 1.2만</span>--%>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=80&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										<%--<img src="${result.img }" alt="${result.title }">--%>
										<img src="/upload/themeupload/80_368_230.jpg" alt="방구석 카메라 교실, 카메라 지식 플러스">
									</div>
									<div class="col-12 text_box">
										<h5>방구석 카메라 교실, 카메라 지식 플러스</h5>
										<div class="col-12 sub_text_box">
											<span><b>4 COURSES</b></span>
											<%--<span class="h_desc5">조회수 1.2만</span>--%>
										</div>
									</div>
								</a>
							</div>

<%--							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=53&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/53_368_230.jpg" alt="드라마 제작, 이것이 궁금했다!">
									</div>
									<div class="col-12 text_box">
										<h5>드라마 제작, 이것이 궁금했다!</h5>
										<div class="col-12 sub_text_box">
											<span><b>9 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
										</div>
									</div>
								</a>
							</div>--%>

						</div>
					</div>

					<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
					<div class="swiper_btn_box">
						<div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
						<div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
					</div>

				</div>

				<div class="tema-list-box03">
					<h2 class="main_title">게임개발</h2>
					<div class="temacard03 swiper-container">
						<div class="swiper-wrapper">
							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=90&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										<%--<img src="${result.img }" alt="${result.title }">--%>
										<img src="/upload/themeupload/90_368_230.jpg" alt="GAME분야 레벨 UP+ 시리즈">
									</div>
									<div class="col-12 text_box">
										<h5>GAME분야 레벨 UP+ 시리즈</h5>
										<div class="col-12 sub_text_box">
											<span><b>5 COURSES</b></span>
											<%--<span class="h_desc5">조회수 1.2만</span>--%>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=83&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										<%--<img src="${result.img }" alt="${result.title }">--%>
										<img src="/upload/themeupload/83_368_230.jpg" alt="알면 쓸모 있는 게임기획자를 위한 게임 개발법">
									</div>
									<div class="col-12 text_box">
										<h5>알면 쓸모 있는 게임기획자를 위한 게임 개발법</h5>
										<div class="col-12 sub_text_box">
											<span><b>3 COURSES</b></span>
											<%--<span class="h_desc5">조회수 1.2만</span>--%>
										</div>
									</div>
								</a>
							</div>

							<%--<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=59&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/59_368_230.jpg" alt="게임 개발시 성공 노하우는 무엇일까?">
									</div>
									<div class="col-12 text_box">
										<h5>게임 개발시 성공 노하우는 무엇일까?</h5>
										<div class="col-12 sub_text_box">
											<span><b>4 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
										</div>
									</div>
								</a>
							</div>--%>

							<%--<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=60&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/60_368_230.jpg" alt="이젠 제대로 알고 계약하자!!">
									</div>
									<div class="col-12 text_box">
										<h5>이젠 제대로 알고 계약하자!!</h5>
										<div class="col-12 sub_text_box">
											<span><b>7 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
										</div>
									</div>
								</a>
							</div>--%>

						</div>
					</div>

					<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
					<div class="swiper_btn_box">
						<div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
						<div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
					</div>

				</div>

				<div class="tema-list-box04">
					<h2 class="main_title">웹툰캐릭터</h2>
					<div class="temacard04 swiper-container">
						<div class="swiper-wrapper">
<%--							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=61&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/61_368_230.jpg" alt="웹툰 프로듀서로써의 제작 노하우">
									</div>
									<div class="col-12 text_box">
										<h5>웹툰 프로듀서로써의 제작 노하우</h5>
										<div class="col-12 sub_text_box">
											<span><b>7 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
										</div>
									</div>
								</a>
							</div>--%>

							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=85&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										<%--<img src="${result.img }" alt="${result.title }">--%>
										<img src="/upload/themeupload/85_368_230.jpg" alt="뜨는 이야기들의 공통분모, 웹 소설 IP">
									</div>
									<div class="col-12 text_box">
										<h5>뜨는 이야기들의 공통분모, 웹 소설 IP</h5>
										<div class="col-12 sub_text_box">
											<span><b>5 COURSES</b></span>
											<%--<span class="h_desc5">조회수 1.2만</span>--%>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=88&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										<%--<img src="${result.img }" alt="${result.title }">--%>
										<img src="/upload/themeupload/88_368_230.jpg" alt="나만의 개성있는 캐릭터 How to make?">
									</div>
									<div class="col-12 text_box">
										<h5>나만의 개성있는 캐릭터 How to make?</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<%--<span class="h_desc5">조회수 1.2만</span>--%>
										</div>
									</div>
								</a>
							</div>

							<%--<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=70&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/70_368_230.png" alt="무한 창작 , 웹툰의 세계">
									</div>
									<div class="col-12 text_box">
										<h5>무한 창작 , 웹툰의 세계</h5>
										<div class="col-12 sub_text_box">
											<span><b>7 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
										</div>
									</div>
								</a>
							</div>--%>

							<%--<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=71&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/71_368_230.png" alt="내가 만든 이모티콘 제안하기">
									</div>
									<div class="col-12 text_box">
										<h5>내가 만든 이모티콘 제안하기</h5>
										<div class="col-12 sub_text_box">
											<span><b>4 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
										</div>
									</div>
								</a>
							</div>--%>

							<%--<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=52&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/52_368_230.jpg" alt="취향저격 캐릭터 만들기 - 캐릭터 매뉴얼북 A to Z">
									</div>
									<div class="col-12 text_box">
										<h5>취향저격 캐릭터 만들기 - 캐릭터 매뉴얼북 A to Z</h5>
										<div class="col-12 sub_text_box">
											<span><b>6 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
										</div>
									</div>
								</a>
							</div>--%>

						</div>
					</div>

					<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
					<div class="swiper_btn_box">
						<div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
						<div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
					</div>

				</div>

				<div class="tema-list-box05">
					<h2 class="main_title">애니메이션</h2>
					<div class="temacard05 swiper-container">
						<div class="swiper-wrapper">
							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=89&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										<%--<img src="${result.img }" alt="${result.title }">--%>
										<img src="/upload/themeupload/89_368_230.jpg" alt="국내 애니메이션이 해외 진출에 성공했던 건에 대하여">
									</div>
									<div class="col-12 text_box">
										<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
										<div class="col-12 sub_text_box">
											<span><b>7 COURSES</b></span>
											<%--<span class="h_desc5">조회수 1.2만</span>--%>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=82&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										<%--<img src="${result.img }" alt="${result.title }">--%>
										<img src="/upload/themeupload/82_368_230.jpg" alt="애니메이션 제작 A to Z">
									</div>
									<div class="col-12 text_box">
										<h5>애니메이션 제작 A to Z</h5>
										<div class="col-12 sub_text_box">
											<span><b>3 COURSES</b></span>
											<%--<span class="h_desc5">조회수 1.2만</span>--%>
										</div>
									</div>
								</a>
							</div>

							<%--<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=62&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/62_368_230.jpg" alt="애니메이션 스토리텔링">
									</div>
									<div class="col-12 text_box">
										<h5>애니메이션 스토리텔링</h5>
										<div class="col-12 sub_text_box">
											<span><b>3 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
										</div>
									</div>
								</a>
							</div>--%>

							<%--<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=54&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/54_368_230.jpg" alt="애니메이션 제작 분야, 여러분의 진로는?">
									</div>
									<div class="col-12 text_box">
										<h5>애니메이션 제작 분야, 여러분의 진로는?</h5>
										<div class="col-12 sub_text_box">
											<span><b>5 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
										</div>
									</div>
								</a>
							</div>--%>

						</div>
					</div>

					<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
					<div class="swiper_btn_box">
						<div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
						<div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
					</div>

				</div>

				<div class="tema-list-box06">
					<h2 class="main_title">공연기획</h2>
					<div class="temacard06 swiper-container">
						<div class="swiper-wrapper">
							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=91&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										<%--<img src="${result.img }" alt="${result.title }">--%>
										<img src="/upload/themeupload/91_368_230.jpg" alt="공연에 반하다, 트렌드한 공연 기획이란?">
									</div>
									<div class="col-12 text_box">
										<h5>공연에 반하다, 트렌드한 공연 기획이란?</h5>
										<div class="col-12 sub_text_box">
											<span><b>9 COURSES</b></span>
											<%--<span class="h_desc5">조회수 1.2만</span>--%>
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=87&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										<%--<img src="${result.img }" alt="${result.title }">--%>
										<img src="/upload/themeupload/87_368_230.jpg" alt="당신의 귀를 열어 드립니다. 음악 마케팅의 KeyPoint!">
									</div>
									<div class="col-12 text_box">
										<h5>당신의 귀를 열어 드립니다. 음악 마케팅의 KeyPoint!</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											<%--<span class="h_desc5">조회수 1.2만</span>--%>
										</div>
									</div>
								</a>
							</div>

							<%--<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=55&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/55_368_230.jpg" alt="공연무대의 시선을 끄는 비밀, 무대디자인 & 무대영상디자인">
									</div>
									<div class="col-12 text_box">
										<h5>공연무대의 시선을 끄는 비밀, 무대디자인 & 무대영상디자인</h5>
										<div class="col-12 sub_text_box">
											<span><b>5 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
										</div>
									</div>
								</a>
							</div>--%>

							<%--<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=63&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/63_368_230.jpg" alt="뮤지컬의 이해">
									</div>
									<div class="col-12 text_box">
										<h5>뮤지컬의 이해</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
										</div>
									</div>
								</a>
							</div>--%>

							<%--<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=56&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/56_368_230.jpg" alt="감독에게 직접 들어보는 뮤지컬 제작 이야기">
									</div>
									<div class="col-12 text_box">
										<h5>감독에게 직접 들어보는 뮤지컬 제작 이야기</h5>
										<div class="col-12 sub_text_box">
											<span><b>8 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
										</div>
									</div>
								</a>
							</div>--%>

						</div>
					</div>

					<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
					<div class="swiper_btn_box">
						<div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
						<div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
					</div>

				</div>

				<%--<div class="tema-list-box07">
					<h2 class="main_title">저작권상식</h2>
					<div class="temacard07 swiper-container">
						<div class="swiper-wrapper">
							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=65&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/65_368_230.jpg" alt="저작권 노하우">
									</div>
									<div class="col-12 text_box">
										<h5>저작권 노하우</h5>
										<div class="col-12 sub_text_box">
											<span><b>10 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=66&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/66_368_230.jpg" alt="저작권 노하우 (해외편)">
									</div>
									<div class="col-12 text_box">
										<h5>저작권 노하우 (해외편)</h5>
										<div class="col-12 sub_text_box">
											<span><b>4 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=72&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/72_368_230.png" alt="저작권 기초 강좌와 노하우">
									</div>
									<div class="col-12 text_box">
										<h5>저작권 기초 강좌와 노하우</h5>
										<div class="col-12 sub_text_box">
											<span><b>4 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
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

				</div>--%>

				<%--<div class="tema-list-box08">
					<h2 class="main_title">콘텐츠교양</h2>
					<div class="temacard08 swiper-container">
						<div class="swiper-wrapper">
							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=67&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/67_368_230.jpg" alt="창의적인 생각의 힘">
									</div>
									<div class="col-12 text_box">
										<h5>창의적인 생각의 힘</h5>
										<div class="col-12 sub_text_box">
											<span><b>3 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=64&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/64_368_230.jpg" alt="콘텐츠 제작에 필요한 필수 강좌">
									</div>
									<div class="col-12 text_box">
										<h5>콘텐츠 제작에 필요한 필수 강좌</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=57&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/57_368_230.jpg" alt="나만의 콘텐츠를 제작하고 싶다면??">
									</div>
									<div class="col-12 text_box">
										<h5>나만의 콘텐츠를 제작하고 싶다면??</h5>
										<div class="col-12 sub_text_box">
											<span><b>8 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
										</div>
									</div>
								</a>
							</div>

							<div class="sub_theme_process_list swiper-slide">
								<a href='/edu/onlineEdu/themeLecture/view.do?pId=69&menuNo=500157&pageIndex=1'>
									<div class="col-5 img_box">
										&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
										<img src="https://edu.kocca.kr/upload/themeupload/69_368_230.png" alt="슬기로운 문화생활">
									</div>
									<div class="col-12 text_box">
										<h5>슬기로운 문화생활</h5>
										<div class="col-12 sub_text_box">
											<span><b>2 COURSES</b></span>
											&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
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

				</div>--%>

			</div>

<%--		<c:forEach items="${resultList }" var="result" varStatus="status" >
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
		</c:forEach>--%>

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
