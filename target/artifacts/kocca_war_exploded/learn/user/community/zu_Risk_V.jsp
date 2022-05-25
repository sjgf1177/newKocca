<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.propose.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    int    v_seq        = box.getInt("p_seq");
    int    v_pageno     = box.getInt("p_pageno");
    String v_searchtext = box.getString("p_searchtext");
    String v_select     = box.getString("p_select");
    String loginid      =box.getSession("userid");

    String v_userid     = "";
    String v_title      = "";
    String v_contents   = "";
    String v_ldate      = "";
    String v_name       = "";
    int    v_cnt        = 0;

    DataBox dbox        = (DataBox)request.getAttribute("view");
     ArrayList list2        = (ArrayList)request.getAttribute("reply");

    if(dbox != null) {
        v_name              = dbox.getString("d_name");
        v_title             = dbox.getString("d_title");
        v_seq               = dbox.getInt("d_seq");
        v_cnt               = dbox.getInt("d_hitnum");
        v_contents          = dbox.getString("d_contents");
        v_ldate             = dbox.getString("d_ldate");
        v_userid            = dbox.getString("d_userid");
    }

%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">

    //����Ʈ�������� �̵�
    function selectList() {
        document.form1.action = "/servlet/controller.community.CommunityRiskServlet";
        document.form1.p_process.value = "";
        document.form1.submit();
    }

    //������������ �̵�
    function updatePage() {
        document.form1.action = "/servlet/controller.community.CommunityRiskServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    //���� ����
    function updateRePly(seq,obj) {
        var str=$(obj).parent().parent().parent().parent().parent().parent().find("textarea").val();
        document.form1.action = "/servlet/controller.community.CommunityRiskServlet";
        document.form1.p_process.value = "updateRePly";
        $("[name='p_replyseq']").val(seq);
        $("[name='p_replycontents']").val(str);
        document.form1.submit();
    }

    //�亯 ���
    function replyPage(str) {
        document.form1.action = "/servlet/controller.community.CommunityRiskServlet";
        document.form1.p_process.value = "replySave";
        $("[name='p_replycontents']").val($("#p_reply").val());
        document.form1.submit();
    }

    //�� ȭ�� ����
    function deleteAction() {
        if (confirm("������ �����Ͻðڽ��ϱ�?")) {

            document.form1.action = "/servlet/controller.community.CommunityRiskServlet";
            document.form1.p_process.value = "delete";
            document.form1.submit();
        }
        else {
            return;
        }
    }

    function gotoDelete(seq) {
        if (confirm("������ �����Ͻðڽ��ϱ�?")) {

            document.form1.action = "/servlet/controller.community.CommunityRiskServlet";
            document.form1.p_process.value = "deleteRePly";
            $("[name='p_replyseq']").val(seq);
            document.form1.submit();
        }
        else {
            return;
        }
    }
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1" method = "post">
    <input type = "hidden" name = "p_seq"         value = "<%= v_seq %>">
    <input type = "hidden" name = "p_searchtext"  value = "<%= v_searchtext %>">
    <input type = "hidden" name = "p_select"      value = "<%= v_select %>">
    <input type = "hidden" name = "p_pageno"      value = "<%= v_pageno %>">
    <input type = "hidden" name = "p_process"     value = "">
    <input type = "hidden" name = "p_replyseq"     value = "">
    <input type = "hidden" name = "p_replycontents"     value = "">

            <h2><img src="/images/portal/community/h6_tit_5.gif" alt="�ǽð��������" class="fl_l" /><p class="category">Home > Ŀ�´�Ƽ > <strong>�ǽð��������</strong></p></h2>

            <table class="board_view ">
            <!--[if ie]><colgroup><col width="25px" /><col width="150px" /><col width="40px" /><col width="80px" /><col width="50px" /><col width="80px" /><col width="25px" /><col width="80px" /></colgroup><![endif]-->
            <colgroup><col width="45px" /><col width="150px" /><col width="60px" /><col width="80px" /><col width="70px" /><col width="80px" /><col width="45px" /><col width="80px" /></colgroup>
            <tr>
                <th>����</th>
                <td colspan="7" class="tit"><%= v_title %></td>
            </tr>
            <tr class="bo">
                <th>�ۼ���</th>
                <td><%=v_name%></td>
                <th>�ۼ�����</th>
                <td class="num"><%= FormatDate.getFormatDate(v_ldate, "yyyy.MM.dd") %></td>
                <th>��ȸ</th>
                <td class="fs_s"><%=v_cnt%></td>
            </tr>
            <tr>
                <td colspan="8" class="con"><%=v_contents%></td>
            </tr>
            </table>

            <!-- ����÷�� ���� -->
            <%
                Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
                Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
                String i_boardStyle        = "board_view";                                // ���� ��Ÿ��
            %>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                        <%@ include file="/learn/user/include/zu_MultiAttach_R.jsp" %> <!-- ����÷�� ����-->
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="690" border="0" cellpadding="0" cellspacing="0" bgcolor="f8f8f8" style="margin:0;">
                            <tr>
                                <td><img src="/images/portal/btn/bar_01.gif" width="690" height="1" /></td>
                            </tr>
                            <tr>
                                <td align="center" height="60px">
                                    <table width="650" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td height="50px"><textarea rows="3" cols="86" name="p_reply" style="overflow:auto;vertical-align:top;align:left" id="p_reply"></textarea></td>
                                            <td><img src="/images/portal/btn/btn_d_01.gif" width="67" height="24" alt="����" style="CURSOR:POINTER;" onclick="replyPage()"/></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td><img src="/images/portal/btn/bar_02.gif" width="690" height="1" /></td>
                            </tr>
                            <% if(list2.size() != 0){
                                for( int i = 0; i < list2.size(); i++) {
                                    DataBox dbox1   = (DataBox)list2.get(i);
                                        String ldate=dbox1.getString("d_ldate").substring(0,4)+"/"+dbox1.getString("d_ldate").substring(4,6)+"/"+dbox1.getString("d_ldate").substring(6,8)+" "+ dbox1.getString("d_ldate").substring(8,10)+":"+dbox1.getString("d_ldate").substring(10,12);
                                        String writeid=dbox1.getString("d_userid");
                                         %>
                                        <tr>
                                            <td align="center" height="50px">
                                                <table width="680" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="170"><span style="color:#48688f"><%=dbox1.getString("d_name")%>(<%=dbox1.getString("d_userid")%>)</span><br><span style="color:#888888"><%=ldate%></span></td>
                                                        <td><p>
                                                                <%--<% if(loginid.equals(writeid)) {%>--%>
                                                                    <textarea rows="2" cols="80" name="p_reply" style="overflow:hidden" ><%=dbox1.getString("d_contents")%></textarea>
                                                                <%--<%} else {%>--%>
                                                                    <%--<%=dbox1.getString("d_contents")%>--%>
                                                                <%--<%}%>--%>
                                                            </p>
                                                        </td>
                                                        <td width="20">
                                                            <%--<% if(loginid.equals(writeid)) {%>--%>
                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td><img src="/images/portal/btn/btn_re.gif" alt="����" style="CURSOR:POINTER" onclick="updateRePly('<%=dbox1.getString("d_seq")%>',this)" ></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="7px"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><img src="/images/portal/btn/btn_x.gif" alt="����" style="CURSOR:POINTER" onclick="gotoDelete('<%=dbox1.getString("d_seq")%>')"></td>
                                                                    </tr>
                                                                </table>
                                                            <%--<%} else {%>--%>
                                                                <%--&nbsp;--%>
                                                            <%--<%}%>--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><img src="/images/portal/btn/bar_02.gif" width="690" height="1" /></td>
                                        </tr>
                                <%}}%>
                        </table>
                    </td>
                </tr>
            </table>
          <p class="board_btn">
          <%--<%if(v_userid.equals(box.getSession("userid"))){%>--%>
          <a href="javascript:updatePage()" class="board_blue"><span>����</span></a>
          <a href="javascript:deleteAction()" class="board_blue"><span>����</span></a>
          <%--<%}%>--%>
          <a href="javascript:selectList()" class="board_blue"><span>���</span></a>
          </p>
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->