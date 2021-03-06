<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="kr.co.unp.cmm.sec.ram.service.impl.UnpUserDetailsHelper" %>
<%@ page import="kr.co.unp.member.vo.*" %>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import="java.util.*" %>
<%@ page import="kr.co.unp.mpm.vo.MenuManageVO"%>
<%@ page import="kr.co.unp.mpm.service.MasterMenuManager"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.unp.co.kr/util" prefix="util" %>

<%
	UsersVO user = UnpUserDetailsHelper.getAuthenticatedUser();
	pageContext.setAttribute("userVO", user);

	String menuNo = request.getParameter("menuNo");
	if( StringUtils.hasText(menuNo) ) {

		org.springframework.context.ApplicationContext context =
		org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		MasterMenuManager masterMenuManagerService = (MasterMenuManager)context.getBean("masterMenuManagerService");

		HashMap<String, List<MenuManageVO>> menuMap = (HashMap<String, List<MenuManageVO>>)application.getAttribute("menuAll6");
		MenuManageVO currentVo = masterMenuManagerService.getCurrentMenu(menuMap, Integer.parseInt(menuNo));
		pageContext.setAttribute("currMenu", currentVo);

		String position = currentVo.getPosition();
		int depth01 = Integer.parseInt(position.substring(0,2)) -1;
		int depth02 = Integer.parseInt(position.substring(2,4)) -1;
		int depth03 = Integer.parseInt(position.substring(4,6)) -1;
		int depth04 = Integer.parseInt(position.substring(6,8)) -1;
		int depth05 = Integer.parseInt(position.substring(8,10)) -1;
		pageContext.setAttribute("depth01", depth01);
		pageContext.setAttribute("depth02", depth02);
		pageContext.setAttribute("depth03", depth03);
		pageContext.setAttribute("depth04", depth04);
		pageContext.setAttribute("depth05", depth05);
	}
%>
<c:set var="userVO" value="${userVO }" scope="request" />


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1, maximum-scale=3, minimum-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>????????????????????? ??????</title>
<!-- <link rel="stylesheet" type="text/css" href="/js/bootstrap/css/bootstrap.min.css"/> -->
<link rel="stylesheet" type="text/css" href="/edumobile/css/animate.min.css" />
<link rel="stylesheet" type="text/css" href="/edumobile/css/common.css"  />
<link rel="stylesheet" type="text/css" href="/edumobile/css/layout.css"  />
<link rel="stylesheet" type="text/css" href="/edumobile/css/main.css"  />
<link rel="stylesheet" type="text/css" href="/edu/css/bm/sub.css"  />
<link rel="stylesheet" href="/edu/js/bm/swiper/swiper.min.css"/>
<link rel="stylesheet" type="text/css" href="/edu/css/bm/wevenResponsive.css"  />
<link rel="stylesheet" type="text/css" href="/edu/css/common.css"  />
<link rel="stylesheet" type="text/css" href="/edu/css/bm/common.css"  />
<link rel="stylesheet" type="text/css" href="/edu/css/bm/main.css"  />
<link rel="stylesheet" type="text/css" href="/edu/css/bm/sub_layout.css"  />
<link rel="stylesheet" type="text/css" href="/edu/css/bm/sub_page.css"  />

<!-- ????????? ?????? -->
<link rel="stylesheet" type="text/css" href="/edu/css/new/testbed_footer.css"/>
<!-- ????????? ?????? ??? -->

<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript"  src="/js/jquery.carouFredSel-6.2.1-packed.js"></script>
<!-- <script type="text/javascript" src="/edumobile/js/common.js"></script> -->
<script type="text/javascript"> subMenuOpenIng=true; </script>
<!-- <script type="text/javascript" src="/js/bootstrap/bootstrap.min.js"></script> -->

<script type="text/javascript" src="/js/jquery.sticky.js"></script>
<script type="text/javascript" src="/js/jquery.scrollTo.min.js"></script>
<script type="text/javascript" src="/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="/js/jquery.appear.js"></script>
<script type="text/javascript" src="/js/modernizr.min.js"></script>
<script type="text/javascript" src="/edumobile/js/main.js"></script>
<script type="text/javascript" src="/edumobile/js/common.js"></script>
<script type="text/javascript" src="/edumobile/js/sub.js"></script>
<script type="text/javascript" src="/edumobile/js/bm/bm.js"></script>
<script type="text/javascript" src="/edumobile/js/bm/sub.js"></script>
<script type="text/javascript" src="/edumobile/js/bm/swiper/swiper.min.js"></script>
<script type="text/javascript" src="/edumobile/js/bm/rollingEvent.js"></script>
<script type="text/javascript" src="/edumobile/js/bm/main.js"></script>
</head>

<body>
<div class="wrapper sub_multi_content_testbed_main contents_view_page">
    <!-- header -->
    <div class="col-12 header_wrap">
       	<!--GNBhead-->

       	<div class="col-12 col-center mw-1200 over-visible header_inner">
    <div class="col-12 pr15 pl15">
        <div class="col-12 header_con">
            <div class="col-12 col-center mw-1200 over-visible">
                <div class="col-12 pr15 pl15">
                    <!-- gnb ??????! -->
                    <div class="col-12 pt27 pb22 header_section mobile_header_section">
                    <!-- ????????? Util ?????? -->
	                        <div class="fl fontsize0 header_util_wrap">
							  <div class="show vm header_util_text_con">
							    <sec:authorize ifAnyGranted="ROLE_USER">
							      <%-- <c:if test="${paramVO.siteName eq 'edu' }">
							        <c:set var="mypageNm" value="???????????????" />
							        <c:set var="mypageUrl" value="/edu/onlineEdu/mylctrum/list.do?menuNo=500061" />
							      </c:if>
							      <c:if test="${paramVO.siteName eq 'testbed' }">
							        <c:set var="mypageNm" value="???????????????" />
							        <c:set var="mypageUrl" value="/testbed/userMember/forUpdate.do?menuNo=700118" />
							      </c:if>
							      <span class="show vm fontsize14 header_util_item">
							        <span class="name_color">
							          <c:out value="${userVO.userNm }"/>
							        </span>??? ?????????????????????.
							      </span>
							      <hr class="show vm header_util_line"> --%>
							      <span class="show vm fontsize14 header_util_item">
							      	<a href="/${paramVO.siteName}/member/logout.do?siteName=testbed" class="ico4 logoutBtn" title="????????????"><img src="/edu/images/bm/mobile_logout_btn.png" alt="????????????" title="????????????" />
							      	</a>
							      </span>
							      <%-- <hr class="show vm header_util_line">
							      <span class="show vm fontsize14 header_util_item" style="position:relative;" id="myPageMenu">
							        <a href="${mypageUrl}" class="ico5" title="${mypageNm}">
							          <!-- <img src="/edu/images/edupro/icon_mypage.png" alt="???????????????" title="???????????????" style="position:absolute;top:0px;" /> -->
							          <span>${mypageNm}
							          </span>
							        </a>
							        <!-- ????????? ?????? -->
							        <div class="mypageSubLayer">
							          <p style="text-align:left;line-height:24px;">
							            <span style="color:#000;font-weight:600;">[???????????????]
							            </span>
							            <br>???????????? ?????? :
							            <span id="studyCount">0
							            </span>???
							          </p>
							        </div>
							        <!-- //????????? ?????? -->
							      </span>
							      <hr class="show vm header_util_line"> --%>
							      <script type="text/javascript">
							        var selectCount = false;
							        $(document).ready(function(){
							          $('#myPageMenu').mouseover(function(){
							            showMypageLayer('IN');
							          }
							                                    );
							          $('#myPageMenu').mouseout(function(){
							            showMypageLayer('OUT');
							          }
							                                   );
							          $('.mypageSubLayer').mouseout(function(){
							            showMypageLayer('OUT');
							          }
							                                       );
							          getMyStudyCount();
							        }
							                         );
							        function showMypageLayer(type){
							          if(type == "IN"){
							            if(!selectCount){
							              selectCount = true;
							              getMyStudyCount();
							            }
							            $('.mypageSubLayer').show();
							          }
							          else{
							            $('.mypageSubLayer').hide();
							          }
							        }
							        function getMyStudyCount(){
							          $.ajax({
							            url : '/edu/onlineEdu/mylctrum/selectMyStudyCount.json',
							            dataType : 'json',
							            data : null,
							            success : function(data) {
							              $('.mypageSubLayer').find('#studyCount').html(data.studyCount);
							            }
							          }
							                );
							        }
							      </script>
							      <%--
							           ???????????? ??????????????? ?????? 2016.04.29
							           <c:if test="${userVO.mentoYn eq 'Y' }">
							      <li>
							        <a href="https://dream.kocca.kr/sso_intranet.do?ssotoken=${userVO.ssotoken}" class="ico6" title="????????????">????????????
							        </a>
							      </li>
							      </c:if>
							    --%>
							    </sec:authorize>
							    <sec:authorize ifNotGranted="ROLE_USER">
								    <c:url var="loginUrl" value="/${paramVO.siteName}/member/forLogin.do">
								      <c:param name="menuNo" value="600130" />
								      <c:param name="siteName" value="testbed" />
								      <c:param name="_targetUrl" value="${_targetUrl}" />
								    </c:url>
							    <span class="show vm fontsize14 header_util_item">
							      <a href="javascript:document.getElementById('loginForm').submit();" class="ico1" title="?????????"><img src="/edu/images/bm/mobile_login_btn.png" alt="?????????" title="?????????" />
							      </a>
							    </span>
							    <form class="login_form" name="loginForm" id="loginForm" action="/edumobile/member/forLogin.do?menuNo=600130" method="post" style="display:none;">
								</form>
							    <hr class="show vm header_util_line">
							    <!-- <span class="show vm fontsize14 header_util_item"><a href="/edumobile/member/join01.do?menuNo=600129" class="ico2" title="????????????">????????????</a></span>
							<hr class="show vm header_util_line"> -->
							  </sec:authorize>
							  <!-- <span class="show vm fontsize14 header_util_item">
							    <a href="/edu/main/contents.do?menuNo=500074" class="ico3" title="????????????">????????????
							    </a>
							  </span>
							  <span class="bgn">
							    <a href="/edu/main/contents.do?menuNo=500074" class="ico3" title="????????????">????????????
							    </a>
							  </span> -->
							</div>
							<!-- <div class="show vm header_util_icon_con">
							  <span class="show header_util_icon_item">
							    <a href="https://www.facebook.com/edukocca" target="_blank">
							      <img src="/edu/images/bm/facebook_icon.png" alt="???????????? ????????????">
							    </a>
							  </span>
							  <span class="show header_util_icon_item">
							    <a href="https://twitter.com/edukocca" target="_blank">
							      <img src="/edu/images/bm/twitter_icon.png" alt="????????? ????????????">
							    </a>
							  </span>
							  <span class="show header_util_icon_item">
							    <a href="http://blog.naver.com/koccaedu" target="_blank">
							      <img src="/edu/images/bm/blog_icon.png" alt="????????? ????????????">
							    </a>
							  </span>
							</div> -->
							</div>
							<div class="show vm header_language_select_con">
								<label for="header_language_select_mobile">????????????</label>
	                        	<select class="header_language_select mobile_only" id="header_language_select_mobile">
	                        		<option value="/edumobile/main/main.do?siteName=testbed&menuNo=600125">KOR</option>
	                        		<option value="/testbedeng/main/main.do">ENG</option>
	                        	</select>
	                        	<label for="header_language_select_web">????????????</label>
	                        	<select class="header_language_select web_only" id="header_language_select_web">
	                        		<option value="/testbed/main/main.do?siteName=testbed">KOR</option>
	                        		<option value="/testbedeng/main/main.do">ENG</option>
	                        	</select>
	                        </div>
	                        <script type="text/javascript">
								$(".header_language_select").on("change", function(){
								    if( this.value == "" ) return;
								    else window.location.href = this.value;
								})
							</script>
	                        <!-- //?????????Util ?????? -->
                        <!-- ?????? -->
                        <!-- <h1 class="logo"><a href="/edu/main/main.do"><span class="hidden">KOCCA(Create NeWave) ??????????????????????????? (???????????? ??????, ???????????? ?????????!)</span></a></h1> -->
                       <!--  <h1 class="show logo_con">
                           	<a href="/edumobile/main/main.do?siteName=testbed" class="show"><img src="/edu/images/bm/multi_content_testbed_logo.png" alt="KOCCA ????????????????????? Multi Content Testbed ??????"></a>
                        </h1> -->
                        <h1 class="show logo_con">
								<a href="/edumobile/main/main.do" class="show"><img style="width: 120px;" src="/edu/new_image/w_logo.png" alt="KOCCA(Create NeWave) ??????????????????????????? (???????????? ??????, ???????????? ?????????!)"></a>
								&nbsp;&nbsp;
								<a href="/edumobile/main/main.do?siteName=testbed" class="show"><img style="width: 100px;" src="/edu/images/bm/multi_content_testbed_logo.png" alt="KOCCA(Create NeWave) ????????????????????? (???????????? ??????, ???????????? ?????????!)"></a>
						</h1>
                        <!-- gnb -->
                        <c:set var="topCategories" value="${menuAll5['menu_0']}" />

                        <div class="over-md-hidden tr gnb_wrap">
	    							<c:set var="topCategories" value="${menuAll6['menu_0']}" />
								    <ul class="fontsize0 gnb_con">
									<c:set var="d02MenuNm" value="${pathData[0] }" />
									<c:forEach var="x" begin="0" end="4">
										<c:if test="${topCategories[x].menuNo eq curD01.menuNo}">
											<c:set var="depthMenuNm" value="${topCategories[x].menuNm}" />
										</c:if>

										<li class="tms${x+1} ${topCategories[x].menuNo eq curD01.menuNo ? 'on' : ''}"><a href="#">${topCategories[x].menuNm}</a>
											<c:set var="d02MenuKey" value="menu_${topCategories[x].menuNo}" />
											<c:set var="d02Categories" value="${menuAll6[d02MenuKey]}" />
											<c:set var="curD02" value="${curD02Categories[depth02]}" />
											<c:if test="${fn:length(d02Categories)>0}">
											<ul>
												<c:forEach var="y" begin="0" end="${fn:length(d02Categories)-1}">
													<li ${d02Categories[y].menuNo eq curD02.menuNo ? 'class="on"' : ''}><a href="${d02Categories[y].fullMenuLink}" ${d02Categories[y].menuPopupYn eq 'Y' ? 'target="_blank"  title="??? ????????? ??????"' : ''} tabindex="4">${d02Categories[y].menuNm}</a>
													<c:set var="d03MenuKey" value="menu_${d02Categories[y].menuNo}" />
													<c:set var="d03Categories" value="${menuAll6[d03MenuKey]}" />
													<c:set var="curD03" value="${curD03Categories[depth03]}" />
													<c:if test="${fn:length(d03Categories)>0}">
													<ul class="gnbD3">
														<c:forEach var="z" begin="0" end="${fn:length(d03Categories)-1}">
														<c:if test="${d03Categories[z].menuNo ne '600033' && d03Categories[z].menuNo ne '600034'}">
															<li data-menuNo='${d03Categories[z].menuNo}' data-currMenuNo='${curD03.menuNo}'  ${d03Categories[z].menuNo eq curD03.menuNo ? 'class="on"' : ''}>
																<a href="${d03Categories[z].fullMenuLink}" ${d03Categories[z].menuPopupYn eq 'Y' ? 'target="_blank"  title="??? ????????? ??????"' : ''} tabindex="4">${d03Categories[z].menuNm}</a>
															</li>
														</c:if>
														</c:forEach>
													</ul>
													</c:if>
													</li>
												</c:forEach>
											</ul>
											</c:if>
										</li>
									</c:forEach>
								    </ul>
								    <div class="fr fontsize0 pt7 gnb_util_con">
    									<hr class="show vm seperate_line">
    									<span class="show vm gnb_icon">
							              <button class="gnb_menu">????????????</button>
							              <button class="gnb_close">???????????? ??????</button>
							            </span>
			    					</div>
			    				</div>

                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 gnb_dim"></div>
        <div class="col-12 search_dim"></div>
    </div>
</div>

        <!--//GNBhead-->

        <div class="swiper-container" id="mainVisual">
            <div class="swiper-wrapper">

            <c:forEach var="mainConcertImg" items="${mainConcertImgList}" varStatus="status">
		        <c:set value="${fileMap[mainConcertImg.atchFileId] }" var="fileList" />
				<c:set var="file" value=""/>
				<c:forEach var="files" items="${fileList}">
					<c:if test="${files.fileFieldName eq 'mainImg'}">
						<c:set  var="file" value="${files}"/>
					</c:if>
				</c:forEach>

				<c:if test="${not empty file }">
                    <div class="main_visual swiper-slide testbed_visual" style="background-image: url('/cmm/fms/getImage.do?atchFileId=${file.atchFileId}&amp;fileSn=${file.fileSn}');">
                    <div class="col-12 col-center mw-1200">
                        <div class="col-12 pr15 pl15">
                            <div class="col-12 tc visual_wrap">
                                <div class="col-12 visual_text_wrap">
                                    <h2>
                                        ${mainConcertImg.concertTitle}
                                   </h2>
                                   <p class="h_desc2">${mainConcertImg.concertStartDate} ~ ${mainConcertImg.concertEndDate}</p>
                                   <div class="more_btn_con">
                                        <a href="/${paramVO.siteName}/concert/info/view.do?concertId=${mainConcertImg.concertId}&menuNo=600137&listType=2" class="show more_btn2">????????????</a>
                                   </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="main_visual_img"></div>
                </div>
                </c:if>
           </c:forEach>

                <div class="main_visual swiper-slide testbed_visual" style="background-image: url('/edu/images/bm/testbed_visual_img_003.jpg');">
                    <div class="col-12 col-center mw-1200">
                        <div class="col-12 pr15 pl15">
                            <div class="col-12 tc visual_wrap">
                                <div class="col-12 visual_text_wrap">
                                    <h2>
                                       ???????????? ??????
                                    </h2>
                                    <p class="h_desc2">
                                    	????????? ???????????? ?????? ??????????????? ???????????? ?????? ????????? ????????? ????????????,<br/>
										????????? ????????? ??? ????????? ????????? ????????? ????????????.
									</p>
                                    <div class="more_btn_con">
                                        <a href="/${paramVO.siteName}/bbs/B0000061/view.do?nttId=72440&menuNo=700005" class="show more_btn2">????????????</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="main_visual_img"></div>
                </div>

				<div class="main_visual swiper-slide testbed_visual" style="background-image: url('/edu/images/bm/testbed_visual_img_008.jpg');">
                    <div class="col-12 col-center mw-1200">
                        <div class="col-12 pr15 pl15">
                            <div class="col-12 tc visual_wrap">
                                <div class="col-12 visual_text_wrap">
                                    <h2>
                                        ?????????????????????
                                   </h2>
                                   <p class="h_desc2">????????? ?????? ???????????? ???????????? ??????,<br/> ???????????? ????????????????????? ????????? ????????????</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="main_visual_img"></div>
                </div>

                <div class="main_visual swiper-slide testbed_visual" style="background-image: url('/edu/images/bm/testbed_visual_img_007.jpg');">
                    <div class="col-12 col-center mw-1200">
                        <div class="col-12 pr15 pl15">
                            <div class="col-12 tc visual_wrap">
                                <div class="col-12 visual_text_wrap">
                                    <h2>
                                        ????????????
                                    </h2>
                                    <p class="h_desc2">????????????66, ??????66, ???????????? 1&2</p>
                                    <div class="more_btn_con">
                                        <a href="/${paramVO.siteName}/main/contents.do?menuNo=700103" class="show more_btn2">????????????</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="main_visual_img"></div>
                </div>

            </div>
        </div>

        <!-- <div class="swiper-container" id="mainVisual">
            <div class="swiper-wrapper">

				<div class="main_visual swiper-slide testbed_visual titus_mobile_visual_position" style="background-image: url('/edu/images/bm/testbed_visual_img_006.jpg');">
                    <div class="col-12 col-center mw-1200">
                        <div class="col-12 pr15 pl15">
                            <div class="col-12 tc visual_wrap">
                                <div class="col-12 visual_text_wrap">
                                    <h2>
                                        ????????????
                                   </h2>
                                   <p class="h_desc2">2017.10.18 ~ 2017.10.20 / 10.21<br/>
                                    ???, ???, ??? 8:00pm / ??? 3:00pm, 7:00pm</p>
                                    <div class="more_btn_con">
                                        <a href="/edumobile/main/contents.do?menuNo=600120&showViewNo=04" class="show more_btn2">????????????</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="main_visual_img"></div>
                </div>

				<div class="main_visual swiper-slide testbed_visual" style="background-image: url('/edu/images/bm/testbed_visual_img_003.jpg');">
                    <div class="col-12 col-center mw-1200">
                        <div class="col-12 pr15 pl15">
                            <div class="col-12 tc visual_wrap">
                                <div class="col-12 visual_text_wrap">
                                    <h2>
                                        ?????????????????????
                                   </h2>
                                   <p class="h_desc2">????????? ?????? ???????????? ???????????? ??????,<br/> ???????????? ????????????????????? ????????? ????????????</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="main_visual_img"></div>
                </div>

                <div class="main_visual swiper-slide testbed_visual" style="background-image: url('/edu/images/bm/testbed_visual_img_007.jpg');">
                    <div class="col-12 col-center mw-1200">
                        <div class="col-12 pr15 pl15">
                            <div class="col-12 tc visual_wrap">
                                <div class="col-12 visual_text_wrap">
                                    <h2>
                                        ????????????
                                    </h2>
                                    <p class="h_desc2">????????????66, ??????66, ????????? 1&2</p>
                                    <div class="more_btn_con">
                                        <a href="/edumobile/main/contents.do?menuNo=600118" class="show more_btn2">????????????</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="main_visual_img"></div>
                </div>

            </div>
        </div> -->
        <div class="col-12 col-center mw-1740 visual_inner">
            <button class="visual_arrow left"><img src="/edu/images/bm/visual_rolling_left_arrow.png" alt="?????? ????????? ??????"></button>
            <button class="visual_arrow right"><img src="/edu/images/bm/visual_rolling_right_arrow.png" alt="?????? ????????? ??????"></button>
        </div>
        <div class="tc mt30 fontsize0 caroufredusel_rolling_btn_con main_top_rolling_icon">
            <span class="show vm rolling_btn active"></span>
            <span class="show vm rolling_btn"></span>
            <span class="show vm rolling_btn"></span>
        </div>
		<a href="javascript:void(0)" class="rolling_stop_icon">
			<img src="/edu/images/bm/main_rolling_stop_icon.png" alt="??????">
		</a>
		<a href="javascript:void(0)" class="rolling_start_icon">
			<img src="/edu/images/bm/main_rolling_start_icon.png" alt="??????">
		</a>
        <script type="text/javascript">

	        function onAttrChangeTestbed(){
	        	$('#mainVisual .swiper-slide').attr('aria-hidden', 'true');
	        	$('#mainVisual .swiper-slide-active').attr('aria-hidden', 'false');
	        }


            $(function(){
                var swip = new Swiper("#mainVisual", {
                    loop : true
                    ,direction: 'horizontal' // ???????????? ??????????????? ??????(vertical?????? ???????????? ?????????)
                    ,slidesPerView: 1 // ????????? ????????? ???????????? ??????
                    ,spaceBetween: 0 // ???????????? ????????? ?????? px ??????
                    ,mousewheelControl: false // ????????? ?????? ???????????? ?????????
                    ,paginationHide: true
                    ,autoHeight:true
                    ,speed : 500
                    ,autoplay:3500
                    ,nextButton: '.visual_arrow.right'
                    ,prevButton: '.visual_arrow.left'
                    ,pagination: '.main_top_rolling_icon'
                    ,bulletActiveClass: 'active'
                    ,autoplayDisableOnInteraction: false
                    ,paginationBulletRender: function (swiper, index, className) {
                        return '<span class="show vm rolling_btn '+className+'"></span>';
                    }
	                ,onSlideChangeEnd : function(swiper){
	//        	        var i = geSlideDataIndex(swiper);
	        	    }
	        	    ,onSlideChangeStart : function(swiper){
	        	    	onAttrChangeTestbed();
	        	    }

                });

				$(".contents_view_page .rolling_stop_icon").on('click', function(){
					swip.stopAutoplay();
				});

				$(".contents_view_page .rolling_start_icon").on('click', function(){
					swip.startAutoplay();
				});
            });
        </script>
        <div class="col-12 col-center mw-1200 list_search_wrap">
            <div class="col-12 pr15 pl15">
                <div class="more_btn_wrap">
                    <a class="more_btn" href="/edumobile/concert/info/list.do?menuNo=600137">
                        <span>????????? ?????????</span>
                    </a>
                </div>
                <hr class="list_search_line">
                <div class="list_search_con">
                    <p class="title">
                        ??????????????? ??????
                    </p>
                    <form name="searchForm" id="searchForm" action="/${paramVO.siteName}/concert/info/list.do?menuNo=600137" method="post">
					    <input type="hidden" name="menuNo" value="600137" />
					    <input type="hidden" name="pageIndex"  value="1"/>
					    <input type="hidden" name="listType"  value="2"/>
					    <input type="hidden" name="siteId"  value="edumobile"/>
					    <input type="hidden" name="selectedDate"  value=""/>

	                    <div class="data_list_box">
		                    <!-- <div class="data_list_wrap">
		                    	<div class="data_list_con">
			                        <span class="web_input_image">
				                        <input type="image" class="calender_btn" src="/edu/images/bm/calender_btn.png">
				                        <label for=""></label>
			                        </span>
			                        <span class="mobile_input_image">
				                        <input type="image" class="calender_btn" src="/edu/images/bm/calender_btn_mobile.png">
				                        <label for=""></label>
			                        </span>
			                        <input type="text" class="calender_text">
			                        <label for=""></label>
		                        </div>
		                    </div> -->
		                    <div class="data_list_con year">
	                    		<span class="web_input_image">
			                        <input type="image" class="calender_btn is_bg_on" src="/edu/images/bm/calender_btn_w.png" title="???????????? ???????????? ?????? ???/?????? ?????? ??????" alt="???????????? ???????????? ?????? ???/?????? ?????? ??????">
		                        </span>
		                        <span class="mobile_input_image">
			                        <input type="image" class="calender_btn is_bg_on" src="/edu/images/bm/calender_btn_w_mobile.png" title="???????????? ???????????? ?????? ???/?????? ?????? ??????" alt="???????????? ???????????? ?????? ???/?????? ?????? ??????">
		                        </span>
		                        <label for="searchConcertYear" class="back_label" aria-hidden="false">???????????? ?????? ?????? ??????</label>
		                        <select id="searchConcertYear" name="selectedYear" class="main_calendar_select" title="???????????? ?????? ?????? ??????">
		                        	<option value="2018">
		                        		2018???
		                        	</option>
		                        	<option value="2017">
		                        		2017???
		                        	</option>
		                        </select>
	                        </div>
	                        <%
	                        Calendar gCal = Calendar.getInstance();
	                		gCal.setTime(new Date());
	                		int cur_year = gCal.get(Calendar.YEAR);
	                		int cur_month = gCal.get(Calendar.MONTH)+1;
	                        %>
	                    	<div class="data_list_con">
	                    		<span class="web_input_image">
			                        <input type="image" class="calender_btn is_bg_on" src="/edu/images/bm/calender_btn_w.png" title="???????????? ???????????? ?????? ???/?????? ?????? ??????" alt="???????????? ???????????? ?????? ???/?????? ?????? ??????">
		                        </span>
		                        <span class="mobile_input_image">
			                        <input type="image" class="calender_btn is_bg_on" src="/edu/images/bm/calender_btn_w_mobile.png" title="???????????? ???????????? ?????? ???/?????? ?????? ??????" alt="???????????? ???????????? ?????? ???/?????? ?????? ??????">
		                        </span>
		                        <label for="searchConcertMonth" class="back_label" aria-hidden="false">???????????? ??? ?????? ??????</label>
		                        <select id="searchConcertMonth" name="selectedMonth" class="main_calendar_select" title="???????????? ??? ?????? ??????">
		                        	<option value="">
		                        		??????
		                        	</option>
		                        	<option value="12" <%= cur_month == 12 ? "selected" : "" %>>
		                        		12???
		                        	</option>
		                        	<option value="11" <%= cur_month == 11 ? "selected" : "" %>>
		                        		11???
		                        	</option>
		                        	<option value="10" <%= cur_month == 10 ? "selected" : "" %>>
		                        		10???
		                        	</option>
		                        	<option value="9" <%= cur_month == 9 ? "selected" : "" %>>
		                        		9???
		                        	</option>
		                        	<option value="8" <%= cur_month == 8 ? "selected" : "" %>>
		                        		8???
		                        	</option>
		                        	<option value="7" <%= cur_month == 7 ? "selected" : "" %>>
		                        		7???
		                        	</option>
		                        	<option value="6" <%= cur_month == 6 ? "selected" : "" %>>
		                        		6???
		                        	</option>
		                        	<option value="5" <%= cur_month == 5 ? "selected" : "" %>>
		                        		5???
		                        	</option>
		                        	<option value="4" <%= cur_month == 4 ? "selected" : "" %>>
		                        		4???
		                        	</option>
		                        	<option value="3" <%= cur_month == 3 ? "selected" : "" %>>
		                        		3???
		                        	</option>
		                        	<option value="2" <%= cur_month == 2 ? "selected" : "" %>>
		                        		2???
		                        	</option>
		                        	<option value="1" <%= cur_month == 1 ? "selected" : "" %>>
		                        		1???
		                        	</option>
		                        </select>
	                        </div>
	                    	<div class="data_list_con search">
	                    		<div class="data_search_text_box">
			                        <input type="text" class="search_text" name="searchKeyword" id="searchConcertTitle" placeholder="??????????????? ?????? ??????" title="???????????? ???????????????" alt="???????????? ???????????????">
	                    			<label for="searchConcertTitle" class="back_label" aria-hidden="false">???????????? ????????? ??????</label>
			                        <span class="web_input_image">
				                        <input type="image" class="search_btn" src="/edu/images/bm/search_btn.png" value="??????????????? ?????? ?????? ??????" alt="??????????????? ?????? ?????? ??????">
			                        </span>
			                        <span class="mobile_input_image">
				                        <input type="image" class="search_btn" src="/edu/images/bm/search_btn_mobile.png" title="???????????? ???????????? ?????? ???/?????? ?????? ??????" alt="???????????? ???????????? ?????? ???/?????? ?????? ??????">
			                        </span>
		                        </div>
	                        </div>
	                    </div>
                    </form>
                    <script type="text/javascript">

                    $(function(){
                    	$("#searchForm").submit( function(e){
//                     		e.preventDefault();

//                     		if( $("#searchConcertMonth").val() == 0 ){

//                     		}
                    	})
                    })
                    </script>
                    <!-- <div class="data_list_box">
	                    <div class="data_list_wrap">
	                    	<div class="data_list_con">
		                        <span class="web_input_image">
			                        <input type="image" class="calender_btn" src="/edu/images/bm/calender_btn.png">
			                        <label for=""></label>
		                        </span>
		                        <span class="mobile_input_image">
			                        <input type="image" class="calender_btn" src="/edu/images/bm/calender_btn_mobile.png">
			                        <label for=""></label>
		                        </span>
		                        <input type="text" class="calender_text">
		                        <label for=""></label>
	                        </div>
	                    </div>
	                    <div class="data_list_wrap">
	                    	<div class="data_list_con">
	                    		<span class="web_input_image">
			                        <input type="image" class="calender_btn is_bg_on" src="/edu/images/bm/calender_btn_w.png">
			                        <label for=""></label>
		                        </span>
		                        <span class="mobile_input_image">
			                        <input type="image" class="calender_btn is_bg_on" src="/edu/images/bm/calender_btn_w_mobile.png">
			                        <label for=""></label>
		                        </span>
		                        <input type="text" class="calender_text">
		                        <label for=""></label>
	                        </div>
	                    </div>
	                    <div class="data_list_wrap search">
	                    	<div class="data_list_con">
	                    		<div class="data_search_text_box">
			                        <input type="text" class="search_text" placeholder="??????????????? ?????? ??????">
			                        <label for=""></label>
			                        <span class="web_input_image">
				                        <input type="image" onclick="javascript:alert('????????? ????????? ?????????.');" class="search_btn" src="/edu/images/bm/search_btn.png">
				                        <label for=""></label>
			                        </span>
			                        <span class="mobile_input_image">
				                        <input type="image" onclick="javascript:alert('????????? ????????? ?????????.');" class="search_btn" src="/edu/images/bm/search_btn_mobile.png">
				                        <label for=""></label>
			                        </span>
		                        </div>
	                        </div>
	                    </div>
                    </div> -->
                </div>
            </div>
        </div>


	</div>
    <!-- //contents -->





	<!-- ????????????, ??????????????? -->
    <%-- <div class="col-12 section contents_section">
        <div class="col-12 col-center mw-1200">
            <div class="col-12 pr15 pl15 contents_wrap">
                <div class="col-12 col-md-6 contents_left_box">
                    <div class="col-12 notice_wrap">
                        <div class="col-12 mb15 section_header">
                            <h4 class="fl">????????????</h4>
                            <a href="/testbed/bbs/B0000061/list.do?menuNo=700112" class="show fr mt7 mr-md-10 more_btn">?????????</a>
                        </div>
                        <div class="col-12 fontsize0 mb16 section_bar">
                            <hr class="h_line4">
                        </div>
                        <div class="col-12 pr-md-per10 contents_body">

                        	<c:choose>
                        		<c:when test='${ B0000061List.size() > 0 }'>
		                        	<c:forEach var="result" items="${B0000061List}" varStatus="status">
							            <c:if test="${status.index == 0}">
							                <p class="col-12 section_title new">
								                <span>
									                <a href="/testbed/bbs/<c:out value="${result.bbsId}"/>/view.do?nttId=<c:out value="${result.nttId}"/>&amp;menuNo=700112">
									                	<c:out value="${result.nttSj}"/>
									                </a>
								                </span>
							                </p>
							                <p class="col-12 mb3 section_desc4">
							                	<c:out value="${result.imgDescCn}"/>
							                </p>
							                <p class="col-12 mb11 section_date4">
							                	<c:out value="${fn:substring(result.regDate,0,10)}"/>
							                </p>
							            </c:if>
							        </c:forEach>
		                            <ul class="col-12 list_style_0">
		                            	<c:forEach var="result" items="${B0000061List}" varStatus="status">
								            <c:if test='${status.index > 0}'>
								                <li>
									                <a href="/testbed/bbs/<c:out value="${result.bbsId}"/>/view.do?nttId=<c:out value="${result.nttId}"/>&amp;menuNo=700005">
									                	<c:out value="${result.nttSj}"/>
									                </a>
								                </li>
								            </c:if>
								        </c:forEach>
		                            </ul>
                            	</c:when>
                            	<c:otherwise>
                            		<!-- ????????? ?????? ??? ?????? -->
                            		<ul class="list_style_8">
                            			<li>????????? ???????????? ????????????.</li>
                            		</ul>
                            	</c:otherwise>
                           	</c:choose>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 contents_right_box">
                    <div class="col-12 notice_wrap">
                        <div class="col-12 mb15 section_header">
                            <h4 class="fl">???????????????</h4>
                            <a href="/testbed/bbs/B0000062/list.do?menuNo=700113" class="show fr mt7 mr-md-10 more_btn">?????????</a>
                        </div>
                        <div class="col-12 fontsize0 mb16 section_bar">
                            <hr class="h_line4">
                        </div>
                        <div class="col-12 pr-md-per10 contents_body" data-zz="${B0000062List.size() }">
                        	<c:choose>
                        		<c:when test='${ B0000062List.size() > 0 }'>

		                            <c:forEach var="result" items="${B0000062List}" varStatus="status">
							            <c:if test="${status.index == 0}">
							                <p class="col-12 section_title new">
								                <span>
									                <a href="/testbed/bbs/<c:out value="${result.bbsId}"/>/view.do?nttId=<c:out value="${result.nttId}"/>&amp;menuNo=700113">
									                	<c:out value="${result.nttSj}"/>
									                </a>
								                </span>
							                </p>
							                <p class="col-12 mb3 section_desc4">
							                	<c:out value="${result.imgDescCn}"/>
							                </p>
							                <p class="col-12 mb11 section_date4">
							                	<c:out value="${fn:substring(result.regDate,0,10)}"/>
							                </p>
							            </c:if>
							        </c:forEach>
		                            <ul class="col-12 list_style_0">
		                            	<c:forEach var="result" items="${B0000062List}" varStatus="status">
								            <c:if test='${status.index > 0}'>
								                <li>
									                <a href="/testbed/bbs/<c:out value="${result.bbsId}"/>/view.do?nttId=<c:out value="${result.nttId}"/>&amp;menuNo=500008">
									                	<c:out value="${result.nttSj}"/>
									                </a>
								                </li>
								            </c:if>
								        </c:forEach>
		                            </ul>
                        		</c:when>
                        		<c:otherwise>
                        		<!-- ????????? ?????? ??? ?????? -->
                            		<ul class="list_style_8">
                            			<li>????????? ???????????? ????????????.</li>
                            		</ul>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> --%>
    <!-- //????????????, ??????????????? -->
    <!-- 2017 09 26 ?????? ????????????(???????????? ??????) -> ????????? ???????????? -->

	<!-- ????????? ?????? ??????????????? -->
    <div class="col-12 sub_section performance_hall_card_section">
        <div class="col-12 col-center mw-1200">
            <div class="col-12 pr15 pl15">
                <div class="performance_hall_card_list_wrap is-mobile">
                    <div class="col-xs-12 col-sm-4 performance_hall_card_list">
                        <div class="img_box">
                            <img src="/edu/images/bm/performance_hall_card_list_img_002.png" alt="">
                        </div>
                        <div class="text_box">
                            <h3>
                                ?????? ??? ??????
                            </h3>
                            <p class="h_desc3">
                                ???????????? ????????? ????????????<br/>
								????????? ?????? ???????????????
                            </p>
                        </div>
                        <div class="center board_util_btn_con">
                        	<a href="/edumobile/main/contents.do?menuNo=600116" class="performance_btn_style_0">????????????</a>
                        </div>
                    </div>
					<!--
                    <div class="col-sm-6 col-3 performance_hall_card_list">
                        <div class="img_box">
                            <img src="/edu/images/bm/performance_hall_card_list_img_003.png" alt="">
                        </div>
                        <div class="text_box">
                            <h3>
                                ?????? ???????????? ??????
                            </h3>
                            <p class="h_desc3">
                                ???????????? ????????? ????????????<br/>
								????????? ????????? ???????????? ??????
                            </p>
                        </div>
                         <div class="center board_util_btn_con">
                        	<a href="/edumobile/main/contents.do?menuNo=600123" class="performance_btn_style_0">????????????</a>
                        </div>
                    </div>
                    -->
                    <div class="col-xs-12 col-sm-4 performance_hall_card_list">
                        <div class="img_box">
                            <img src="/edu/images/bm/performance_hall_card_list_img_000.png" alt="">
                        </div>
                        <div class="text_box">
                            <h3>
                                ????????????
                            </h3>
                            <p class="h_desc3">
                                ????????????????????? ??? ?????????<br/>
								??????????????? ????????? ??????????????????
                            </p>
                        </div>
                        <div class="center board_util_btn_con">
                        	<a href="/edumobile/main/contents.do?menuNo=600121" class="performance_btn_style_0">????????????</a>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 performance_hall_card_list">
                        <div class="img_box">
                            <img src="/edu/images/bm/performance_hall_card_list_img_004.png" alt="">
                        </div>
                        <div class="text_box">
                            <h3>
                                ????????? ???
                            </h3>
                            <p class="h_desc3">
                                ????????? ??????????????? ?????????<br/>
								????????? ????????????
                            </p>
                        </div>
                        <div class="center board_util_btn_con">
                        	<a href="/edumobile/main/contents.do?menuNo=600119" class="performance_btn_style_0">????????????</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--//????????? ?????? ??????????????? -->



    <!-- ????????? ?????? -->
    <div class="col-12 sub_section performance_hall_section">

        <div class="col-12 col-center mw-1200">
            <div class="col-12 pr15 pl15">
                <div class="performance_hall_wrap">
                    <div class="performance_hall_header">
                        <h3>
                            ?????? ??????
                        </h3>
                    </div>
                    <div class="performance_hall_body">
                        <h4>
                            ?????? ??????
                        </h4>
                        <p class="h_desc4">
                            <!-- ????????? ????????? ?????? ????????? ????????? ?????? ??? ????????? ????????????<br>
                            ???????????? ?????????  ??????????????? ??? ????????????. -->
                            ????????? ???????????? ???????????????, ??????????????? ?????????<br/>
                            ????????? ?????? ???????????? ???????????? ??? ????????????.
                        </p>
                        <p class="h_data4">
                            <span class="list">?????? : 02.6310.0626</span><span class="list">E-MAIL : <a href="mailto:yhsong@kocca.kr">yhsong@kocca.kr</a></span><span class="list">???????????? : ??? ~ ??? (10:00-18:00)</span>
                        </p>
                        <div class="download_wrap">
                            <a class="download_btn" href="/upload/testbedupload/testbedapply_2019_new.hwp">
                                <span>???????????? ????????????</span>
                            </a>
                            <a class="download_btn" href="/upload/testbed/testbedpolicy.hwp">
                                <span>???????????? ????????????</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- // ????????? ?????? -->


    <!-- ???????????? -->
    <div class="col-12 sub_section facilities_information_section">
        <div class="col-12 facilities_information_header">
        	<div class="col-12 col-center mw-1200">
        		<div class="col-12 pr15 pl15">
        			<div class="facilities_guide_con">
		        		<div class="facilities_guide_left_box">
			        		<p class="facilities_guide_title">
			        			FACILITIES GUIDE
			        		</p>
				            <h3>
				                ?????? ??????
				            </h3>
			        	</div>
			        	<div class="facilities_guide_right_box">
			        		<div class="facilities_guide_desc">
				        		???????????????????????? ????????? ???????????? ????????????66, ???????????? ???????????? ??????66,<br/>
				        		?????????????????? ????????????, ????????? ?????? ??? ????????? ????????? ????????? ?????? ????????? ?????? ????????????.
							</div>
							<div class="facilities_guide_btn_con">
								<a href="/edumobile/main/contents.do?menuNo=600118" class="facilities_more_btn">
									???????????????
								</a>
							</div>
			        	</div>
		        	</div>
	        	</div>
        	</div>
        </div>
        <div class="col-12 facilities_information_list_wrap">
            <div class="col-12 col-md-6 facilities_information_list top left">
                <div class="col-12 img_box"></div>
                <div class="col-12 text_box">
                    <h4>
                        ?????????????????????
                    </h4>
                    <p class="h_desc4">
                        ?????? : ????????? 2,700??? (??????2???, ??????2???, ????????????????????????)<br>
                        ?????? ?????? : ????????????66(193???,350???(106py)), ?????????????????? ???????????? ???
                    </p>
                </div>
            </div>
            <div class="col-12 col-md-6 facilities_information_list top right">
                <div class="col-12 img_box"></div>
                <div class="col-12 text_box">
                    <h4>
                        ????????????66_????????? ????????????
                    </h4>
                    <div class="contents_list_wrap">
                        <div class="contents_list w_263 padding_30">
                            <h5>
                                ????????????
                            </h5>
                            <hr class="h_line5">
                            <ul class="list_style_facilities">
                                <!-- <li>???????????? : ??????????????? ??????</li>
                                <li>????????? ???????????? ?????? 19m ????????? ??????</li>
                                <li>???????????? ????????? ???????????? ?????? ??????</li> -->
                                <li><span>????????????</span></li>
                                <li><span>??? 14m x ?????? 17m x ?????? 9m</span></li>
                                <li><span>?????? : ?????????, ?????????, ?????????</span></li>
                                <li><span>?????? : ??? 12m x ?????? 2.5m??? ???????????? 2??? (?????? ?????? ?????? 1m)</span></li>
                            </ul>
                        </div>
                        <div class="contents_list w_263">
                            <h5>
                                ?????? ??????
                            </h5>
                            <hr class="h_line5">
                            <ul class="list_style_facilities">
                                <!-- <li>????????? : ??? 14m x ?????? 9m x ?????? 15m</li>
                                <li>???????????? : ??? 7m x ?????? 9m x ?????? 15m</li> -->
                                <li><span>1??? 135???(?????????)</span></li>
                                <li><span>2??? 24???</span></li>
                                <li><span>3??? 34???(???????????? 2??? ??????)</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 facilities_information_list bottom left">
                <div class="col-12 img_box"></div>
                <div class="col-12 text_box">
                    <h4>
                        ??????66_???????????? ????????????
                    </h4>
                    <div class="contents_list_wrap">
                        <div class="contents_list">
                            <hr class="h_line5">
                            <ul class="list_style_facilities">
                                <li><span>?????? 5m x ?????? 12m x ?????? 4m  ?????? ????????? ????????? ??????</span></li>
                                <li><span>???????????? ??????, ????????????, ????????????</span></li>
                                <li><span>????????????, ?????????, ?????? ??? ????????? ???????????? ????????? ????????????</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 facilities_information_list bottom right">
                <div class="col-12 img_box"></div>
                <div class="col-12 text_box">
					<h4>
						???????????? 1,2
					</h4>
					<div class="contents_list_wrap">
						<div class="contents_list w_420">
							<hr class="h_line5">
							<ul class="list_style_facilities">
								<li><span>????????????1 : ?????? 11m x ?????? 5m x ?????? 3.5m</span></li>
								<li><span>????????????2 : ?????? 12m x ?????? 12m x ?????? 8m (????????? 3m)</span></li>
								<li><span>??????, ??????, ??????, ??????, ?????????, ??????, ????????? ???????????? ????????? ?????? ??????</span></li>
							</ul>
						</div>
					</div>
                </div>
            </div>
        </div>
    </div>
    <!-- //???????????? -->

    <!-- footer -->
	<jsp:include page="/WEB-INF/jsp/edumobile/inc/testbedmobileFooter.jsp" flush="true" />
    <!-- //footer -->
</div>

</body>
</html>
