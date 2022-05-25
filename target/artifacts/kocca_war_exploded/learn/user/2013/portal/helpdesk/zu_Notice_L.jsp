<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="com.credu.homepage.*" %>
<%@ page import="com.credu.library.*" %>
<%@ page import="com.credu.common.*" %>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    ArrayList list2 = null;

    int v_tabseq = box.getInt("p_tabseq");
    int v_seq = box.getInt("p_seq");
    String v_process  = box.getString("p_process");
    String v_onoff = box.getStringDefault("p_onoffgubun","ALL");
    String v_gubun_view = box.getString("p_gubun_view"); // �������� ����

    // �˻�
    String v_searchtext = box.getString("p_searchtext");
    String v_search = box.getString("p_search");

    int    v_cnt = 0;            // ��ȸ��
    String v_gubun = "";           // ��ü����
    String v_startdate = "";           // �˾�����������
    String v_enddate = "";           // �˾�����������
    String v_adtitle = "";           // ����
    String v_adcontent = "";           // ����
    String v_addate = "";           // �����
    String v_adname = "";           // �����
    String v_luserid = "";
//    String v_gubun_view = "";
    String v_loginyn = "";           // �α�������
    String v_useyn = "";           // �������
    String v_grcodecd = "";           // ��� �����׷�
    String v_isall = "";           // ��ü ���� ����
    String v_onoffgubun = "";           // �¿�������
    int v_popwidth = 0;               // �˾�����
    int v_popheight = 0;               // �˾�����
    int v_popxpos = 0;               // �˾�x��ġ
    int v_popypos = 0;               // �˾�y��ġ

    String v_popup = "";               // �˾�����
    String v_uselist = "";               // ����Ʈ���
    String v_useframe = "";               // �����ӻ��

    String v_upfile ="";
    //String v_realfile  ="";

    int v_dispnum = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
    int v_rowcount = 0;
    int v_upfilecnt = 0;
    int v_pageno = box.getInt("p_pageno");
    int v_pagesize = box.getInt("p_pagesize");

    int  v_totalrowcount =  0;

    String s_userid = box.getSession("userid");
    String s_username = box.getSession("name");

    list2 = (ArrayList)request.getAttribute("selectNoticeList");

    String left_menu = "helpdesk";

    box.put("title_str", "�������� - ���ҽ�");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>

<!-- ��ũ��Ʈ�������� -->
<SCRIPT type="text/javascript" LANGUAGE="JavaScript">
<!--
    function go(index) {
        document.nform1.p_pageno.value = index;
        document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
        document.nform1.p_process.value = "List";
        document.nform1.submit();
    }

    //������ ����
    function goPage(pageNum) {
        document.nform1.p_pageno.value = pageNum;
        document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
        document.nform1.p_process.value = "List";
        document.nform1.submit();
    }

    function pagesize(pageSize) {
        document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
        document.nform1.p_pageno.value = 1;
        document.nform1.p_pagesize.value = pageSize;
        document.nform1.p_process.value = "List";
        document.nform1.submit();
    }

    function search_enter(e)  {
        if (e.keyCode =='13'){  select();  }
    }

    //����Ʈ ��ȸ
    function select() {
        document.nform1.p_pageno.value = 0;
        document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
        document.nform1.p_process.value = "List";
        document.nform1.submit();
    }

    //�󼼺���
    function selectView(seq) {

        document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
        document.nform1.p_process.value = "selectView";
        document.nform1.p_seq.value= seq;
        document.nform1.submit();
    }

//-->
</SCRIPT>
<!-- container-new -->
<div id="container-new">

    <form name="nform1" method="post" action="/" onsubmit="javascript:select();">
    <input type="hidden" name="p_process" />
    <input type="hidden" name="p_pageno"  value="<%=v_pageno%>" />
    <input type="hidden" name="p_seq"    />
    <input type="hidden" name="p_pagesize"  value="<%=v_pagesize%>" />

        <div id="mainMenu">
        <!-- �н����� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>���ҽ�</li>
                <li>
                    �������� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul style="z-index: 1;">
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List" class="active">��������</a></li>
                        <li><a href="/servlet/controller.homepage.TongBoardServlet?p_process=list" >��ī���� �̾߱�</a></li>
                        <li><a href="/servlet/controller.homepage.CMUBoardServlet?p_process=list" >CMU ���丮</a></li>
                    <!-- 2015-01-09 ������
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp">����� ��</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">FAQ</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome">�̿�ȳ�</a></li>
                    -->
                    </ul>
                </li>
            </ul>

            <!-- //�н����� -->
<!--2015-01-07 ����
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
        <h2 class="subTit">��������
            <!-- <img src="/images/2013/support/notice_title.gif" alt="��������" />
            //--></h2>

            <div id="subCont">
                <div class="noticBox">
                    �ű԰�������, �������� ������ ����, ���, ��û���� �� �پ��� ���񽺿� ���� ������ �ż��ϰ� ���ص帳�ϴ�.
                </div>
                <!--  ������ �� �˻� -->
                <div class="search">
                    <fieldset>
                        <legend>���� �˻�</legend>
                        <label for="oTotalSearch" style="display:none;">���� �˻�</label>
                        <select id="oTotalSearch" name="p_search" title="�˻� �з�">
                            <option value="adtitle" <%=v_search.equals("adtitle")?"selected":"" %>>����</option>
                            <option value="adcontent" <%=v_search.equals("adcontent")?"selected":"" %>>����</option>
                        </select>
                        <input type="text" name="p_searchtext" value="<%=v_searchtext %>" title="�˻���" class="keyword" onkeypress="search_enter(event);" />
                        <input type="image" src="/images/2013/btn/btn_src2.gif" alt="�˻�" class="btn" onclick="javascript:select();" />
                    </fieldset>
                </div>

                <div class="tableWrap2 space5">
                    <table class="board" summary="��ǥ�� �������� ǥ�� ��ü, ����, �����, ��ȸ ������ �����Ǿ��ֽ��ϴ�.">
                        <caption>�������� ����Ʈ</caption>
                        <colgroup>
                            <col width="6%"/>
                            <col width="10%"/>
                            <col width="*"/>
                            <col width="10%"/>
                            <col width="7%"/>
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col"><label for="oOnOffGubun">��ȣ</label></th>
                            <th scope="col">
                                <select class="" id="oGubun" name="p_gubun_view" onchange="javascript:select();">
                                    <option value="" <%if(v_gubun_view.equals("")){%>selected<%}%>>��ü</option>
                                    <option value="N" <%if(v_gubun_view.equals("N")){%>selected<%}%>>����</option>
                                    <option value="G" <%if(v_gubun_view.equals("G")){%>selected<%}%>>�ȳ�</option>
                                    <option value="I" <%if(v_gubun_view.equals("I")){%>selected<%}%>>����</option>
                                <!-- 2015-01-21 ���� ����
                                <select class="" id="oOnOffGubun" name="p_onoffgubun" onchange="javascript:select();">
                                    <option value="ALL" <%if(v_onoff.equals("ALL")){%>selected<%}%>>��ü</option>
                                    <option value="ON" <%if(v_onoff.equals("ON")){%>selected<%}%>>�¶���</option>
                                    <option value="OFF" <%if(v_onoff.equals("OFF")){%>selected<%}%>>����</option>
                                </select>
                                -->
                                </select>
                            </th>
                            <th scope="col">����</th>
                            <th scope="col">�����</th>
                            <th scope="col">��ȸ</th>
                        </tr>
                        </thead>
                        <tbody>
<%
                        if(list2.size() != 0){
                            for( int i = 0; i < list2.size(); i++) {
                                DataBox dbox = (DataBox)list2.get(i);
                                v_seq      = dbox.getInt("d_seq");
                                v_cnt      = dbox.getInt("d_cnt");
                                v_adtitle  = dbox.getString("d_adtitle");
                                v_addate   = dbox.getString("d_addate");
                                v_adname   = dbox.getString("d_adname");
                                v_upfilecnt = dbox.getInt("d_filecnt");
                                v_dispnum   = dbox.getInt("d_dispnum");
                                v_totalpage = dbox.getInt("d_totalpage");
                                v_totalrowcount = dbox.getInt("d_totalrowcount");
                                v_rowcount  = dbox.getInt("d_rowcount");
                                v_isall     = dbox.getString("d_isall");
                                v_onoffgubun = dbox.getString("d_onoffgubun");
                                v_gubun =dbox.getString("d_gubun");
                                String txtGubun = "";

                                if( v_onoffgubun.equals("C") ) {
                                    v_onoffgubun = "<img src=\"/images/2013/btn/icon_online.gif\" alt=\"�¶���\">";
                                } else {
                                    v_onoffgubun = "<img src=\"/images/2013/btn/icon_offline.gif\" alt=\"��������\">";
                                }
                                
                                if(v_gubun.equals("G")){
                                    txtGubun = "�ȳ�";
                                } else if(v_gubun.equals("I")){
                                    txtGubun = "����";
                                } else {
                                    txtGubun = "����";
                                }

                                v_addate = FormatDate.getFormatDate(v_addate, "yyyy.MM.dd");
%>
                        <tr>
                            <td class="first"><%=v_dispnum%></td>
                            <td class="bldnone"><%=txtGubun %></td>
                            <td class="bldnone left"><a href="javascript:selectView(<%=v_seq%>);"><%=StringManager.removeHTML(v_adtitle)%></a></td>
                            <td><%=v_addate%></td>
                            <td><%=v_cnt%></td>
                        </tr>
<% 
                            } 
                        } else {
%>
                        <tr>
                            <td colspan="5">��ϵ� �Խù��� �����ϴ�.</td>
                        </tr>
<% 
                        }
%>
                        </tbody>
                    </table>
                </div>
                <!-- //tableWrap2 -->

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
<!--  //container-new -->
<%@ include file="/learn/user/2013/portal/include/footer.html"%>