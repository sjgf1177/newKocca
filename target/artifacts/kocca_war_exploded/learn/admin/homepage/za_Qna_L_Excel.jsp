<%
//**********************************************************
//  1. ��      ��: Qna ����Ʈ ��ȸȭ��
//  2. ���α׷���:  za_Qna_L.jsp
//  3. ��      ��: Qna ����Ʈ ��ȸȭ��
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2005. 7. 7 �̿���
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.homepage.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%

	RequestBox box        = (RequestBox)request.getAttribute("requestbox");
	String  v_process     = box.getString("p_process");
    String  v_type        = box.getStringDefault("p_type", "ALL");

    //out.println(v_type);
    String  v_action      = box.getString("p_action");
    String  s_gadmin      = box.getSession("gadmin");
    String  s_grtype      = box.getSession("grtype");
    String  ss_grcode   = box.getString("s_grcode");            //�����׷�
    String  v_gadmin    = StringManager.substring(s_gadmin, 0, 1);
    String  isAll       = !v_gadmin.equals("A") ? "false" : "true";
    String  v_selGroup  = box.getStringDefault("p_selGroup", "ALL");

    int v_pageno = box.getInt("p_pageno");
    if (v_pageno == 0)  v_pageno = 1;

    String startDate = FormatDate.getRelativeDate(-90);
    String endDate = FormatDate.getDate("yyyyMMdd");
    String searchStart   = "";
    String searchEnd     = "";
    String v_subj        ="";
    String v_year        ="";
    String v_subjseq     = "";
    int    v_replystate  = 0;
    String  v_inuserid   = "";
    String  v_name       = "";
    String  v_indate     = "";
    String  v_upfile     = "";
    String  v_title      = "";
    String  v_scsubjnm      = "";
    String  v_edudate      = "";
    int     v_seq        = 0;
    String  v_types      = "";
    String  v_grcode     = "";
    String  v_repstatus  = "";
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    searchStart = FormatDate.getFormatDate(startDate,"yyyy-MM-dd");
    searchEnd   = FormatDate.getFormatDate(endDate,"yyyy-MM-dd");
//	String  v_searchStart = box.getStringDefault("p_searchStart",searchStart);
    String  v_searchStart = box.getStringDefault("p_searchStart",searchEnd);
    String  v_searchEnd   = box.getStringDefault("p_searchEnd",searchEnd);
    String  v_startdate   = box.getString("p_startdate");
    String  v_enddate     = box.getString("p_enddate");
    String  s_grcode      = box.getStringDefault("p_grcode","ALL");
    String  v_searchtext     = box.getString("p_searchtext");
    String  v_select         = box.getString("p_select");
    String  v_search         = box.getString("p_search");
    String  v_categorycd     = box.getStringDefault("p_categorycd","00");
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
    String  v_order    = box.getString("p_order"); //����
    int v_cnt = 0;
    String s_userid = box.getSession("userid");
    String s_usernm = box.getSession("name");
    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
    ArrayList list = (ArrayList)request.getAttribute("selectList");

    response.setHeader("Content-Disposition", "attachment; filename=qna_excel.xls"); 
    response.setHeader("Content-Description", "JSP Generated Data");

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
  <table width="1000" border="1" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">
        <!----------------- ����������ȸ ���� ----------------->
        <table border="1" cellspacing="1" cellpadding="5">
          <tr>
            <td class="table_title" width="5%"><b>NO</b></td>
            <td class="table_title" width="10%"><b>����</b></td>
            <td class="table_title" >��������</td>
            <td class="table_title" width="10%"><b>����</b></td>
            <td class="table_title" width="7%"><b>�����</b></td>
            <td class="table_title" width="5%"><b>÷������</b></td>
            <td class="table_title" width="5%"><b>�亯����</b></td>
            <td class="table_title" width="5%"><b>������</b></td>
            <td class="table_title" width="10%"><b>����</b></td>
            <td class="table_title" width="10%"><b>������</b></td>
            <td class="table_title" width="10%"><b>��������</b></td>
            <td class="table_title" width="10%"><b>�亯����</b></td>
          </tr>

<%if(v_action.equals("go") && list.size() > 0){%>
<%
            for(int i = 0; i < list.size(); i++) {
                DataBox dbox = (DataBox)list.get(i);
                v_dispnum       = dbox.getInt("d_dispnum");
                v_inuserid      = dbox.getString("d_inuserid");
                v_name          = dbox.getString("d_name");
                v_cnt           = dbox.getInt("d_cnt");
                v_indate        = dbox.getString("d_indate");
                v_upfile        = dbox.getString("d_upfile");
                v_title         = dbox.getString("d_title");
                v_seq           = dbox.getInt("d_seq");
                v_types         = dbox.getString("d_types");
                v_categorycd    = dbox.getString("d_categorycd");
                v_grcode        = dbox.getString("d_grcode");
                v_replystate    = Integer.parseInt(dbox.getString("d_replystate"));
                v_upfilecnt     = dbox.getInt("d_filecnt");
                v_scsubjnm      = dbox.getString("d_scsubjnm");
                v_edudate       = dbox.getString("d_edudate");
                v_subjseq       = dbox.getString("d_subjseq");

                v_totalpage     = dbox.getInt("d_totalpage");
                v_rowcount      = dbox.getInt("d_rowcount");
                v_type          = dbox.getString("d_type");
                v_subj          = dbox.getString("d_subj");
                v_year          = dbox.getString("d_year");
                v_subjseq       = dbox.getString("d_subjseq");

                v_repstatus     = dbox.getString("d_okyn1").equals("") ? "1" : dbox.getString("d_okyn1");

                String v_content=dbox.getString("d_contents").replace("\r\n","").replace("<p>&nbsp;</p>","");
                String v_ans=dbox.getString("d_ans").replace("\r\n","").replace("<p>&nbsp;</p>","");

                if (v_repstatus.equals("1")){
                	v_repstatus    = "������";
                } else if (v_repstatus.equals("2")){
                    v_repstatus    = "�亯�غ���";
                } else if (v_repstatus.equals("3")){
                    v_repstatus    = "�亯�Ϸ�";
                }

                // �˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.
                if (!v_searchtext.equals("")&&v_select.equals("title")) {
                    v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
                } else if(!v_searchtext.equals("")&&v_select.equals("name")){
                    v_name = StringManager.replace(v_name, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
                }
%>
             <tr class="table_02_1">
                <td class="table_02_1"><%=v_dispnum%></td>
                <td class="table_02_1">
<%
                     if(v_type.equals("PQ")){
                        out.print("Ȩ������");
                     }else if(v_type.equals("OO")){
                         out.print("1vs1 ���");
                     }else if(v_type.equals("BU")){
                         out.print("���׽Ű�");
                     }else if(v_type.equals("CU")){
                         out.print("��ڿ���");
                     }else if(v_type.equals("MM")){
                         out.print("1:1����");
                     }else{
                         out.print("����������");
                     }
%>
                 <input type = "hidden" name = "pp_type" value="<%=v_type%>">
                </td>
                <td class="table_02_2"><%=v_title%></td>
                <td class="table_02_1"><%=v_name%></td>
                <td class="table_02_1"><%=FormatDate.getFormatDate(v_indate,"yyyy/MM/dd")%></td>
                <td class="table_02_1">
                    <%if(v_upfilecnt>0){%>
                        <img src="/images/user/support/ico_file.gif" width="13" height="12">
                    <%}else{
                     %>
                    <%}%>
                </td>
                <td class="table_02_1"><%=v_repstatus %></td>
                <td class="table_02_1"><%=v_scsubjnm %></td>
                <td class="table_02_1"><%=v_subjseq %></td>
                <td class="table_02_1"><%=v_edudate %></td>
                <td class="table_02_1"><%=v_content %></td>
                 <td class="table_02_1"><%=v_ans %></td>
            </tr>
                      <%}%>
                    <%}else{%>

                    <tr>
                      <td colspan='15' class="table_02_1">��� �� ������ �����ϴ�.</td>
                    </tr>
                    <%}%>
        </table>
      </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
