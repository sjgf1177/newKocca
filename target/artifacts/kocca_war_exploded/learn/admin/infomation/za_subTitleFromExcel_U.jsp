<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.beta.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  v_seq= box.getString("p_seq");

%>
<html>
<head>
<title>�������� �ڸ� ���� ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script type="text/javascript" src="/js/jquery/1.11.1/jquery-1.11.1.min.js"></script>
<SCRIPT LANGUAGE="JavaScript">

    function insert_check(process){
        if (document.form1.p_file.value.length > 0 ){
            var data = document.form1.p_file.value;
            data = data.toUpperCase(data);
            
            if (data.indexOf(".XLS") < 0 || data.indexOf(".XLSX") > 0) {
                alert("DB�� �ԷµǴ� ���������� xls ���ϸ� �����մϴ�.");
                return;
            }
        }

        document.form1.action = "/servlet/controller.infomation.GoldClassAdminServlet";
        document.form1.p_process.value = process;
        document.form1.submit();
    }
    
    
    
    
    
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<!----------------- form ���� ----------------->
<form name="form1" id="form1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="p_process" id="p_process" value="" />
        <input type="hidden" name="p_action" id="p_action" value="" />
        <input type="hidden" name="s_seq" id="s_seq" value="<%=v_seq%>" />

<table width="90%" border="0" cellspacing="0" cellpadding="0" style="padding-left:10px">
    <tr>
        <td height="10px" colspan="2"></td>
    </tr>
    <tr>
        <td width="1%" class="sub_title"><img src="/images/admin/common/icon.gif" />�������� �ڸ� ���� ���</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td height="10px" colspan="2"></td>
    </tr>
    <tr>
		<td>
			<input type="file" name="p_file" id="p_file" class="input" value="" />
		</td>
    </tr>
    <tr>
        <td height="7px" colspan="2"></td>
    </tr>
    <tr>
        <td align="right" colspan="2"><a href="javascript:insert_check('subtitleUpdate')"><img src="/images/admin/button/btn_apply.gif" border="0"></a></td>
    </tr>
    <tr>
        <td colspan="2">
            
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class="subtitle">
                <tr>
                    <td class=dir_txt ><b><font size="3">(���ǻ���)</font></b></td>
                </tr>
                <tr>
                    <td height="8">&nbsp;</td>
                </tr>
                <tr>
                    <td height="40" class=dir_txt >1. ���þ���� �޾� ����� ��(Ȯ���ڴ� .xls�� ���) &nbsp;<a href="/upload/goldclass/koccaGoldClassSubtitle_Sample.xls"><b>���þ�� �ٿ�ε�</b></a>
                    	<br />&nbsp;&nbsp;&nbsp;<u>���� ��� ���°� �ƴ� ��� ġ������ ������ �߻��� �� �ֽ��ϴ�.</u>	
                    </td>
                </tr>
                <tr>
                    <td height="20" class=dir_txt >2. ���� ���� ��Ͽ��� �������� ���ε� ����(�������� ��ȣ �ʼ��Է�).</td>
                </tr>
                <tr>
                    <td height="20" class=dir_txt >3. �ݵ�� �ش� �������°� ��ϵ� ���¿��� �ڸ� ����ؾ� ��.</td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</form>
<!----------------- form �� ----------------->
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>

