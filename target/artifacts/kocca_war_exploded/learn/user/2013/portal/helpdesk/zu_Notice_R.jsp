<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String  v_process    = box.getString("p_process");
    int     v_pageno     = box.getInt   ("p_pageno");
    String  v_userid     = box.getSession("userid");
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    String  v_gubun_view = box.getString("p_gubun_view");
    String  v_gubun_txt = "";

    int v_tabseq   = box.getInt("p_tabseq");
    int v_seq      = box.getInt("p_seq");

    int    v_cnt       = 0;            // ��ȸ��
    String v_gubun     = "";           // ��ü����
    String v_startdate = "";           // �˾�����������
    String v_enddate   = "";           // �˾�����������
    String v_adtitle   = "";           // ����
    String v_adcontent = "";           // ����
    String v_addate    = "";           // �����
    String v_adname    = "";           // �����
    String v_luserid   = "";
//    String v_gubun_view = "";
    String v_loginyn    = "";           // �α�������
    String v_useyn      = "";           // �������
    String v_grcodecd   = "";           // ��� �����׷�
    String v_onoffgubun = "";           // �¶���/�������� ����
    String v_onoff      = "";
    int v_popwidth   = 0;               // �˾�����
    int v_popheight  = 0;               // �˾�����
    int v_popxpos    = 0;               // �˾�x��ġ
    int v_popypos    = 0;               // �˾�y��ġ

    String v_popup   = "";               // �˾�����
    String v_uselist = "";               // ����Ʈ���
    String v_useframe= "";               // �����ӻ��

    DataBox dbox = (DataBox)request.getAttribute("selectNotice");

    if (dbox != null) {
        v_gubun     = dbox.getString("d_gubun");
        v_adtitle   = dbox.getString("d_adtitle");
        v_adcontent = dbox.getString("d_adcontent");
        v_addate    = dbox.getString("d_addate");
        v_adname    = dbox.getString("d_adname");
        v_cnt       = dbox.getInt("d_cnt");
        v_onoff     = box.getString("p_onoffgubun");

        if(dbox.getStringDefault("d_onoffgubun","C").equals("C")){
            v_onoffgubun = "<img src=\"/images/2013/btn/icon_online.gif\" alt=\"�¶���\">";
        }else{
            v_onoffgubun = "<img src=\"/images/2013/btn/icon_offline.gif\" alt=\"��������\">";
        }

        v_addate     = FormatDate.getFormatDate(v_addate, "yyyy.MM.dd");

     }
     v_onoffgubun="";

/*  2015-01-21 ���� ���� ������.
    if (v_gubun.equals("Y")) v_gubun_view = "��ü";
    else if (v_gubun.equals("N")) v_gubun_view = "�Ϲ�";
    else if (v_gubun.equals("P")) v_gubun_view = "�˾�";

*/
    if (v_gubun_view.equals("N")){
        v_gubun_txt = "����";
    } else if (v_gubun_view.equals("G")){
        v_gubun_txt = "�ȳ�";
    } else if (v_gubun_view.equals("I")){
        v_gubun_txt = "����";
    } 

    if (v_uselist.equals("")) v_uselist = "N";
    if (v_useframe.equals("")) v_useframe = "N";

    if(v_loginyn.equals("Y")) v_loginyn = "�α�����";
    else if(v_loginyn.equals("N")) v_loginyn = "�α�����";
    else v_loginyn = "��ü";

    if(v_useyn.equals("Y")) v_useyn = "���";
    else if(v_useyn.equals("N")) v_useyn = "������";

    box.put("title_str", "�������� - ���ҽ�");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- ��ũ��Ʈ���� -->
<SCRIPT type="text/javascript">
    $(function() {
        $(document.body).css("font-family", "����,Dotum,AppleGothic,sans-serif").css("font-size", "12px");
    });


    function listnotice(){
        document.nform2.p_process.value = "List";
        document.nform2.action = "/servlet/controller.homepage.HomeNoticeServlet";
        document.nform2.submit();
    }

</SCRIPT>
<!-- ��ũ��Ʈ�������� -->

<!-- container-new -->
<div id="container-new">

        <div id="mainMenu">
        <!-- �н����� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>���ҽ�</li>
                <li>�������� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul style="z-index: 1;">
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List" class="active">��������</a></li>
                        <li><a href="/servlet/controller.homepage.TongBoardServlet?p_process=list" >��ī���� �̾߱�</a></li>
                        <li><a href="/servlet/controller.homepage.CMUBoardServlet?p_process=list" >CMU ���丮</a></li>
                        <!-- 2015-01-07 �������
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp">����� ��</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">FAQ</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome">�̿�ȳ�</a></li>
                        -->
                    </ul>
                </li>
            </ul>
            <!-- //�н����� -->
<!-- 2015-01-07 �������
            <div class="introCategory">
                <ul>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp">����� ��</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">FAQ</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
                    <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List"><strong><u>��������</u></strong></a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome">�̿�ȳ�</a></li>
                </ul>
            </div>
-->
            <!-- //������ο� -->
        </div>
        <!-- //#mainMenu -->

        <!-- ������ ���� ���� -->
        <div id="contents">
        <!-- form ���� -->
        <form name="nform2" method="post" action="/">
            <input type="hidden" name="p_process" >
            <input type="hidden" name="p_pageno" value="<%=v_pageno %>">
            <input type="hidden" name="p_searchtext" value="<%=v_searchtext %>">
            <input type="hidden" name="p_search" value="<%=v_search %>">
            <input type="hidden" name="p_onoffgubun" value="<%=v_onoff%>" />
            <input type="hidden" id="choicetype" value="subject">
            <input type="hidden" name="p_gubun_view" value="<%=v_gubun_view%>">

            <h2 class="subTit"> ��������
            <!-- <img src="/images/2013/support/notice_title.gif" alt="��������" />
            //--></h2>

            <div id="subCont">
                <div class="noticBox">
                    �ű԰�������, �������� ������ ����, ���, ��û���� �� �پ��� ���񽺿� ���� ������ �ż��ϰ� ���ص帳�ϴ�.
                </div>

                <div class="article">
                    <div class="info">
                        <p class="title"><%=v_onoffgubun %> <%=StringManager.removeHTML(v_adtitle)%></p>
                        <p class="date"><%=v_addate%></p>
                    </div>
                    <div class="inner">
                        <%=StringManager.removeHTMLHead(v_adcontent)%>
                        <%
                            Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
                            Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
                            String i_boardStyle        = "board_view";                                // ���� ��Ÿ��
                        %>
                        <%if(i_realfileVector.size() != 0){ %>
                        <br/>
                        <%@ include file="/learn/user/include/zu_MultiAttach_2012_R.jsp" %>
                        <%} %>
                    </div>
                </div>

                <!--table class="bbsNavi">
                    <colgroup>
                        <col width="60">
                        <col>
                        <col width="70">
                    </colgroup>
                    <tr>
                        <td class="pre">������</td>
                        <td><img src="/images/2013/btn/icon_online.gif" alt="�¶���" /><a href="#">�ڸ�Ʈ�� �޾ƺ��ϴ�</a></td>
                        <td>2013.06.18</td>
                    </tr>
                    <tr>
                        <td class="next">������</td>
                        <td><img src="/images/2013/btn/icon_offline.gif" alt="��������" /><a href="#">�ڸ�Ʈ�� �޾ƺ��ϴ� �ڸ�Ʈ�� �޾ƺ��ϴ� �ڸ�Ʈ�� �޾ƺ��ϴ� �ڸ�Ʈ�� �޾ƺ��ϴ�</a></td>
                        <td>2013.06.18</td>
                    </tr>
                </table-->

                <div class="btnArea right">
                    <a href="javascript:listnotice();"><img src="/images/2013/btn/btn_list.gif" alt="���" /></a>
                </div>

            </div>
            <!-- //#subCont -->
        </form>
        </div>
        <!-- ������ ���� �� -->

</div>
<!--  //container-new  ��-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>