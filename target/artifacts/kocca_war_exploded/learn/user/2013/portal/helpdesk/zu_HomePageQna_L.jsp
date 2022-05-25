<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    if (box == null) box = RequestManager.getBox(request);
    int v_tabseq         = box.getInt("p_tabseq");
    int row = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_seq = 0,v_readcnt = 0,v_cnt = 0;

    String v_inuserid   = "";
    String v_position   = "";
    String v_indate     = "";
    String v_title      = "";
    String tLink        = "";
    String v_types      = "";
    String v_name       = "";
    String v_categorycd = "";
    String v_categorynm = "";
    String v_isopen     = "";
    String v_repstatus  = "";
    String v_repstatusnm = "";


    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
    ArrayList selectList = (ArrayList)request.getAttribute("selectList");

    String  v_searchtext     = box.getString("p_searchtext");
    String  v_search         = box.getString("p_search");
    String  v_selCategory    = box.getString("p_selCategory");

    int v_pageno             = box.getInt("p_pageno");
    String s_userid          = box.getSession("userid");
    String s_usernm          = box.getSession("name");
    String s_grcode          = box.getStringDefault("tem_grcode", box.getSession("tem_grcode"));

    int  v_totalrowcount =  0;

    String v_classname1      = "";
    String v_classname2      = "";

    box.put("title_str", "���� ���ϱ� - �������� - ������");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ���� -->
<script language="JavaScript" type="text/JavaScript">
<!--

//�Է��������� �̵�
function insertPage() {
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value = "insertPage";
    document.form1.p_pageno.value = "<%= v_pageno %>";
    document.form1.submit();
}

function search_enter(e)  {
    if (e.keyCode =='13'){  selectList();  }
}


//�˻����뿡 �´� ����Ʈ �������� �̵�
function selectList() {
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value = "";
    document.form1.submit();
}

//��ȭ�� �������� �̵�
function select(seq, upfilecnt, userid, types) {
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value   = "selectView";
    document.form1.p_seq.value       = seq;
    document.form1.p_userid.value    = userid;
    document.form1.p_types.value     = types;
    document.form1.p_upfilecnt.value = upfilecnt;
    document.form1.submit();
}

//ī�װ��� �´� ����Ʈ �˻�
function changeCategory() {
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value    = "";
    document.form1.submit();
}

//��� �������� �̵�
function insertPage() {
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value = "insertPage";
    document.form1.submit();
}

//������ �̵�
function go(index) {
    document.form1.p_pageno.value = index;
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value = "";
    document.form1.submit();
}

//������ �̵�
function goPage(pageNum) {
     document.form1.p_pageno.value = pageNum;
     document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
     document.form1.p_process.value = "";
     document.form1.submit();
}
//-->
</script>

<!-- container-new ���� //-->
<div id="container-new">


    <!-- form ���� -->
    <form name="form1" method = "post" action="">
    <input type="hidden" name="p_process"     value="">
    <input type="hidden" name="p_pageno"      value="<%=v_pageno%>">
    <input type="hidden" name="p_seq"         value="">
    <input type="hidden" name="p_userid"      value="">
    <input type="hidden" name="p_upfilecnt"   value="">
    <input type="hidden" name="p_types"       value="<%=v_types%>">

        <div id="mainMenu">
        <!-- �н����� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>������</li>
                <li>�������� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul style="z-index: 1;">
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=HelpHome">�н�����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">�����ϴ� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList" class="active">��������</a></li>
<!--
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp">����� ��</a></li>
-->
<!--
                        <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome">�̿�ȳ�</a></li>
-->
                    </ul>
                </li>
            </ul>

            <!-- //�н����� -->
            <!--
            <div class="introCategory">
                <ul>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp">����� ��</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList">FAQ</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList"><strong><u>��������</u></strong></a></li>
                    <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">��������</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome">�̿�ȳ�</a></li>
                </ul>
            </div>
            -->
            <!-- //������ο� -->
            
        </div>
        <!-- //#mainMenu -->

        <!-- ������ ���� ���� -->
        <div id="contents">


            <h2 class="subTit">��������<!--<img src="/images/2013/support/studyask_title.gif" alt="��������" />//--></h2>

            <div id="subCont">
                <ul class="tabCus">
                    <li><a href="#"><img src="/images/2013/support/tabstudy1_on.jpg" alt="���� ���ϱ�" /></a></li>
                    <li><a href="/servlet/controller.homepage.HomePageContactServlet?p_process=insertPage;"><img src="/images/2013/support/tabstudy2_off.jpg" alt="1:1����" /></a></li>
                </ul>
                <h3 class="blind">������ϱ� ������ġ</h3>

                <div class="noticBox">
                    ���� �� ����� �亯�� �Ϸ�Ǹ� ȸ������ ����������� �亯�Ϸ� �ȳ� SMS�� �߼۵˴ϴ�.
                </div>

                <div class="noticBox">
                    <strong>[3D ��ü������ ����]</strong><br />
                    �� ����� 2014�� 4���η� �ѱ���������������� ������Ż�������(<a href="http://uhd3d.nipa.kr" target="_blank" style="color:#0000ff;">uhd3d.nipa.kr</a>)���� ����� �̰��Ǿ����� �˷��帳�ϴ�. <br />
                    <%-- ���� : 070-7551-6738 --%>
                </div>
            <!--  ������ �� �˻� -->
            <div class="search">
                <fieldset>
                    <legend>���� �˻�</legend>
                    <select name="p_search" title="�˻� �з�">
                        <option value="TITL" <%=v_search.equals("TITL")?"selected":"" %>>����</option>
                        <option value="CONT" <%=v_search.equals("CONT")?"selected":"" %>>����</option>
                        <option value="NAME" <%=v_search.equals("NAME")?"selected":"" %>>�ۼ���</option>
                    </select>
                    <input type="text" name="p_searchtext" value="<%=v_searchtext %>" title="�˻���" class="keyword" onkeypress="search_enter(event);" />
                    <input type="image" src="/images/2013/btn/btn_src2.gif" alt="�˻�" class="btn" onclick="javascript:selectList();" />
                </fieldset>
            </div>

                <div class="tableWrap2 space5">
                    <table class="board" summary="��ǥ�� ���� ���ǽ� ����� ����ǥ�� ī�װ�,������,�����Ⱓ,����,����,���Ῡ��,������ ���� �����Ǿ��ֽ��ϴ�.">
                        <caption>����� ����</caption>
                        <colgroup>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="*"/>
                            <col width="12%"/>
                            <col width="11%"/>
                            <col width="13%"/>
                            <col width="7%"/>
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">
                                <select class="" name="p_selCategory" onchange="selectList()">
                                    <option value="" <%=box.getString("p_selCategory").equals("ALL")? "selected":"" %>>��ü</option>
                                    <option value="B1" <%=box.getString("p_selCategory").equals("B1")? "selected":"" %>>��ۿ���</option>
                                    <option value="A1" <%=box.getString("p_selCategory").equals("A1")? "selected":"" %>>���Ӱ���</option>
                                    <option value="C1" <%=box.getString("p_selCategory").equals("C1")? "selected":"" %>>��ȭ������</option>
                                </select>
                            </th>
                            <th scope="col">����</th>
                            <th scope="col">�ۼ���</th>
                            <th scope="col">�����</th>
                            <th scope="col">�亯����</th>
                            <th scope="col">��ȸ</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            if(selectList.size() != 0){
                                for(int i = 0; i < selectList.size(); i++) {
                                    DataBox dbox = (DataBox)selectList.get(i);
                                    v_dispnum    = dbox.getInt("d_dispnum");
                                    v_inuserid   = dbox.getString("d_inuserid");
                                    v_name       = dbox.getString("d_name");
                                    v_cnt        = dbox.getInt("d_cnt");
                                    v_indate     = dbox.getString("d_indate");
                                    v_title      = dbox.getString("d_title");
                                    v_seq        = dbox.getInt("d_seq");
                                    v_types      = dbox.getString("d_types");
                                    v_readcnt    = dbox.getInt("d_readcnt");
                                    v_upfilecnt  = dbox.getInt("d_filecnt");
                                    v_totalpage  = dbox.getInt("d_totalpage");
                                    v_rowcount   = dbox.getInt("d_rowcount");
                                    v_categorycd = dbox.getString("d_categorycd");
                                    v_categorynm = dbox.getString("d_categorynm");
                                    v_isopen     = dbox.getString("d_isopen");
                                    v_repstatus  = dbox.getString("d_okyn1");
                                    v_totalrowcount = dbox.getInt("d_totalrowcount");

                                    // �˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.
                                    if (!v_searchtext.equals("")&&v_search.equals("title")) {
                                        v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
                                    } else if(!v_searchtext.equals("")&&v_search.equals("name")){
                                        v_name = StringManager.replace(v_name, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
                                    }

                                    if(v_categorynm.equals("")){
                                        v_categorynm = "��Ÿ";
                                    }

                                    if(v_repstatus.equals("3")){
                                        v_repstatusnm = "<img src=\"/images/2013/btn/btn_answer_done.gif\" alt=\"�亯�Ϸ�\" />";
                                    }else if(v_repstatus.equals("2")){
                                        v_repstatusnm = "�غ���";
                                    }else{
                                        v_repstatusnm = "��ó����";
                                    }
                        %>
                        <tr>
                            <td class="first"><%=v_dispnum%></td>
                            <td><%=v_categorynm%></td>
                            <td class="left">
                                <%if (v_isopen.equals("N")){%>
                                    <img src="/images/2013/common/ico_rock.gif" alt="��� ǥ��" />
                                <% } %>
                                <%if (v_isopen.equals("N") && !s_userid.equals(v_inuserid)){%>
                                    <a href="javascript:alert('��б��� �ۼ��ڸ� �� �� �ֽ��ϴ�.');"><%=StringManager.formatTitle(v_title, 30)%></a>
                                <%}else{ %>
                                    <a href="javascript:select('<%=v_seq%>','<%=v_upfilecnt%>','<%=v_inuserid%>','<%=v_types%>');"><%=StringManager.formatTitle(v_title, 30)%></a>
                                <%}%>
                                <%if (FormatDate.getDate("yyyyMMdd").equals(FormatDate.getFormatDate(v_indate, "yyyyMMdd"))){%>
                                    <img src="/images/2013/common/ico_new2.gif" alt="���οö�� �� ǥ��" />
                                <%} %>
                            </td>
                            <td><%=v_name%></td>
                            <td><%=FormatDate.getFormatDate(v_indate, "yyyy.MM.dd")%></td>
                            <td><%=v_repstatusnm %></td>
                            <td><%=v_cnt%></td>
                        </tr>
                        <%
                                }
                            }else{
                        %>
                        <tr>
                            <td class="first" colspan="7">��ϵ� ������ �����ϴ�.</td>
                        </tr>
                        <%} %>
                        </tbody>
                    </table>
                </div>
                <!-- //tableWrap2 -->

                <div class="btnArea right">
                    <a href="javascript:insertPage();"><img src="/images/2013/btn/bnt_write.gif" alt="���ۼ�" /></a>
                </div>

                <div class="paging pgSpace">
                    <%= PageUtil.re2013_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
                </div>
                <!-- //paging -->
            </div>
            <!-- //#subCont -->


        </div>
    </form>
    <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>