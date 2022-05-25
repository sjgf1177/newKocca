<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    box.put("topmenu","5");
    box.put("submenu","7");

    ArrayList list1 = null;
    ArrayList list2 = null;

    String v_process = box.getString("p_process");

    // �˻�
    String v_searchtext = box.getString("p_searchtext");
    String v_search = box.getString("p_search");

    String v_selSeminarGubun = box.getString("p_selSeminarGubun");
    String p_periodyn = box.getString("p_periodyn");

    int v_pageno = box.getInt("p_pageno");
    int v_dispnum = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
    int v_rowcount = 0;
    int v_pagesize = box.getInt("p_pagesize");

    int v_seq = 0;              // �Ϸù�ȣ
    int v_cnt = 0;              // ��ȸ��

    String v_title = "";           // ����
    String v_content = "";           // ����
    String v_indate = "";           // �����
    String v_name = "";           // �����
    String v_startdate = "";           // �̺�Ʈ ������
    String v_enddate = "";           // �̺�Ʈ ������
    String v_winneryn = "";           // ��û�� ����
    String v_isall = "";
    String v_status = "";
    String v_bannerimg = "";
    String v_save_bannerimg = "";
    String v_periodyn = "";
    String v_periodtxt = "";

    String s_userid = box.getSession("userid");
    String s_username = box.getSession("name");

    list1 = (ArrayList)request.getAttribute("selectList");

    box.put("title_str", "�̺�Ʈ - ���ҽ�");

%>
<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">
<!--
    function go(index) {
        document.nform1.p_pageno.value = index;
        document.nform1.action = "/servlet/controller.homepage.EventHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //������ ����
    function goPage(pageNum) {
        document.nform1.p_pageno.value = pageNum;
        document.nform1.action = "/servlet/controller.homepage.EventHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //����Ʈ ��ȸ
    function select() {
        document.nform1.p_pageno.value = 0;
        document.nform1.action = "/servlet/controller.homepage.EventHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //�󼼺���
    function selectView(seq) {

        document.nform1.action = "/servlet/controller.homepage.EventHomePageServlet";
        document.nform1.p_process.value = "selectView";
        document.nform1.p_seq.value= seq;
        document.nform1.submit();
    }

    function viewPassContent(seq) {

        window.open("about:blank", "popUpView", "top=0, left=0, width=400, height=330, status=no, resizable=no, scrollbars=auto");

        document.nform1.action="/servlet/controller.homepage.EventHomePageServlet";
        document.nform1.p_process.value = "selectViewPass";
        document.nform1.p_seq.value = seq;
        document.nform1.target="popUpView";
        document.nform1.submit();

        document.nform1.target="_self";
    }

    function fnPeriodList(){
        document.nform1.action = "/servlet/controller.homepage.EventHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();

    }

//-->
</SCRIPT>
<!-- ��ũ��Ʈ�������� -->
<!-- container-new ���� //-->
<div id="container-new">

<!-- Form ���� ���� -->
<form name="nform1" method="post" onsubmit="javascript:select();" action="">
    <input type = "hidden" name = "p_process">
    <input type = "hidden" name = "p_pageno"  value="<%=v_pageno%>">
    <input type = "hidden" name = "p_seq"    >

    <div id="mainMenu">
        <!-- �¶��� ���� -->
        <ul class="location">
            <li>Ȩ</li>
            <li>���ҽ�</li>
            <li>�̺�Ʈ <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List" >��������</a></li>
                    <li><a href="/servlet/controller.homepage.EventHomePageServlet?p_process=selectList" class="active">�̺�Ʈ</a></li>
                    <li><a href="/servlet/controller.homepage.TongBoardServlet?p_process=list" >��ī���� �̾߱�</a></li>
                    <li><a href="/servlet/controller.homepage.CMUBoardServlet?p_process=list" >CMU ���丮</a></li>
                    <!-- 2015-01-09 �������
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">���� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList" class="active">�����ȳ�</a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">Ŀ�´�Ƽ</a></li>
                    -->
                </ul>
            </li>
        </ul>

        <!-- ������ο� -->
<!-- 2015-01-07 �������
        <div class="introCategory">
            <ul>
                <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">���� ���ǽ�</a></li>
                <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList">�����ȳ�</a></li>
                <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage"><strong><u>Ŀ�´�Ƽ</u></strong></a></li>
            </ul>
        </div>
-->
        <!-- //������ο� -->
    </div>

    <!-- ������ ���� ���� -->
    <div class="content">
        <h2 class="subTit">�̺�Ʈ</h2>
        <div class="subCont">
            <div class="noticBox">
                ��������ī���̿��� ����Ǵ� �پ��� �̺�Ʈ �ҽ��� ���ص帳�ϴ�.
            </div>
            <div style="margin-left : 15px ; width: 49px;">
            <select name="p_periodyn" onchange="javascript:fnPeriodList();">
                <option value="">��ü</option>
                <option value="Y" <%= p_periodyn.equals("Y")? "selected" : "" %>>������</option>
                <option value="P" <%= p_periodyn.equals("P")? "selected" : "" %>>����</option>
                <option value="N" <%= p_periodyn.equals("N")? "selected" : "" %>>����</option>
            </select>
            </div>
            <table class="eventlist" cellpadding="0" cellspacing="0" summary="���� �������� �̺�Ʈ�� ����Դϴ�">
                <colgroup><col width="438px"><col width="438px"></colgroup>
                <tr>
                <%
                    if(list1.size() != 0){
                        for( int i = 0; i < list1.size(); i++) {
                            DataBox dbox = (DataBox)list1.get(i);

                            v_seq = dbox.getInt("d_seq");
                            v_cnt = dbox.getInt("d_cnt");
                            v_title = dbox.getString("d_title");
                            v_startdate = dbox.getString("d_strdate");
                            v_enddate = dbox.getString("d_enddate");
                            v_indate = dbox.getString("d_indate");
                            v_name = dbox.getString("d_name");
                            v_winneryn = dbox.getString("d_winneryn");
                            v_isall = dbox.getString("d_isall");

                            v_dispnum = dbox.getInt("d_dispnum");
                            v_totalpage = dbox.getInt("d_totalpage");
                            v_rowcount = dbox.getInt("d_rowcount");
                            v_bannerimg = dbox.getString("d_bannerimg");
                            v_save_bannerimg = dbox.getString("d_save_bannerimg");
                            v_periodyn = dbox.getString("d_periodyn");

                            if (v_periodyn.equals("Y")){
                                v_periodtxt = "������";
                            } else {
                                v_periodtxt = "����";
                            }

                            if(v_winneryn.equals("C")){
                                v_winneryn = "�̹�ǥ";
                                v_status = "�Ϸ�";
                            } else if(v_winneryn.equals("Y")){
                                v_winneryn = "<a href='javascript:viewPassContent("+v_seq+")'><img src='/images/portal/homepage_renewal/library/btn_dok.jpg' width='90' height='21' alt='��÷��Ȯ��' /></a>";
                                v_status = "�Ϸ�";
                            } else if(v_winneryn.equals("N")){
                                v_winneryn = "�̹�ǥ";
                                v_status = "����";
                            } else if(v_winneryn.equals("A")){
                                v_winneryn = "�̹�ǥ";
                                v_status = "����";
                            }


                            //if (!v_searchtext.equals("")&&v_search.equals("title")) {
                                /*
                            if (!v_searchtext.equals("")) {
                                v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
                            }
                                */
%>
                    <td style="padding:15px;" >
                        <a href="javascript:selectView(<%=v_seq%>)" tabindex="<%=i+180%>" title="<%=FormatDate.getFormatDate(v_startdate, "yyyy.MM.dd")%> ~ <%=FormatDate.getFormatDate(v_enddate, "yyyy.MM.dd")%> <%=v_title%>�� ���� �̺�Ʈ �󼼳����� Ȯ���մϴ�">
                        <div>

                            <div>
                                <img style="border-style:solid; border-color:#dedede; border-width:1px;" width = "435px" height="140px" src="<%=v_save_bannerimg%>" alt="<%=FormatDate.getFormatDate(v_startdate, "yyyy.MM.dd")%> ~ <%=FormatDate.getFormatDate(v_enddate, "yyyy.MM.dd")%> <%=v_title%>">
                            </div>
                            <div style="padding-top: 4px; line-height: 20px;">
                            <b>&#183 ���� :</b> <%=StringManager.formatTitle(v_title,45)%> <br>
                            <b>&#183 �Ⱓ :</b> <%=FormatDate.getFormatDate(v_startdate, "yyyy.MM.dd")%> ~ <%=FormatDate.getFormatDate(v_enddate, "yyyy.MM.dd")%>
                            <span><img src="/images/2013/common/<%= v_periodyn.equals("Y") ? "event_01.png" : (v_periodyn.equals("N") ? "event_02.png" : "event_03.png") %>" style="margin-bottom: -3px;"></span>
                            </div>
                        </div>
                        </a>

                    </td>
<%
                            if ((i+1)%2 == 0) {
%>
                </tr>
                <tr>
<%
                            }
%>

<%                      }
                    } else if (list1.size() == 0) {
%>
                    <td colspan="4" style="padding: 32px 0 32px 12px; text-align:left; font-family:����; font-weight:bold; font-size:18px; ">
                        ���� �������� �̺�Ʈ�� �����ϴ�.
                    </td>
<%
                    }
%>
<%
                if (list1.size() % 2 == 1) {
%>
                    <th></th><td>&nbsp;</td>
<%
                }
%>
                </tr>
            </table>

            <div class="paging pgSpace">
                <%= PageUtil.re2013_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
            </div>

        </div>
    </div>
</form>
</div>
<!--  //container-new �� //-->
<%@ include file="/learn/user/2013/portal/include/footer.html"%>

