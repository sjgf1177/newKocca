<%
//**********************************************************
//  1. ��     ��: SUBJECT LIST
//  2. ���α׷���: zu_Subject_L.jsp
//  3. ��     ��: ������ȸ
//  4. ȯ     ��: JDK 1.3
//  5. ��     ��: 1.0
//  6. ��     ��: 2004.01.14
//  7. ��     ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String type = box.get("type");
    String v_area = box.get("p_area");

    // �˻�
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");


    String sub_title_img ="";  // �����̹���
    String sub_title_name =""; // ���� �̹��� ����
    String sub_title_navi =""; // ���� �̹��� ����

    String  v_today        =  FormatDate.getDate("yyyyMMddHH");

     if (type.equals("S01")) {
        sub_title_img = "/images/2012/sub/page3/title/offline_cast.gif";
        sub_title_name = "�������ΰ��� ��ۿ��� �о�";
        sub_title_navi = "��ۿ���";
    } else if (type.equals("S02")) {
        sub_title_img = "/images/2012/sub/page3/title/offline_making.gif";
        sub_title_name = "�������ΰ��� ���Ӱ��� �о�";
        sub_title_navi = "��������";
    } else if (type.equals("S03")) {
        sub_title_img = "/images/2012/sub/page3/title/offline_plan.gif";
        sub_title_name = "�������ΰ��� ��ȹâ�� �о�";
        sub_title_navi = "��ȹâ��";
    } else {
        sub_title_img = "/images/2012/sub/page3/title/offline_total.gif";
        sub_title_name = "�������ΰ��� ��ۿ��� �о�";
        sub_title_navi = "��ü";
    }

    //box.put("submenu","1");


    String p_specials = box.get("p_specials");
    String p_action = box.get("p_action");

    String p_menuid = box.get("menuid"); //��� 01,���� 02,��ȹ 03
    String p_middleclass = box.get("s_mclassnm");  //����������米�� 001,����������缺���� 002, ��Ź���� 003
    if (box == null) box = RequestManager.getBox(request);
    List<DataBox> subjList = (List<DataBox>)request.getAttribute("SubjectList");         // ���� ����Ʈ
    int v_pageno = box.getInt("p_pageno");
    if (v_pageno == 0)  v_pageno = 1;
    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_pagesize = box.getInt("p_pagesize");
    int  v_totalrowcount =  0;

    String categoryName = "";
    String sub1_toggle = "off";
    String sub2_toggle = "off";
    String sub3_toggle = "off";
    String sub4_toggle = "off";

    if ("001".equals(v_area)) {
        sub2_toggle = "on";
        categoryName = "������ ���� �米��";
    } else if ("002".equals(v_area)) {
        sub3_toggle = "on";
        categoryName = "������ ����缺����";
    } else if ("003".equals(v_area)) {
        sub4_toggle = "on";
        categoryName = "";
    } else if ("004".equals(v_area)) {
        sub1_toggle = "on";
        categoryName = "3D ��ü������ �����η¾缺";
    }

    // box.put("title_str", categoryName + "-������û, ���屳��");
    box.put("title_str", categoryName + " - ������û");// 2015-03-06 "������ ���� �米��" �̸�����
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>

<!-- ��ũ��Ʈ���� -->
<script language="JavaScript">
<!--//
// �����˻� ����ó��
function search_enter(e)  {
    if (e.keyCode =='13'){  subjSearch();  }
}

// �����˻�
function subjSearch() {
    document.form1.p_process.value = "SubjectList";
    document.form1.submit();
}

//���� ���뺸��
function whenSubjInfo(subj, year, subjseq, seq){
    var subjForm = document.form1;
    subjForm.p_subj.value = subj;
    subjForm.p_year.value = year;
    subjForm.p_subjseq.value = subjseq;
    subjForm.p_seq.value = seq;
    subjForm.p_process.value = 'SubjectPreviewPage';
    subjForm.p_rprocess.value = 'SubjectList';
    subjForm.action='/servlet/controller.off.ProposeOffServlet';
    subjForm.method = "get";
    subjForm.target = "_self";
    subjForm.submit();
}

//��ü��������
function whenSubjectListAll() {
document.form1.p_process.value = 'SubjectListAll';
document.form1.p_rprocess.value = 'SubjectList';
document.form1.action='/servlet/controller.off.ProposeOffServlet';
document.form1.submit();
}
//������û
function whenSubjPropose(subj,year,subjseq, subjnm, seq) {
    if(<%= box.getSession("userid").length()==0 %>) {
        alert("�α����� �ʿ��մϴ�.");
        var retURL = document.location.href;
        retURL = retURL.substr( retURL.indexOf("//") + 2, retURL.length);
        retURL = retURL.substr( retURL.indexOf("/") , retURL.length);
        location.href = "/learn/user/2013/portal/homepage/zu_MainLogin.jsp?p_frmURL=" + retURL;
        return;
    }
    if(!confirm(subjnm+"������ ������û�Ͻðڽ��ϱ�?")){
     return;
    }
    var new_Open = window.open("","proposeWindow",'scrollbars=yes,width=800,height=600,resizable=no');
    document.form1.p_process.value = "SubjectEduProposePage";
    document.form1.target = "proposeWindow";
    document.form1.p_subj.value = subj;
    document.form1.p_year.value = year;
    document.form1.p_subjseq.value = subjseq;
    document.form1.p_seq.value = seq;
    document.form1.action = "/servlet/controller.off.ProposeOffServlet";
    document.form1.submit();
    document.form1.target = "_self";
}

//���ɹ�ư Ŭ��
function fnInterestInsert(subj,year,subjseq,courseyn,subjnm) {

    if (confirm(subjnm + " ������ ���ɰ������� ����ϽÁٽ��ϱ�?")) {
            $.post("/servlet/controller.common.AjaxServlet"
                    , {checkSqlNum:"interest.exist", sqlNum:"interest.insert", p_subj:subj,rerurnFunction:"resultInterest"}
                    , function(data) {
                        $("#ajaxDiv").html(data);
                    });
    }
}
function resultInterest(data) {
    if (data.result=='true') alert("���ɰ������� ����߽��ϴ�.");
    else alert("���ɰ��� ����� �����Ͽ����ϴ�.\n"+data.result);
}
    //������ �̵�
    function go(index) {
        document.form1.p_action.value = "go";
        document.form1.p_pageno.value = index;
        document.form1.p_process.value = "SubjectList";
        document.form1.submit();
    }
    //������ �̵�
    function selectArea(area,mid) {
        //document.form1.type.value = area;
        document.form1.p_area.value = area;
        if( mid != '' ) {
            document.form1.menuid.value = mid;
        }
        //document.form1.s_mclassnm.value = "";
        document.form1.p_action.value = "go";
        document.form1.p_process.value = "SubjectList";
        document.form1.p_pageno.value = 0;
        document.form1.submit();
    }
    //������ �̵�
    function goPage(pageNum) {
        document.form1.p_action.value = "go";
        document.form1.p_pageno.value = pageNum;
        document.form1.p_process.value = "SubjectList";
        document.form1.submit();
    }
    function pagesize(pageSize) {
        document.form1.target = "_self";
        document.form1.p_pageno.value = 1;
        document.form1.p_pagesize.value = pageSize;
        document.form1.p_process.value = "SubjectList";
        document.form1.submit();
    }
//-->
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->

<!-- container-new ���� //-->
<div id="container-new">

    <!-- form ���� -->

    <form name="form1" action="/servlet/controller.off.ProposeOffServlet" method="post">
    <input type="hidden" name="type"    value="<%=type%>"/>
    <input type="hidden" name="p_upperclass"    value="<%=type%>"/>
    <input type="hidden" name="p_process"   value="<%=box.get("p_process")%>"/>
    <input type="hidden" name="p_rprocess"  value=""/>
    <input type="hidden" name="p_year"  value=""/>
    <input type="hidden" name="p_subj"  value=""/>
    <input type="hidden" name="p_subjseq"   value=""/>
    <input type="hidden" name="p_seq"   value=""/>
    <input type="hidden" name="gubun" value="2">
    <input type="hidden" name="p_area" id="p_area"  value="<%= box.get("p_area") %>"/>
    <input type="hidden" name="p_action"    value="<%=p_action%>"/>
    <input type="hidden" name="p_pageno"    value="<%=v_pageno%>"/>
    <input type="hidden" name="p_pagesize"  value="<%=v_pagesize%>"/>
    <input type="hidden" name="menuid" value='<%= box.get("menuid") %>'>
    <input type="hidden" name="p_topuserid" value=""/>
    <input type="hidden" name="p_toppwd"    value=""/>

    <div id="mainMenu">
        <!-- ���� ���� -->
        <ul class="location">
            <li>Ȩ</li>
            <li>���屳��</li>
            <li><%= v_area.equals("001") ? "������û" : "������ ����缺����"%> <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <!-- 2015-03-06������ ���� �米�� �̸� ���� /-->
                    <li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=001" <%= v_area.equals("001") ? "class=\"active\"" : ""%>>������û</a></li>
                    <!-- 2015-02-23 ����
                    <li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=002" <%= v_area.equals("002") ? "class=\"active\"" : ""%>>������ ����缺����</a></li>
                    //-->
                    <li><a href="/servlet/controller.course.EduScheduleHomePageServlet?p_process=offSchlYearPlanList">�����ȳ�</a></li>
<!-- 2015-01-07 �������
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage">���� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=001" class="active">������û</a></li>
-->
                    <!-- 2014-04-23 ���� 3D������ �̷�â���η� �̰� �Ϸ������ ���Ͽ� �ּ�ó��
                    <li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=004" class="active">������û</a></li>
                    //-->
                </ul>
            </li>
        </ul>

        <!-- ������ο� -->
<!-- 2015-01-07 �������
        <div class="introCategory">
            <ul>
                <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage">���� ���ǽ�</a></li>
                <li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=001"><strong><u>������û</u></strong></a></li>
                <li><a href="/servlet/controller.course.EduScheduleHomePageServlet?p_process=offSchlYearPlanList">�����ȳ�</a></li>
            </ul>
        </div>
-->
    </div>


    <!-- ������ ���� ���� -->
    <div id="contents">
        <h2 class="subTit"><%= v_area.equals("001") ? "������û" : "������ ����缺����"%>
        <!--<img src="/images/2013/field_edu/annual_title<%= v_area.equals("001") ? "01" : "02"%>.gif" alt="<%= v_area.equals("001") ? "������ ���� �米��" : "������ ����缺����"%>" />//-->
        </h2>

        <div id="subCont">
<!-- 2015-01-07 �������
            <ul class="tabCus">
                <!--
                <li><a href="javascript:selectArea('004','');"><img src="/images/2013/field_edu/annual_tab_1_<%=sub1_toggle%>.gif" alt="3D ��ü������ �����η¾缺" /></a></li>
                //-->
<!--
                <li><a href="javascript:selectArea('001','');"><img src="/images/2013/field_edu/annual_tab_2_<%=sub2_toggle%>.gif" alt="������ ���� �米��" /></a></li>
                <li><a href="javascript:selectArea('002','');"><img src="/images/2013/field_edu/annual_tab_3_<%=sub3_toggle%>.gif" alt="������ ����缺����" /></a></li>
            </ul>

-->

            <h3 class="blind">������û ������ġ</h3>

            <!--2015-03-06 ����
            <div class="noticBox">
                <strong>[3D ��ü������ ����]</strong><br />
                �� ����� 2014�� 4���η� �ѱ���������������� ������Ż�������(<a href="http://uhd3d.nipa.kr" target="_blank" style="color:#0000ff;">uhd3d.nipa.kr</a>)���� ����� �̰��Ǿ����� �˷��帳�ϴ�. <br />
            </div>

            -->
        <!--  ������ �� �˻� -->
        <div class="search">
            <fieldset>
                <legend>���� �˻�</legend>
                <select name="p_search" title="�˻� �з�">
                    <option value="NAME" <%=v_search.equals("NAME")?"selected":"" %>>������</option>
                </select>
                <input type="text" name="p_searchtext" value="<%=v_searchtext %>" title="�˻���" class="keyword" onkeypress="search_enter(event);" />
                <input type="image" src="/images/2013/btn/btn_src2.gif" alt="�˻�" class="btn" onclick="javascript:subjSearch();" />
            </fieldset>
        </div>


            <div class="board2 space2">
                <table class="" summary="�� ǥ�� ���屳�� �����ȳ� ǥ�� �о�, ������, ������, ��û�Ⱓ, �����Ⱓ,���� �� ���� �Ǿ� �ֽ��ϴ�.">
                    <caption>�����ȳ� ǥ</caption>
                    <colgroup>
                        <col width="*"/>
                        <col width="35%"/>
                        <col width="*"/>
                        <col width="*"/>
                        <col width="*"/>
                        <col width="*"/>
                    </colgroup>
                    <thead>
                        <tr>
                            <th>�о�</th>
                            <th>������</th>
                            <th>������</th>
                            <th>��û�Ⱓ</th>
                            <th>�����Ⱓ</th>
                            <th>����</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    int i = 0;
                    for(DataBox dbox : subjList) {
                    String biyong = "";
                    String slimit = "";
                    String propyn = dbox.getString("d_propyn");
                    if( dbox.getInt("d_biyong") == 0 ) {
                        biyong = "����";
                    } else {
                        biyong = dbox.getCommaInt("d_biyong") + "��";
                    }
                    if( dbox.getInt("d_studentlimit") == 0 ) {
                        slimit = "���Ѿ���";
                    } else {
                        slimit = dbox.getCommaInt("d_studentlimit") + "��";
                    }
                    %>
                    <tr>
                        <td class="first"><%=dbox.get("d_areaname") %></td>
                        <td class="subject"><a href="javascript:whenSubjInfo(
                                    '<%=dbox.get("d_subj")%>',
                                    '<%=dbox.get("d_year")%>',
                                    '<%=dbox.get("d_subjseq")%>',
                                    '<%=dbox.get("d_seq")%>')"><%=dbox.get("d_subjnm")%></a></td>
                        <td><%= biyong %></td>
                        <td><%=dbox.getDate("d_propstart", ".").substring(0,10)%>~<%=dbox.getDate("d_propend", ".").substring(0,10)%></td>
                        <td><%=dbox.getDate("d_edustart", ".").substring(0,10)%>~<%=dbox.getDate("d_eduend", ".").substring(0,10)%></td>
                        <td>
                        <%if(dbox.get("d_me_sukang_yn").equals("Y")) {%>��û�Ϸ�<%  } else if( dbox.get("d_isprop").equals("Y") ) { %>
                            <a href="javascript:whenSubjPropose(
                                    '<%=dbox.get("d_subj")%>',
                                    '<%=dbox.get("d_year")%>',
                                    '<%=dbox.get("d_subjseq")%>',
                                    '<%=dbox.get("d_subjnm")%>',
                                    '<%=dbox.get("d_seq")%>')"><img src="/images/2013/field_edu/btn_apply.gif" alt="��û" /></a>
                        <% } else if (StringManager.toInt(dbox.get("d_propstart")) >= StringManager.toInt(v_today)){ %>
                            <a href="javascript:alert('������û �Ⱓ�� �ƴմϴ�.');"><img src="/images/2013/field_edu/btn_standby.gif" alt="���" /></a>
                        <% } else { %>
                            <img src="/images/2013/field_edu/btn_ending.gif" alt="����" />
                        <% } i++; %>
                        </td>
                    </tr>
                    <%
                        v_totalpage  = dbox.getInt("d_totalpage");// for ���� �ȿ� ����
                        v_totalrowcount = dbox.getInt("d_totalrowcount");
                        v_rowcount    = dbox.getInt("d_rowcount");
                    }
                    if( subjList.size() < 1) {
                    %>
                        <tr><td colspan="6" class="first">��ϵ� ������ �����ϴ�.</td></tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
            <!-- //tableWrap -->

            <div class="paging">
                <%= PageUtil.re2013_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
            </div>
            <!-- //paging -->

        </div>
        <!-- //#subCont -->
    </div>
    <!-- ������ ���� �� -->
    </form>

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>