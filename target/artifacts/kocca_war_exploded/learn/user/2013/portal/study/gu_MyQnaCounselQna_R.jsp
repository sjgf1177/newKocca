<%
//**********************************************************
//  1. ��      ��: ���ǻ�㳻�� - ���� QnA �󼼺���
//  2. ���α׷��� : gu_MyQnaCounselSangdam_R.jsp
//  3. ��      ��: ���ǻ�㳻��
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.11.26
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.research.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.study.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    box.put("topmenu","2");
    box.put("submenu","5");

    String  v_process   = box.getString("p_process");
    String  v_categorycd  = box.getString("p_categorycd");
    int     v_seq         = box.getInt("p_seq");
    String  v_subj        = box.getString("p_subj");
    String  v_year        = box.getString("p_year");
    String  v_subjseq     = box.getString("p_subjseq");
    String  v_type        = box.getString("p_type");
    String  v_searchtext  = box.getString("p_searchtext");
    String  v_select      = box.getString("p_select");
    String  v_repkind     = "";
    int     v_repseq      = 0;

    int     v_pageno      = box.getInt("p_pageno");
    int     v_pagesize    = box.getInt("p_pagesize");

    DataBox dbox        = (DataBox)request.getAttribute("selectMyQnaCounselQna");
    String v_inuserid   = dbox.getString("d_inuserid");
    String v_lesson     = dbox.getString("d_lesson");
    String v_kind       = dbox.getString("d_kind");
    String v_name       = dbox.getString("d_name");
    String v_indate     = dbox.getString("d_indate");
    String v_title      = dbox.getString("d_title");
    String v_contents   = dbox.getString("d_contents");
    String v_grcodenm   = dbox.getString("d_grcodenm");
    String v_grcode     = dbox.getString("d_grcode");
    String v_okyn1      = dbox.getString("d_okyn1");
    String v_okuserid1  = dbox.getString("d_okuserid1");
    String v_okdate1    = dbox.getString("d_okdate1");
    String v_okyn2      = dbox.getString("d_okyn2");
    String v_okuserid2  = dbox.getString("d_okuserid2");
    String v_okdate2    = dbox.getString("d_okdate2");
    String v_scsubjnm   = dbox.getString("d_scsubjnm");
    String v_subjseqgr  = dbox.getString("d_subjseqgr");
    Vector v_realfileVector = (Vector)dbox.getObject("d_realfile");
    Vector v_savefileVector = (Vector)dbox.getObject("d_savefile");
    String v_realmotion  = dbox.getString("d_realmotion");
    String v_savemotion  = dbox.getString("d_savemotion");
    String v_status_view = "";
    int    v_filecount   = v_realfileVector.size();
    int    v_cnt         = dbox.getInt("d_cnt");

    //vc_status  1 : ��ó��, 2 : ó����, 3 : �Ϸ�
    if (v_okyn1.equals("1")) {
        v_status_view = "������";
    } else if (v_okyn1.equals("2")) {
        v_status_view = "�亯�غ���";
    } else if (v_okyn1.equals("3")) {
        v_status_view = "�亯�Ϸ�";
    } else {
        v_status_view = "";
    }

    MyQnaBean myqnabean = new MyQnaBean();

    //Relative Start
    String pp_searchStart   = box.getString("p_searchStart");
    String pp_searchEnd     = box.getString("p_searchEnd");
    String ss_gyear         = box.getString("s_gyear");
    String ss_grseq         = box.getString("s_grseq");
    String ss_upperclass    = box.getString("s_upperclass");
    String ss_middleclass   = box.getString("s_middleclass");
    String ss_lowerclass    = box.getString("s_lowerclass");
    String ss_subjcourse    = box.getString("s_subjcourse");
    String ss_subjseq       = box.getString("s_subjseq");
    String pp_order         = box.getString("p_order");
    String pp_orderType     = box.getString("p_orderType");
    //Relative End

    box.put("title_str", "��� ���� - ���θ޴�");
    //box.put("title_str", "��� ����-���� ���ǽ�, �¶��α���");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
    $(function() {
        $(document.body).css("font-family", "����,Dotum,AppleGothic,sans-serif").css("font-size", "12px");
    });

    // �������
    function listPage() {
        document.form1.target = "_self";
        document.form1.p_process.value='MyQnaCounselListPage';
        document.form1.action='/servlet/controller.study.MyQnaServlet';
        document.form1.submit();
    }

//-->
</script>
<!-- ��ũ��Ʈ�������� -->
<!-- container-new ���� //-->
<div id="container-new">

    <!-- Form ���� ���� -->
    <form name="form1" method="post" action="/servlet/controller.study.MyQnaServlet">
        <input type="hidden" name="p_process"     value="<%= v_process %>">
        <input type="hidden" name="p_pageno"      value="<%= v_pageno %>">
        <input type="hidden" name="p_pagesize"    value="<%= v_pagesize %>">
        <input type="hidden" name="p_type"        value="<%= v_type %>">
        <input type="hidden" name="p_subj"        value="<%= v_subj %>">
        <input type="hidden" name="p_year"        value="<%= v_year %>">
        <input type="hidden" name="p_subjseq"     value="<%= v_subjseq %>">
        <input type="hidden" name="p_select"      value="<%= v_select %>">
        <input type="hidden" name="p_searchtext"  value="<%= v_searchtext %>">

    <div id="mainMenu">
        <ul class="location">
            <li>���θ޴�</li>
            <li>��㳻�� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage" >�¶��� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage">���屳�� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=MINE" >�����ۼ��� ��</a></li>
                    <li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage" class="active" >��㳻��</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">��������</a></li>
                </ul>
            </li>

            <!-- 2015-01-20 ���� ���� 
            <li>Ȩ</li>
            <li>�¶��� ����</li>
            <li>
                ���� ���ǽ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage" class="active">���� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList">�����ȳ�</a></li>
                    <li><a href="#">Ŀ�´�Ƽ</a></li>
                </ul>
            </li>
            //-->
        </ul>

        <!-- ������ο� -->
        <!-- 2015-01-20 ������� 
        <div class="introCategory">
            <ul>
                <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage"><strong><u>���� ���ǽ�</u></strong></a></li>
                <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList">�����ȳ�</a></li>
                <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">Ŀ�´�Ƽ</a></li>
            </ul>
        </div>
        //-->
        <!-- //������ο� -->
        <!-- //�¶��� ���� -->
    </div>


   <!-- ������ ���� ���� -->
    <div id="contents">
        <h2 class="subTit">��㳻��<!-- <img src="/images/2013/online_edu/myclass_title.gif" alt="���� ���ǽ�" /> //--></h2>

        <div id="subCont" class="myClass2">
            <!-- 2015-01-20 ���� ����
            <ul class="tabCus">
                <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage"><img src="/images/2013/online_edu/myclass_tab_1_off.gif" alt="���� ���ǽ�" /></a></li>
                <li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage"><img src="/images/2013/online_edu/myclass_tab_2_on.gif" alt="��㳻��" /></a></li>
                <li><a href="/servlet/controller.research.SulmunSubjUserServlet?p_process=SulmunNew"><img src="/images/2013/online_edu/myclass_tab_3_off.gif" alt="����" /></a></li>
            </ul>
            //-->
            <h3 class="blind">��㳻�� ������ġ</h3>

            <div class="article">
                    <div class="info">
                        <p class="title"><%=v_scsubjnm %></p>
                        <p class="date"><%= FormatDate.getFormatDate(v_indate, "yyyy.MM.dd") %></p>
                    </div>

                    <div class="inner">
                        <%=v_contents%>
                    </div>
                </div>
                <!-- //article -->

                <p class="answer"><a href="#">�亯</a></p>

                <div class="article">
                <%
                ArrayList list = (ArrayList)request.getAttribute("selectMyQnaCounselQnaListA");
                ArrayList list1 = new ArrayList();
                int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
                //int v_cnt = 0;
                int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1;
                if(list.size() != 0) {
                    for(int i = 0; i < list.size(); i++) {
                        DataBox dboxA = (DataBox)list.get(i);
                        v_dispnum   = dboxA.getInt("d_dispnum");
                        v_inuserid  = dboxA.getString("d_inuserid");
                        v_name      = dboxA.getString("d_name");
                        v_indate    = dboxA.getString("d_indate");
                        v_title     = dboxA.getString("d_title");
                        v_seq       = dboxA.getInt("d_seq");
                        v_totalpage = dboxA.getInt("d_totalpage");
                        v_rowcount  = dboxA.getInt("d_rowcount");
                        v_contents  = dboxA.getString("d_contents");
                        v_scsubjnm  = dboxA.getString("d_scsubjnm");
                        v_subjseqgr = dboxA.getString("d_subjseqgr");
                        v_repseq    = dboxA.getInt("d_seq");
                        v_repkind   = dboxA.getString("d_kind");
                %>
                    <div class="info3">
                        <p class="name"><%=v_name %></p>
                        <p class="date"><%= FormatDate.getFormatDate(v_indate, "yyyy.MM.dd HH:mm") %></p>
                    </div>
                    <div class="inner2">
                        <%=StringManager.removeHTMLHead(v_contents) %>
                    </div>
                <% }} %>
                </div>
                <!-- //article -->

                <!--table class="bbsNavi" style="display: none;">
                    <colgroup>
                        <col width="70">
                        <col>
                        <col width="70">
                        <col width="70">
                    </colgroup>
                    <tr>
                        <td class="pre">������</td>
                        <td><img src="/images/2013/common/ico_pds.gif" alt="�ڷ�" /> <a href="my_class_2.html">������, ����� �߽� Ȩ������ ������</a></td>
                        <td>�ۼ���</td>
                        <td>2013.06.18</td>
                    </tr>
                    <tr>
                        <td class="next">������</td>
                        <td><img src="/images/2013/common/ico_pds.gif" alt="�ڷ�" /> <a href="my_class_2.html">�Ȼ걳����, ������ִ� �����̾߱⡯ �ʵ��� �������� ��ȭ... ��ȣ����</a></td>
                        <td>ȫ�浿</td>
                        <td>2013.06.18</td>
                    </tr>
                </table-->

                <div class="btnArea right">
                    <a href="javascript:history.go(-1);"><img src="/images/2013/btn/btn_list.gif" alt="���" /></a>
                </div>
            </div>
            <!-- //#subCont -->
        </div>
        <!-- //#contents -->
        <!-- ������ ���� �� -->


    </form>

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>