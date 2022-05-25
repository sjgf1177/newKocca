<%
//**********************************************************
//  1. ��      ��: ���ǰ��ι� > ���ǻ�㳻��
//  2. ���α׷��� : gu_MyQnaCounsel_L.jsp
//  3. ��      ��: ���� ��㳻��
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.11.25
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    if (box == null) box = RequestManager.getBox(request);

    String  ss_userid     = box.getSession("userid");
    int     v_no = 0;
    String  v_sdate       = "";
    String  v_types       = "";
    String  v_type        = "";
    String  v_typenm      = "";
    String  v_title       = "";
    String  v_status      = "";
    String  v_status_view = "";
    String  v_status_class = "";
    String  v_searchtext  = box.getString("p_searchtext");
    String  v_select      = box.getString("p_select");
    String  p_type        = box.getString("p_type");
    String  v_edustart    = "";
    String  v_eduend      = "";
    String  v_subj          = "";
    String  v_subjseq       = "";
    String  v_year          = "";
    String  v_userid        = "";
    String  sScriptString   = "";


    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0, v_tabseq = 0;

    // ����¡����
    int row      = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_pageno = box.getInt("p_pageno");

    ArrayList blist2 = (ArrayList)request.getAttribute("MyQnaCounselListPage");  // �н�����

    box.put("title_str", "��� ���� - ���θ޴�");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
    $(function() {
        $(document.body).css("font-family", "����,Dotum,AppleGothic,sans-serif").css("font-size", "12px");
    });

    function press_enter(e) {
        if (e.keyCode =='13'){  selectList();  }
    }

    //�˻����뿡 �´� ����Ʈ �������� �̵�
    function selectList() {
        //if (form1.p_searchtext.value == ""){
        //  alert("�˻� �� ������ �Է��� �ּ���");
        //}else{
            document.form1.action = "/servlet/controller.study.MyQnaServlet";
            document.form1.p_process.value = "MyQnaCounselListPage";
            document.form1.p_pageno.value = "1";
            document.form1.submit();
        //}
    }

    //��ȭ�� �������� �̵�
    function select(tabseq, seq,  userid, types) {
        document.form1.action = "/servlet/controller.study.MyQnaServlet";
        document.form1.p_process.value   = "MyQnaSiteViewPage";
        document.form1.p_tabseq.value    = tabseq;
        document.form1.p_seq.value       = seq;
        document.form1.p_userid.value    = userid;
        document.form1.p_types.value     = types;
        //document.form1.p_upfilecnt.value = upfilecnt;
        document.form1.submit();
    }


    //������ �̵�
    function goPage(pageNum) {
        document.form1.p_pageno.value = pageNum;
        document.form1.action = "/servlet/controller.study.MyQnaServlet";
        document.form1.p_process.value = "MyQnaCounselListPage";
        document.form1.submit();

    }


    //Q&A��ȭ�� �������� �̵�
    function viewHomeqna(seq, upfilecnt, userid, types, type) {
        document.form1.action               = "/servlet/controller.study.MyQnaServlet";
        document.form1.p_process.value      = "MyQnaCounselHomeQnaViewPage";
        document.form1.p_seq.value          = seq;
        document.form1.p_userid.value       = userid;
        document.form1.p_types.value        = types;
        document.form1.pp_type.value        = type;
        document.form1.p_upfilecnt.value    = upfilecnt;
        document.form1.submit();
    }

    //�������� ��ȭ�� �������� �̵�
    function viewQna(seq,subj,year,subjseq) {
        document.form1.action = "/servlet/controller.study.MyQnaServlet";
        document.form1.p_process.value = "MyQnaCounselQnaViewPage";
        document.form1.p_seq.value     = seq;
        document.form1.p_subj.value    = subj;
        document.form1.p_year.value    = year;
        document.form1.p_subjseq.value = subjseq;
        document.form1.submit();
    }

//-->
</script>
<!-- ��ũ��Ʈ�������� -->
<!-- container-new ���� //-->
<div id="container-new">

    <!-- Form ���� ���� -->
    <form name="form1" method="post" action="/servlet/controller.study.MyQnaServlet" onsubmit="javascript:selectList();">
        <input type="hidden" name="p_process"     value="">
        <input type="hidden" name="p_pageno"      value="<%= v_pageno %>">
        <input type="hidden" name="p_seq"         value="">
        <input type="hidden" name="p_userid"      value="">
        <input type="hidden" name="p_upfilecnt"   value="">
        <input type="hidden" name="p_types"       value="">
        <input type="hidden" name="pp_type"       value="">
        <input type="hidden" name="p_tabseq"      value="">
        <input type="hidden" name="p_subj">
        <input type="hidden" name="p_year">
        <input type="hidden" name="p_subjseq">

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

            <!-- 2015-01-09 ������
            <li>���� ���ǽ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
            //-->
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
            <!-- 2015-01-09 ������
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage" class="active">���� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList">�����ȳ�</a></li>
                    <li><a href="#">Ŀ�´�Ƽ</a></li>
                </ul>
            </li>
            //-->
            </li>
        </ul>

        <!-- ������ο� -->
        <!-- 2015-01-09 ���� ����
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
        <h2 class="subTit">��㳻��<!--<img src="../images/2013/online_edu/counsel_title.gif" alt="��㳻��" />//--></h2>

        <div id="subCont" class="myClass2">

            <!-- 2015-01-09 �������
            <ul class="tabCus">
                <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage"><img src="/images/2013/online_edu/myclass_tab_1_off.gif" alt="���� ���ǽ�" /></a></li>
                <li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage"><img src="/images/2013/online_edu/myclass_tab_2_on.gif" alt="��㳻��" /></a></li>
                <li><a href="/servlet/controller.research.SulmunSubjUserServlet?p_process=SulmunNew"><img src="/images/2013/online_edu/myclass_tab_3_off.gif" alt="����" /></a></li>
                <li><a href="/servlet/controller.study.FavorOpenClassServlet?p_process=favorOpenClassList"><img src="/images/2013/online_edu/myclass_tab_4_off.gif" alt="���Ѱ���" /></a></li>
            </ul>
            //-->
            <h3 class="blind">��㳻�� ������ġ</h3>

            <div class="board2">
                <table summary="�۹�ȣ, �з�, ����, ����, �ۼ���, ����� ��ȸ�� �����Ǿ��ֽ��ϴ�.">
                    <colgroup>
                        <col width="5%"/>
                        <col width="12%"/>
                        <col width="*"/>
                        <col width="10%"/>
                        <col width="12%"/>
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">
                            <select title="�з�" name="p_type" onChange="selectList()">
                                <option value="ALL" <%=p_type.equals("ALL") ? "selected" : "" %>>��ü</option>
                                <option value="MM" <%=p_type.equals("MM") ? "selected" : "" %>>1vs1���</option>
                                <option value="SUBJ" <%=p_type.equals("SUBJ") ? "selected" : "" %>>����������</option>
                                <option value="PQ" <%=p_type.equals("PQ") ? "selected" : "" %>>����Ʈ �̿� ����</option>
                            </select>
                        </th>
                        <th scope="col">����</th>
                        <th scope="col">�ۼ���</th>
                        <th scope="col">���</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                    if(blist2.size() != 0){
                        for (int i=0; i<blist2.size(); i++) {
                            DataBox dbox = (DataBox)blist2.get(i);
                            v_dispnum   = dbox.getInt("d_dispnum");
                            v_no        = dbox.getInt("d_no");
                            v_sdate     = dbox.getString("d_sdate");
                            v_types     = dbox.getString("d_types");
                            v_totalpage = dbox.getInt("d_totalpage");
                            v_title     = dbox.getString("d_title");
                            v_type      = dbox.getString("d_type");
                            v_status    = dbox.getString("d_status");
                            v_userid    = dbox.getString("d_userid");
                            v_subj      = dbox.getString("d_subj");
                            v_year      = dbox.getString("d_year");
                            v_subjseq   = dbox.getString("d_subjseq");

                            int i_upfilecnt = dbox.getInt("d_upfilecnt");

                            if (!v_searchtext.equals("")&&v_select.equals("title")) {
                                v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
                            }

                            if (v_type.equals("PQ")) {
                                v_typenm = "Ȩ������";
                            } else if (v_type.equals("BU") || v_type.equals("CU") || v_type.equals("OO") || v_type.equals("MM")) {
                                v_typenm = "1vs1���";
                            } else if (v_type.equals("OFF")) {
                                v_typenm = "�������";
                            } else if (v_type.equals("SUBJ")) {
                                v_typenm = "����������";
                            } else {
                                v_typenm = "";
                            }

                            //vc_status  1 : ��ó��, 2 : ó����, 3 : �Ϸ�
                            if (v_status.equals("1")) {
                                v_status_view   = "��ó��";
                                v_status_class  = "pre";
                            } else if (v_status.equals("2")) {
                                v_status_view   = "�亯��";
                                v_status_class  = "ing";
                            } else if (v_status.equals("3")) {
                                v_status_view   = "<img src=\"/images/2013/btn/btn_answer_done2.gif\" alt=\"�亯�Ϸ�\" />";
                                v_status_class  = "finish";
                            } else {
                                v_status_view   = "��ó��";
                                v_status_class  = "pre";
                            }

                            if ("PQ".equals(v_type) || "BU".equals(v_type) || "CU".equals(v_type) || "OO".equals(v_type) || "MM".equals(v_type)) {
                                sScriptString   = "viewHomeqna('" + v_no + "', '" + v_upfilecnt + "', '" + v_userid + "', '" + v_types + "', '" + v_type + "');";
                            } else if ("SUBJ".equals(v_type)) {
                                sScriptString   = "viewQna('" + v_no + "', '" + v_subj + "', '" + v_year + "', '" + v_subjseq + "');";
                            }
                    %>
                    <tr>
                        <td class="first"><%= v_dispnum %></td>
                        <td class="fs"><%= v_typenm %></td>
                        <td class="left"><a href="javascript:<%=sScriptString %>;"><%= v_title %></a></td>
                        <td><%=FormatDate.getFormatDate(v_sdate, "yyyy.MM.dd")%></td>
                        <td><%=v_status_view %></td>
                    </tr>
                    <%
                        }
                    }else{
                    %>
                    <tr>
                        <td class="first" colspan="5">��ϵ� ������ �����ϴ�.</td>
                    </tr>
                    <%} %>
                    </tbody>
                </table>
            </div>
            <!-- //board2 -->

            <div class="paging">
                <%= PageUtil.re2013_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
            </div>
            <!-- //paging -->
        </div>
        <!-- //#subCont -->
    </div>

    </form>

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>