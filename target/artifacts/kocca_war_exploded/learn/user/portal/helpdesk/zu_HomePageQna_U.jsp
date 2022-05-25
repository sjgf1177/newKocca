<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.dunet.common.util.*" %>


<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String v_title      = "";
    String v_contents   = "";
    String v_usernm     = "";
    String v_inuserid   = "";
    String v_indate     = "";
    String v_types      = "";
    String v_categorycd = "";
    String v_isopen     = "";
    String content      = "";


    int     v_seq        = box.getInt("p_seq");
    String  v_searchtext = box.getString("p_searchtext");
    String  v_select     = box.getString("p_select");
    int     v_pageno     = box.getInt("p_pageno");
    String  v_selCategory = box.getString("p_selCategory");

    String  width        = "650";
    String  height       = "200";

    String  s_name = box.getSession("name");

    DataBox dbox = (DataBox)request.getAttribute("selectQna");
    if(dbox != null) {
        v_inuserid   = dbox.getString("d_inuserid");
        v_types      = dbox.getString("d_types");
        v_usernm       = dbox.getString("d_name");
        v_indate     = dbox.getString("d_indate");
        v_title      = dbox.getString("d_title");
        v_seq        = dbox.getInt("d_seq");
        v_categorycd = dbox.getString("d_categorycd");
        v_isopen     = dbox.getString("d_isopen");

        content          = dbox.getString("d_contents");
        String s_userid  = box.getSession("userid");
    }

%>
<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--

var grCode = '<%= box.getSession("tem_grcode") %>';

 //����Ʈȭ������ �̵�
function selectList() {
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value = "";
    document.form1.submit();
}

 //�����͸� �Է��Ѵ�.
function update() {

    var frm = document.form1;

    if (blankCheck(document.all.p_title.value)) {
        alert("������ �Է��ϼ���!");
        document.all.p_title.focus();
        return;
    }
    if (realsize(document.all.p_title.value) > 100) {
        alert("������ �ѱ۱��� 50�ڸ� �ʰ����� ���մϴ�.");
        document.all.p_title.focus();
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

    // document.getElementById("p_content").value = CrossEditor.GetBodyValue();

    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value = "update";
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



//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1" method = "post">
    <input type = "hidden" name = "p_seq"         value = "<%= v_seq %>">
    <input type = "hidden" name = "p_types"       value = "<%= v_types %>">
    <input type = "hidden" name = "p_userid"      value = "<%=v_inuserid%>">
    <input type = "hidden" name = "p_searchtext"  value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_select"      value = "<%=v_select %>">
    <input type = "hidden" name = "p_selCategory" value = "<%=v_selCategory %>">

    <input type = "hidden" name = "p_pageno"      value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_process"     value="">

<%
    if( box.getSession("tem_grcode").equals("N000001")) {
%>
    <table>
      <tr>
        <td>

        <!--Ÿ��Ʋ�κ�-->
    <table width="672" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" colspan="2" class="h_road">&nbsp;</td>
      </tr>
      <tr>
        <td><img src="/images/portal/homepage_renewal//support/stitle_04.gif" alt="Q&A" /></td>
        <td class="h_road">Home &gt; �н����� �ȳ�  &gt; <strong>Q&A</strong></td>
      </tr>
      <tr>
        <td height="12" colspan="2"></td>
        </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="E5E5E5"></td>
      </tr>
    </table>

    <!--Ÿ��Ʋ�κ�//-->


      <!--���̺�κ�-->
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="1" colspan="6" bgcolor="#7692CB"></td>
        </tr>
        <tr>
          <td class="tit_table">����</td>
          <td colspan="5" class="ct_tit_table_right"><%= v_title %></td>
        </tr>

        <tr>
          <td class="tit_table">�з�</td>
          <td class="ct_tit_table_left">
            <kocca_select:select
                        name="p_categorycd"
                        sqlNum="0001"
                        param="0088"
                        onChange=""
                        attr= "�з�"
                        selectedValue="<%=v_categorycd %>"
                        isLoad="true"
                        type="1"
                        styleClass=""
                        all="false" />
          </td>
          <td class="tit_table">�ۼ���</td>
          <td class="ct_tit_table"><%=v_usernm%></td>
          <td class="tit_table">�ۼ�����</td>
          <td class="ct_tit_table_lright"><%= FormatDate.getFormatDate(v_indate, "yyyy.MM.dd") %></td>
        </tr>
        <tr>
          <td colspan="6" class="ct_tit_table_lright">
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
          <td height="1" colspan="6" bgcolor="CACACA"></td>
        </tr>
        <tr>
          <td height="4" colspan="6" bgcolor="F7F7F7"></td>
        </tr>
      </table>

      <!-- ����÷�� ���� -->
            <%
            Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
            Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
            Vector i_fileseqVector     = (Vector)dbox.getObject("d_fileseq");         // ���� �Ϸù�ȣ

            int    i_fileLimit         = HomePageQnaBean.getFILE_LIMIT();             // ���� ÷�� ���ϼ�

            String i_formName          = "form1";                                     // Form �̸�
            String i_ServletName       = "HomePageQNAServlet";                        // ���� ���� �̸�
            String i_boardStyle        = "board_write";                               // �Է� ���̺� Class ��
            %>
            <%@ include file="/learn/user/portal/include/multiAttach_include.jsp" %>
            <!-- ����÷�� ���� -->
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="h_road"><a href="javascript:update();"><img src="/images/portal/homepage_renewal/support/btn_reg.jpg"/></a></td>
      </tr>
    </table>


      </td>
    <td width="20">&nbsp;</td>

  </tr>
</table>

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
                    <kocca_select:select
                        name="p_categorycd"
                        sqlNum="0001"
                        param="0088"
                        onChange=""
                        attr= "�з�"
                        selectedValue="<%=v_categorycd %>"
                        isLoad="true"
                        type="1"
                        styleClass=""
                        all="false" />
                </td>
                <th class="th"><img src="/images/portal/ico/ico_board_s.gif" alt="" class="va_m mg_r7" />��б�</th>
                <td class="td"><input name="p_isopen" type="checkbox" value = "N" <%=v_isopen.equals("N") ? "checked" : "" %>></td>
                <th class="th">�ۼ���</th>
                <td class="td txt"><%=v_usernm%></td>
                <th class="th">�ۼ�����</th>
                <td class="td stxt ff_t"><%= FormatDate.getFormatDate(v_indate, "yyyy.MM.dd") %></td>
            </tr>
            <tr class="bo">
                <th class="th">����</th>
                <td colspan="7" class="td"><input name="p_title" type="text" id="subject" class="inbox" style="width:550px;" value="<%=v_title %>"/></td>
            </tr>
            <tr class="bo">
                <th class="th">����</th>
                <td colspan="7" class="td con">
                    <textarea id="p_content" name="p_content" style="display:block;width:540px; height:280px;"><%= content %></textarea>
                    <script type="text/javascript">
                        // 2014-07-25
                        // ���� ���� ���� �������̶� �ϴ� �޽����� �Բ� �� �����Ͱ� �ε����� ����.
                        // �������� ���� ��� *.kocca.or.kr �����ο��� �����
                        // ASP ����Ʈ�� *.edukocca.or.kr�� �Ǿ� �־ ������� ���� ������.
                        // �̿� ���� ������ �ذ��ϰ��� �� ������ ��ſ� textarea�� ��ü
                        //
                        // var contentValue = document.getElementById("p_content").value; // Hidden �� ����
                        // var CrossEditor = new NamoSE('contents');
                        // CrossEditor.editorStart();
                        // CrossEditor.SetBodyValue(contentValue); // ������ ���� ������ ����
                    </script>
                </td>
            </tr>
            </table>
            <!-- ����÷�� ���� -->
            <%
            Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
            Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
            Vector i_fileseqVector     = (Vector)dbox.getObject("d_fileseq");         // ���� �Ϸù�ȣ

            int    i_fileLimit         = HomePageQnaBean.getFILE_LIMIT();             // ���� ÷�� ���ϼ�

            String i_formName          = "form1";                                     // Form �̸�
            String i_ServletName       = "HomePageQNAServlet";                        // ���� ���� �̸�
            String i_boardStyle        = "board_write";                               // �Է� ���̺� Class ��
            %>
            <%@ include file="/learn/user/portal/include/multiAttach_include.jsp" %>
            <!-- ����÷�� ���� -->

            <p class="board_btn"><a href="javascript:update();" class="board_blue mg_r5"><span>����</span></a><a href="javascript:history.back(-1);" class="board_blue mg_r5"><span>���</span></a><a href="javascript:history.back(-1);" class="board_blue"><span>���</span></a></p>

            <%} %>
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->