<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc"%>


<ccc:constantsMap className="kr.co.unp.bbs.vo.SearchVO" var="SearchVO" />
<script type="text/javascript">
	//<![CDATA[
	$(window).ready(function() {
		$(".popUpList").click(function() {
			var url = $(this).attr("href");
			window.open(url,"주요성과관리_팝업","scrollbars=yes,width=800, height=700");
			return false;
		});

	});

	//]]>
</script>

<div class="over-hidden sub_contents_header">
	<div class="linemap_wrap"> <!-- fl class 삭제 -->
		<ul class="col-12 linemap_con">
			<li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>사업안내</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>창의인재동반</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>사업소개</span></a></li>
		</ul>
	</div>
</div>
<div class="sub_title s_tit02">
	<div class="col-center mw-1280">창의인재동반<span class="call_txt_box">문의 : 061-900-6383 / 6385</span></div>
</div>
<div class="col-center mw-1280 dream_list">
	<div class="tab_style_1_con">
		<ul class="tab_style_1 four_tab size_24">
			<li class="active"><a href="/edu/dream/mainRsltManage/list.do?menuNo=500040" title="현재탭"><span>사업소개</span></a></li>
			<li><a href="/edu/dream/pltfomList/list.do?menuNo=500117"><span>플랫폼기관</span></a></li>
			<li><a href="/edu/bbs/B0000041/list.do?menuNo=500211"><span>창의현장</span></a></li>
			<li><a href="/edu/archiveUser/contentsList.do?menuNo=500259&amp;workField=1"><span>성과아카이브</span></a></li>
		</ul>
	</div>

	<div class="edu_together_view_inner">
		<h3>콘텐츠 창의인재동반사업 소개</h3>
		<p class="view_desc">
			<span class="color_black">콘텐츠 창의인재동반사업은 대한민국 콘텐츠산업의 미래를 이끌어갈
			우수한 콘텐츠 창작자 육성을 위해 플랫폼기관의 네트워크와 콘텐츠분야 정상급 전문가(멘토)가
			창의교육생(멘티)에게 프로젝트 중심의 현장 밀착형 멘토링을 지원하는 사업입니다.</span>
		</p>
		<div class="edu_youtube_wrap">
			<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/lihO7WTTxak" frameborder="0" allowfullscreen title="2016 창의인재동반사업 소개"></iframe> -->
			<video width="100%" height="auto"  poster="https://edu.kocca.kr/upload/dream/dream_introduce_2022_ep.jpg" oncontextmenu="return false;" controls="true" controlslist="nodownload">
				<source src="https://edu.kocca.kr/upload/dream/dream_introduce_2022_ep.mp4" type="video/mp4">
			</video>
		</div>
		<div class="edu_youtube_subtitle_view_btn_con">
			<button class="edu_youtube_subtitle_view_btn caption_btn" onclick="showCaption();"><span class="edu_view_default" style="color:white">자막보기</span><span class="edu_view_active" style="color:white">자막닫기</span></button>
			<div class="edu_youtube_subtitle_view_text" tabindex="0" >
				<br/>누구나 하나씩은 마음속에 품고 있는 콘텐츠
				<br/>(멘트) 누구나 하나씩은 마음속에 품고 있는 콘텐츠가 있죠
				<br/>
				<br/>음악
				<br/>(멘트) 들을 때마다 설레는 음악
				<br/>스토리
				<br/>(멘트) 밤새는 줄 모르고 읽던 책
				<br/>영화
				<br/>(멘트) 몇 번씩 다시 봤던 영화
				<br/>(멘트) 장르와 취향은 달라도 좋은 콘텐츠가 주는 감동은 언제나 가슴 벅찹니다.
				<br/>
				<br/>좋은 콘텐츠를 위한 터전을 만든 10년
				<br/>(멘트) 우리가 지난 10년 동안 해온 일은 더 많은 사람들이 감동할 수 있는 더 좋은 콘텐츠를 창작할 수 있는 터전을 만든 것입니다.
				<br/>
				<br/>사람과 사람
				<br/>(멘트) 사람과 사람을 연결하고
				<br/>
				<br/>기술과 창의력
				<br/>(멘트) 기술과 창의력을 융합하고
				<br/>
				<br/>새로운 도전과 창조적 결합
				<br/>(멘트) 새로운 도전과 창조적 결합을 통해
				<br/>
				<br/>Creative DNA 10년
				<br/>(멘트) 우리만의 크리에이티브 DNA를 발전시켜온 10년
				<br/>젊은 인재들의 꿈을 지원하는 한국콘텐츠진흥원의 인재양성 사업이야기를 한번 들어보실래요?
				<br/>
				<br/>콘텐츠 창의인재동반사업
				<br/>
				<br/>콘텐츠 창의인재동반사업
				<br/>예비 창작자의 역량 개발에서 산업계 진출까지 원스톱 지원하는 대표 인재양성사업
				<br/>(멘트) 창의인재동반사업은 예비 창작자의 창작 역량 개발에서 산업계 진출까지 원스톱으로 지원하는 한국콘텐츠진흥원의 대표 인재양성사업입니다.
				<br/>
				<br/>검은 사제들
				<br/>멘티 : 장재현(작·감독)
				<br/>멘토 : 황병국
				<br/>(멘트) 영화 검은사제들
				<br/>
				<br/>동백꽃 필 무렵 OST
				<br/>멘티 : 유민호, 박지환(작/편곡)
				<br/>멘토 : 강동윤
				<br/>(멘트) 드라마 동백꽃 필 무렵의 OST
				<br/>
				<br/>
				<br/>여신님이 보고계셔
				<br/>멘티 : 한정석(기획·극작)
				<br/>멘토 : 조성원
				<br/>(멘트) 뮤지컬 여신님이 보고계셔와 다수의 웹툰까지, 지난 10년동안 수많은 작품들이 창의인재동반사업을 통해 탄생했습니다.
				<br/>
				<br/>대중을 매료시킨 창작역량의 비결
				<br/>(멘트) 대중을 매료시킨 창작역량의 비결
				<br/>
				<br/>창의인재동반사업만의 1:1 도제식 멘토링
				<br/>(멘트) 그것은 콘텐츠 전문가와 예비 창작자들을 이어준 창의인재동반사업만의 1:1 도제식 멘토링이었습니다.
				<br/>
				<br/>창의DNA를 구축하고 키워 온 지난 10년
				<br/>(멘트) 지난 10년동안 창의 DNA를 구축하고 키워온 인재양성지원사업
				<br/>
				<br/>새로운 콘텐츠의 창조DNA를 개척할 다음 10년
				<br/>(멘트) 이제는 앞으로 10년을 이끌 새로운 콘텐츠의 창조DNA를 개척해야할 시간
				<br/>
				<br/>세상을 놀라게 할 더 좋은 콘텐츠
				<br/>(멘트) 세대와 세대를 잇고 장르와 기술의 융합으로 세상을 놀라게 할 더 좋은 콘텐츠를 만들기 위해 한국콘텐츠진흥원 인재양성사업이 함께하겠습니다.
				<br/>
				<br/>창의 DNA 10+(로고)
				<br/>
				<br/>문화체육관광부(로고) 한국콘텐츠진흥원(로고)
				<br/>
			</div>
		</div>
	</div>

	<div class="edu_together_three_card_con" style="border-bottom:1px solid #eeeeee; margin-bottom: 30px;">
		<div class="col-12 col-md-4 edu_together_three_card_list">
			<div class="col-12">
				<div class="icon_box">
					<img src="/edu/images/bm/edu_together_icon_000.png" alt="창의교육생 멘티">
				</div>
				<div class="text_box">
					<p class="three_card_title">
						창의교육생(멘티)
					</p>
					<p class="three_card_desc">
						콘텐츠 창작의 소질과 소양을 갖춘, 플랫폼기관 및 멘토로부터
						창작실무와 노하우를 전수받고자 하는 열정 넘치는 예비창작자
					</p>
					<p style="margin-top:15px;">
						<spen style="font-size:25px; font-weight:bold; color:#01A9DB;">2,808</spen> 명
					</p>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-4 edu_together_three_card_list">
			<div class="col-12">
				<div class="icon_box">
					<img src="/edu/images/bm/edu_together_icon_001.png" alt="창의교육생 멘토">
				</div>
				<div class="text_box">
					<p class="three_card_title">
						멘토
					</p>
					<p class="three_card_desc">
						콘텐츠산업 분야의 전문가로서,
						플랫폼기관과 함께 청년인재(멘티)를
						선발, 도제식 교육을 통한 노하우 전수
					</p>
					<p style="margin-top:15px;">
						<spen style="font-size:25px; font-weight:bold; color:#01A9DB;">1,339</spen> 명
					</p>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-4 edu_together_three_card_list">
			<div class="col-12">
				<div class="icon_box">
					<img src="/edu/images/bm/edu_together_icon_002.png" alt="플랫폼 기관">
				</div>
				<div class="text_box">
					<p class="three_card_title">
						플랫폼기관
					</p>
					<p class="three_card_desc">
						소정의 심사를 거쳐 선발된 기관으로
						멘토와 멘티의 양방향 네트워크
						연계를 통해 현장형 도제식 멘토링,
						창의숙성과정을 운영하는 기관
					</p>
					<p style="margin-top:15px; padding-left:20px;">
						<spen style="font-size:25px; font-weight:bold; color:#01A9DB;">110</spen> 개
					</p>
				</div>
			</div>
		</div>
		<div style="font-size:13px; color:#A4A4A4; text-align:right; margin-right:52px; margin-bottom:25px;">
			* 2012년 ~ 2021년 누적 기준
		</div>
	</div>
	<p class="call_txt_box2">문의처 : 061-900-6383 / 6385</p>
</div>