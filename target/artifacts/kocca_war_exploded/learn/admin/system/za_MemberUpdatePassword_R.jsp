<%
//**********************************************************
//  1. ��      ��: ȸ�� FileToDB
//  2. ���α׷��� : za_MemberFileToDB_P.jsp
//  3. ��      ��: ȸ�� FileToDB ���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 0.1
//  6. ��      ��: ������ 2006.1.20
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    List<DataBox> list = (List)request.getAttribute("memberPasswordUpdateList");
%>
<html>
<head>
<title>ȸ�� ��й�ȣ ���� | �ѱ���������ī���� ������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>

</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">
            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
                <tr>
                    <td><img src="/images/admin/system/unite_title18.gif" /></td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" /></td>
                </tr>
            </table>
            <!-- title �� //-->
            <br />

<%
    String userId = "";
    String msg = "";

    int okCnt = 0, failCnt = 0, notUserCnt = 0;
    int listSize = 0;
    int i = 0;
    try {

        listSize = list.size();
        DataBox dbox = new DataBox("updateMemberPassword");
%>
            <!-- ������� ���� //-->
            <table>
                <tr>
                    <td><font color="red">��ȸ�� ������ 1�� �̻� Ȥ�� ERROR�Ǽ��� 1�� �̻� ������ ��� �ϰ�ó���� ��ҵ˴ϴ�.</font></td>
                </tr>
            </table>

            <table cellspacing="1" cellpadding="5" class="table_out">
                <tr>
                    <td colspan="3" class="table_top_line"></td>
                </tr>
                <tr>
                    <td class="table_title" width="10%">�ٹ�ȣ</td>
                    <td class="table_title" width="30%">���̵�</td>
                    <td class="table_title">MESSAGE</td>
                </tr>
<%
        for (i = 0; i < listSize - 1; i++ ) {
            dbox = list.get(i);
            userId = dbox.getString("userId");
            msg = dbox.getString("msg");
            msg = ( msg.equals("Y") ? "��й�ȣ ���� ����" : (msg.equals("F") ? "<font color='red'>��й�ȣ ���� ����</font>" : "<font color='blue'>����� �������� ����</font>"));

%>
                <tr>
                    <td class="table_02_1"><%= i + 1 %></td>
                    <td class="table_02_1"><%= userId %></td>
                    <td class="table_02_1"><%= msg %></td>
                </tr>
<%
        }

        dbox = list.get(i);
        okCnt = dbox.getInt("okCnt");
        failCnt = dbox.getInt("failCnt");
        notUserCnt = dbox.getInt("notUserCnt");

%>
                <tr>
                    <td class="table_title" colspan="3">�� ������: <%= listSize - 1 %>�� / ����: <%= okCnt %>�� / ����: <%= failCnt %> / ��ȸ��: <%= notUserCnt %></td>
                </tr>

            </table>
            <br />
            <br />
<%
        if ( failCnt > 0 || notUserCnt > 0 ) {
%>

            <br />
            <br />
            <!-- �����޼��� ���� //-->
            <table>
                <tr>
                    <td><font color="blue"><b>�ڷ� ó�� ����<b></font></td>
                </tr>
                <tr>
                    <td><font color="red">������Ŀ� ������ �ʴ� ���ڳ� ��ȣ�� �� ���� �� �ֽ��ϴ�.</font><br /></td>
                </tr>
                <!--
                <tr>
                    <td>
                        <font color="red">&nbsp;&nbsp; �Է��� ������ ����<b>[Ctrl+C]</b>�� ������������ ���� �ٿ��ֱ�<b>[Ctrl+V]</b>�� �Ͽ� <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;���̸����� �������� �ٽýõ� �Ͽ� �ֽʽÿ�.</font><br />
                    </td>
                </tr>
                //-->
            </table>
<%
        }
    } catch (Exception ex) {
        ErrorManager.getErrorStackTrace(ex);
        out.println(ex.getMessage());
    }
%>
            <br />
            <br />

            <!-- ���, �̸����� ��ư ���� //-->
            <table width="97%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center" >
                        <a href="/servlet/controller.system.MemberAdminServlet" title="������� �̵�"><img src="/images/admin/button/btn_list.gif" alt="������� �̵�" border="0" /></a>&nbsp;&nbsp;
                        <a href="#" onclick="javascript:self.close();" title="â�ݱ�"><img src="/images/admin/button/btn_close.gif" alt="â�ݱ�" border="0" /></a>
                    </td>
                </tr>
            </table>
            <!-- ���, �̸����� ��ư �� //-->
            <br />
        </td>
    </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>