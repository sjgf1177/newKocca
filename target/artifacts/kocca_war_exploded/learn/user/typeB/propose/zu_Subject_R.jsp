<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false" %>
<%
	pageContext.setAttribute("CR", "\r");
	pageContext.setAttribute("LF", "\n");
	pageContext.setAttribute("CRLF", "\r\n");
	pageContext.setAttribute("SP", "&nbsp;");
	pageContext.setAttribute("BR", "<br/>");
%>

<jsp:include page="/learn/user/typeB/include/topMainAsp.jsp" />

<script type="text/javascript">
function whenPreShow(url, subj, d_wj_classkey) {
	prelog_url = "/servlet/controller.propose.ProposeCourseServlet?p_process=insertPreviewLog&p_subj="+subj;
	open_window("openShow",url,"100","100","${subjectPreview.d_prewidth}","${subjectPreview.d_preheight}","","","",true,true);
}

function whenSubjList() {
	var actionurl = document.form1.p_actionurl.value;
    
	document.form1.target = "_self";
	document.form1.p_process.value=document.form1.p_rprocess.value;
	if(actionurl != null && actionurl != "")
		   document.form1.action=document.form1.p_actionurl.value;
	document.form1.submit();
}

//������û
function whenSubjPropose(subj,year,subjseq, subjnm) {
	if('${sessionScope.userid}' == '') {
		alert("�α����� �ʿ��մϴ�.");
		return;
	}
	if(!confirm(subjnm+"������ ������û�Ͻðڽ��ϱ�?")) {
	 return;
	}
	var new_Open = window.open("","proposeWindow",'scrollbars=yes,width=800,height=730,resizable=no');
	document.form1.p_process.value = "SubjectEduProposePage";
	document.form1.target = "proposeWindow";
	document.form1.p_subj.value = subj;
	document.form1.p_year.value = year;
	document.form1.p_subjseq.value = subjseq;
	document.form1.action = "/servlet/controller.propose.ProposeCourseServlet";
	document.form1.submit();
	document.form1.target = "_self";
}
</script>
<form name="form1" action="/servlet/controller.propose.ProposeCourseServlet" method="post">
	<!--input type="hidden" name="type"	value="<%//=type%>"/-->
	<input type="hidden" name="p_process"	value="${param.p_proscess }"/>
	<input type="hidden" name="p_rprocess"	value="${param.p_rprocess ne ''? param.p_rprocess: param.p_process }"/>
	<input type="hidden" name="p_actionurl" value="${param.p_actionurl}"/>
	<input type="hidden" name="p_year"	value=""/>
	<input type="hidden" name="p_subj"	value="${param.p_subj}"/>
	<input type="hidden" name="p_subjseq"	value="${param.p_subjseq}"/>
	<input type="hidden" name="p_subjnm"	value="${param.p_subjnm}"/>
	<input type="hidden" name="p_upperclass"	value="${param.p_upperclass}"/>
	<input type="hidden" name="p_upperclassnm"	value="${param.p_upperclassnm}"/>
	<input type="hidden" id="s_mclassnm" name="s_mclassnm"	value="${param.s_mclassnm}"/>
	<input type="hidden" name="p_action"	value="${param.p_action}"/>
	<input type="hidden" name="p_pageno"	value="${param.p_pageno eq 0 || param.p_pageno eq '' ? 0 : param.p_pageno }"/>
	<input type="hidden" name="p_pagesize"  value="${param.p_pagesize}"/>
	<input type="hidden" name="p_area"  value="${param.p_area }"/>
	<input type="hidden" name="gubun" value="${param.gubun }" />
    <input type="hidden" name="menuid" value="${param.menuid }" />
</form>

<section>
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <jsp:include page="/learn/user/typeB/include_left/left_9.jsp">
                    	<jsp:param value="02" name="left_active"/>
                    </jsp:include>
                    <div class="subContainer">
                        <div class="sub_section">
                            <div class="sub_contents_header">
                                <span>������û</span>
                                <div class="linemap_wrap">
                                    <ul>
                                        <li>
                                            <a href="#">
                                                <span>
                                                    <img src="/common/image/home_icon.png" alt="����">
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#"><span>������û</span></a>
                                        </li>
                                        <li>
                                            <a href="#"><span>������û</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sub_contents_body">
                                <div class="sub_info_body">
                                    <p class="sub_course_view_title">�����Ұ�</p>
                                    <div class="sub_course_alert_box">
                                        <p><span>[<c:out value="${subjectPreview.d_areaname }" />]</span> <c:out value="${subjectPreview.d_subjnm }" /></p>
                                    </div>
                                    <div class="sub_course_view_wrap">
                                        <div class="img_box">
                                            <img src="<c:out value="${subjectPreview.d_introducefilenamenew }" />" alt="<c:out value="${subjectPreview.d_subjnm }" />" />
                                        </div>
                                        <div class="info_box">
                                            <table>
                                                <colgroup>
                                                    <col width="25%">
                                                    <col width="auto">
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <th>�������</th>
                                                        <td>
                                                        	<c:set var="edumans" value="${fn:replace(subjectPreview.d_edumans, CRLF, BR)}" />
															<c:set var="edumans" value="${fn:replace(edumans, CR, BR)}" />
															<c:set var="edumans" value="${fn:replace(edumans, LF, BR)}" />
															<c:out value="${edumans }" escapeXml="false" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>��������</th>
                                                        <td>
                                                        	<c:set var="intro" value="${fn:replace(subjectPreview.d_intro, CRLF, BR)}" />
															<c:set var="intro" value="${fn:replace(intro, CR, BR)}" />
															<c:set var="intro" value="${fn:replace(intro, LF, BR)}" />
															<c:out value="${intro }" escapeXml="false" />
														</td>
                                                    </tr>
                                                    <tr>
                                                        <th>��������</th>
                                                        <td>
                                                        	<c:set var="explain" value="${fn:replace(subjectPreview.d_explain, CRLF, BR)}" />
															<c:set var="explain" value="${fn:replace(explain, CR, BR)}" />
															<c:set var="explain" value="${fn:replace(explain, LF, BR)}" />
															<c:out value="${explain }" escapeXml="false" />
														</td>
                                                    </tr>
                                                    <tr>
                                                        <th>���Ǳ���/����</th>
                                                        <td>
                                                        	<c:set var="memo" value="${fn:replace(subjectPreview.d_memo, CRLF, BR)}" />
															<c:set var="memo" value="${fn:replace(memo, CR, BR)}" />
															<c:set var="memo" value="${fn:replace(memo, LF, BR)}" />
															<c:out value="${memo }" escapeXml="false" />
														</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div class="course_button">
                                            	<c:if test="${subjectPreview.d_preurl ne '' && sessionScope.tem_grcode ne 'N000210'}">
													<a href="javascript:whenPreShow('<c:out value="${subjectPreview.d_preurl}" />','<c:out value="${param.p_subj}" />', '<c:out value="${param.p_wj_classkey}" />' )" class="gustation_btn">���� ������</a>
	                                            </c:if>
                                                <a href="javascript:whenSubjList();" class="list_btn">��ϰ���</a>
                                                <c:if test="${subjectPreview.d_propose_yn eq 'N' && subjectPreview.d_sugang_yn eq 'Y' }">
                                                <a href="javascript:whenSubjPropose('<c:out value="${param.p_subj}" />','<c:out value="${param.p_year}" />','<c:out value="${param.p_subjseq}" />','<c:out value="${param.p_subjnm}" />')" class="apply_btn">������û</a>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                 </div>
                                <div class="sub_boarder_body">
                                    <p class="sub_course_view_title">��������</p>
                                    <table class="td_align_left">
                                        <colgroup>
                                            <col width="13%">
                                            <col width="auto">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>����</th>
                                                <th>��������</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${lessonList }" var="list" varStatus="status">
                                        		<tr>
	                                                <td><c:out value="${list.d_lesson }" /></td>
	                                                <td><c:out value="${list.d_sdesc }" /></td>
	                                            </tr>
                                        	</c:forEach>
                                        </tbody>
                                    </table>
                                    
                                    <p class="sub_course_view_title">����</p>
                                    <table>
                                        <colgroup>
                                            <col width="35%">
                                            <col width="25%">
                                            <col width="40%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>�������</th>
                                                <th>����</th>
                                                <th>������</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>����</td>
                                                <td><c:out value="${subjseqList[0].d_gradscore }" /></td>
                                                <td><c:out value="${subjseqList[0].d_gradstep }" />% �̻�</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
                                    <p class="sub_course_view_title">��</p>
                                    <table>
                                        <colgroup>
                                            <col width="25%">
                                            <col width="10%">
                                            <col width="15%">
                                            <col width="15%">
                                            <col width="15%">
                                            <col width="10%">
                                            <col width="10%">
                                            <col width="10%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>�򰡱���</th>
                                                <th>������</th>
                                                <th>�߰���</th>
                                                <th>������</th>
                                                <th>������</th>
                                                <th>����Ʈ</th>
                                                <th>������</th>
                                                <th>��Ÿ</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>����ġ(%)</td>
                                                <td><c:out value="${subjseqList[0].d_wstep }" />%</td>
                                                <td><c:out value="${subjseqList[0].d_wmtest }" />%</td>
                                                <td><c:out value="${subjseqList[0].d_wftest }" />%</td>
                                                <td><c:out value="${subjseqList[0].d_whtest }" />%</td>
                                                <td><c:out value="${subjseqList[0].d_wreport }" />%</td>
                                                <td><c:out value="${subjseqList[0].d_wetc1 }" />%</td>
                                                <td><c:out value="${subjseqList[0].d_wetc2 }" />%</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- footer -->
<jsp:include page="/learn/user/typeB/include/newFooterB.jsp" />
<!-- footer -->
</body>
</html>
