<%
//**********************************************************
//  1. ��      ��: EDUCATION STUDYING SUBJECT PAGE
//  2. ���α׷���: zu_EducationStudyingSubject_L.jsp
//  3. ��      ��: �������� ����
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009/11/23
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.course.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    ArrayList list1 = null;
    list1 = (ArrayList)request.getAttribute("EducationStudyingSubjectList");   //�������� ���� ����Ʈ
    ArrayList list2 = null;
    list2 = (ArrayList)request.getAttribute("EducationProposeSubjectList");   //������û ���� ����Ʈ
    ArrayList list3 = null;
    list3 = (ArrayList)request.getAttribute("StudyHistoryList");   //���� ���� ����Ʈ

    ArrayList favorSubjectList = (ArrayList)request.getAttribute("favorSubjectList"); // ���� ���� ���
    DataBox dbox = null;

    String userId = box.getSession("userid");
    String grcode = box.getSession("tem_grcode");

    //�н����ΰ���
    String v_subj = "";
    String v_year = "";
    String v_subjnm = "";
    String v_subjseq = "";
    String v_edustart = "";
    String v_eduend =  "";
    String v_eduurl =  "";
    int v_ieduurl = 0;
    String cpsubj = "";
    String cpsubjseq = "";
    String v_isonoff =  "";
    String v_upperclassnm = "";
    String v_edulist_value= "";
    String isoutsourcing = "";
    String company = "";
    String contenttype  = "";
    String v_tmp_subj = "";
    String v_isalways = "";


    //�������
    String subj = "";
    String year = "";
    String subjNm = "";
    String isUse = "";
    String contentType = "";
    String subjSeq = "";
    String eduStart = "";
    String eduTerm = "";
    String eduEnd = "";
    String isGraduated = "";
    String gradStatusTxt = "";
    String eduUrl = "";

    String isAbleReview = "";
    String isPossibleByDate = "";

    int possibleCnt = 0;
    
    double tstep = 0d;

    String upperClassNm = "";
    

    int total = 0;
    int dispNum = 0;
    int totalPage = 0;
    int totalRowCount = 1;

    int row = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int pageNo = box.getInt("p_pageno");

    box.put("title_str", "���� ���ǽ� - �¶��� ���ǽ� - ���θ޴�");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script type="text/javascript">
    // �н�â OPEN
    function studyOpen(gubun,url, iurl) {
        var f = "";
        if(gubun == "1") {
            f = document.form1;
        } else if(gubun =="3") {
            f = document.form3;
        }

        f.lessonReurl.value = url;
        f.lessonReiurl.value = iurl;
        var s_url = url+"&p_iurl="+iurl;
        if (url == '') {
            alert("������ �����ϴ�");
        } else {
            if (iurl == 0){
                open_window('openApp',s_url,0,0,0,0,false,false,false,true,true);
            }else{
                open_window('openApp',s_url,0,0,1024,768,false,false,false,'yes','yes');
            }
        }
}

    // �н���Ȳ OPEN
    function whenEdulist(subjNm, iurl, iseduend, url) {
        var ulink = url + "&p_subjnm=" + subjNm + "&p_iurl=" + iurl + "&p_iseduend=" + iseduend;
        var new_Open = window.open(ulink,"eduList",'scrollbars=no,width=350,height=240,scrollbars=yes,resizable=no');
    }

    // ���������� POPUP
    function whenSubjInfoPopup(gubun,subj,subjNm,isonoff){
        var f = "";

        if(gubun == "1"){
            f = document.form1;
        } else if(gubun =="3") {
            f = document.form3;
        }

        window.self.name = "SubjList";
        window.open("", "openSubjInfo", "scrollbars=no, width=720, height=350, scrollbars=yes, resizable=yes'");
        f.target = "openSubjInfo"

        f.p_subj.value = subj;
        f.p_subjnm.value = subjNm;
        f.p_isonoff.value = isonoff;
        f.p_process.value = 'SubjectPreviewPopup';
        f.action='/servlet/controller.propose.ProposeCourseServlet';
        f.submit();

        f.target = window.self.name;
    }

    /**
     * �������� �� ȭ������ �̵�
     */
    function fnViewSubjInfo(subj, isUse, possibleCnt, year, subjseq) {

        var url = "/servlet/controller.propose.ProposeCourseServlet";
        var param = "?p_process=previewSubjDetailPage&p_subj=" + subj + "&p_year=" + year + "&p_subjseq=" + subjseq;

        if ( isUse != null && isUse == "N" ) {
            alert("������ �����Դϴ�.");
            return;
        }

        if ( possibleCnt != null && possibleCnt == 0) {
            alert("���� �����Ǿ� ���� ���� �����Դϴ�.");
            return;
        }

        location.href = url + param;
    }

    //�������
    function cancelPropose(tid,p_paymethod){
        if(!confirm("������ ����Ͻðڽ��ϱ�?")){
            return;
        }
        document.form2.target = "_self"
        document.form2.p_tid.value = tid;
        document.form2.p_paymethod.value = p_paymethod;
        document.form2.p_process.value = 'CancelPropose';
        document.form2.action = "/servlet/controller.study.MyClassServlet";
        document.form2.submit();
    }

    //������ ���
    function suRoyJeung(subj,year,subjSeq,userid, kind, subjgrcode){
        window.self.name = "SuryoJeung";
        var new_Open = window.open("","openSuryoJeungPrint",'scrollbars=no,width=830,height=800,scrollbars=yes,resizable=NO');

        document.form3.target = "openSuryoJeungPrint";
        document.form3.action = "/servlet/controller.polity.DiplomaAdminServlet";

        document.form3.p_subj.value = subj;
        document.form3.p_year.value = year;
        document.form3.p_scsubjseq.value = subjSeq;
        document.form3.p_userid.value = userid;
        document.form3.p_kind.value = kind;
        document.form3.p_grcode.value = subjgrcode;
        document.form3.p_process.value = "DiplomaPrint";
        document.form3.submit();
        document.form3.target = window.self.name;
    }

    //������ �̵�
    function goPage(pageNum) {

        document.form3.p_pageno.value = pageNum;
        document.form3.action = "/servlet/controller.study.MyClassServlet";
        document.form3.p_process.value = "EducationStudyingSubjectPage";
        document.form3.submit();
    }

    /**
     * ���� ���� ���
     */
    function fnCancelFavor(subj, idx) {

        var param = "p_process=manageFavorSubj&classType=01&subj=" + subj + "&jobType=cancel";
        var successMsg = "";

        if ( confirm("���� ���� ��Ͽ��� �����Ͻðڽ��ϱ�?") ) {
            $.ajax({
                    type : "get"
                ,   url : "/servlet/controller.study.MyClassServlet"
                ,   dataType : "json"
                ,   data : param
                ,   success : function (data) {

                        if ( data.isLogin == true ) {
                            if ( data.resultCnt > 0) {
                                $("#oFavorSubjList" + idx).remove();
                                alert("���� �������� �����Ǿ����ϴ�.");

                            } else {
                                alert("������ �߻��Ͽ����ϴ�.\n�����ڿ��� �����ϼ���.");
                                return;
                            }
                        } else {
                            alert("�α����� �ʿ��մϴ�.");
                            return;
                        }
                    }
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1 + " :: " + arg2);
                    }
                ,   error :  function(arg1, arg2) {
                        // alert("error : " + arg1);
                    }

            });
        } else {
            return;
        }
    }

 </script>
<!-- ��ũ��Ʈ�������� -->

<!-- container-new ���� //-->
<div id="container-new">

        <!-- �¶��� ���� -->
        <div id="mainMenu">
            <ul class="location">
                <li>���θ޴�</li>
                <li>�¶��� ���ǽ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage" class="active">�¶��� ���ǽ�</a></li>
                        <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage">���屳�� ���ǽ�</a></li>
                        <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=MINE" >�����ۼ��� ��</a></li>
                        <li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage">��㳻��</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">��������</a></li>
                        <!-- 2015-01-09 ���� ����
                        <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList">�����ȳ�</a></li>
                        <li><a href="#">Ŀ�´�Ƽ</a></li>
                        //-->
                    </ul>
                </li>
            </ul>

            <!-- ������ο� -->
            <div class="introCategory">
                <ul>
                    <!-- <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage"><strong><u>���� ���ǽ�</u></strong></a></li> //-->
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage"><strong><u>���� ���ǽ�</u></strong></a></li>
                    <li><a href="/servlet/controller.study.FavorOpenClassServlet?p_process=favorOpenClassList" >����</a></li> 
                    <li><a href="/servlet/controller.research.SulmunSubjUserServlet?p_process=SulmunNew" >����</a></li>
                    <li><a href="/servlet/controller.study.ProposeReviewServlet?p_process=selectReviewList" >�����ı�</a></li>
                    <!-- 2015-01-09 ���� ����
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList">�����ȳ�</a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">Ŀ�´�Ƽ</a></li>
                    //-->
                </ul>
            </div>
            <!-- //������ο� -->
            <!-- //�¶��� ���� -->
        </div>


    <!-- ������ ���� ���� -->
        <div id="contents">
            <h2 class="subTit">���� ���ǽ�<!--<img src="/images/2013/online_edu/myclass_title.gif" alt="���� ���ǽ�" />//--></h2>

            <div id="subCont" class="myClass">
                <!-- 2015-01-12 �������
                <ul class="tabCus">
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage"><img src="/images/2013/online_edu/myclass_tab_1_on.gif" alt="���� ���ǽ�" /></a></li>
                    <li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage"><img src="/images/2013/online_edu/myclass_tab_2_off.gif" alt="��㳻��" /></a></li>
                    <li><a href="/servlet/controller.research.SulmunSubjUserServlet?p_process=SulmunNew"><img src="/images/2013/online_edu/myclass_tab_3_off.gif" alt="����" /></a></li>
                    <li><a href="/servlet/controller.study.FavorOpenClassServlet?p_process=favorOpenClassList"><img src="/images/2013/online_edu/myclass_tab_4_off.gif" alt="���Ѱ���" /></a></li>
                </ul>
                //-->

                


                <h3 class="subTit_bl">&gt; �н�����  ����<!--<img src="/images/2013/online_edu/myclass_title_h3_4.gif" alt="����� ����" />//--></h3>
                <div class="tableWrap2 noclose">
                <form name="form3" method= "post">
                    <input type="hidden" name="p_process">
                    <input type="hidden" name="p_sel"       value="<%=box.getString("p_sel")%>">
                    <input type="hidden" name="p_subj"      value="">
                    <input type="hidden" name="p_subjnm"    value ="">
                    <input type="hidden" name="p_grcode"    value ="">
                    <input type="hidden" name="s_grcode"    value="<%= grcode %>">
                    <input type="hidden" name="p_year"      value="">
                    <input type="hidden" name="s_subj"      value="">
                    <input type="hidden" name="p_scsubjseq" value="">
                    <input type="hidden" name="p_subjseq"   value="">
                    <input type="hidden" name="p_userid"    value="">
                    <input type="hidden" name="p_kind"      value="">
                    <input type="hidden" name="p_isonoff"   value ="">
                    <input type="hidden" name="p_pageno"        value="<%= pageNo %>">
                    <!-- �н�â �ٽö���� 1:�ٽ� �ȶ���  2:�ٽö���(�н����������� �ݾ������) -->
                    <input type="hidden" name="lessonRepopup" value="1">
                    <input type="hidden" name="lessonReurl" value="">
                    <input type="hidden" name="lessonReiurl" value="">

                    <table class="layoutTable3 space3" summary="��ǥ�� ���� ���ǽ� �н����� ����ǥ�� ī�װ�,������,�����Ⱓ,�н���Ȳ,�н��ϱ� �������� �����Ǿ� �ֽ��ϴ� ">
                        <caption>�н����� ����</caption>
                        <colgroup>
                            <col width="76"/>
                            <col width="344"/>
                            <col width="150"/>
                            <col width="85"/>
                            <col width="65"/>
                            <col width="80"/>
                            <col width="*"/>
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">ī�װ�</th>
                            <th scope="col">������</th>
                            <th scope="col">�н��Ⱓ</th>
                            <th scope="col">���ǽ�</th>
                            <th scope="col">������</th>
                            <th scope="col">������</th>
                        </tr>
                        </thead>
                        <tbody>
<%
                        if(list3.size() != 0){
                            dbox = null;
                            for(int i = 0; i < list3.size(); i++) {
                                dbox = (DataBox)list3.get(i);

                                subj = dbox.getString("d_subj");
                                subjNm = dbox.getString("d_subjnm");
                                isUse = dbox.getString("d_isuse");
                                contentType = dbox.getString("d_contenttype");
                                eduUrl = dbox.getString("d_eduurl");
                                year = dbox.getString("d_year");
                                subjSeq = dbox.getString("d_subjseq");
                                v_isalways = dbox.getString("d_isalways");
                                
                                if(v_isalways.equals("Y")){
	                                eduStart = dbox.getString("d_edustart");
	                                eduEnd = dbox.getString("d_eduend");
                                }else{
	                                eduStart = dbox.getString("d_courseedustart");
	                                eduEnd = dbox.getString("d_courseeduend");
                                }
                                
                                isGraduated = dbox.getString("d_isgraduated");
                                upperClassNm = dbox.getString("d_upperclassnm");
                                tstep = dbox.getDouble("d_tstep");
                                isAbleReview = dbox.getString("d_isablereview");
                                isPossibleByDate = dbox.getString("d_ispossible_by_date");

                                cpsubj = dbox.getString("d_cpsubj");
                                cpsubjseq = dbox.getString("d_cpsubjseq");
                                company = dbox.getString("d_company");
                                contenttype = dbox.getString("d_contenttype");
                                
                                isoutsourcing = dbox.getString("d_isoutsourcing");
                                possibleCnt = dbox.getInt("d_possible_cnt");
                                dispNum = dbox.getInt("d_dispnum");
                                totalPage = dbox.getInt("d_totalpage");

                                eduStart = FormatDate.getFormatDate(eduStart,"yyyy.MM.dd");
                                eduEnd = FormatDate.getFormatDate(eduEnd,"yyyy.MM.dd");

                                
                                if(eduEnd.equals(""))
                                	eduTerm = eduStart;
                                else
                                	eduTerm = eduStart + " ~ " + eduEnd; 
                                
                                
                             	// �н�url=������ ���..
                                if(eduUrl.equals("")) { v_ieduurl = 0; }else{ v_ieduurl = 1; }

                                if (isoutsourcing.equals("Y")) {                 //��Ź�����϶�

                                	eduUrl = "/servlet/controller.contents.EduStart";
                                	eduUrl += "?FIELD1=" + userId + "&FIELD2=" + year + "&FIELD3=" + cpsubj + "&FIELD4=" + cpsubjseq + "&FIELD99=" + company+"&FIELD100=N"+ "&contenttype=" + contenttype+ "&p_subj=" + subj +"&p_year="+ year +"&p_subjseq="+subjSeq;
                                } else {//�ܺΰ����� �ƴѰ��
                                     //���� ���� ���.. eduUrl = EduEtc1Bean.make_eduURL(v_subj,v_year,v_subjseq);
                                    if (eduUrl.equals("")){
                                    	eduUrl = "/servlet/controller.contents.EduStart?p_subj="+subj;
                                    }

                                    if (!year.equals(""))
                                    	eduUrl = eduUrl+"&p_year="+year+"&p_subjseq=";
                                    else
                                    	eduUrl = eduUrl+"&p_year=2000&p_subjseq=";

                                    if(!subjSeq.equals(""))
                                    	eduUrl = eduUrl+subjSeq;
                                    else eduUrl = eduUrl+"0001";
                                    eduUrl +=  "&contenttype=" + contenttype;
                                }
%>
                        <tr>
                            <td class="first"><%= upperClassNm %></td>
                            <td><a href="javascript:fnViewSubjInfo('<%= subj %>', '<%= isUse %>', <%= possibleCnt %>, '<%= year %>', '<%= subjSeq %>');"><%= subjNm %></a></td>
                            <td><%= eduTerm %></td>
                            <td>
								<span class="btnPink"><a href="javascript:studyOpen('3','<%=eduUrl%>','<%=v_ieduurl%>');">���ǽ�</a></td>
                            </td>
                            <td><%= tstep %>%</td>
                            <td>
<%
                                if(!subj.equals("") && isGraduated.equals("Y")) {
%>
                                <span class="btnPink"><a href="javascript:suRoyJeung('<%= subj %>','<%= year %>','<%= subjSeq %>','<%= userId %>','1','<%= grcode %>');">���</a></span>
<%
                                } else {
%>
                                    -
<%
                                }
%>
                            </td>
                        </tr>
<%
                            }
                        } else {
%>
                        <tr>
                            <td class="first" colspan="7">����� ������ �����ϴ�.</td>
                        </tr>
<%
                        }
%>
                        </tbody>
                    </table>
                    </form>
                </div>
                <!-- //tableWrap2 -->

                <div class="paging">
                    <%= PageUtil.re2013_printPageListDiv(totalPage, pageNo, 0, 30, totalRowCount) %>
                </div>
                <!-- //paging -->
            </div>
            <!-- //#subCont -->
        </div>
        <!-- //#contents -->
        <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>


