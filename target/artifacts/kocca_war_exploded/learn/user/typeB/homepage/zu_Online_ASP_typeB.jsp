<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page isELIgnored="false" %>
<script src="/common/js/swiper/swiper.min.js"></script>
<script type="text/javascript">
	function main_search(){
		if($("#relation_site").val() == null || $("#relation_site").val() == ""){
			alert("���������� ������ �ּ���.");
			$("#relation_site").focus();
			return;
		}
		
		if($.trim($("#p_searchtext").val()) == null || $.trim($("#p_searchtext").val()) == ""){
			alert("�˻�� �Է��� �ּ���.");
			$("#p_searchtext").focus();
			return;
		}
		
		if($("#relation_site").val() == "SUBJ"){
			document.formMainSearch.p_process.value = "REQUEST";
			document.formMainSearch.action = "/servlet/controller.homepage.AspMenuMainServlet";
			document.formMainSearch.submit();
		}else{
			document.formMainSearch.p_process.value = "mainPage";
			document.formMainSearch.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
			document.formMainSearch.submit();
		}
	}
</script>
	<section>
        <div class="wrapper">
            <div class="container">
                <div class="row main_contents_searchBox">
                    <div class="col-12 col-center">
                        <div class="col-lg-6 col-md-8 col-sm-12 col-center course_search_box">
                        	<form name="formMainSearch" method="POST">
                        		<input type="hidden" name="p_process" value="" />
                        		<input type="hidden" name="p_lecture_cls" value="<c:out value="${param.p_lecture_cls eq '' || param.p_lecture_cls eq null? 'ALL' : param.p_lecture_cls}" />" />
	                            <select class="relation_site" name="relation_site" id="relation_site" >
	                                <option value="">��������</option>
									<c:if test='${sessionScope.tem_grcode ne "N000179"}'>
	                                	<option value="SUBJ">���԰���</option>
									</c:if>
	                                <option value="OPEN">��������</option>
	                            </select>
	                            <input type="text" name="p_searchtext" id="p_searchtext" onkeypress="if(event.keyCode==13) {main_search(); return false;}" placeholder="�˻��� �Է�">
	                            <a class="btn_main_search" href="javascript:main_search();"></a>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row">
					<c:if test="${sessionScope.tem_grcode ne 'N000179'}">
						<div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
							<div class="box_ct">
								<span class="ct_title">���԰���</span>
								<span class="btn_more"><a href="javascript:menuForward('9','02')">������</a></span>

								<div class="vertical_slide scroll-none">
									<ul>
										<c:forEach items="${subjectList }" var="list" varStatus="status">
											<li>
												<a href="javascript:viewSubject('<c:out value="${list.d_subj }" />','<c:out value="${list.d_subjnm }" />','<c:out value="${list.d_isonoff }" />','<c:out value="${list.d_scupperclass }" />','<c:out value="${list.d_classname }" />','<c:out value="${list.d_scyear }" />','<c:out value="${list.d_subjseq }" />','<c:out value="${list.d_wj_classkey }" />');">
													<div class="img_box">
														<img src="<c:out value="${list.d_introducefilenamenew }" />" alt="<c:out value="${list.d_scsubjnm }" />">
													</div>
													<div class="edu_info">
														<span class="point_blue edu_title abbreviation"><c:out value="${list.d_scsubjnm }" /></span>
														<p class="edu_content abbreviation2"><c:out value="${list.d_intro }" /></p>
													</div>
												</a>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</c:if>
                    <div class="col-xl-3 <c:if test='${sessionScope.tem_grcode ne "N000179"}'>col-lg-4</c:if> col-md-6 col-sm-12">
                        <div class="box_ct">
                            <span class="ct_title">��������</span>
                            <span class="btn_more float-right"><a href="javascript:menuForward('5','01');">������</a></span>

                            <div class="vertical_slide scroll-none">
                                <ul>
                                	<c:forEach items="${goldClassList }" var="list" varStatus="status">
                                		<li>
	                                        <a href="javascript:viewContent('<c:out value="${list.d_seq }"/>', '<c:out value="${list.d_lecture_cls }"/>');">
	                                            <div class="img_box">
	                                                <img src="<c:out value="${list.d_vodimg }" />" alt="<c:out value="${list.d_lecnm }" />">
	                                            </div>
	                                            <div class="edu_info">
	                                                <span class="point_blue edu_title abbreviation"><c:out value="${list.d_lecnm }" /></span>
	                                                <p class="edu_content abbreviation2"><c:out value="${list.d_intro }" /></p>
	                                            </div>
	                                        </a>
	                                    </li>
                                	</c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 <c:if test='${sessionScope.tem_grcode ne "N000179"}'>col-lg-4</c:if> col-md-6 col-sm-12">
                        <div class="box_ct">
                            <span class="ct_title">�н���������</span>
                            <div class="div4_box">
                                <div class="div4_box_con">
	                            	<a href="javascript:menuForward('4','01');" style="text-decoration: none !important;">
	                                    <div class="div_4_imgBox">
	                                        <img src="/common/image/icon_faq.jpg" alt="FAQ">
	                                    </div>
	                                    <span>FAQ</span>
	                                    <p>���� �����Ǵ� ���׿� ����<br/>�亯�Դϴ�.</p>
	                                </a>
                                </div>
                                <div class="div4_box_con">
                                	<a href="javascript:menuForward('4','02');" style="text-decoration: none !important;">
	                                    <div class="div_4_imgBox">
	                                        <img src="/common/image/icon_qna.jpg" alt="Q&A">
	                                    </div>
	                                    <span>Q&A</span>
	                                    <p>�ñ��Ͻ� ���뿡 ����<br/>�������װ� �亯�Դϴ�.</p>
	                                </a>
                                </div>
                                <div class="div4_box_con">
                                	<a href="javascript:menuForward('4','14');" style="text-decoration: none !important;">
	                                    <div class="div_4_imgBox">
	                                        <img src="/common/image/icon_remote.jpg" alt="��������">
	                                    </div>
	                                    <span>��������</span>
	                                    <p>���������� ��������<br/>���񽺸� �����մϴ�.</p>
                                	</a>
                                </div>
                                <div class="div4_box_con">
                                    <div class="div_4_imgBox">
                                        <img src="/common/image/call.jpg" alt="�¶��α���">
                                    </div>
                                    <span>��������</span>
                                    <p style="font-size:16px; font-weight: bold;">02-6310-0770</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 <c:if test='${sessionScope.tem_grcode ne "N000179"}'>col-lg-4</c:if> col-md-6 col-sm-12">
						<c:if test='${sessionScope.tem_grcode ne "N000179"}'>
							<a href="javascript:menuForward('3','11');">
								<div class="image_banner_con">
									<div class="box_ct">
										<img src="/common/image/banner_main_mypage2.jpg" alt="���ǰ��ǽ� �ٷΰ���"/>
										<!--
										<span class="banner_title">���ǰ��ǽ�</span>
										<a href="javascript:menuForward('3','11');">�ٷΰ���</a>
										<p class="banner_con">�¶��ΰ����� ��ۿ���, ���Ӱ���, ��ȭ������ ���� �������� ����� �����ý����� ���� �ð��� ������ ������� ������ ������ ���� �� �ִ� '����'�����Դϴ�.</p>
										-->
									</div>
								</div>
							</a>
						</c:if>
						<c:if test='${sessionScope.tem_grcode eq "N000179"}'>
							<a href="javascript:menuForward('4','07');">
								<div class="image_banner_con">
									<div class="box_ct">
										<img src="/common/image/banner_main_mypage1792.png" alt="�������� �ٷΰ���"/>
									</div>
								</div>
							</a>
						</c:if>
                        <!-- 
                        <div class="image_banner_con">
                            <div class="box_ct">    
                               	<img src="/common/image/banner_main_mypage.jpg" alt="���ǰ��ǽ� �ٷΰ���"/>
                                <span class="banner_title">���ǰ��ǽ�</span>
                                <a href="javascript:menuForward('3','11');">�ٷΰ���</a>
                                <p class="banner_con">�¶��ΰ����� ��ۿ���, ���Ӱ���, ��ȭ������ ���� �������� ����� �����ý����� ���� �ð��� ������ ������� ������ ������ ���� �� �ִ� '����'�����Դϴ�.</p>
                            </div>
                        </div>
                         -->
                    </div>
					<c:if test="${sessionScope.tem_grcode ne 'N000179'}">
						<div class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
							<div class="box_ct">
								<span class="ct_title">��������</span>
								<span class="btn_more float-right"><a href="javascript:menuForward('4','07');">������</a></span>

								<div class="list_box">
									<ul>
										<c:forEach items="${noticeList }" var="list" varStatus="sataus">
											<li>
												<a href="javascript:viewNotice('<c:out value="${list.d_seq }" />');">
													<span class="abbreviation"><c:out value="${list.d_adtitle }" /></span>
													<span>
														<fmt:parseDate value="${list.d_addate }" var="noticeDate" pattern="yyyyMMddHHmmss" parseLocale="euc-kr"/>
														<fmt:formatDate value="${noticeDate }" pattern="yyyy-MM-dd" />
													</span>
												</a>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</c:if>
                    <div class="col-xl-3 <c:if test='${sessionScope.tem_grcode ne "N000179"}'>col-lg-4</c:if> col-md-6 col-sm-12">
                        <div class="box_ct swiper-container" style="padding:0" id="main_banner_slide">
                            <div class="swiper-wrapper">
                            	<c:choose>
									<c:when test="${sessionScope.tem_grcode eq 'N000134'}">
		                                <div>
		                                    <a href="/servlet/controller.homepage.HomeNoticeServlet">
		                                        <span style="display: none;">�н��� ������ �����ϴ�. ���� �߻� �� ��ġ ���� �ȳ�</span>
		                                        <img src="/common/image/banner4.png" title="�н��� ������ �����ϴ�. ���� �߻� �� ��ġ ���� �ȳ�" alt="�н��� ������ �����ϴ�. ���� �߻� �� ��ġ ���� �ȳ�">
		                                    </a>
		                                </div>
                            		</c:when>
	                                <c:otherwise>
	                            	 	<div class="swiper-slide">
		                                    <a href="#">
		                                        <span style="display: none;">������ ����缺�� ��� �ѱ���������ī���̿����� �������� �پ��� �ް� ����� �����մϴ�.</span>
		                                        <img src="${sessionScope.tem_grcode ne "N000179"? "/common/image/banner1.png" : "/common/image/banner1791.png"}" title="������ ����缺�� ��� �ѱ���������ī���̿����� �������� �پ��� �ް� ����� �����մϴ�." alt="������ ����缺�� ��� �ѱ���������ī���̿����� �������� �پ��� �ް� ����� �����մϴ�.">
		                                    </a>
		                                </div>
		                                <div class="swiper-slide">
		                                    <a href="#">
		                                        <span style="display: none;">���� ��𼭳� ������ ��ۿ���, ����, ��ȭ ������ �о��� ���� ��ĥ�� �е��� ���� ���� �¶��� ����</span>
		                                        <img src="${sessionScope.tem_grcode ne "N000179"? "/common/image/banner2.jpg" : "/common/image/banner1792.png"}" title="���� ��𼭳� ������ ��ۿ���, ����, ��ȭ ������ �о��� ���� ��ĥ�� �е��� ���� ���� �¶��� ����" alt="���� ��𼭳� ������ ��ۿ���, ����, ��ȭ ������ �о��� ���� ��ĥ�� �е��� ���� ���� �¶��� ����">
		                                    </a>
		                                </div>
                            	 	</c:otherwise>
                            	 </c:choose>
                            </div>
						<c:if test="${sessionScope.tem_grcode ne 'N000134'}">
							<div class="swiperControlBox">
							    <div class="col-12 swiper-pagination"></div>
							    <div class="swiper-button-prev"></div>
							    <div class="swiper-button-next"></div>
							    <div class="swiper-autoplay-stop"></div>
							</div>
						</c:if>
						
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
