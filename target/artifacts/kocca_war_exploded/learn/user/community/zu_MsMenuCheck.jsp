<%
//**********************************************************
//  1. ��      ��: Ŀ�´�Ƽ�� �ߺ�üũ
//  2. ���α׷��� : zu_CmuPopNameCheck.jsp
//  3. ��      ��: Ŀ�´�Ƽ���� �ߺ��� üũ�Ѵ�.
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2005.07.01 �̿���
//  7. ��      ��: 2005.07.01 �̿���
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage   = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process    = box.getString("p_process");
    String  v_cmuno      = box.getString("p_cmuno");//������ ������������ ������ ������.
    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");

    int  recordcnt       = Integer.parseInt(String.valueOf(request.getAttribute("recordcnt")));
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>Ŀ�´�Ƽ</title>
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<script type="text/javascript" src="/script/portal/common.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
//�ߺ�üũ
function uf_boxsexlect() {
    if(document.form1.p_title.value ==''){
       alert('Ŀ�´�Ƽ���� �Է��Ͽ����մϴ�.');document.form1.p_title.focus();return;
    }
    document.form1.action = "/servlet/controller.community.CommunityPopUpServlet";
    document.form1.p_process.value = "boarddupchkPage";
    document.form1.submit();
}


//��ȭ������ ����������
function uf_send() {
    if (document.form1.p_rowcnt.value ==99){
        alert('�ߺ�Ȯ���� �Ͽ����մϴ�.');document.form1.p_title.focus();return;
    }

    if (document.form1.p_rowcnt.value !=0){
        alert('����ҽ� �� ���� ��Ī�Դϴ�');return;
    }
    opener.document.form1.p_ins_title.value='<%=box.getString("p_title")%>';
    opener.document.form1.p_dupchk.value ='Y';
    this.close();
  
}
//-->
</script>
</head>
<body id="popup"><!-- popup size : 490* -->
<form name = "form1"  method = "post">
	<input type = "hidden" name = "p_process" value=""/>
	<input type = "hidden" name = "p_rowcnt"  value="<%=recordcnt%>"/>
	<input type = "hidden" name = "p_brd_fg"  value="<%=box.getString("p_brd_fg")%>"/>
	<input type = "hidden" name = "p_cmuno"  value="<%=box.getString("p_cmuno")%>"/>
    
    <div id="pop_header">
        <h1><img src="/images/portal/community/pop_h1_tit4.gif" alt="Ŀ�´�Ƽ" /></h1>
    </div>
    <div id="pop_container">
        <div id="contentwrap" class="message_top">
            <p class="searchbox_com">
                <span class="txt">�Խ��� ��Ī �ߺ�Ȯ��</span>
                <input type="text" name="p_title" class="inbox" style="width:144px;" value="<%=box.getString("p_title")%>" onkeyup="javascript:document.form1.p_rowcnt.value ='99';" onkeypress="javascript:fnKeyPressEnter(event, 'uf_boxsexlect');"/>
                <input type="image" src="/images/portal/btn/btn_overlapconfirm.gif" class="va_m mg_r12" alt="�˻�" />
            </p>
            <% if(recordcnt !=0){%>
            <p class="com_txt">����Ͻ� �� �����ϴ�</p>
            <% } else {%>
            <p class="com_txt">����Ͻ� �� �ֽ��ϴ�</p>
            <% }%>
        </div>
    </div>
    <div id="pop_footer">
        <p class="f_btn">
        <% if(recordcnt==0){%>
        <a href="javascript:uf_send();" class="btn_gr"><span>���</span></a>
        <% }%>
        <a href="javascript:this.close();" class="btn_gr"><span>�ݱ�</span></a>
        </p>
    </div>
</form>
</body>
</html>