<%
//**********************************************************
//  1. ��      ��: �����ڰ���
//  2. ���α׷��� : za_Manager_R.jsp
//  3. ��      ��: �����ڰ��� ���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 11. 10
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    String  v_pageno    = box.getString("p_pageno");
    String v_searchtext = box.getString("p_searchtext");
    String v_search     = box.getString("p_search");
    String ss_gadmin    = box.getStringDefault("s_gadmin","ALL");       //gadmin

    String v_userid     = box.getString("p_userid");
    String v_gadmin     = box.getString("p_gadmin");

   // �����ڵ� + "," + �����׷��ʿ俩��  + "," + �����ڵ��ʿ俩�� + "," + ȸ���ڵ��ʿ俩�� +  "," + �μ��ڵ��ʿ俩��
    String v_gadminview = GadminAdminBean.getGadminIsNeed(v_gadmin);
    String v_isneedgrcode  = "";
    String v_isneedsubj    = "";
    String v_isneedcomp    = "";
    String v_isneedoutcomp = "";
    String v_isneeddept    = "";
    StringTokenizer st = new StringTokenizer(v_gadminview,",");

    // �׷�/����/�μ� �ʿ俩��
    if (st.hasMoreElements()) {
        v_gadmin        = (String)st.nextToken();
        v_isneedgrcode  = (String)st.nextToken();
        v_isneedsubj    = (String)st.nextToken();
        v_isneedcomp    = (String)st.nextToken();
        v_isneeddept    = (String)st.nextToken();
        //v_isneedoutcomp = (String)st.nextToken();
    }

    // ������ �⺻����
    String v_gadminnm   = "";
    String v_grtype     = "";
    String v_comp       = "";
    String v_isdeleted  = "";
    String v_fmon       = "";
    String v_tmon       = "";
    String v_fmonview   = "";
    String v_tmonview   = "";
    String v_commented  = "";
    String v_luserid    = "";
    String v_ldate      = "";

    String v_cono       = "";
    String v_name       = "";
    String v_jikwi      = "";
    String v_jikwinm    = "";
    String v_compnm     = "";

    //���������׷�����
    String v_grcode     = "";
    String v_grcodenm   = "";

    //������������
    String v_subj       = "";
    String v_subjnm     = "";

    //����ȸ������
    String v_company    = "";
    String v_companynm  = "";
    
    //����ȸ������
    String v_outcompany = "";
    String v_cpnm       = "";

    //�����μ�����
    String v_subcomp       = "";
    String v_subcompanynm  = "";
    String v_subgpmnm      = "";
    String v_subdeptnm     = "";

    DataBox dbox = (DataBox)request.getAttribute("selectManager");

    if (dbox != null) {
        v_gadmin     = dbox.getString("d_gadmin");
        v_gadminnm   = dbox.getString("d_gadminnm");
        v_grtype     = dbox.getString("d_grtype");
        v_comp       = dbox.getString("d_comp");
        v_isdeleted  = dbox.getString("d_isdeleted");
        v_fmon       = dbox.getString("d_fmon");
        v_tmon       = dbox.getString("d_tmon");
        v_fmonview   = FormatDate.getFormatDate(v_fmon,"yyyy/MM/dd");
        v_tmonview   = FormatDate.getFormatDate(v_tmon,"yyyy/MM/dd");
        v_commented  = dbox.getString("d_commented");
        v_luserid    = dbox.getString("d_luserid");
        v_ldate      = dbox.getString("d_ldate");

        v_cono       = dbox.getString("d_cono");
        v_name       = dbox.getString("d_name");
        v_jikwi      = dbox.getString("d_jikwi");
        v_jikwinm    = dbox.getString("d_jikwinm");
        v_compnm     = dbox.getString("d_compnm");
    }

    ArrayList list1 = (ArrayList)request.getAttribute("selectManagerGrcode");     //���������׷�����
    ArrayList list2 = (ArrayList)request.getAttribute("selectManagerSubj");       //������������
    ArrayList list3 = (ArrayList)request.getAttribute("selectManagerComp");       //����ȸ������
    ArrayList list4 = (ArrayList)request.getAttribute("selectManagerDept");       //�����μ�����
    ArrayList list5 = (ArrayList)request.getAttribute("selectManagerOutComp");       //���־�ü����


%>

<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    // ��� ����
    function modify_manager() {
        if (document.form1.p_gadmin.value=="P1") {
             alert("����������� �������ֽʽÿ�");
             return;
        }

        document.form1.action = "/servlet/controller.system.ManagerAdminServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }
    // ��� ����
    function delete_manager() {
        if (document.form1.p_gadmin.value=="P1") {
             alert("����������� �������ֽʽÿ�");
             return;
        }

        document.form1.p_searchtext.value = "";
        document.form1.p_search.value     = "";
        document.form1.action = "/servlet/controller.system.ManagerAdminServlet";
        document.form1.p_process.value = "delete";
        document.form1.submit();
    }
    // ����Ʈ
    function list_manager() {
        document.form1.action = "/servlet/controller.system.ManagerAdminServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }

//-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process"    value = "<%=v_process %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno%>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext%>">
    <input type = "hidden" name = "p_search"     value = "<%=v_search%>">
    <input type = "hidden" name = "p_userid"     value = "<%=v_userid%>">
    <input type = "hidden" name = "p_gadmin"     value = "<%=v_gadmin%>">
    <input type = "hidden" name = "s_gadmin"     value = "<%=ss_gadmin%>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="665">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
        <tr> 
          <td><img src="/images/admin/system/unite_title05.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
        <br>
        <!----------------- ������� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>ID</strong></td>
            <td height="25" class="table_02_2"><%=v_userid%></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2"><%=v_name%></td>
          </tr>
          <!------------------------  ���Ѻз� ���� ---------------------->
          <tr>
            <td class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2"><%=v_gadminnm%></td>
          </tr>
          <!------------------------  ���Ѻз� ��   ---------------------->
          <tr>
            <td height="25" class="table_title"><b>�����</b></td>
            <td class="table_02_2"><%=GetCodenm.get_codenm("0060",v_grtype)%></td>
          </tr>
        <!------------------------  �׷�˻� ���� ---------------------->
          <tr>
            <td class="table_title"><strong>�����׷�</strong></td>
            <td height="25" class="table_02_2">
<%
         if (list1 != null && v_isneedgrcode.equals("Y")) {
            for(int i = 0; i < list1.size(); i++) {
                DataBox dbox1 = (DataBox)list1.get(i);
                v_grcode    = dbox1.getString("d_grcode");
                v_grcodenm  = dbox1.getString("d_grcodenm");
                out.println (v_grcodenm + "<br>");
            }
         }
%>
            </td>
          </tr>

        <!------------------------  �׷�˻� ��   ---------------------->

        <!------------------------  �����˻� ���� ---------------------->
          <tr>
            <td class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2">
<%
         if (list2 != null && v_isneedsubj.equals("Y")) {
            for(int i = 0; i < list2.size(); i++) {
                DataBox dbox2 = (DataBox)list2.get(i);
                v_subj    = dbox2.getString("d_subj");
                v_subjnm  = dbox2.getString("d_subjnm");
                out.println (v_subjnm + "<br>");
            }
         }
%>
            </td>
          </tr>
        <!------------------------  �����˻� ��   ---------------------->

        <!------------------------  ȸ��˻� ���� ---------------------->
          <!--tr>
            <td class="table_title"><strong>ȸ��</strong></td>
            <td height="25" class="table_02_2">
<%
         if (list3 != null && v_isneedcomp.equals("Y")) {
            for(int i = 0; i < list3.size(); i++) {
                DataBox dbox3 = (DataBox)list3.get(i);
                v_company    = dbox3.getString("d_comp");
                v_companynm  = dbox3.getString("d_compnm");
                out.println (v_companynm + "<br>");
            }
         }
%>
            </td>
          </tr-->
        <!------------------------  ȸ��˻� ��   ---------------------->
        
        
        <!------------------------  ���־�ü�� ���� ---------------------->
          <!--tr>
            <td class="table_title"><strong>���־�ü��</strong></td>
            <td height="25" class="table_02_2">
<%
         if (list5 != null && v_isneedoutcomp.equals("Y")) {
            for(int i = 0; i < list5.size(); i++) {
                DataBox dbox5 = (DataBox)list5.get(i);
                v_outcompany = dbox5.getString("d_comp");
                v_cpnm       = dbox5.getString("d_cpnm");
                out.println (v_cpnm + "<br>");
            }
         }
%>
            </td>
          </tr-->
        <!------------------------  ���־�ü�� ��   ---------------------->
        

        <!------------------------  �μ��˻� ���� ---------------------->
          <!--tr>
            <td class="table_title"><strong>�μ�</strong></td>
            <td height="25" class="table_02_2">
<%
         if (list4 != null && v_isneeddept.equals("Y")) {
            for(int i = 0; i < list4.size(); i++) {
                DataBox dbox4 = (DataBox)list4.get(i);
                v_subcomp       = dbox4.getString("d_comp");
                v_subcompanynm  = dbox4.getString("d_companynm");
                v_subgpmnm  = dbox4.getString("d_gpmnm");
                v_subdeptnm  = dbox4.getString("d_deptnm");
                out.println (v_subcompanynm + "/" + v_subgpmnm + "/" + v_subdeptnm + "<br>");
            }
         }
%>
            </td>
          </tr-->
        <!------------------------  �μ��˻� ��   ---------------------->
          <!--tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2"><%=v_jikwinm%></span></td>
          </tr-->
          <tr>
            <td height="25" class="table_title"><b>���ѻ��Ⱓ</b></td>
            <td class="table_02_2"><%=v_fmonview%> ~ <%=v_tmonview%></td>
          </tr>
          <tr>
            <td height="25" class="table_title"><b>���ѻ��뵵</b></td>
            <td class="table_02_2"><%=v_commented%></td>
          </tr>
        </table>
        <!----------------- ������� �� ----------------->


        <br>
        <!----------------- ����, ����, ����Ʈ ��ư ���� ----------------->
        <table border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"><a href="javascript:modify_manager()"><img src="/images/admin/button/btn_modify.gif" border="0"></a></td>
            <td width=8></td>
            <td align="center"><a href="javascript:delete_manager()"><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
            <td width=8></td>
            <td align="center"><a href="javascript:list_manager()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
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
