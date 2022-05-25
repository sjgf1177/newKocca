<%
//**********************************************************
//  1. ��      ��: Notice
//  2. ���α׷��� : za_Notice_I.jsp
//  3. ��      ��: �������� ���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2005. 8. 1
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.dunet.common.util.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String v_process = box.getString("p_process");
    String v_selcomp = box.getString("p_selcomp");

    int v_pageno = box.getInt("p_pageno");
    int v_pagesize = box.getInt("p_pagesize");

    String v_searchtext = box.getString("p_searchtext");
    String v_search     = box.getString("p_search");

    int v_seq = box.getInt("p_seq");

    String v_lecnm = "";   // ���Ǹ�
    String v_tutornm           = "";   // �����
    String v_vodurl = "";   // ���� URL
    String v_tutorcareer = "";   // ���
    String v_lectime = "";   // ���� �ð�
    String v_genre = "";   // �帣
    String v_creator = "";   // ����
    String v_intro = "";   // ����
    String v_contents = "";   // ����
    String v_tutorauthor = "";   // ����
    String v_width_s = "";   // â����
    String v_height_s = "";   // â����
    String v_openyn = "";   // ���¿���
    String v_useyn = "";   // ��뿩��
    String v_img_save_file = "";   // �����̹���(�������ϸ�)
    String v_tutor_save_file = "";   // �����̹���(�������ϸ�)
    String v_subtitle = "";   // �ڸ�����

    DataBox dbox = (DataBox)request.getAttribute("selectOffExpert");
    if (dbox != null) {
        v_lecnm = dbox.getString("d_lecnm");
        v_tutornm = dbox.getString("d_tutornm");
        v_vodurl = dbox.getString("d_vodurl");
        v_tutorcareer = dbox.getString("d_tutorcareer");
        v_lectime = dbox.getString("d_lectime");
        v_genre = dbox.getString("d_genre");
        v_creator = dbox.getString("d_creator");
        v_intro = dbox.getString("d_intro");
        v_contents = dbox.getString("d_contents");
        v_tutorauthor = dbox.getString("d_tutorauthor");
        v_width_s = dbox.getString("d_width_s");
        v_height_s = dbox.getString("d_height_s");
        v_openyn = dbox.getString("d_openyn");
        v_useyn = dbox.getString("d_useyn");
        v_img_save_file = dbox.getString("d_vodimg");
        v_tutor_save_file = dbox.getString("d_tutorimg");
        v_subtitle = dbox.getString("d_subtitle");
    }

    String s_gadmin = box.getSession("gadmin");
    String v_gadmin ="";
    if(!s_gadmin.equals("")){
        v_gadmin = s_gadmin.substring(0,1);
    }
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/css" href="/css/admin_style.css">
<script language="VBScript" src="/script/cresys_lib.vbs"></script>
<script type="text/javascript" src="/script/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src= "/script/cresys_lib.js"></script>
<script type="text/javascript">
<!--
//����
    function modify_article() {
        document.form1.action = "/servlet/controller.infomation.GoldClassAdminServlet";
        document.form1.target="_self";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    function delete_article() {
        if ( confirm ("���������Ͻðڽ��ϱ�?") ) {
            document.form1.action = "/servlet/controller.infomation.GoldClassAdminServlet";
            document.form1.target="_self";
            document.form1.p_process.value = "delete";
            document.form1.submit();
        } else {
            return;
        }
    }

    function list() {
        document.form1.action = "/servlet/controller.infomation.GoldClassAdminServlet";
        document.form1.target="_self";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

    function openGoldClass(urls,w,h) {

        if (w.length>0) {
            window.open("about:blank", "ViewVod", "top=0, left=0, width="+w+", height="+h+", status=no, resizable=no");

        }else{
            window.open("about:blank", "ViewVod", "top=0, left=0, width=600, height=500, status=no, resizable=no");
        }
        document.form1.action="/servlet/controller.infomation.GoldClassAdminServlet";
        document.form1.p_process.value = "popUpVod";
        document.form1.target="ViewVod";
        document.form1.submit();
    }

//-->
</script>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
 
<form name="form1" method="post" enctype="multipart/form-data">
    <input type = "hidden" name="p_process"    value = "<%= v_process %>">
    <input type = "hidden" name="p_pageno"     value = "<%= v_pageno %>">
    <input type = "hidden" name="p_pagesize"   value = "<%= v_pagesize %>">
    <input type = "hidden" name="p_search"     value = "<%= v_search %>">
    <input type = "hidden" name="p_searchtext" value = "<%= v_searchtext %>">
    <input type = "hidden" name="p_seq"        value = "<%= v_seq %>">



<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top">

            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
                <tr>
                    <td><img src="/images/admin/portal/s.1_19.gif" ></td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
                </tr>
            </table>
            <!-- title �� //-->

            <br />
            <br />
            <!-- �������� ���� ���� //-->
            <table class="table_out" cellspacing="1" cellpadding="5">
                <tr>
                    <td colspan="2" class="table_top_line"></td>
                </tr>
                <tr>
                    <td width="15%" class="table_02_2"><strong>���¸�</strong></td>
                    <td height="25" class="table_02_2"><%=v_lecnm %>
                        <a href="javascript:openGoldClass('<%=v_vodurl %>','<%=v_width_s %>','<%=v_height_s %>')">&nbsp;&nbsp;<img src="/images/admin/button/btn_aviview.gif" align="absmiddle" border="0"></a>
                    </td>
                </tr>
                <tr>
                    <td width="15%" class="table_02_2" colspan="2"><strong>����Ұ�</strong></td>
                </tr>
                <tr>
                    <td height="25" class="table_02_2" colspan="2">
                        <table width="97%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td height="10" colspan="2"></td>
                            </tr>
                            <tr>
                                <td width="140" valign="top">
                                    <table width="100" height="120" border="0" cellpadding="0" cellspacing="0" bgcolor="e0e0e0">
                                        <tr>
                                            <td style="text-align:center; vertical-align:middle;">
<%
    if ( v_tutor_save_file == null || v_tutor_save_file.equals("") ) {
%>
                                                <img src="/images/common/no_profile_img.png" width="130" height="130" border="0" alt="" />
<%
    } else {
%>
                                                <img src="/servlet/controller.library.DownloadServlet?p_savefile=<%= v_tutor_save_file %>" width="130" height="130" border="0" alt="" />
<%
    }
%>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table width="100%" border="0" cellspacing="2" cellpadding="8">
                                        <tr>
                                            <td width="60" valign="top"><strong><font color="33939D">�����</font></strong></td>
                                            <td><%=v_tutornm %></td>
                                        </tr>
                                        <tr>
                                            <td valign="top"><strong><font color="33939D">���</font></strong></td>
                                            <td><%=v_tutorcareer.replace("\r\n","<br />") %></td>
                                        </tr>
                                        <tr>
                                            <td valign="top"><strong><font color="33939D">����</font></strong></td>
                                            <td><%=v_tutorauthor.replace("\r\n","<br />") %></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="10" colspan="2"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr align="center">
                    <td width="15%" class="table_02_2" colspan="2"><strong>���¼Ұ�</strong></td>
                </tr>
                <tr>
                    <td width="15%" class="table_02_2"><strong>����</strong></td>
                    <td height="25" class="table_02_2"><%=v_intro.replace("\r\n","<br />") %></td>
                </tr>
                <tr>
                    <td width="15%" class="table_02_2"><strong>����</strong></td>
                    <td height="25" class="table_02_2"><%=v_contents.replace("\r\n","<br />") %></td>
                </tr>
                <tr>
                    <td width="15%" class="table_02_2"><strong>�ڸ�</strong></td>
                    <td height="25" class="table_02_2"><div style="height:170px; overflow-y:scroll;"><%=StringManager.convertHtmlchars(v_subtitle) %></div></td>
                </tr>
            </table>
            <!-- �������� ���� �� //-->

            <br />

            <!-- ����, ��� ��ư ���� //-->
            <table width="16%" border="0" cellspacing="0" cellpadding="0">
                <tr>
<%
    if(v_gadmin.equals("A") || v_gadmin.equals("B") || (v_gadmin.equals("H") || v_gadmin.equals("K")) ) {
%>
                    <td align="center"><a href="javascript:modify_article()"><img src="/images/admin/button/btn_modify.gif" border="0" /></a></td>
                    <td align="center"><a href="javascript:delete_article()"><img src="/images/admin/button/btn_del.gif" border="0" /></a></td>
<%
    }
%>
                    <td align="center"><a href="javascript:list()"><img src="/images/admin/button/btn_cancel.gif" border="0" /></a></td>
                </tr>
            </table>
            <!-- ����, ��� ��ư �� //-->
        </td>
    </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
