<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<script type="text/javascript" >
    //��ü �����˻�
    function totalSubjSearch() {
        var grcode="${sessionScope.tem_grcode }";
        var searchText = $("#search_input").val();

		var url     = "/servlet/controller.propose.ProposeCourseServlet?p_process=TotalSubjectList&s_subjnm="+searchText;
		menuMainForward_Total(url);
    }
    
    function open_window(name, url, left, top, width, height, toolbar, menubar, statusbar, scrollbar, resizable) {
        toolbar_str = toolbar ? 'yes' : 'no';
        menubar_str = menubar ? 'yes' : 'no';
        statusbar_str = statusbar ? 'yes' : 'no';
        scrollbar_str = scrollbar ? 'yes' : 'no';
        resizable_str = resizable ? 'yes' : 'no';
        window.open(url, name, 'left='+left+',top='+top+',width='+width+',height='+height+',toolbar=no,menubar=no,status='+statusbar_str+',scrollbars='+scrollbar_str+',resizable='+resizable_str).focus();
    }
 	// ����������
    function topAdminOpenPage() {
        window.self.name = "winSelectView";
        farwindow = window.open("", "openWinAdmin", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 1024, height = 768, top=0, left=0");
        document.topdefaultForm.target = "openWinAdmin"
        document.topdefaultForm.action = "/learn/admin/system/mScreenFset.jsp";
        document.topdefaultForm.submit();

        farwindow.window.focus();
        document.topdefaultForm.target = window.self.name;
    }
 	
 	// ���Ѻ���
    function topAuthChange() {
        var sAuth   = document.getElementById("p_topAuth").value;

        document.topdefaultForm.p_auth.value    = sAuth;
        document.topdefaultForm.p_process.value = "authChange";
        document.topdefaultForm.action          = "/servlet/controller.homepage.MainServlet";
        document.topdefaultForm.submit();
    }
</script>
	<header>
        <div class="wrapper">
            <div class="container">
                <div class="row header-util-wrap">
                    <div class="col-12 col-right">
                        <div class="header-util-text">
                        	<c:choose>
                        		<c:when test="${sessionScope.userid eq null || sessionScope.userid == ''}">
                        			<span class="header_util_item"><a href="javascript:mainmenu('990');">�α���</a></span>
		                            <hr class="header_util_line">
		                            <span class="header_util_item"><a href="javascript:mainmenu('1');">ȸ������</a></span>
		                            <hr class="header_util_line">
		                            <span class="header_util_item"><a href="javascript:mainmenu('2');">���̵�/�н����� ã��</a></span>
                        		</c:when>
                        		<c:otherwise>
                        			<span class="header_util_item"><a href="javascript:mainmenu('3');" >�α׾ƿ�</a></span>
			                		<c:if test="${sessionScope.agreechk ne 'N'}">
			                			<hr class="header_util_line">
				                    	<span class="header_util_item"><a href="javascript:mainmenu('4');" >������������</a></span>
				                    	<c:if test="${sessionScope.authList ne '' && sessionScope.authList ne null}">
				                    		<hr class="header_util_line">
	                       					<select name="p_topAuth" id="p_topAuth" onchange="javascript:topAuthChange();" style="background:#FFFFFF;-webkit-appearance:menulist; padding:0px;">
	                       						<option value="ZZ">�н���</option>
		                        				<c:forTokens items="${sessionScope.authList }" delims="||" var="item">
		                        				<option value="${fn:split(item, '^')[0] }" <c:if test="${sessionScope.gadmin eq fn:split(item, '^')[0]}"> selected </c:if>>${fn:split(item, '^')[1] }</option>
	    	                    				</c:forTokens>
	                       					</select>
	                       					<span class="header_util_item"><a href="javascript:topAdminOpenPage();" class="btn_record" >�̵�</a></span>
	                        			</c:if>
                        			</c:if>
                        			<c:if test="${!(sessionScope.gadmin eq 'ZZ') && !(sessionScope.gadmin eq '')}">
                        				
                        			</c:if>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                        <!-- 
                        <div class="header-util-sns">
                            <span class="header_util_item">
                                <a href="#">
                                    <img src="/common/image/facebook_icon.png" alt="���̽��� �ٷΰ���">
                                </a>
                            </span>
                            <span class="header_util_item">
                                <a href="#">
                                    <img src="/common/image/twitter_icon.png" alt="Ʈ���� �ٷΰ���">
                                </a>
                            </span>
                            <span class="header_util_item">
                                <a href="#">
                                    <img src="/common/image/blog_icon.png" alt="��α� �ٷΰ���">
                                </a>
                            </span>
                            <span class="header_util_item">
                                <a href="#">
                                    <img src="/common/image/youtube_icon.png" alt="��Ʃ�� �ٷΰ���">
                                </a>
                            </span>
                            <span class="header_util_item">
                                <a href="#">
                                    <img src="/common/image/instargram_icon.png" alt="�ν�Ÿ�׷� �ٷΰ���">
                                </a>
                            </span>
                        </div>
                         -->
                    </div>
                </div>
                <div class="row header-section">
                    <div class="col-12">
                    	<c:if test="${sessionScope.agreechk eq 'N'}">
	                        <span class="logo" >
                                <img src="/images/newmain_20100625/<c:out value="${sessionScope.tem_grcode }"/>.png" alt="�ΰ�" />
	                        </span>
                        </c:if>
                        <c:if test="${sessionScope.agreechk ne 'N'}">
	                        <span class="logo" >
	                            <a href="/servlet/controller.homepage.MainServlet">
	<!--                                 <img src="/common/image/w_logo.png" alt="�ѱ���������ī����" /> -->
	                                <img src="/images/newmain_20100625/<c:out value="${sessionScope.tem_grcode }"/>.png" alt="�ΰ�" />
	<%--                                 <img src="/images/newmain_20100625/<%=s_tem_grcodeGLB%>.png" alt="logo"/> --%>
	                            </a>
	                        </span>                        
	                        <span class="gnb_con">
	                            <ul class="col-center">
									<c:if test="${sessionScope.tem_grcode ne 'N000179'}">
										<li>
											<a href="javascript:menuForward('8', '01');">���԰����ȳ�</a>
											<ul>
												<li><a href="javascript:menuForward('8', '01');">���������ȳ�</a></li>
											</ul>
										</li>
										<li>
											<a href="javascript:menuForward('9', '01');">���԰�����û</a>
											<ul>
												<li><a href="javascript:menuForward('9', '01');">������û�ȳ�</a></li>
												<li><a href="javascript:menuForward('9', '02');">������û</a></li>
												<li><a href="javascript:menuForward('9', '03');">������û Ȯ��/���</a></li>
											</ul>
										</li>
									</c:if>
	                                <li>
	                                    <a href="javascript:menuForward('5', '01');">��������</a>
	                                </li>
									<c:if test="${sessionScope.tem_grcode ne 'N000179'}">
										<li>
											<a href="javascript:menuForward('3', '11');">���ǰ��ǽ�</a>
											<ul>
												<li><a href="javascript:menuForward('3', '11');">�������ΰ���</a></li>
												<li><a href="javascript:menuForward('3', '02');">���Ǳ����̷�</a></li>
												<li><a href="javascript:menuForward('3', '12');">���ǻ�㳻��</a></li>
											</ul>
										</li>
									</c:if>
	                                <li>
	                                    <a href="javascript:menuForward('4', '07');">�н���������</a>
	                                    <ul>
	                                        <li><a href="javascript:menuForward('4', '07');">��������</a></li>
					                        <li><a href="javascript:menuForward('4', '01');">FAQ</a></li>
					                        <li><a href="javascript:menuForward('4', '02');">Q&amp;A</a></li>
					                        <li><a href="javascript:menuForward('4', '14');">������������</a></li>
	                                    </ul>
	                                </li>
	                            </ul>
	                        </span>
	                        <span class="gnb_util_icon">
	                            <span class="search_con">
	                                <form onsubmit="return false;">
	                                    <input type="text" class="header_search_input" title="�˻�� �Է����ּ���" placeholder="�˻�� �Է����ּ���." id="search_input" name="topWarp_searchText" onkeypress="javascript:if(event.keyCode==13){totalSubjSearch(); return false;}">
	                                    <label for="search_input" id="search_label"></label>
	                                    <img src="/common/image/search_icon.png" alt="�˻�Ȯ��" class="btn_search_form" onclick="totalSubjSearch();">
	                                </form>
	                            </span>
	                            <hr class="seperate_line">
	                            <span class="gnb_icon">
	                                <img src="/common/image/gnb_icon.png" alt="GNB�޴� ����" class="gnb_menu">
	                                <img src="/common/image/gnb_close.png" alt="GNB�޴� �ݱ�" class="gnb_close">
	                            </span>
	                        </span>
	                	</c:if>
                    </div>
                </div>
            </div>    
        </div>
        <div class="header_after"></div>
    </header>