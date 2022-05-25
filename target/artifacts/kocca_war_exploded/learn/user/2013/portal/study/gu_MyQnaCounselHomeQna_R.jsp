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
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    int    v_seq        = box.getInt("p_seq");
    int    v_pageno     = box.getInt("p_pageno");
    String v_searchtext = box.getString("p_searchtext");
    String v_select     = box.getString("p_select");
    String v_selCategory = box.getString("p_selCategory");

    String  v_categorycd  = box.getStringDefault("p_categorycd","00");
    String  v_process     = box.getString("p_process");
    String  v_subj        = box.getString("p_subj");
    String  v_year        = box.getString("p_year");
    String  v_subjseq     = box.getString("p_subjseq");
    String  v_type        = box.getString("pp_type");
    String  v_repkind     = "";
    int     v_repseq      = 0;
    int     v_pagesize    = box.getInt("p_pagesize");

    String  v_action      = box.getString("p_action");
    int     v_upfilecnt   = box.getInt("p_upfilecnt");          //  ������ ������ִ� ���ϼ�

    String s_userid     = box.getSession("userid");

    String v_title      = "";
    String v_contents   = "";
    String v_inuserid   = "";
    String v_indate     = "";
    String v_types      = "";
    String v_name       = "";
    String v_categorynm = "";
    String v_isopen     = "";
    String v_repstatus  = "";
    int    v_cnt        = 0;

    DataBox dbox        = (DataBox)request.getAttribute("selectQna");

    if(dbox != null) {
        v_inuserid          = dbox.getString("d_inuserid");
        v_name              = dbox.getString("d_name");
        v_types             = dbox.getString("d_types");
        v_indate            = dbox.getString("d_indate");
        v_title             = dbox.getString("d_title");
        v_seq               = dbox.getInt("d_seq");
        v_cnt               = dbox.getInt("d_cnt");
        v_contents          = dbox.getString("d_contents");
        v_categorycd        = dbox.getString("d_categorycd");
        v_categorynm        = dbox.getString("d_categorynm");
        v_isopen            = dbox.getString("d_isopen");
        v_repstatus         = dbox.getString("d_okyn1");
    }

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
        <input type="hidden" name="p_seq"         value="<%= v_seq %>">
        <input type="hidden" name="p_searchtext"  value="<%= v_searchtext %>">
        <input type="hidden" name="p_select"      value="<%= v_select %>">
        <input type="hidden" name="p_pageno"      value="<%= v_pageno %>">
        <input type="hidden" name="p_selCategory" value="<%= v_selCategory %>">
        <input type="hidden" name="p_process"     value="">
        <input type="hidden" name="p_userid"      value="<%= v_inuserid %>">
        <input type="hidden" name="p_types"       value="<%=v_types%>">
        <input type="hidden" name="pp_type"       value="<%=v_type%>">

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
                <!--2015-01-09 ���� ����
                <li>
                    ���� ���ǽ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <!--
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
            <h2 class="subTit">��㳻��<!--<img src="/images/2013/online_edu/counsel_title.gif" alt="��㳻��" />//--></h2>

            <div id="subCont" class="myClass2">

                <!-- 2015-01-09 ���� ����
                <ul class="tabCus">
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage"><img src="/images/2013/online_edu/myclass_tab_1_off.gif" alt="���� ���ǽ�" /></a></li>
                    <li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage"><img src="/images/2013/online_edu/myclass_tab_2_on.gif" alt="��㳻��" /></a></li>
                    <li><a href="/servlet/controller.research.SulmunSubjUserServlet?p_process=SulmunNew"><img src="/images/2013/online_edu/myclass_tab_3_off.gif" alt="����" /></a></li>
                </ul>

                //-->
                <h3 class="blind">��㳻�� ������ġ</h3>

                <div class="article">
                        <div class="info">
                            <p class="title"><%= v_title %></p>
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
                    ArrayList list = (ArrayList)request.getAttribute("selectAns");

                    String v_anstitle      = "";
                    String v_anscontents   = "";
                    String v_ansinuserid   = "";
                    String v_ansindate     = "";
                    String v_ansname       = "";
                    String v_anscategorynm = "";
                    String v_savefile      = "";
                    String v_realfile      = "";

                    if(list != null && list.size() != 0 ) {
                        for(int i = 0; i < list.size(); i++) {
                            DataBox Ansbox         = (DataBox)list.get(i);

                            v_ansinuserid = Ansbox.getString("d_inuserid");
                            v_ansname = Ansbox.getString("d_name");
                            v_ansindate = Ansbox.getString("d_indate");
                            v_anstitle = Ansbox.getString("d_title");
                            v_anscontents = Ansbox.getString("d_contents");
                            v_anscategorynm = Ansbox.getString("d_categorynm");
                            v_savefile = Ansbox.getString("d_savefile");
                            v_realfile = Ansbox.getString("d_realfile");
    %>
                        <div class="info3">
                            <p class="name"><%=v_ansname %></p>
                            <p class="date"><%= FormatDate.getFormatDate(v_ansindate, "yyyy.MM.dd HH:mm") %></p>
                        </div>
                        <div class="inner2">
                            <%=StringManager.removeHTMLHead(v_anscontents).replaceAll("\r\n","<br/>") %>
                        </div>
    <%
                            if(!v_savefile.equals("")) { 
    %>
                        <div class="info2">
                            <p class="file">
                                <a href="/servlet/controller.library.DownloadServlet?p_savefile=<%=v_savefile%>&p_realfile=<%=v_realfile%>"><%=v_realfile %></a>

                            </p>
                        </div>
    <%
                            } 
    %>
    <% 
                        }
                    } else {
    %>
                        <div class="inner2">
                            ��ϵ� �亯�� �����ϴ�.
                        </div>

    <%
                    }
    %>
                    </div>
                    <!-- //article -->

                    <table class="bbsNavi" style="display: none;">
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
                    </table>

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