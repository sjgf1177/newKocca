<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/tags/KoccaPageUtilTaglib" prefix="pu" %>
<%@ page isELIgnored="false" %>
<jsp:include page="/learn/user/typeB/include/topMainAsp.jsp" />
<c:set var="pageno" value="${param.p_pageno eq null || param.p_pageno eq ''? 1 : param.p_pageno}" />
<c:set var="pagesize" value="${param.p_pagesize eq null || param.p_pagesize eq ''? 10 : param.p_pagesize}" />

<script type="text/javascript">
//������ �̵�
function goPage(pageNum) {
	document.form1.p_pageno.value = pageNum;
	document.form1.action = "/servlet/controller.study.MyClassServlet";
	document.form1.p_process.value = "EducationStudyingSubjectPage";
	document.form1.submit();
}

//�н���Ȳ OPEN
function whenEdulist(iurl, iseduend, url) {
    var ulink = url + "&p_iurl=" + iurl + "&p_iseduend=" + iseduend;
    var new_Open = window.open(ulink,"eduList",'scrollbars=no,width=350,height=240,scrollbars=yes,resizable=no');
}

//�н�â OPEN
function studyOpen(url, iurl) {
	<c:if test="${sessionScope.gadmin eq 'ZZ'}" >
		document.form1.lessonReurl.value = url;
       	document.form1.lessonReiurl.value = iurl;
       	
        var s_url = url+"&p_iurl="+iurl;
        //alert(s_url);
		if (url == '') {
		    alert("������ �����ϴ�");
		} else {
			if (iurl == 0){
				open_window('openApp',s_url,0,0,1024,768,false,false,false,true,true);
			}else{
				open_window('openApp',s_url,0,0,1000,700,false,false,false,'yes','yes');
			}
		}
	</c:if>
	<c:if test="${sessionScope.gadmin ne 'ZZ'}" >
		alert ("�н��� ������ �ƴմϴ�.");
	</c:if>
}

//�н�â OPEN (�ܺΰ��� : �����н���)
function studyOpen2(url, iurl, wj_classkey, edustart) {
	<c:if test="${sessionScope.gadmin eq 'ZZ'}" >
        document.form1.lessonReurl.value = url;
        document.form1.lessonReiurl.value = iurl;
        var s_url = url+"&p_iurl="+iurl;

        if (url == '') {
			alert("������ �����ϴ�");
        } else {
			s_url ="http://kocca.campus21.co.kr/enterclass.asp?userid=${sessionScope.userid}&classkey="+wj_classkey+"&edustart="+ edustart ;
			open_window('openApp',s_url,0,0,1024,768,false,false,'yes','yes','yes');
        }
	</c:if>
	<c:if test="${sessionScope.gadmin ne 'ZZ'}" >
		alert ("�н��� ������ �ƴմϴ�.");
	</c:if>
}

//���������� POPUP
function whenSubjInfoPopup(subj,subjnm,isonoff){
    window.self.name = "SubjList";
    window.open("", "openSubjInfo", "scrollbars=no,width=720,height=800,scrollbars=yes,resizable=yes'");
    document.form1.target = "openSubjInfo"

    document.form1.p_subj.value = subj;
    document.form1.p_subjnm.value = subjnm;
    document.form1.p_isonoff.value = isonoff;
    document.form1.p_process.value = 'SubjectPreviewPopup';
    document.form1.action='/servlet/controller.propose.ProposeCourseServlet';
    document.form1.submit();

    document.form1.target = window.self.name;
}

</script>

<form name= "form1" method= "post">
	<input type='hidden' name='p_process'>
	<input type='hidden' name='p_subj'      value ="">
	<input type='hidden' name='p_year'      value ="">
	<input type='hidden' name='p_subjseq'   value ="">
	<input type='hidden' name='p_scsubjseq'   value ="">
	<input type='hidden' name='p_subjnm'    value ="">
	<input type='hidden' name='p_userid'    value ="">
	<input type='hidden' name='p_gubun'     value ="">
	<input type='hidden' name='p_rejectedreason'     value ="">
	<input type='hidden' name='p_isonoff'   value ="">
	<input type='hidden' name='p_kind' value="">
	<input type='hidden' name='p_grcode' value="${sessionScope.tem_grcode }">
	<input type='hidden' name='s_grcode' value="${sessionScope.tem_grcode }">
	<input type="hidden" name="p_pageno" value="<c:out value="${param.p_pageno }" />">
	<input type="hidden" name="p_pagesize"  value="<c:out value="${param.p_pagesize }" />"/>
	<!-- �н�â �ٽö���� 1:�ٽ� �ȶ���  2:�ٽö���(�н����������� �ݾ������) -->
	<input type='hidden' name='lessonRepopup' value="1">
	<input type='hidden' name='lessonReurl' value="">
	<input type='hidden' name='lessonReiurl' value="">
	<!-- <input type='hidden' name='wj_classkey' value="">-->
	<input type="hidden" name="gubun" value="${param.gubun }" />
    <input type="hidden" name="menuid" value="${param.menuid }" />
</form>
<section>
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <jsp:include page="/learn/user/typeB/include_left/left_3.jsp">
                    	<jsp:param value="${param.menuid }" name="left_active"/>
                    </jsp:include>
                    <div class="subContainer">
                        <div class="sub_section">
                            <div class="sub_contents_header">
                                <span>�������� ����</span>
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
                                            <a href="#"><span>���ǰ��ǽ�</span></a>
                                        </li>
                                        <li>
                                            <a href="#"><span>�������� ����</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sub_contents_body">
                                <div class="sub_board_header">
                                   <div class="list_title">
                                        <span><span>��</span>���� �������� ���� ����Դϴ�.</span>
                                        <span><span>��</span>�������� ������ ���� ��� �н�â���� �̵��Ͻ� �� �ֽ��ϴ�.</span>
                                        <span class="point_orange"><span>��</span>���� �н� �ÿ��� ���ͳ� �ͽ��÷η� ����� �����մϴ�.</span>
                                    </div>
                                </div>
                                <div class="sub_boarder_body">
                                    <table class="td_align_left2">
                                        <colgroup>
                                            <col width="auto">
                                            <col width="25%">
                                            <col width="15%">
                                            <col width="15%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>������</th>
                                                <th>�����Ⱓ</th>
                                                <th>�н���Ȳ</th>
                                                <th>�н��ϱ�</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${EducationStudyingSubjectList }" var="list" varStatus="status">
                                        		<tr>
	                                                <td><a href="javascript:whenSubjInfoPopup('<c:out value="${list.d_subj }" />','<c:out value="${list.d_subjnm }" />','<c:out value="${list.d_isonoff }" />');"><c:out value="${list.d_subjnm }" /></a></td>
	                                                <td>
	                                                	<fmt:parseDate value="${list.d_edustart }" var="edustart" pattern="yyyyMMddHH" />
	                                                	<fmt:formatDate value="${edustart }" pattern="yyyy.MM.dd"/>
	                                                	 ~ 
	                                                	<fmt:parseDate value="${list.d_eduend }" var="eduend" pattern="yyyyMMddHH" />
	                                                	<fmt:formatDate value="${eduend }" pattern="yyyy.MM.dd"/>
	                                                </td>
	                                                <td>
	                                                	<c:set var="ieduurl" value="${(list.d_eduurl eq '' || list.d_eduurl eq null)? 0 : 1 }" />
	                                                	<c:url value="/servlet/controller.contents.EduStart" var="edulist_value">
	                                                		<c:param name="p_process" value="eduList" />
	                                                		<c:param name="p_subj" value="${list.d_subj }" />
	                                                		<c:param name="p_year" value="${list.d_year }" />
	                                                		<c:param name="p_subjseq" value="${list.d_subjseq }" />
	                                                		<c:param name="p_userid" value="${sessionScope.userid }" />
	                                                	</c:url>
	                                                	<c:choose>
	                                                		<c:when test="${list.d_isoutsourcing eq 'Y' }">
			                                                	<c:url value="/servlet/controller.contents.EduStart" var="eduUrl">
			                                                		<c:param name="FIELD1" value="${sessionScope.userid }" />
			                                                		<c:param name="FIELD2" value="${list.d_year }" />
			                                                		<c:param name="FIELD3" value="${list.d_cpsubj }" />
			                                                		<c:param name="FIELD4" value="${list.d_cpsubjseq }" />
			                                                		<c:param name="FIELD99" value="${list.d_company }" />
			                                                		<c:param name="FIELD100" value="N" />
			                                                		<c:param name="contenttype" value="${list.d_contenttype }" />
			                                                		<c:param name="p_subj" value="${list.d_subj }" />
			                                                		<c:param name="p_year" value="${list.d_year }" />
			                                                		<c:param name="p_subjseq" value="${list.d_subjseq }" />
			                                                	</c:url>
	                                                		</c:when>
	                                                		<c:otherwise>
	                                                			<c:if test="${list.d_eduurl eq '' || list.d_eduurl eq null }">
	                                                				<c:url value="/servlet/controller.contents.EduStart" var="eduUrl">
	                                                					<c:param name="p_subj" value="${list.d_subj }" />
	                                                					<c:param name="p_year" value="${(list.d_year eq null || list.d_year eq '')? '2000' : list.d_year}" />
	                                                					<c:param name="p_subjseq" value="${(list.d_subjseq eq null || list.d_subjseq eq '')? '0001' : list.d_subjseq }" />
	                                                					<c:param name="contenttype" value="${list.d_contenttype }" />
	                                                				</c:url>
	                                                			</c:if>
	                                                		</c:otherwise>
	                                                	</c:choose>
	                                                	<a href="javascript:whenEdulist('<c:out value="${ieduurl }" />','','<c:out value="${edulist_value }" />');" class="btn_introView">����</a>
	                                                </td>
	                                                <td>
	                                                	<c:choose>
	                                                		<c:when test="${list.d_controlstudy > 0 }">
	                                                			<a href="javascript:controlstudy();" class="btn_view">�н��ϱ�1</a>
	                                                		</c:when>
	                                                		<c:otherwise>
	                                                			<c:if test="${list.d_isstudyyn eq 'Y'}">
	                                                				<c:choose>
	                                                					<c:when test="${sessionScope.tem_grcode eq 'N000031' }">
	                                                						<a href="javascript:studyOpen2('<c:out value="${eduUrl }" />','<c:out value="${ieduurl }" />>', '<c:out value="${list.d_wj_classkey }" />', '<c:out value="${list.d_edustartdt }" />');" class="btn_view">�н��ϱ�2</a>
	                                                					</c:when>
	                                                					<c:otherwise>
	                                                						<a href="javascript:studyOpen('<c:out value="${eduUrl }" />','<c:out value="${ieduurl }" />');" class="btn_view">�н��ϱ�3</a>
	                                                					</c:otherwise>
                                                					</c:choose>
	                                                			</c:if>
	                                                		</c:otherwise>
	                                                	</c:choose>
	                                                </td>
	                                            </tr>
	                                            <c:set var="totalpage" value="${list.d_totalpage }" />
                                        	</c:forEach>
                                        	<c:if test="${fn:length(EducationStudyingSubjectList) <= 0 }">
                                        		<tr>
                                        			<td colspan="4">�������� ������ �����ϴ�.</td>
                                        		</tr>
                                        		<c:set var="totalpage" value="0" />
                                        	</c:if>
                                        </tbody>
                                    </table>
                                </div>
                                ${pu:typeB_printPageListDiv(totalpage, pageno, pagesize) }
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