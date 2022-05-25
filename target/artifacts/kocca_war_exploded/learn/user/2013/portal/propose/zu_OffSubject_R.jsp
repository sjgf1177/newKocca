<%
//**********************************************************
//  1. ��     ��: SUBJECT LIST
//  2. ���α׷���: zu_Subject_L.jsp
//  3. ��     ��: ������ȸ
//  4. ȯ     ��: JDK 1.3
//  5. ��     ��: 1.0
//  6. ��     ��: 2004.01.14
//  7. ��     ��:
//***********************************************************/
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import="java.util.*" %>
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
    String p_specials = box.get("p_specials");
    String p_action = box.get("p_action");
    String type = box.get("type");
    if (box == null) box = RequestManager.getBox(request);
    int v_pageno = box.getInt("p_pageno");
    if (v_pageno == 0)  v_pageno = 1;
    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_pagesize = box.getInt("p_pagesize");
    int  v_totalrowcount =  0;
    DataBox subjectPreview = (DataBox) request.getAttribute("subjectPreview");
    boolean isSeq = true;//���� �����ο��� �������� ����
    String isCheckedPropose = box.getStringDefault("isCheckedPropose","N"); // ������û�ߴ� �������� üũ�ϴ� �� (Y:��û, N:�̽�û)

    isSeq = subjectPreview.getString("d_flagyn").equals("Y") ? true : false; // ������û ��ư on/off ����, ��û�ο��� ���� flag ������(����)

     Date date = new Date();
     SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMddHHmm");
     String strdate = simpleDate.format(date).substring(0,10);
     String nflage="";
     if(subjectPreview.getString("d_propend").compareTo(strdate)>0)
        nflage="Y";
     else
        nflage="N";
     String v_area = box.get("p_area");

    String categoryName = "";
    String sub1_toggle = "off";
    String sub2_toggle = "off";
    String sub3_toggle = "off";
    String sub4_toggle = "off";

    if ("001".equals(v_area)) {
        sub2_toggle = "on";
        categoryName = "������û";
    } else if ("002".equals(v_area)) {
        sub3_toggle = "on";
        categoryName = "������ ����缺����";
    } else if ("003".equals(v_area)) {
        sub4_toggle = "on";
    } else if ("004".equals(v_area)) {
        sub1_toggle = "on";
        categoryName = "3D ��ü������ �����η¾缺";
    }

    String wholeTitle = "";//subjectPreview.getString("d_subjnm") + "-" + categoryName + " - ������û - ���屳��";
    wholeTitle = subjectPreview.getString("d_subjnm") + " - " + categoryName + " - ���屳��";


     box.put("title_str", wholeTitle);

%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>

<!-- ��ũ��Ʈ���� -->
<script language="JavaScript">
<!--//
//LIST
function whenList(){
    document.form1.target = "_self";
    document.form1.action='/servlet/controller.off.ProposeOffServlet';
    document.form1.p_process.value = 'SubjectList';
    document.form1.p_rprocess.value = '';
    self.location.href = "/servlet/controller.off.ProposeOffServlet?p_process=SubjectList";
}

// �����˻� ����ó��
function search_enter(e)  {
    if (e.keyCode =='13'){  subjSearch();  }
}

// �����˻�
function subjSearch() {
    document.form1.p_process.value = "SubjectList";
    document.form1.submit();
}

// �α����
function whenSubjBest(){
    document.form1.target = "_self";
    document.form1.p_process.value= "SubjectListBest";
    document.form1.action= "/servlet/controller.off.ProposeOffServlet";
    document.form1.submit();
}



// ��ü�������� (����ȭ��)
function whenSubjList() {
    var actionurl = document.form1.p_actionurl.value;

    document.form1.target = "_self";
    document.form1.p_process.value = document.form1.p_rprocess.value;
    if(actionurl != null && actionurl != "") {
        document.form1.action = document.form1.p_actionurl.value;
    }
    document.form1.submit();
}

// ����������ȸ
function whenSelSubjInfo(subjseq,year) {
    var url = "/servlet/controller.off.ProposeOffServlet";

    var new_Open = window.open(url,"seqInfo",'scrollbars=yes,width=680,height=600,resizable=no');
    document.form1.target = "seqInfo";
    document.form1.p_process.value = "SeqPreviewPage";
    document.form1.p_subjseq.value = subjseq;
    document.form1.p_year.value = year;
    document.form1.submit();
}

//������û
function whenSubjPropose() {
    if(<%= box.getSession("userid").length()==0 %>) {
        alert("�α����� �ʿ��մϴ�.");

        var retURL = document.location.href;
        retURL = retURL.substr( retURL.indexOf("//") + 2, retURL.length);
        retURL = retURL.substr( retURL.indexOf("/") , retURL.length);
        location.href = "/learn/user/2013/portal/homepage/zu_MainLogin.jsp?p_frmURL=" + encodeURIComponent(retURL);
        return;
    }
    if(!confirm("<%= subjectPreview.getString("d_subjnm") %> ������ ������û�Ͻðڽ��ϱ�?")) {
     return;
    }
    var new_Open = window.open("","proposeWindow",'scrollbars=yes,width=800,height=600,resizable=no');
    document.form1.p_process.value = "SubjectEduProposePage";
    document.form1.target = "proposeWindow";
    document.form1.action = "/servlet/controller.off.ProposeOffServlet";
    document.form1.submit();
    document.form1.target = "_self";
}

//������ �򰡺���
function ContentResearchInfo(){
  document.form1.target = "_self";
  document.form1.p_process.value = "ContentResearch";
  document.form1.action="/servlet/controller.off.ProposeOffServlet";
  document.form1.submit();
}

//���ǰ��ǽ�
function goPersonHistory(){
  document.form1.target = "_self";
  document.form1.p_process.value = "EducationSubjectPage";
  document.form1.action="/servlet/controller.study.MyClassServlet";
  document.form1.submit();
}

//���Ǹ�������
function whenLectureList(isoutsourcing, conturl){
    window.self.name = "LectureList";
    if(isoutsourcing == "N"){
     var url = "/servlet/controller.off.ProposeOffServlet";
     var new_Open = window.open(url,"LectureList1",'scrollbars=yes,width=746,height=550,resizable=no');
     document.form1.target="LectureList1";
     document.form1.p_process.value="LectureList";
     document.form1.submit();
    }else{
      if (conturl == '') {
        alert("���Ǹ��������� �����ϴ�.");
     }
     url = conturl;
     var new_Open = window.open(url,"LectureList1",'scrollbars=yes,width=800,height=600,resizable=no');
    }
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

//-->
</script>

<!-- container-new ���� //-->
<div id="container-new">

<form name="form1" action="/servlet/controller.off.ProposeOffServlet" method="post">
    <input type="hidden" name="type"    value="<%=type%>"/>
    <input type="hidden" name="p_process"   value="<%=box.get("p_process")%>"/>
    <input type="hidden" name="p_rprocess" value="<%=box.getStringDefault("p_rprocess", box.get("p_process"))%>"/>
    <input type="hidden" name="p_actionurl" value="<%=box.get("p_actionurl")%>"/>
    <input type="hidden" name="p_year"  value="<%=box.get("p_year")%>"/>
    <input type="hidden" name="p_subj"  value="<%=box.get("p_subj")%>"/>
    <input type="hidden" name="p_subjseq"   value="<%=box.get("p_subjseq")%>"/>
    <input type="hidden" name="p_seq"   value="<%=box.get("p_seq")%>"/>
    <input type="hidden" name="p_subjnm"    value="<%=box.get("p_subjnm")%>"/>
    <input type="hidden" name="p_iscourseYn"    value=""/>
    <input type="hidden" name="p_upperclass"    value="<%= box.get("p_upperclass") %>"/>
    <input type="hidden" name="p_upperclassnm"  value="<%=box.get("p_upperclassnm")%>"/>
    <input type="hidden" name="p_action"    value="<%=p_action%>"/>
    <input type="hidden" name="p_pageno"    value="<%=v_pageno%>"/>
    <input type="hidden" name="p_pagesize"  value="<%=v_pagesize%>"/>
    <input type="hidden" name="p_area"/>

    <div id="mainMenu">
        <!-- ���� ���� -->
        <ul class="location">
            <li>Ȩ</li>
            <li>���屳��</li>
            <li><%= v_area.equals("001") ? "������û" : "������ ����缺����"%> <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=001" <%= v_area.equals("001") ? "class=\"active\"" : ""%>>������û</a></li>
                    <li><a href="/servlet/controller.course.EduScheduleHomePageServlet?p_process=offSchlYearPlanList">�����ȳ�</a></li>
<!-- 2015-01-07 �������
                    <li><a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=002" <%= v_area.equals("002") ? "class=\"active\"" : ""%>>������ ����缺����</a></li>
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
<!--2015-01-07 �������
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

    <h2 class="subTit">������û <!--<img src="/images/2013/field_edu/courseapply_title.gif" alt="������û" />//--></h2>

        <div id="subCont">
<!-- 2015-01-07 �������
            <ul class="tabCus">
                <!--
                <li><a href="javascript:selectArea('004','');"><img src="/images/2013/field_edu/annual_tab_1_<%=sub1_toggle%>.gif" alt="3D ��ü������ �����η¾缺" /></a></li>
                //-->
<!--
                <li><a href="javascript:selectArea('001','');"><img src="/images/2013/field_edu/annual_tab_2_<%=sub2_toggle%>.gif" alt="������ ���� �米��" /></a></li>
                <li><a href="javascript:selectArea('002','');"><img src="/images/2013/field_edu/annual_tab_3_<%=sub3_toggle%>.gif" alt="����������缺����" /></a></li>
            </ul>
-->
            <h3 class="blind">������ ����缺���� ������ġ</h3>

            <!-- online_box -->
            <div class="online_box">
                <div class="title_center">
                    <%= subjectPreview.getString("d_subjnm") %><br />
                    <span><%= subjectPreview.getString("d_subjtarget") %></span>

                    <%
                    if (isSeq && nflage.equals("Y") && isCheckedPropose.equals("N")) { %>
                    <span style="padding-top:30px;padding-bottom: 40px;"><a href="javascript:whenSubjPropose()"><img src="/images/2013/field_edu/btn_class_apply.gif" alt="������û" /></a></span>
                    <% } %>

                </div>

                <p class="tit"><img src="/images/2013/field_edu/field_tit_1.gif" alt="������ǥ" style="width: 100%;" /></p>
                <ul class="list1">
                    <li><%= subjectPreview.getString("d_intro") %></li>
                </ul>

                <p class="tit"><img src="/images/2013/field_edu/field_tit_2.gif" alt="��������" style="width: 100%;" /></p>
                <br/>
                <%= StringManager.removeHTMLHead(subjectPreview.getString("d_explain")) %>

                <p class="tit"><img src="/images/2013/field_edu/field_tit_3.gif" alt="�����ȳ�" style="width: 100%;" /></p>
                <p class="bul_circle">��������</p>
                <div class="tableWrap11 space2">
                    <table class="dataTable11" summary="�� ǥ�� �����ȳ� ǥ�� ������û�Ⱓ, �����Ⱓ, ��������, ������, �������� �������� ���� �Ǿ� �ֽ��ϴ�.">
                        <caption>�����ȳ� ���� ǥ</caption>
                        <colgroup>
                            <col width="20%"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row">������û�Ⱓ</th>
                            <td><%= subjectPreview.getDate("d_propstart", "/") %> ~ <%= subjectPreview.getDate("d_propend", "/") %></td>
                        </tr>
                        <tr>
                            <th scope="row">�����Ⱓ</th>
                            <td><%= subjectPreview.getDate("d_edustart", "/") %> ~ <%= subjectPreview.getDate("d_eduend", "/") %></td>
                        </tr>
                        <tr>
                            <th scope="row">��������</th>
                            <td><%= subjectPreview.getCommaInt("d_studentlimit") %>��</td>
                        </tr>
                        <tr>
                            <th scope="row">������</th>
                            <td><%
                                String biyong = "";
                                if( subjectPreview.getCommaInt("d_biyong").equals("0") ) {
                                    biyong = "����";
                                } else {
                                    biyong = subjectPreview.getCommaInt("d_biyong") + " ��";
                                }
                                %>
                            <%= biyong %></td>
                        </tr>
                        <tr>
                            <th scope="row">��������</th>
                            <td><% if(!subjectPreview.getString("d_charger").equals("")){%>
                                <%=subjectPreview.getString("d_charger") %>
                                <%}else{ %>
                                    -
                                <%} %></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //tableWrap11 -->

            </div>
            <!-- //online_box -->

            <div class="btnArea right">
                <a href="/servlet/controller.off.ProposeOffServlet?p_process=SubjectList&p_area=<%=v_area%>"><img src="/images/2013/btn/btn_tolist.gif" alt="�������" /></a>
            </div>

        </div>
        <!-- //#subCont -->
    </div>

</form>

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>