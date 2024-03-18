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
				<div class="col-12 board_sorting_con" style="display: none;"> <!-- 검색기능 개발 전까지 숨김 -->
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
									<img src="/upload/themeupload/L92.png" alt="시청은 핑계고! 베테랑 제작진 레벨 테스트, 이거 완전 내 이야기인데? 싶은 현직+예비 PD님들 주목!, 트렌드를 쫒지 않고 나만의 콘텐츠를 만드는 노하우를 알려 드립니다.">
									<%--<img src="/edu/images/renew2022/L92.png" alt="시청은 핑계고! 베테랑 제작진 레벨 테스트">--%>
								</div>
								<div class="col-12 text_box">
									<h5>시청은 핑계고! 베테랑 제작진 레벨 테스트</h5>

									<!-- 신규과정 일때 사용할 것 2주뒤 자동제거 기능 필요-->

									<c:set var='now_dt' value='${today}'/>
									<c:set var='chk_dt' value='2023-11-30'/>
									<fmt:parseDate value="${now_dt}" var="pd_now_dt" pattern="yyyy-MM-dd"/>
									<fmt:parseNumber value="${pd_now_dt.time / (1000*60*60*24)}" integerOnly="true" var="pn_now_dt"></fmt:parseNumber>
									<fmt:parseDate value="${chk_dt}" var="pd_chk_dt" pattern="yyyy-MM-dd"/>
									<fmt:parseNumber value="${pd_chk_dt.time / (1000*60*60*24)}" integerOnly="true" var="pn_chk_dt"></fmt:parseNumber>

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
									<img src="/upload/themeupload/1001.png" alt="현장에서 통하는 방송 기획,모두가 주목하는 콘텐츠의 비밀!은 바로 탄탄한 기획에 있다? 방송 기획력 향상을 위한 실전 TIP! 현장 고수들이 직접 전해드립니다.">
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
									<img src="/upload/themeupload/1002.png" alt="다큐멘터리 글쓰기, 프로그램 기획부터 구성까지, 다큐멘터리 글쓰기의 모든 것 다큐멘터리 제작 노하우를 단계별로 차근차근 알아보세요.">
									<%--<img src="/edu/images/renew2022/1002.png" alt="다큐멘터리 글쓰기">--%>
								</div>
								<div class="col-12 text_box">
									<h5>다큐멘터리 글쓰기</h5>
									<div class="col-12 sub_text_box">
										<span><b>4 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=75&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<img src="/upload/themeupload/1003.png" alt="방송 미디어 인사이트, 드라마, 예능, 다큐멘터리까지!? 현장 전문가가 생생하게 전하는 방송 미디어와 인사이트지금 바로 확인하세요!">
									<%--<img src="/edu/images/renew2022/1003.png" alt="방송 미디어 인사이트">--%>
								</div>
								<div class="col-12 text_box">
									<h5>방송 미디어 인사이트</h5>
									<div class="col-12 sub_text_box">
										<span><b>11 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=74&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<img src="/upload/themeupload/1004.png" alt="OSMU 원작과 창작의 성공적 사례, 원작의 작품성과 의도는 유지하면서 성공적인 N차 창작물 만들기 OSMU(One-Source Multi-Use) 전략 성공 사례를 통해 확인하세요!">
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
									<img src="/upload/themeupload/L81.png" alt="슬기로운 글로벌 콘텐츠 제작 생활, 글로벌향 콘텐츠 기획과 제작부터 계약까지
세계로 뻗어나가는 콘텐츠! 한번 만들어 볼까요?">
								</div>
								<div class="col-12 text_box">
									<h5>슬기로운 글로벌 콘텐츠 제작 생활</h5>
									<div class="col-12 sub_text_box">
										<span><b>5 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=78&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L78.png" alt="당신의 상상은 현실이 된다, 리얼타임 엔진과 기술, 아직 상상만 하고 있는 당신!을 위해 준비했습니다.
진짜보다 더 진짜같은 VR 콘텐츠 제작 방법!?">
								</div>
								<div class="col-12 text_box">
									<h5>당신의 상상은 현실이 된다, 리얼타임 엔진과 기술</h5>
									<div class="col-12 sub_text_box">
										<span><b>3 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=80&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L80.png" alt="방구석 카메라 교실, 카메라 지식 플러스, 방송의 첫 시작, 카메라! 제대로 알고 싶다면? 촬영 전 꼭 알아야 할 카메라 지식을 소개합니다.">
								</div>
								<div class="col-12 text_box">
									<h5>방구석 카메라 교실, 카메라 지식 플러스</h5>
									<div class="col-12 sub_text_box">
										<span><b>8 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=53&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L53.png" alt="드라마 제작, 이것이 궁금했다!, 재밌게 보기만 했던 드라마,
어떻게 만들어지는지 궁금하신가요? 촬영 감독과 프로듀서에게 듣는 드라마 제작 이야기와 드라마 촬영 기법!">
								</div>
								<div class="col-12 text_box">
									<h5>드라마 제작, 이것이 궁금했다!</h5>
									<div class="col-12 sub_text_box">
										<span><b>3 COURSES</b></span>
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

			<div class="tema-list-box03">
				<h2 class="main_title">게임개발</h2>
				<div class="temacard03 swiper-container">
					<div class="swiper-wrapper">
						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=93&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L93.png" alt="프로그래밍부터 엔진까지, 게임 개발 바이블, 게임 개발할 떄 꼭 필요한 필수 프로그래밍&TOOL 강좌, 파이썬부터 언리얼까지 게임 개발 바이블로 완전정복">
								</div>
								<div class="col-12 text_box">
									<h5>프로그래밍부터 엔진까지, 게임 개발 바이블</h5>
									<div class="col-12 sub_text_box">
										<c:if test='${ (pn_chk_dt - pn_now_dt) >= 0 }'>
											<span class="tag new" style="margin-bottom: 0; margin-right: 10px;">NEW</span>
										</c:if>
										<span><b>6 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=90&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L90.png" alt="GAME분야 레벨 UP+ 시리즈,초대장, 단계별 강좌로 게임 분야 MASTER로 만들어드립니다. 입문부터 심과 과정까지 게임 제작 LEVEL UP!">
								</div>
								<div class="col-12 text_box">
									<h5>GAME분야 레벨 UP+ 시리즈</h5>
									<div class="col-12 sub_text_box">
										<span><b>6 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=83&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L83.png" alt="알면 쓸모 있는 게임기획자를 위한 게임 개발법, 나는 게임 기획자, 개발에 대해 얼마나 알아야 할까? 기획자가 알아야 할 포인트만 쏙쏙 살펴봅시다.">
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

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=59&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L59.png" alt="게임 개발시 성공 노하우는 무엇일까?, 게임 개발, 뭐부터 해야 할까?
맨땅에 헤딩은 이제 그만! 1인 개발자가 들려주는 진짜 필요한 게임 개발 이야기">
								</div>
								<div class="col-12 text_box">
									<h5>게임 개발시 성공 노하우는 무엇일까?</h5>
									<div class="col-12 sub_text_box">
										<span><b>7 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=60&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L60.png" alt="이젠 제대로 알고 계약하자!!, 게임 업계 종사자분들 주목개발만큼 중요한 게 있습니다. 내가 만든 너무 소중한 게임, 잘 지킬 수 있는 방법 꼭 확인하세요!">
								</div>
								<div class="col-12 text_box">
									<h5>이젠 제대로 알고 계약하자!!</h5>
									<div class="col-12 sub_text_box">
										<span><b>7 COURSES</b></span>
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

			<div class="tema-list-box04">
				<h2 class="main_title">웹툰/캐릭터</h2>
				<div class="temacard04 swiper-container">
					<div class="swiper-wrapper">
						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=94&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L94.png" alt="지속가능한 창작의 원동력, 웹툰 스튜디오, 작업 속도up, 퀄맅up, 체계적인 시스템으로 효율성을 올린다. 웹툰 산업의 지속가능성을 높이는 스튜디오 창작 시스템을 소개합니다.">
								</div>
								<div class="col-12 text_box">
									<h5>지속가능한 창작의 원동력, 웹툰 스튜디오</h5>
									<div class="col-12 sub_text_box">
										<span><b>5 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=61&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L61.png" alt="웹툰 프로듀서로써의 제작 노하우,웹툰 프로듀서를 꿈꾸는 당신을 위해 준비했습니다. 기획부터 로그라인까지 웹툰 제작 실무 노하우 대/공/개">
								</div>
								<div class="col-12 text_box">
									<h5>웹툰 프로듀서로써의 제작 노하우</h5>
									<div class="col-12 sub_text_box">
										<span><b>3 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=85&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L85.png" alt="뜨는 이야기들의 공통분모, 웹 소설 IP, IP 무한 확장의 시대,뜨는 이야기에 숨겨진 비밀이 있다. 작은 아이디어도 웹소설 IP로 재탄생시키는 방법, 함께 확인하시죠!">
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
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=70&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L70.png" alt="무한 창작 , 웹툰의 세계짜임새 있는 스토리 구성과 다양한 연출기법 나만의 스토리를 녹인 웹툰 제작 방법 A to Z">
								</div>
								<div class="col-12 text_box">
									<h5>무한 창작 , 웹툰의 세계</h5>
									<div class="col-12 sub_text_box">
										<span><b>6 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=71&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L71.png" alt="내가 만든 이모티콘 제안하기, 누구나 쉽고 재미있게 만든다. 이모티콘 기획부터 제안까지 나만의 이모티콘 만드는 방법">
								</div>
								<div class="col-12 text_box">
									<h5>내가 만든 이모티콘 제안하기</h5>
									<div class="col-12 sub_text_box">
										<span><b>4 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=52&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L52.png" alt="취향저격 캐릭터 만들기 - 캐릭터 매뉴얼북 A to Z,캐릭터를 활용한 브랜드 마케팅부터 컨셉과 적용을 위한 가이드라인까지 캐릭터 제작 매뉴얼북으로 완성하세요!">
								</div>
								<div class="col-12 text_box">
									<h5>취향저격 캐릭터 만들기 - 캐릭터 매뉴얼북 A to Z</h5>
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

			<div class="tema-list-box05">
				<h2 class="main_title">애니메이션</h2>
				<div class="temacard05 swiper-container">
					<div class="swiper-wrapper">
						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=89&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L89.png" alt="국내 애니메이션이 해외 진출에 성공했던 건에 대하여, <레드슈즈>와 <핑크퐁 아기상어>의 캐릭터 브랜딩부터 영상 작업까지, 국내 애니메이션 성공사례를 통해 해외 진출 전략을 분석해봅니다.">
								</div>
								<div class="col-12 text_box">
									<h5>국내 애니메이션이 해외 진출에 성공했던 건에 대하여</h5>
									<div class="col-12 sub_text_box">
										<span><b>4 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=82&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L82.png" alt="애니메이션 제작 A to Z눈 깜짝할 새 완성되는 애니메이션! 놓치지 말고 따라오세요. 누구나 할수있다. 시선 집중! 애니메이션 제작 방법">
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

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=62&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L62.png" alt="애니메이션 스토리텔링,단편과 장편 애니메이션의 차이? VR 애니메이션 스토리텔링 기법? 애니메이션 종류별로 구분해보고 각각의 스토레텔링 단계를 구성해봅니다.">
								</div>
								<div class="col-12 text_box">
									<h5>애니메이션 스토리텔링</h5>
									<div class="col-12 sub_text_box">
										<span><b>3 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

                        <div class="sub_theme_process_list swiper-slide">
                            <a href='/edu/onlineEdu/themeLecture/view.do?pId=88&menuNo=500157&pageIndex=1'>
                                <div class="col-5 img_box">
                                    <%--<img src="${result.img }" alt="${result.title }">--%>
                                    <img src="/upload/themeupload/L88.png" alt="나만의 개성있는 캐릭터 How to make? 어렵고 막막했던 캐릭터 제작, 이제 쉽고 재밌게 시작해보세요! How to make? 개성만점 나만의 캐릭터 제작과정">
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
				<h2 class="main_title">공연기획/음악</h2>
				<div class="temacard06 swiper-container">
					<div class="swiper-wrapper">
						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=91&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L91.png" alt="공연에 반하다, 트렌드한 공연 기획이란?,공연 기초 설계 및 기획부터 공연 창작의 새로운 기술 이해까지! 공연 트렌드 전반에 대해 알아봅니다.">
								</div>
								<div class="col-12 text_box">
									<h5>공연에 반하다, 공연 기획/기술의 모든 것</h5>
									<div class="col-12 sub_text_box">
										<span><b>11 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=87&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L87.png" alt="당신의 귀를 열어 드립니다. 음악 마케팅의 KeyPoint!, 잘 만들어진 음악, 소비자들의 마음에 콕! 박히려면? 공연 기초 설계 및 기획부터 공연 창작의 새로운 기술 이해까지! 공연 트렌드 전반에 대해 알아봅니다.">
								</div>
								<div class="col-12 text_box">
									<h5>당신의 귀를 열어 드립니다. 음악 마케팅의 KeyPoint!</h5>
									<div class="col-12 sub_text_box">
										<span><b>4 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=55&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L55.png" alt="공연무대의 시선을 끄는 비밀, 무대디자인 & 무대영상디자인, 이 무대는 꼭 봐야해! 관중을 사로잡는 무대의 비밀? 무대 디자이너의 역할과 영상 디자인의 활용법을 알려드립니다.">
								</div>
								<div class="col-12 text_box">
									<h5>공연무대의 시선을 끄는 비밀, 무대디자인 & 무대영상디자인</h5>
									<div class="col-12 sub_text_box">
										<span><b>5 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=63&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L63.png" alt="뮤지컬의 이해 뮤지컬 기본 개념과 장르부터 브로드웨이 뮤지컬의 제작과정까지! 뮤지컬 이해를 위한 가이드 지금 바로 확인하세요!">
								</div>
								<div class="col-12 text_box">
									<h5>뮤지컬의 이해</h5>
									<div class="col-12 sub_text_box">
										<span><b>2 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=56&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L56.png" alt="감독에게 직접 들어보는 뮤지컬 제작 이야기, 장르를 넘나드는 뮤지컬, 국내 뮤지컬은 어떻게 변화했을까? 뮤지컬 음악 감독이 직접 들려주는 뮤지컬과 음악 이야기">
								</div>
								<div class="col-12 text_box">
									<h5>뮤지컬 대표 전문가가 들려주는 뮤지컬 제작 이야기</h5>
									<div class="col-12 sub_text_box">
										<span><b>11 COURSES</b></span>
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

			<%--<div class="tema-list-box07">
				<h2 class="main_title">저작권상식</h2>
				<div class="temacard07 swiper-container">
					<div class="swiper-wrapper">
						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=65&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
									<img src="/upload/themeupload/L65.png" alt="저작권 노하우">
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
									<img src="/upload/themeupload/L66.png" alt="저작권 노하우 (해외편)">
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
									<img src="/upload/themeupload/L72.png" alt="저작권 기초 강좌와 노하우">
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

			<div class="tema-list-box08">
				<h2 class="main_title">콘텐츠교양</h2>
				<div class="temacard08 swiper-container">
					<div class="swiper-wrapper">
<%--						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=67&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
									<img src="/upload/themeupload/L67.png" alt="창의적인 생각의 힘">
								</div>
								<div class="col-12 text_box">
									<h5>창의적인 생각의 힘</h5>
									<div class="col-12 sub_text_box">
										<span><b>2 COURSES</b></span>
										&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
									</div>
								</div>
							</a>
						</div>--%>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=95&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L95.png" alt="배리어 프리, 장벽을 허무는 콘텐츠의 힘">
								</div>
								<div class="col-12 text_box">
									<h5>배리어 프리, 장벽을 허무는 콘텐츠의 힘</h5>
									<div class="col-12 sub_text_box">
										<span class="tag new" style="margin-bottom: 0; margin-right: 10px;">NEW</span>
										<span><b>16 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=96&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L96.png" alt="2023 콘텐츠 스텝업X플러스 현장 강의">
								</div>
								<div class="col-12 text_box">
									<h5>2023 콘텐츠 스텝업X플러스 현장 강의</h5>
									<div class="col-12 sub_text_box">
										<span class="tag new" style="margin-bottom: 0; margin-right: 10px;">NEW</span>
										<span><b>6 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=97&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									<%--<img src="${result.img }" alt="${result.title }">--%>
									<img src="/upload/themeupload/L97.png" alt="2022 콘텐츠 플러스 현장 강의">
								</div>
								<div class="col-12 text_box">
									<h5>2022 콘텐츠 플러스 현장 강의</h5>
									<div class="col-12 sub_text_box">
										<span class="tag new" style="margin-bottom: 0; margin-right: 10px;">NEW</span>
										<span><b>4 COURSES</b></span>
										<%--<span class="h_desc5">조회수 1.2만</span>--%>
									</div>
								</div>
							</a>
						</div>

						<%--<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=64&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
									<img src="/upload/themeupload/L64.png" alt="콘텐츠 제작 필수 강좌">
								</div>
								<div class="col-12 text_box">
									<h5>콘텐츠 제작 필수 강좌</h5>
									<div class="col-12 sub_text_box">
										<span><b>8 COURSES</b></span>
										&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
									</div>
								</div>
							</a>
						</div>--%>

						<%--<div class="sub_theme_process_list swiper-slide">
							<a href='/edu/onlineEdu/themeLecture/view.do?pId=57&menuNo=500157&pageIndex=1'>
								<div class="col-5 img_box">
									&lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
									<img src="/upload/themeupload/L57.png" alt="콘텐츠 제작 기초 강좌">
								</div>
								<div class="col-12 text_box">
									<h5>콘텐츠 제작 기초 강좌</h5>
									<div class="col-12 sub_text_box">
										<span><b>12 COURSES</b></span>
										&lt;%&ndash;<span class="h_desc5">조회수 1.2만</span>&ndash;%&gt;
									</div>
								</div>
							</a>
						</div>--%>

						<%--
                                                    <div class="sub_theme_process_list swiper-slide">
                                                        <a href='/edu/onlineEdu/themeLecture/view.do?pId=69&menuNo=500157&pageIndex=1'>
                                                            <div class="col-5 img_box">
                                                                &lt;%&ndash;<img src="${result.img }" alt="${result.title }">&ndash;%&gt;
                                                                <img src="/upload/themeupload/69_368_230.png" alt="슬기로운 문화생활">
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
                        --%>

					</div>
				</div>

				<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
				<div class="swiper_btn_box">
					<div><button type="button" class="swiper-button-prev" title="이전 배너보기"></button></div>
					<div><button type="button" class="swiper-button-next" title="다음 배너가기"></button></div>
				</div>

			</div>

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
