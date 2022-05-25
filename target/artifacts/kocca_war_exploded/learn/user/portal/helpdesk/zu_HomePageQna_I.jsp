<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String v_title = "";
    String v_content = "";
    String v_usernm = "";
    String v_userid = "";
    String v_regdt = "";

    int v_seq = box.getInt("p_seq");
    String v_searchtext = box.getString("p_searchtext");
    String v_select = box.getString("p_select");
    String v_selCategory = box.getString("p_selCategory");
    int v_pageno = box.getInt("p_pageno");
    String s_usernm = box.getSession("name");
    String content = "";
    String width = "650";
    String height = "200";

    String s_userid = box.getSession("userid");

%>
<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="javascript" type="text/javascript">

    var grCode = '<%= box.getSession("tem_grcode") %>';

    //����Ʈȭ������ �̵�
    function selectList() {
        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form1.p_process.value = "";
        document.form1.submit();
    }

    //�����͸� �Է��Ѵ�.
    function insert() {

        var frm = document.form1;

        if (blankCheck(frm.p_title.value)) {
            alert("������ �Է��ϼ���!");
            frm.p_title.focus();
            return;
        }

        if (realsize(frm.p_title.value) > 100) {
            alert("������ �ѱ۱��� 50�ڸ� �ʰ����� ���մϴ�.");
            frmp_title.focus();
            return;
        }

        if (frm.p_categorycd.options[frm.p_categorycd.selectedIndex].value == "") {
            alert("�з��� �����ϼ���!");
            frm.p_categorycd.focus();
            return;
        }

        if ( grCode == "N000001" ) {
            if(!CrossEditor.IsDirty()){ // ũ�ν������� ���� ������ �Է� Ȯ��
                alert(" �����Ϳ� ������ �Է��� �ּ��� !!");
                CrossEditor.SetFocusEditor();// ũ�ν������� Focus �̵�
                return;
            }
        } else {
            if ( document.getElementById("p_content").value == "" ) {
                alert("������ �Է��� �ּ���.");
                document.getElementById("p_content").focus();
                return;
            }
        }

        if ( grCode == "N000001" ) {
            document.getElementById("p_content").value = CrossEditor.GetBodyValue();
        }

        frm.p_searchtext.value    = "";
        frm.p_select.value        = "";
        frm.p_selCategory.value   = "";
        frm.p_pageno.value        =  1;

        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
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

<%
    if( box.getSession("tem_grcode").equals("N000001")) {
%>
    <br>
            <img src="/images/portal/homepage_renewal//support/stitle_04.gif" alt="Q&A" class="fl_l" /><p align="right">Home > �н������ȳ� > <strong>Q&A</strong></p>
        <br/>
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
              <td height="1" colspan="8" bgcolor="#7692CB"></td>
            </tr>
            <tr>
                <td class="tit_table" width="100"><label for="lab">�з�</label></td>
                <td class="ct_tit_table_left">
                    <kocca_select:select name="p_categorycd" sqlNum="0001" param="0088" onChange="" attr= "�з�"
                        selectedValue="" isLoad="true" type="1" styleClass="" all="false" />
                </td>
                <td class="tit_table"><img src="/images/portal/homepage_renewal/support/lock_on.jpg" /><label for="secret">��б�</label></td>
                <td class="ct_tit_table"><input name="p_isopen" type="checkbox" value = "N"></td>
                <td class="tit_table">�ۼ���</td>
                <td class="ct_tit_table"><%=s_usernm %></td>
                <td class="tit_table">�ۼ�����</td>
                <td class="ct_tit_table_lright"><%= FormatDate.getDate("yyyy.MM.dd") %></td>
            </tr>
            <tr>
                <td class="tit_table">����</td>
                <td colspan="7" class="ct_tit_table_lright"><input name="p_title" id="subject" type="text" class="inbox" style="width:590px;" /></td>
            </tr>
            <tr>
                <td width=100% colspan="8" class="ct_tit_table_right">
                    <textarea id="p_content" name="p_content" style="display:none;"><%=StringManager.replace(content, "&", "&amp") %></textarea>
                    <script type="text/javascript">
                        var contentValue = document.getElementById("p_content").value; // Hidden �� ����
                        var CrossEditor = new NamoSE('contents');
                        CrossEditor.editorStart();
                        CrossEditor.SetBodyValue(contentValue); // ������ ���� ������ ����
                    </script>
                </td>
            </tr>

            <tr>
                <td colspan="8" class="ct_tit_table_lright">

            <!-- ����÷�� ���� -->
<%
            Vector i_realfileVector    = null;        // ���� ���ϸ�
            Vector i_savefileVector    = null;        // ���� ���ϸ�
            Vector i_fileseqVector     = null;         // ���� �Ϸù�ȣ

            int    i_fileLimit         = HomePageQnaBean.getFILE_LIMIT();             // ���� ÷�� ���ϼ�

            String i_formName          = "form1";                                     // Form �̸�
            String i_ServletName       = "HomePageQNAServlet";                        // ���� ���� �̸�
            String i_boardStyle        = "board_write";                               // �Է� ���̺� Class ��
%>

            <%@ include file="/learn/user/portal/include/multiAttach_include.jsp" %>
            <!-- ����÷�� ���� -->
            <!-- ����÷�� ���� -->
                </td>
            </tr>
            <tr>
              <td colspan="8" height="1" bgcolor="#C6C6C6"></td>
            </tr>
            <tr>
              <td colspan="8" height="4" bgcolor="#F7F7F7"></td>
            </tr>
            <tr>
              <td colspan="8" height="10"></td>
            </tr>
         </table>
    <p align="center">
        <a href="javascript:insert();" class="board_blue mg_r5"><img src="/images/portal/homepage_renewal//support/btn_reg.jpg" /></a>
        <a href="javascript:history.back(-1);" class="board_blue mg_r5"><img src="/images/portal/homepage_renewal//support/btn_cancel.jpg" /></a>
        <a href="javascript:history.back(-1);" class="board_blue"><img src="/images/portal/homepage_renewal//support/btn_list.jpg" /></a>
    </p>

<%
    } else {
%>

            <h2><img src="/images/portal/studying/h2_tit3.gif" alt="Q&A" class="fl_l" /><p class="category">Home > �н��������� > <strong>Q&A</strong></p></h2>

            <p><img src="/images/portal/studying/qna_borimg.gif" alt="���� ���� ������ ����Ͻø�, ����ڰ� �亯�ص帳�ϴ�. ���� ���뿡 ���� ������ ������ �����ø� ������� �ۼ����ּ���. " /></p>

            <table class="board_write">
            <!--[if ie]>
            <colgroup>
                <col width="70px" /><col width="120px" />
                <col width="75px" /><col width="40px" />
                <col width="60px" /><col width="80px" />
                <col width="60px" /><col width="100px" />
            </colgroup>
            <![endif]-->
            <colgroup>
                <col width="75px" /><col width="120px" />
                <col width="85px" /><col width="50px" />
                <col width="60px" /><col width="80px" />
                <col width="70px" /><col width="80px" />
            </colgroup>
            <tr class="bo">
                <th class="th"><label for="lab">�з�</label></th>
                <td class="td">
                    <kocca_select:select name="p_categorycd" sqlNum="0001" param="0088" onChange="" attr= "�з�"
                        selectedValue="" isLoad="true" type="1" styleClass="" all="false" />
                 <!--
                 <kocca_select:select name="p_categorycd" sqlNum="course.0002"  param=" "
                                                onChange="" attr=" " selectedValue="" isLoad="true" all="false" />
                -->
                </td>
                <th class="th"><img src="/images/portal/ico/ico_board_s.gif" alt="" class="va_m mg_r7" /><label for="secret">��б�</label></th>
                <td class="td"><input name="p_isopen" type="checkbox" value = "N"></td>
                <th class="th">�ۼ���</th>
                <td class="td txt"><%=s_usernm %></td>
                <th class="th">�ۼ�����</th>
                <td class="td stxt ff_t"><%= FormatDate.getDate("yyyy.MM.dd") %></td>
            </tr>
            <tr class="bo">
                <th class="th">����</th>
                <td colspan="7" class="td"><input name="p_title" id="subject" type="text" class="inbox" style="width:550px;" /></td>
            </tr>
            <tr class="bo">
                <th class="th">����</th>
                <td colspan="7" class="td">
                    <textarea  id="p_content" name="p_content" style="display:block; width:540px; height:280px;"></textarea>
                    <script type="text/javascript">
                        // 2014-07-25
                        // ���� ���� ���� �������̶� �ϴ� �޽����� �Բ� �� �����Ͱ� �ε����� ����.
                        // �������� ���� ��� *.kocca.or.kr �����ο��� �����
                        // ASP ����Ʈ�� *.edukocca.or.kr�� �Ǿ� �־ ������� ���� ������.
                        // �̿� ���� ������ �ذ��ϰ��� �� ������ ��ſ� textarea�� ��ü
                        //
                        // var CrossEditor = new NamoSE("contents");
                        // CrossEditor.editorStart();
                    </script>
                </td>
            </tr>
            </table>
            <!-- ����÷�� ���� -->
            <%
            Vector i_realfileVector    = null;        // ���� ���ϸ�
            Vector i_savefileVector    = null;        // ���� ���ϸ�
            Vector i_fileseqVector     = null;         // ���� �Ϸù�ȣ

            int    i_fileLimit         = HomePageQnaBean.getFILE_LIMIT();             // ���� ÷�� ���ϼ�

            String i_formName          = "form1";                                     // Form �̸�
            String i_ServletName       = "HomePageQNAServlet";                        // ���� ���� �̸�
            String i_boardStyle        = "board_write";                               // �Է� ���̺� Class ��
            %>

            <%@ include file="/learn/user/portal/include/multiAttach_include.jsp" %> 
            <!-- ����÷�� ���� -->

            <p class="board_btn"><a href="javascript:insert();" class="board_blue mg_r5"><span>���</span></a><a href="javascript:history.back(-1);" class="board_blue mg_r5"><span>���</span></a><a href="javascript:history.back(-1);" class="board_blue"><span>���</span></a></p>
            <%} %>
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->