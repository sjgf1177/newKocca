<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/tags/KoccaPageUtilTaglib" prefix="pu" %>
<%@ page isELIgnored="false" %>
<jsp:include page="/learn/user/typeB/include/topMainAsp.jsp" />
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="today" />
<c:set var="pageno" value="${param.p_pageno eq null || param.p_pageno eq ''? 1 : param.p_pageno}" />
<c:set var="pagesize" value="${param.p_pagesize eq null || param.p_pagesize eq ''? 10 : param.p_pagesize}" />

<script type="text/javascript">
//������ �̵�
function goPage(pageNum) {
	document.form1.p_pageno.value = pageNum;
	document.form1.action = "/servlet/controller.study.MyClassServlet";
	document.form1.p_process.value = "StudyHistoryList";
	document.form1.submit();
}

//�н�â OPEN
function studyOpen(url, iurl) {
	<c:if test="${sessionScope.gadmin eq 'ZZ'}" >
		document.form1.lessonReurl.value = url;
       	document.form1.lessonReiurl.value = iurl;
       	
        var s_url = url+"&p_iurl="+iurl;
		if (url == '') {
		    alert("������ �����ϴ�");
		} else {
			if (iurl == 0)
				open_window('openApp',s_url,0,0,1024,768,false,false,false,true,true);
			else
				open_window('openApp',s_url,0,0,1024,768,false,false,false,'yes','yes');
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

//������ ���
function suRoyJeung(subj, year, subjseq, userid, kind, subjgrcode){
	kind = '1';
	window.self.name = "SuryoJeung";
	var new_Open = window.open("","openSuryoJeungPrint",'scrollbars=no,width=830,height=800,scrollbars=yes,resizable=NO');
	
	document.form1.target = "openSuryoJeungPrint";
	document.form1.action = "/servlet/controller.polity.DiplomaAdminServlet";
	
	document.form1.p_subj.value = subj;
	document.form1.p_year.value = year;
	document.form1.p_scsubjseq.value = subjseq;
	document.form1.p_userid.value = userid;
	document.form1.p_kind.value = kind;
	document.form1.p_grcode.value = subjgrcode;
	document.form1.p_process.value = "DiplomaPrint";
	document.form1.submit();
    document.form1.target = window.self.name;
}
</script>
<form name= "form1" method= "post">
    <input type='hidden' name='p_process'>
    <input type='hidden' name='p_sel'       value="<c:out value="${param.p_sel }" />">
    <input type='hidden' name='p_subj'      value="">
    <input type='hidden' name='p_subjnm'    value ="">
    <input type='hidden' name='p_grcode'    value ="">
    <input type='hidden' name='s_grcode'    value="<c:out value="${sessionScope.tem_grcode }" />">
    <input type='hidden' name='p_year'      value="">
    <input type='hidden' name='s_subj'      value="">
    <input type='hidden' name='p_scsubjseq' value="">
    <input type='hidden' name='p_subjseq'   value="">
    <input type='hidden' name='p_userid'    value="">
    <input type='hidden' name='p_kind'      value="">
    <input type='hidden' name='p_isonoff'   value ="">
    <input type='hidden' name='p_pageno' value="<c:out value="${param.p_pageno }" />">
	<input type='hidden' name='p_pagesize'  value="<c:out value="${param.p_pagesize }" />"/>
    <!-- �н�â �ٽö���� 1:�ٽ� �ȶ���  2:�ٽö���(�н����������� �ݾ������) -->
    <input type='hidden' name='lessonRepopup' value="1">
    <input type='hidden' name='lessonReurl' value="">
    <input type='hidden' name='lessonReiurl' value="">
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
                                <span>���Ǳ����̷�</span>
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
                                            <a href="#"><span>���Ǳ����̷�</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sub_contents_body">
                                <div class="sub_board_header">
                                   <div class="list_title">
                                        <span><span>��</span>������ ��ģ ���� ����Դϴ�.</span>
                                        <span><span>��</span>������ ��ģ ������ ���� ��� ���� �� ���Ῡ�θ� Ȯ���� �� �ֽ��ϴ�.</span>
                                    </div>
                                </div>
                                <div class="sub_boarder_body">
                                    <table class="td_align_left2">
                                        <colgroup>
                                            <col width="auto">
                                            <col width="15%">
                                            <col width="15%">
                                            <col width="12%">
                                            <col width="8%">
                                            <col width="8%">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>������</th>
                                                <th>�����Ⱓ</th>
                                                <th>�����Ⱓ</th>
                                                <th>����</th>
                                                <th>����</th>
                                                <th>���Ῡ��</th>
                                                <th>������</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${StudyHistoryList }" var="list" varStatus="status">
                                        		<fmt:parseDate value="${list.d_courseedustart }" var="courseedustart" pattern="yyyyMMddHH" />
                                        		<fmt:parseDate value="${list.d_courseeduend }" var="courseeduend" pattern="yyyyMMddHH" />
                                        		<fmt:parseDate value="${list.d_reviewstart }" var="reviewstart" pattern="yyyyMMdd" />
                                        		<fmt:parseDate value="${list.d_reviewend }" var="reviewend" pattern="yyyyMMdd" />
                                        		<fmt:formatDate value="${courseedustart }" pattern="yyyyMMdd" var="edustart"/>
                                        		<fmt:formatDate value="${courseeduend }" pattern="yyyyMMdd" var="eduend"/>
                                        		<tr>
	                                                <td><a href="javascript:whenSubjInfoPopup('<c:out value="${list.d_subj }" />','<c:out value="${list.d_subjnm }" />','<c:out value="${list.d_isonoff }" />');"><c:out value="${list.d_subjnm }" /></a></td>
	                                                <td> 
	                                                	<fmt:formatDate value="${courseedustart }" pattern="yyyy.MM.dd"/>
	                                                	 ~ 
	                                                	<fmt:formatDate value="${courseeduend }" pattern="yyyy.MM.dd"/>
	                                                </td>
	                                                <td>
	                                                	<fmt:formatDate value="${reviewstart }" pattern="yyyy.MM.dd"/>
	                                                	 ~ 
	                                                	<fmt:formatDate value="${reviewend }" pattern="yyyy.MM.dd"/>
	                                                </td>
	                                                <td>
	                                                	<c:choose>
	                                                		<c:when test="${list.d_isablereview eq 'Y' && list.d_isgraduated eq 'Y' && eduend < today}">
	                                                			<c:set var="ieduurl" value="${(list.d_eduurl eq '' || list.d_eduurl eq null)? 0 : 1 }" />
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
	                                                			<c:choose>
                                                					<c:when test="${sessionScope.tem_grcode eq 'N000031' }">
                                                						<a href="javascript:studyOpen2('<c:out value="${eduUrl }" />','<c:out value="${ieduurl }" />>', '<c:out value="${list.d_wj_classkey }" />', '<c:out value="${list.d_edustartdt }" />');" class="btn_view">����</a>
                                                					</c:when>
                                                					<c:otherwise>
                                                						<a href="javascript:studyOpen('<c:out value="${eduUrl }" />','<c:out value="${ieduurl }" />');" class="btn_view">����</a>
                                                					</c:otherwise>
                                               					</c:choose>
	                                                		</c:when>
	                                                		<c:otherwise>-</c:otherwise>
	                                                	</c:choose>
	                                                </td>
	                                                <td><c:out value="${list.d_tstep}"/></td>
	                                                <td>
	                                                	<c:choose>
	                                                		<c:when test="${list.d_isgraduated eq 'A' }">-</c:when>
	                                                		<c:when test="${list.d_isgraduated eq 'B' }">ó����</c:when>
	                                                		<c:when test="${list.d_isgraduated eq 'Y' }">����</c:when>
	                                                		<c:when test="${list.d_isgraduated eq 'N' }">�̼���</c:when>
	                                                		<c:otherwise>-</c:otherwise>
	                                                	</c:choose>
	                                                </td>
	                                                <td>
	                                                	<c:choose>	                                                		
	                                                		<c:when test="${not empty list.d_subj && list.d_isgraduated eq 'Y' && eduend < today}">		                          			
	                                                			<a href="javascript:suRoyJeung('<c:out value="${list.d_subj }" />','<c:out value="${list.d_year }" />','<c:out value="${list.d_subjseq }" />','<c:out value="${sessionScope.userid }" />','<c:out value="${list.d_kind}" />','<c:out value="${list.d_subjgrcode }" />');" class="btn_introView">�μ�</a>
	                                                		</c:when>
	                                                		<c:when test="${not empty list.d_subj && list.d_isgraduated eq 'Y' && sessionScope.tem_grcode eq 'N000210'}">
	                                                			<a href="javascript:suRoyJeung('<c:out value="${list.d_subj }" />','<c:out value="${list.d_year }" />','<c:out value="${list.d_subjseq }" />','<c:out value="${sessionScope.userid }" />','<c:out value="${list.d_kind}" />','<c:out value="${list.d_subjgrcode }" />');" class="btn_introView">�μ�</a>
	                                                		</c:when>
	                                                		<c:when test="${not empty list.d_subj && list.d_isgraduated eq 'Y' && sessionScope.tem_grcode eq 'N000206'}">
	                                                			<a href="javascript:suRoyJeung('<c:out value="${list.d_subj }" />','<c:out value="${list.d_year }" />','<c:out value="${list.d_subjseq }" />','<c:out value="${sessionScope.userid }" />','<c:out value="${list.d_kind}" />','<c:out value="${list.d_subjgrcode }" />');" class="btn_introView">�μ�</a>
	                                                		</c:when>	  
	                                                		<c:when test="${not empty list.d_subj && list.d_isgraduated eq 'Y' && sessionScope.tem_grcode eq 'N000235'}">
	                                                			<a href="javascript:suRoyJeung('<c:out value="${list.d_subj }" />','<c:out value="${list.d_year }" />','<c:out value="${list.d_subjseq }" />','<c:out value="${sessionScope.userid }" />','<c:out value="${list.d_kind}" />','<c:out value="${list.d_subjgrcode }" />');" class="btn_introView">�μ�</a>
	                                                		</c:when>	    
                                               		        <c:when test="${not empty list.d_subj && list.d_isgraduated eq 'Y' && sessionScope.tem_grcode eq 'N000232'}">
	                                                			<a href="javascript:suRoyJeung('<c:out value="${list.d_subj }" />','<c:out value="${list.d_year }" />','<c:out value="${list.d_subjseq }" />','<c:out value="${sessionScope.userid }" />','<c:out value="${list.d_kind}" />','<c:out value="${list.d_subjgrcode }" />');" class="btn_introView">�μ�</a>
	                                                		</c:when>	
                                               		        <c:when test="${not empty list.d_subj && list.d_isgraduated eq 'Y' && sessionScope.tem_grcode eq 'N000233'}">
	                                                			<a href="javascript:suRoyJeung('<c:out value="${list.d_subj }" />','<c:out value="${list.d_year }" />','<c:out value="${list.d_subjseq }" />','<c:out value="${sessionScope.userid }" />','<c:out value="${list.d_kind}" />','<c:out value="${list.d_subjgrcode }" />');" class="btn_introView">�μ�</a>
	                                                		</c:when>	 
                                               		        <c:when test="${not empty list.d_subj && list.d_isgraduated eq 'Y' && sessionScope.tem_grcode eq 'N000222'}">
	                                                			<a href="javascript:suRoyJeung('<c:out value="${list.d_subj }" />','<c:out value="${list.d_year }" />','<c:out value="${list.d_subjseq }" />','<c:out value="${sessionScope.userid }" />','<c:out value="${list.d_kind}" />','<c:out value="${list.d_subjgrcode }" />');" class="btn_introView">�μ�</a>
	                                                		</c:when>	      
                                               		        <c:when test="${not empty list.d_subj && list.d_isgraduated eq 'Y' && sessionScope.tem_grcode eq 'N000240'}">
	                                                			<a href="javascript:suRoyJeung('<c:out value="${list.d_subj }" />','<c:out value="${list.d_year }" />','<c:out value="${list.d_subjseq }" />','<c:out value="${sessionScope.userid }" />','<c:out value="${list.d_kind}" />','<c:out value="${list.d_subjgrcode }" />');" class="btn_introView">�μ�</a>
	                                                		</c:when>		   
															<c:when test="${not empty list.d_subj && list.d_isgraduated eq 'Y' && sessionScope.tem_grcode eq 'N000242'}">
	                                                			<a href="javascript:suRoyJeung('<c:out value="${list.d_subj }" />','<c:out value="${list.d_year }" />','<c:out value="${list.d_subjseq }" />','<c:out value="${sessionScope.userid }" />','<c:out value="${list.d_kind}" />','<c:out value="${list.d_subjgrcode }" />');" class="btn_introView">�μ�</a>
	                                                		</c:when>	
	                                                		<c:otherwise>
	                                                			- 
	                                                		</c:otherwise>
	                                                	</c:choose>
	                                                </td>
	                                            </tr>
	                                            <c:set var="totalpage" value="${list.d_totalpage }" />
                                        	</c:forEach>
                                        	<c:if test="${fn:length(StudyHistoryList) le 0 }">
                                        		<tr>
                                        			<td colspan="7">���� �����̷� ������ �����ϴ�</td>
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