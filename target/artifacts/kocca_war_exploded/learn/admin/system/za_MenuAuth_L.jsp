<%
//**********************************************************
//  1. ��      ��: �޴����Ѽ���
//  2. ���α׷��� : za_MenuAuth_L.jsp
//  3. ��      ��: �޴����Ѽ��� ����Ʈ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 11. 8
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process  = box.getString("p_process");
    String  v_grcode   = box.getString("p_grcode");
    String  v_systemgubun = box.getString("p_systemgubun");

    int  v_gadmincnt  = StringManager.toInt(box.getString("p_gadmincnt"));  // ���Ѱ���
    ArrayList list1   = (ArrayList)request.getAttribute("selectList1");       // ���Ѹ���Ʈ
    ArrayList list2   = (ArrayList)request.getAttribute("selectList2");       // �޴������� ����Ʈ

    String v_gadminnm  = "";                       	 // ���Ѹ�
    String[] v_gadmin  = new String[v_gadmincnt];    // ���Ѿ��̵�

    int    v_levels      = 0;                        // ����
    int    v_seq         = 0;                        // seq
    String v_gubun       = "";                       // ���� (��޴�, �Ҹ޴�, ���)
    String v_menu        = "";                       // �޴�
    String v_menunm      = "";                       // �޴���
    String v_control_org = "";                       // ����(�б�/����)
    String[] v_control   = new String[v_gadmincnt];  // ����(�б�/����)

    String v_rchecked    = "";                       // �б���� üũ
    String v_wchecked    = "";                       // ������� üũ

    String v_classcenter = "";                       // td class ����(�߾�����)
    String v_classleft   = "";                       // td class ����(��������)
    String v_classright  = "";                       // td class ����(����������)
    int    v_menucount   = 0;
    int    j=0,k=0,v_width=1000;

    for (j=9; j<=v_gadmincnt; j++){  //������ ������ ���� ���̺� width����
    	k++;
    	v_width=v_width+k*100;
    }
%>

<html>
<head>
<title>�ƢƢƢƢ� ũ���� �����ý��� �ƢƢƢƢ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    function insert() {

        document.form1.action = "/servlet/controller.system.MenuAuthAdminServlet";
        document.form1.p_process.value = "update";
        document.form1.submit();
    }
    
    function Search() {
        document.form1.action ="/servlet/controller.system.MenuAuthAdminServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">


<form name="form1" method="post">
    <input type = "hidden" name = "p_process" value = "<%= v_process %>">
    <input type = "hidden" name = "p_grcode"  value = "<%= v_grcode %>">

<table width="<%=v_width%>" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="<%=v_width%>" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/system/unite_title04.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>

        <!----------------- title �� ----------------->

        <br>
        <!----------------- ����, �޴��ڵ帮��Ʈ ��ư ���� ----------------->
        <table width="<%=v_width%>" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <!--td width="7%" align="left" class=txt_input>�ý��۸�</td>
            <td width="15%" align="left">
                <select name="p_systemgubun" onChange=Search()>
                    <option value="1" <% if(v_systemgubun.equals("1")) { out.println("selected");}%>>���ձ����ý���</option>
                    <option value="2" <% if(v_systemgubun.equals("2")) { out.println("selected");}%>>����Ʈ�ý���</option>
                </select>
            </td-->
            <td>&nbsp;</td>
            <td align="left"><a href='javascript:insert()'><img src="/images/admin/button/btn_save.gif" border="0"></a>
            <a href='/servlet/controller.system.MenuAdminServlet?p_process=select&p_grcode=0000001'><img src="/images/admin/button/btn_menucodelist.gif" border="0"></a></td>
          </tr>
          <tr> 
            <td height="3"></td>
          </tr>
        </table> 
        <!----------------- ����, �޴��ڵ帮��Ʈ ��ư �� ----------------->

        <!----------------- ��޴����� ���� ----------------->
        <table width="<%=v_width%>" border="0" class="table_out" cellspacing="1" cellpadding="0">
          <tr>
            <td colspan="<%=(v_gadmincnt + 2)%>" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="40" height="50" class="table_title" rowspan="2"><b>����</b></td>
            <td width="160" class="table_title" rowspan="2"><b>�޴��ڵ��</b></td>
            <td width="<%=v_gadmincnt*v_width/10%>" class="table_title" colspan="<%=v_gadmincnt%>" height="25"><b>����</b></td>
          </tr>
          <tr>
<%
      // ���� ����Ʈ
       for(int i = 0; i < list1.size(); i++) {

                GadminData data1  = (GadminData)list1.get(i);
                v_gadmin[i]   = data1.getGadmin();
                v_gadminnm    = data1.getGadminnm();
%>
            <td width="<%=v_width/10%>" class="table_title" height="25"><b><%=v_gadminnm%></b></td>
<%
        }
%>
          </tr>
          <tr>
<%= StringManager.menuListFetch( list2,   v_gadmincnt,  v_gadmin,v_control) %>
<% /*
       //�޴� ����Ʈ
        for(int i = 0; i < list2.size(); i++) {

            MenuAuthData data2  = (MenuAuthData)list2.get(i);
            v_levels  = data2.getLevels();
            v_seq     = data2.getSeq();
            v_menu    = data2.getMenu();
            v_menunm  = data2.getMenunm();

            

            if (v_levels == 1 && v_seq == 0)      {
                v_menucount++;
                v_gubun = "<b>" + String.valueOf(v_menucount) + "</b>";

                v_classcenter = "table_02_8";
                v_classleft   = "table_02_9";
                v_classright  = "table_02_10";
            } else if (v_levels == 2 && v_seq == 0) {
                v_gubun = "�޴�";
                v_classcenter = "table_02_5";
                v_classleft   = "table_02_6";
                v_classright  = "table_02_7";
            } else {
                v_gubun = "���";
                v_classcenter = "table_02_1";
                v_classleft   = "table_02_2";
                v_classright  = "table_02_4";
            }
%>
            <td width="40" height="25" class="<%=v_classcenter%>"><%=v_gubun%></td>
            <td width="160" class="<%=v_classcenter%>"><%=v_menunm%></td>
<%
           // ���� ����Ʈ
           if(v_gadmincnt > 0) {
               v_control_org = data2.getControl();
               StringTokenizer st = new StringTokenizer(v_control_org,"/");
               j = 0;

               // ���α��ѿ� ���� ������ �б�/������Ѱ� �迭�� ����
               while (st.hasMoreElements()) {
                   v_control[j] = StringManager.chkNull((String)st.nextToken());
                   j++;

               }

               // ��ġ ������ ���� ���а� (�Ǿռ��� ���ڸ�) ����
               for (j = 0;j<v_gadmincnt;j++){
                  v_control[j] = StringManager.rightstring(v_control[j], v_control[j].length()-1);
               }
               
            	
               // �ش� ���� üũ�ڽ��� ����
               for (k=0; k < v_gadmincnt ; k++) {

               	
                  v_control[k] = StringManager.chkNull(v_control[k]);

                   if (v_control[k].equals("r") || v_control[k].equals("rw") ) v_rchecked = "checked";
                   else v_rchecked = "";
                   if (v_control[k].equals("w") || v_control[k].equals("rw") ) v_wchecked = "checked";
                   else v_wchecked = "";
                   
%>				
                <td width="<%=v_width/10%>" class="<%=v_classcenter%>">
                        <input type="hidden" name = "p_menu<%=v_gadmin[k]%>" value="<%=v_menu%>">
                        <input type="hidden" name = "p_menusubseq<%=v_gadmin[k]%>" value="<%=v_seq%>">
                        <input type="hidden" name = "p_gadmin<%=v_gadmin[k]%>" value="<%=v_gadmin[k]%>">
                  <table width='100'>
<%            if (v_seq == 0) {                              %>

                    <tr>
                      <td class="<%=v_classright%>"> View </td>
                      <td class="<%=v_classright%>">  
                        <input type="checkbox" name="p_<%=v_gadmin[k]%>R<%=i%><%=k%>" value="r" <%=v_rchecked%>>
                        <input type="hidden" name="p_<%=v_gadmin[k]%>W<%=i%><%=k%>" value="w" <%=v_wchecked%>>
                      </td>
<%            } else {                                       %>
                    <tr>
                      <td class="<%=v_classcenter%>"> R </td>
                      <td class="<%=v_classright%>"> 
                        <input type="checkbox" name="p_<%=v_gadmin[k]%>R<%=i%><%=k%>" value="r" <%=v_rchecked%>>
                      <td class="<%=v_classcenter%>"> W </td>
                      <td class="<%=v_classright%>"> 
                        <input type="checkbox" name="p_<%=v_gadmin[k]%>W<%=i%><%=k%>" value="w" <%=v_wchecked%>>
                      </td>
<%            }                                              %>
                  </table>
                </td>
<%
                }
            }
%>
          </tr>
<%
        }*/
%>
        </table>
        <!----------------- ��޴����� �� ----------------->


      </td>
  </tr>
</table>


<%@ include file = "/learn/library/getJspName.jsp" %> 
</form>
</body>
</html>
