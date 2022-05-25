<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String v_title     = "";
    String v_content   = "";
    String v_usernm    = "";
    String v_userid    = "";
    String v_regdt     = "";

    int v_seq = box.getInt("p_seq");
    String v_searchtext = box.getString("p_searchtext");
    String v_select     = box.getString("p_select");
    String v_selCategory = box.getString("p_selCategory");
    int    v_pageno     = box.getInt("p_pageno");
    String s_usernm     = box.getSession("name");
    String content      = "";
    String width        = "650";
    String height       = "200";

    String s_userid     = box.getSession("userid");

%>
<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
    var insertSw=false;

    //����Ʈȭ������ �̵�
    function selectList() {
        document.form1.action = "/servlet/controller.community.CommunityRiskServlet";
        document.form1.p_process.value = "";
        document.form1.submit();
    }

    //�����͸� �Է��Ѵ�.
    function insert() {
        if(insertSw)
            return;

        insertSw=true;
        
        var frm = document.form1;

        if(document.all.use_editor[0].checked) {
            form1.p_content.value = ObjEditor.document.all.tags("html")[0].outerHTML;
        }else {
            form1.p_content.value = document.all.txtDetail.value;
        }

        if (blankCheck($("[name='p_title']").val())) {
            alert("������ �Է��ϼ���!");
            $("[name='p_title']").focus();
            insertSw=false;
            return;
        }

        if (realsize($("[name='p_title']").val()) > 100) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            $("[name='p_title']").focus();
            insertSw=false;
            return;
        }

        //document.getElementById("p_content").value = CrossEditor.GetBodyValue();

        frm.p_searchtext.value    = "";
        frm.p_select.value        = "";
        frm.p_selCategory.value   = "";
        frm.p_pageno.value        =  1;

        document.form1.action = "/servlet/controller.community.CommunityRiskServlet";
        document.form1.p_process.value = "insert";
        document.form1.submit();

    }

    //�Է� ������ ������ üũ
    function blankCheck( msg ) {
        var mleng = msg.length;
        chk=0;

        for (i=0; i<mleng; i++) {
            if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
        }
        if ( chk == 0 ) return (true);

        return (false);
    }
    function realsize( value ) {//���ڼ��� üũ
        var len = 0;
        if ( value == null ) return 0;
        for(var i=0;i<value.length;i++){
            var c = escape(value.charAt(i));
            if ( c.length == 1 ) len ++;
            else if ( c.indexOf("%u") != -1 ) len += 2;
            else if ( c.indexOf("%") != -1 ) len += c.length/3;
        }
        return len;
    }
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1" enctype = "multipart/form-data" method = "post">
    <input type = "hidden" name = "p_seq"           value = "<%= v_seq %>">
    <input type = "hidden" name = "p_searchtext"    value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_select"        value = "<%=v_select %>">
    <input type = "hidden" name = "p_selCategory"   value = "<%=v_selCategory %>">

    <input type = "hidden" name = "p_pageno"        value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_process"       value = "">
    <input type = "hidden" name = "p_gubun"       value = "0">
    <input type = "hidden" name = "p_parentseq" value="0"   >
    
            <h2><img src="/images/portal/community/h6_tit_5.gif" alt="�ǽð��������" class="fl_l" /><p class="category">Home > Ŀ�´�Ƽ > <strong>�ǽð��������</strong></p></h2>

            <table class="board_write">
            <tr class="bo">
                <th class="th" width="50px">�ۼ���</th>
                <td class="td txt" width="400px"><%=s_usernm %></td>
                <th class="th" style="width:60px">�ۼ�����</th>
                <td class="td stxt ff_t" ><%= FormatDate.getDate("yyyy.MM.dd") %></td>
            </tr>
            <tr class="bo">
                <th class="th">����</th>
                <td colspan="3" class="td"><input name="p_title" id="subject" type="text" class="inbox" style="width:500px;" /></td>
            </tr>
            <tr class="bo">
                <td width=85% colspan="4" class="td con">
                    <textarea  id="p_content" name="p_content" style="display:none;"></textarea>
                    <%@ include file="/include/DhtmlEditor.jsp" %>
                </td>
            </tr>
            </table>
            <!-- ����÷�� ���� -->
            <%
            Vector i_realfileVector    = null;        // ���� ���ϸ�
            Vector i_savefileVector    = null;        // ���� ���ϸ�
            Vector i_fileseqVector     = null;         // ���� �Ϸù�ȣ

            int    i_fileLimit         = 10;             // ���� ÷�� ���ϼ�

            String i_formName          = "form1";                                     // Form �̸�
            String i_ServletName       = "RiskMenagermentServlet";                        // ���� ���� �̸�       riskmenagermentServlet
            String i_boardStyle        = "board_write";                               // �Է� ���̺� Class ��
            %>

            <%@ include file="/learn/user/portal/include/multiAttach_include.jsp" %>
            <!-- ����÷�� ���� -->

            <p class="board_btn"><a href="javascript:insert();" class="board_blue mg_r5" id="inserBtn"><span>����</span></a><a href="javascript:history.back(-1);" class="board_blue mg_r5"><span>���</span></a><a href="javascript:history.back(-1);" class="board_blue"><span>���</span></a></p>

</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->