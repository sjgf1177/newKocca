<%
//**********************************************************
//  1. ��      ��: Notice
//  2. ���α׷��� : za_Notice_R.jsp
//  3. ��      ��: �������� �󼼺���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2005. 7. 13
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String v_process  = box.getString("p_process");
    
    String s_userid = box.getSession("userid");
    int v_pageno   = box.getInt("p_pageno");
    String v_selcomp  = box.getString("p_selcomp");

    String v_searchtext = box.getString("p_searchtext");
    String v_search     = box.getString("p_search");

    int v_tabseq        = box.getInt("p_tabseq");
    int v_seq           = box.getInt("p_seq");

    int v_cnt        = 0;            // ��ȸ��
    String v_gubun      = "";           // ��ü����
    String v_startdate  = "";           // �˾�����������
    String v_enddate    = "";           // �˾�����������
    String v_adtitle    = "";           // ����
    String v_adcontent  = "";           // ����
    String v_addate     = "";           // �����
    String v_adname     = "";           // �����
    String v_aduserid   = "";           // userid

    String v_gubun_view = "";
    String v_loginyn    = "";           // �α�������
    String v_useyn      = "";           // �������
    String v_compcd     = "";           // ���ȸ��
    int v_popwidth      = 0;            // �˾�����
    int v_popheight     = 0;            // �˾�����
    int v_popxpos       = 0;            // �˾�x��ġ
    int v_popypos       = 0;            // �˾�y��ġ
                        
    String v_popup      = "";           // �˾�����
    String v_uselist    = "";           // ����Ʈ���
    String v_useframe   = "";           // �����ӻ��
    String v_isall      = "";
    String v_grcodecd   = "";
    String v_isanswer  = "";           // �亯�� ���� ����
    String v_bannerimg = "";
    String v_save_bannerimg  = "";   // ����̹���(�������ϸ�)
    String v_userid = "";
    
    DataBox dbox = (DataBox)request.getAttribute("selectEvent");
    
    if (dbox != null) {
        v_gubun     = dbox.getString("d_gubun");            
        v_startdate = dbox.getString("d_strdate"); 
        v_enddate   = dbox.getString("d_enddate");   
        v_adtitle   = dbox.getString("d_title");  
        v_adcontent = dbox.getString("d_content");
        v_addate    = dbox.getString("d_indate");   
        v_adname    = dbox.getString("d_name");   
        v_cnt       = dbox.getInt("d_cnt");      
        v_loginyn   = dbox.getString("d_loginyn");   
        v_useyn     = dbox.getString("d_useyn");     
        v_compcd    = dbox.getString("d_compcd");    
        v_popwidth  = dbox.getInt("d_popwidth");     
        v_popheight = dbox.getInt("d_popheight");    
        v_popxpos   = dbox.getInt("d_popxpos");      
        v_popypos   = dbox.getInt("d_popypos");      
        v_popup     = dbox.getString("d_popup");     
        v_uselist   = dbox.getString("d_uselist");   
        v_useframe  = dbox.getString("d_useframe");  
        v_isall     = dbox.getString("d_isall");  
        v_grcodecd  = dbox.getString("d_grcodecd");  
        v_aduserid  = dbox.getString("d_aduserid");
        v_isanswer  = dbox.getString("d_isanswer");   
        v_bannerimg  = dbox.getString("d_bannerimg");
        v_save_bannerimg  = dbox.getString("d_save_bannerimg");
        v_userid = dbox.getString("d_userid");

        v_addate     = FormatDate.getFormatDate(v_addate, "yyyy/MM/dd");
        if(v_isanswer.equals("Y")) v_isanswer = "���";
        else v_isanswer = "������";
     }  
     
    if (v_gubun.equals("Y")) v_gubun_view = "��ü";
    else if (v_gubun.equals("N")) v_gubun_view = "�Ϲ�";
    else if (v_gubun.equals("P")) v_gubun_view = "�˾�";
    
    if (v_uselist.equals("")) v_uselist = "N";
    if (v_useframe.equals("")) v_useframe = "N";
    
    if(v_loginyn.equals("Y")) v_loginyn = "�α�����"; 
    else if(v_loginyn.equals("N")) v_loginyn = "�α�����";
    else v_loginyn = "��ü";
    
    
    if(v_useyn.equals("Y")) v_useyn = "���";
    else if(v_useyn.equals("N")) v_useyn = "������";
     
//���ȸ��
    int tmplen= 0;
    String compcd="'1'";
    if(!v_compcd.equals("")) {
        compcd=v_compcd.substring(0, v_compcd.length()-1);
        compcd=StringManager.replace(compcd, ",", "','");
        compcd="'"+compcd+"'";
    }
    
    String grcodecd="'1'";
    if(!v_grcodecd.equals("")) {
        grcodecd=v_grcodecd.substring(0, v_grcodecd.length()-1);
        grcodecd=StringManager.replace(grcodecd, ",", "','");
        grcodecd="'"+grcodecd+"'";
    }
    
    
    NoticeAdminBean bean = new NoticeAdminBean();
    
    String s_gadmin    = box.getSession("gadmin");
    String v_gadmin ="";
    if(!s_gadmin.equals("")){
        v_gadmin = s_gadmin.substring(0,1);
    }
    
%>

<html>
<head>
<title>eIBIs</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    // �Խù� ����
    function modify_notice() {
        document.form1.action = "/servlet/controller.homepage.EventAdminServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    //�Խù�����
    function delete_notice() {
        document.form1.p_searchtext.value = "";
        document.form1.p_search.value     = "";
        document.form1.action = "/servlet/controller.homepage.EventAdminServlet";
        document.form1.p_process.value = "delete";
        document.form1.submit();
    }

    // ��Ϻ���
    function list_notice() {
        document.form1.action = "/servlet/controller.homepage.EventAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

    /**
     * ÷������ �ٿ�ε�
     */
    function fnDownlaodFile( saveFileNm, fileNm ) {
        var url = "/servlet/controller.library.DownloadServlet";
        var param = "?p_savefile=" + saveFileNm + "&p_realfile=" + fileNm;

        location.href = url + param;
    }

//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process" value = "<%= v_process %>">
    <input type = "hidden" name = "p_pageno" value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_search" value = "<%=v_search %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_seq" value = "<%=v_seq %>">
    <input type = "hidden" name = "p_saveFileNm" value = "<%=v_save_bannerimg %>">


<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
        <td align="center" valign="top"> 
            <!----------------- title ���� ----------------->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
                <tr> 
                    <td><img src="/images/admin/portal/s.1_14.gif" ></td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
                </tr>
            </table>
            <!----------------- title �� ----------------->

            <br>
            <br>
            <!----------------- �������� ���� ���� ----------------->
            <table class="table_out" cellspacing="1" cellpadding="5">
                <tr>
                    <td colspan="2" class="table_top_line"></td>
                </tr>
                <tr>
                    <td width="15%" class="table_title"><strong>�ۼ���</strong></td>
                    <td height="25" class="table_02_2"><%= v_userid %></td>
                </tr>
                <tr class="table_02_2">
                    <td height="25" class="table_title" ><strong>�����</strong></td>
                    <td height="25" class="table_02_2"><%= v_addate %></td>
                </tr>
                <tr class="table_02_2"> 
                    <td height="25" class="table_title" ><strong>�̺�Ʈ �Ⱓ</strong></td>
                    <td class="table_02_2"><%=FormatDate.getFormatDate(v_startdate,"yyyy/MM/dd")%> ~ <%=FormatDate.getFormatDate(v_enddate,"yyyy/MM/dd")%>
                </tr>
                <tr> 
                    <td width="15%" class="table_title"><strong>�������</strong></td>
                    <td height="25" class="table_02_2"><%=v_useyn%></td>
                </tr>
                <tr>
                    <td width="15%" class="table_title"><strong>����</strong></td>
                    <td height="25" class="table_02_2"><b><%= v_adtitle %></b></td>
                </tr>
                <tr>
                    <td width="15%" class="table_title"><strong>����</strong></td>
                    <td height="50" class="table_02_2"><br><%= v_adcontent %><br></td>
                </tr>
                <tr> 
                    <td width="15%" class="table_title"><strong>����� �̹���</strong></td>
                    <td height="25" class="table_02_2">
                        <a href="javascript:fnDownlaodFile('<%= v_save_bannerimg.replace("\\", "/") %>', '<%= v_bannerimg %>');">
                        <img src="<%=v_save_bannerimg %>" width=255 height=65 border=0></a>
                    </td>
                </tr>
            </table>
            <!----------------- �������� ���� �� ----------------->

            <br>
            <!----------------- ����, ����, ����Ʈ ��ư ���� ----------------->
            <table width="16%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                    <%if(v_gadmin.equals("A") || v_gadmin.equals("B") || ( s_userid.equals(v_aduserid) && (v_gadmin.equals("H") || v_gadmin.equals("K"))) ){%>
                    <td align="center"><a href="javascript:modify_notice()"><img src="/images/admin/button/btn_modify.gif" border="0"></a>&nbsp;</td>
                    <td align="center"><a href="javascript:delete_notice()"><img src="/images/admin/button/btn_del.gif" border="0"></a>&nbsp;</td>
                    <%}%>
                    <td align="center"><a href="javascript:list_notice()"><img src="/images/admin/button/btn_list.gif" border="0"></a>&nbsp;</td>
                </tr>
            </table>
            <!----------------- ����, ����, ����Ʈ ��ư �� ----------------->
        </td>
    </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
