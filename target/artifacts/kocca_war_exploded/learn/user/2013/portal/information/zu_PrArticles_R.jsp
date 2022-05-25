<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String  v_process    = box.getString("p_process");
    int     v_tabseq     = box.getInt   ("p_tabseq");
    int     v_pageno     = box.getInt   ("p_pageno");
    String  v_userid     = box.getSession("userid");
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");


    int v_seq      = box.getInt("p_seq");

    String  v_date          = "";
    String  v_title         = "";
    String  v_content       = "";
    String  v_name          = "";
    String  v_flagYn        = "";
    String  v_position      = "";
    String  v_url           = "";
    int     v_cnt           =  0;
    DataBox dbox = (DataBox)request.getAttribute("selectView");

    if (dbox != null) {
        v_title     = dbox.getString("d_title");
        v_content   = dbox.getString("d_content");
        v_date      = FormatDate.getFormatDate(dbox.getString("d_ldate"),"yyyy�� MM�� dd��");
        v_name      = dbox.getString("d_name");
        v_flagYn    = dbox.getString("d_flagyn");
        v_position  = dbox.getString("d_position");
        v_url       = dbox.getString("d_url");
        v_cnt       = dbox.getInt("d_cnt");
     }

    box.put("title_str", "�����ڷ�, ��ī���̼Ұ�");
%>
<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">

    function listnotice(){
        document.nform2.p_process.value = "selectList";
        document.nform2.action = "/servlet/controller.infomation.BriefingHomePageServlet";
        document.nform2.submit();
    }

</SCRIPT>
<!-- ��ũ��Ʈ�������� -->

<form name="nform2" method="post">
    <input type = "hidden" name = "p_process" >
    <input type = "hidden" name = "p_seq" value="<%=v_seq%>">
    <input type = "hidden" name = "p_tabseq" value="<%=v_tabseq%>">
    <input type = "hidden" name = "p_pageno" value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_search" value = "<%=v_search %>">
</form>

        <!-- ������ ���� ���� -->
        <div id="contents">

            <div id="mainMenu">
                <!-- ��ī���� �Ұ� -->
                <ul class="location">
                    <li>Ȩ</li>
                    <li>��ī���̼Ұ�</li>
                    <li>
                        �����ڷ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                        <ul style="z-index: 1;">
                            <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">������� �λ縻</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">������� �ȳ�</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER">�������±��</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction">���ô� ��</a></li>
                            <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus">���޹���</a></li>
<!-- 2015-01-08 �������
                        <li><a href="/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList">�����ڷ�</a></li>
-->

                        </ul>
                    </li>
                </ul>
                <div class="introCategory">
                    <ul>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=DirectorMessage">������� �λ縻</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Facility">�ü��Ұ�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=edu">������� �ȳ�</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=PR">ȫ������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=COOPER">�������±��</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageAboutUsServlet?p_process=Direction">���ô� ��</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=contactus">���޹���</a></li>
                        <li><a href="/servlet/controller.infomation.BriefingHomePageServlet?p_process=selectList"><strong><u>�����ڷ�</u></strong></a></li>
                    </ul>
                </div>
            </div>


            <h2 class="subTit"><img src="/images/2013/introduce/bodo_title.gif" alt="�����ڷ�" /></h2>

            <div id="subCont">
                <div class="article">
                    <div class="info">
                        <p class="title"><%=v_title%></p>
                        <p class="date"><%=v_date %></p>
                    </div>

                    <div class="inner">
                        <%=StringManager.removeHTMLHead(v_content)%>
                        <%
                        Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
                        Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
                        String i_boardStyle        = "board_view";                                // ���� ��Ÿ��
                        %>
                        <%@ include file="/learn/user/include/zu_MultiAttach_2012_R.jsp" %>
                    </div>
                </div>
                <!-- //article -->

                <!--table class="bbsNavi">
                    <colgroup>
                        <col width="70">
                        <col>
                        <col width="70">
                        <col width="70">
                    </colgroup>
                    <tr>
                        <td class="pre">������</td>
                        <td><img src="/images/2013/common/ico_info.gif" alt="����" /> <a href="my_class_2.html">������, ����� �߽� Ȩ������ ������</a></td>
                        <td>�ۼ���</td>
                        <td>2013.06.18</td>
                    </tr>
                    <tr>
                        <td class="next">������</td>
                        <td><img src="/images/2013/common/ico_question2.gif" alt="����" /> <a href="my_class_2.html">�Ȼ걳����, ������ִ� �����̾߱⡯ �ʵ��� �������� ��ȭ... ��ȣ����</a></td>
                        <td>ȫ�浿</td>
                        <td>2013.06.18</td>
                    </tr>
                </table-->

                <div class="btnArea right">
                    <a href="javascript:listnotice();"><img src="/images/2013/btn/btn_list.gif" alt="���" /></a>
                </div>
            </div>
            <!-- //#subCont -->




        </div>
        <!-- ������ ���� �� -->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>