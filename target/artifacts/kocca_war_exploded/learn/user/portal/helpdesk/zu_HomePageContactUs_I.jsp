<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.cp.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    int    v_tabseq     = box.getInt("p_tabseq");
    String v_process    = box.getString("p_process");
    int    v_pageno     = box.getInt("p_pageno");
    String v_searchtext = box.getString("p_searchtext");
    String v_search     = box.getString("p_search");
    int    v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�
    String v_indate     = "";
    String s_userid     = box.getSession("userid");
    String s_username   = box.getSession("name");
    String s_email      = box.getSession("email");
    String content      = "";
    String width        = "650";
    String height       = "200";
   // String leftmenu = box.getString("leftmenu");
    
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
var grCode = '<%= box.getSession("tem_grcode") %>';

//�Էµ� ���� ����
function insert() {

	if( document.form1.p_title.value == '' ) {
		alert("������ �Է��ϼ���.");
		document.form1.p_title.focus();
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

    if (realsize(document.form1.p_title.value) > 200) {
        alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
        document.form1.p_title.focus();
        return;
    }

    if ( grCode == "N000001" ) {
        document.getElementById("p_content").value = CrossEditor.GetBodyValue();
    }
    
    document.form1.p_pageno.value = "1";
    document.form1.p_search.value     = "";
    document.form1.p_searchtext.value = "";
    document.form1.action = "/servlet/controller.homepage.HomePageContactServlet";
    document.form1.p_process.value = "insert";
    document.form1.submit();
}

//�󳻿� üũ
function blankCheck( msg ) {
    var mleng = msg.length;
    chk=0;
    
    for (i=0; i<mleng; i++) {
        if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
    }
    if ( chk == 0 ) return (true);
    
    return (false);
}

//�����Է��� ����ϰ� ����Ʈ�� �̵�
function cancel() {
     document.form1.action = "/servlet/controller.homepage.MainServlet";
     //document.form1.p_process.value = "selectList";
     document.form1.submit();
}

//���ڼ� üũ
function realsize( value ) {
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
<form name = "form1" enctype = "multipart/form-data" method = "post">
    <input type = "hidden" name = "p_tabseq"    value = "<%=v_tabseq %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_search"     value = "<%=v_search %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_process" value="">
    
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
        <td><img src="/images/portal/homepage_renewal/support/stitle_05.gif" alt="1:1����" /></td>
        <td class="h_road">Home &gt; �н����� �ȳ�  &gt; <strong>1:1����</strong></td>
      </tr>
      <tr>
        <td height="12" colspan="2"></td>
        </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="E5E5E5"></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="1" colspan="6" bgcolor="#7692CB"></td>
      </tr>
      <tr>
        <td width="100" class="tit_table">����</td>
        <td colspan="5" class="ct_tit_table_lright"><input name="p_title" type="text" id="p_title" size="50" /></td>
      </tr>
      <tr>
        <td class="tit_table">�亯ȸ�Ÿ���</td>
        <td class="ct_tit_table_left"><%=s_email%></td>
        <td class="tit_table">�ۼ���</td>
        <td class="ct_tit_table_left"><%=s_username%></td>
        <td width="80" class="tit_table">�ۼ�����</td>
        <td class="ct_tit_table"><%= FormatDate.getDate("yyyy.MM.dd") %></td>
      </tr>
      <tr>
        <td colspan="6" class="ct_tit_table_left">
			<textarea  id="p_content" name="p_content" style="display:none;"></textarea>
                    <script type="text/javascript">
                      var CrossEditor = new NamoSE("contents");
                       CrossEditor.editorStart();
                    </script>
		</td>
      </tr>
      <!--
      <tr>
        <td class="tit_table">÷������</td>
        <td colspan="5" class="ct_tit_table_lright"><img src="/images/portal/homepage_renewal/support/btn_search.jpg" width="65" height="21" /><img src="/images/portal/homepage_renewal/support/btn_clean.jpg" width="53" height="21" /></td>
      </tr>
		-->
      <tr>
        <td height="1" colspan="6" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="6" bgcolor="F7F7F7"></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="h_road"><a href="javascript:insert();"><img src="/images/portal/homepage_renewal/support/btn_reg.jpg" alt="���" width="46" height="25" /></a></td>
      </tr>
    </table>
    <!--Ÿ��Ʋ�κ�//-->
    </td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
      	
<%
    } else {
%>

            <h2><img src="/images/portal/studying/h2_tit8.gif" alt="1:1 ����" class="fl_l" /><p class="category">Home > �н��������� > <strong>1:1 ����</strong></p></h2>

            <p><img src="/images/portal/studying/inquiry_borimg.gif" alt="����Ʈ �̿�� ��������, ���ǻ���, ���� �� ����  �Ű��� ������ ������ ������ּ���. ȸ�Ÿ��Ϸ� �亯�帳�ϴ�" /></p>

            <table class="board_write mg_t30">
            <!--[if ie]><colgroup><col width="80px" /><col width="180px" /><col width="40px" /><col width="50px" /><col width="50px" /><col width="50px" /></colgroup><![endif]-->
            <colgroup><col width="80px" /><col width="180px" /><col width="45px" /><col width="50px" /><col width="55px" /><col width="50px" /></colgroup>
            <tr>
                <th class="th">����</th>
                <td class="td" colspan="5"><input name="p_title" type="text" class="inbox" style="width:530px;" /></td>
            </tr>
            <tr class="bo">
                <th class="th">�亯ȸ�Ÿ���</th>
                <!--td><input type="text" class="inbox" style="width:210px;"  /></td-->
                <td class="td"><%=s_email%></td>
                <th class="th">�ۼ���</th>
                <td class="td txt"><%=s_username%></td>
                <th class="th">�ۼ�����</th>
                <td class="td stxt ff_t"><%= FormatDate.getDate("yyyy.MM.dd") %></td>
            </tr>
            <tr>
                <th class="th">����</th>
                <td colspan="5" class="td">
                    <textarea id="p_content" name="p_content" style="display:block; width:520px; height:280px;"></textarea>
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

            <p class="board_btn"><a href="javascript:insert()"" class="board_blue mg_r5"><span>���</span></a>
            
            <%} %>
      
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->