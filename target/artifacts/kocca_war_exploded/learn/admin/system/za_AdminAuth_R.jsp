<%
//**********************************************************
//  1. ��      ��: ��ں� �޴� ����
//  2. ���α׷��� : za_AdminAuth_L.jsp
//  3. ��      ��: ��ں� �޴� ������ ����
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 11. 16
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process  		= box.getString("p_process");
    String  v_grcode   		= box.getString("p_grcode");
    String  v_userid   		= box.getString("p_userid");
    String  v_gadminview 	= box.getString("p_gadminview");
    int  	v_gadmincnt  	= StringManager.toInt(box.getString("p_gadmincnt"));  	// ���Ѱ���
    String 	v_gadminnms		= box.getString("p_gadminnms");							// ��ں� ���Ѹ�
    ArrayList list1   		= (ArrayList)request.getAttribute("selectList1");     	// ���Ѹ���Ʈ
    ArrayList list2   		= (ArrayList)request.getAttribute("selectList2");     	// �޴������� ����Ʈ

    String 	 v_gadminnm    = box.getString("p_gadminnm"); 							// ���Ѹ�
    String[] v_gadmin    = new String[v_gadmincnt];       							// ���Ѿ��̵�

	if (v_gadminnm.equals("")) v_gadminnm = "��ڸ޴�����";						//��� �޴� ���� ���ý� ���̰� �� �ʵ��

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
    
    String v_cono		 = "";						 // ���
    String v_name		 = "";						 // ����
    String v_jikwinm	 = "";						 // ���� �̸�
    String v_compnm		 = "";						 // ȸ���
    
    // ������ �⺻����
    MenuAuthAdminData data = (MenuAuthAdminData)request.getAttribute("selectManager");

    v_cono       = data.getCono();
    v_name       = data.getName();
    v_jikwinm    = data.getJikwinm();
    v_compnm     = data.getCompnm();
    

    StringTokenizer st = new StringTokenizer(v_gadminnms,",");

    int kk = st.countTokens();
    String v_adminnm[] = new String[kk+1];
    int ttm = 0;
    while (st.hasMoreTokens()) {
		v_adminnm[ttm++]  = st.nextToken();
	}
%>

<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
	//��ں� �޴����� ���� ����
    function insert() {
        document.form1.action = "/servlet/controller.system.MenuAuthAdminEachServlet";
        document.form1.p_process.value = "update";
        document.form1.submit();
    }

	//���� ������ ���� �׷�/����/ȸ��/�μ� ��� ȭ�� ���÷���
    function changeGadmin() {
		document.form1.action = "/servlet/controller.system.MenuAuthAdminEachServlet";
		document.form1.p_process.value = "updatePage";
		document.form1.submit();
    }
    //��ں� �޴����Ѽ��� ����Ʈ ȭ������ �̵�
    function list() {
        document.form1.action = "/servlet/controller.system.MenuAuthAdminEachServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }
    
//-->
</SCRIPT>

</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form name="form1" method="post">
    <input type = "hidden" name = "p_process" value = "<%= v_process %>">
    <input type = "hidden" name = "p_grcode"  value = "<%= v_grcode %>">
    <input type = "hidden" name = "p_userid"  value = "<%= v_userid %>">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/system/unite_title06.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->
    </td>
  </tr>
  <tr>
  	<td height="20">&nbsp;</td>
  </tr>
  <!-------------------��� �Ż����� �Ҽ�,����,����,���,���� ����------------------------->
  <tr>
  	  <td width="500" align="center" valign="top">
  	      <table border="0" cellpadding="0" cellspacing="0">
  	      	  <tr height="30"><td>&nbsp;</td></tr>
      		  <tr>
      		  	 <td align="center">
      			     <table border="0" class="table_out" cellpadding="0" cellspacing="1">
      			         <tr>
      			     	     <td width="80" class="table_title">�Ҽ�</td>
      			     		 <td width="420" class="table_02_8"><%=v_compnm%></td>
      			     	 </tr>
      			     	 <tr>
      			     		 <td class="table_title">����</td>
      			     		 <td class="table_02_8"><%=v_jikwinm%></td>
      			     	 </tr>
      			     	 <tr>
      			     	  	 <td class="table_title">����</td>
      			     	  	 <td class="table_02_8"><%=v_gadminnms%></td>
      			     	 </tr>
      			     	 <tr>
      			     	  	 <td class="table_title">���</td>
      			     	  	 <td class="table_02_8"><%=v_cono%></td>
      			     	 </tr>
      			     	 <tr>
      			     	  	 <td class="table_title">����</td>
      			     	  	 <td class="table_02_8"><%=v_name%></td>
      			     	 </tr>
      			     </table>
      			 </td>
      		</tr>
      	</table>
    </td>

  <!----------------------��� �Ż����� ���� ������� --------------------->

  	<td valign="top" align="center">
        <!----------------- ����, �޴��ڵ帮��Ʈ ��ư ���� ----------------->
        <table width="97%" border="0" cellpadding="0" cellspacing="0">
            <tr>
          		<td width="50%" align="right"><strong>�������ø�</strong></td>
          		<td width="30%" align="center" height="25">
             	<%= GadminAdminBean.getGadminSelectOnly("p_gadminview",v_gadminview,"onChange=\"changeGadmin()\"") %>
          		</td>
        		<td width="10%" align="center"><a href='javascript:insert()'><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
        		<!--td width="10%" align="right" width="99"><a href='/servlet/controller.system.MenuAdminServlet?p_process=select&p_grcode=0000001'><img src="/images/admin/system/menu_code1_butt.gif" width="93" height="18" border="0"></a></td-->
        		<td width="10%" align="center"><a href='javascript:list()'><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
        	</tr>
        	<tr>
          		<td height="3"></td>
        	</tr>
      	</table>
      	<!----------------- ����, �޴��ڵ帮��Ʈ ��ư �� ----------------->

      	<!----------------- ��޴����� ���� ----------------->
      	<table class="table_out" cellspacing="1" cellpadding="0">
        	<tr>
          		<td colspan="<%=(v_gadmincnt + 2)%>" class="table_top_line"></td>
        	</tr>
        	<tr>
          		<td height="50" class="table_title" rowspan="2"><b>����</b></td>
          		<td class="table_title" rowspan="2"><b>�޴��ڵ��</b></td>
          		<td class="table_title" colspan="<%=v_gadmincnt%>" height="25"><b>����</b></td>
        	</tr>
        	<tr>
				<td class="table_title" height="25"><b><%=v_gadminnm%></b></td>
		  	</tr>
		  	<tr>
<%

       //�޴� ����Ʈ
        for(int i = 0; i < list2.size(); i++) {
			DataBox dbox = (DataBox)list2.get(i);
            //MenuAuthAdminData data2  = (MenuAuthAdminData)list2.get(i);
            v_levels  = dbox.getInt("d_levels");
            v_seq     = dbox.getInt("d_seq");
            v_menu    = dbox.getString("d_menu");
            v_menunm  = dbox.getString("d_menunm");
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

/*
            if (v_levels == 1) v_bgcolor = "#E1E1E1";
            else               v_bgcolor = "#F7F7F7";

            if (v_seq == 0) {
                v_classcenter = "table_02_5";
                v_classleft   = "table_02_6";
                v_classright  = "table_02_7";
            } else {
                v_classcenter = "table_02_1";
                v_classleft   = "table_02_2";
                v_classright  = "table_02_4";
            }
*/
%>
            	<td height="25" class="<%=v_classcenter%>"><%=v_gubun%></td>
            	<td class="<%=v_classcenter%>"><%=v_menunm%></td>
<%
           // ���� ����Ʈ
               v_control_org = dbox.getString("d_control");
               int j = 0;

               // �ش� ���� üũ�ڽ��� ����

				  if (v_control_org.equals("r") || v_control_org.equals("rw") ) v_rchecked = "checked";
                  else v_rchecked = "";
                  if (v_control_org.equals("w") || v_control_org.equals("rw") ) v_wchecked = "checked";
                  else v_wchecked = "";	
%>
                <td class="<%=v_classcenter%>">
                    <input type="hidden" name = "p_menu" value="<%=v_menu%>">
                    <input type="hidden" name = "p_menusubseq" value="<%=v_seq%>">
                    <input type="hidden" name = "p_userid" value="<%=v_userid%>">
                  	<table width ='100%'>
<%            if (v_seq == 0) {                              %>

                    	<tr>
                      		<td width ='50%' class="<%=v_classright%>"> View </td>
                      		<td width ='50%' class="<%=v_classright%>">  
                        	<input type="checkbox" name="p_<%=v_userid%>R<%=i%>" value="r" <%=v_rchecked%>>&nbsp
                        	<input type="hidden" name="p_<%=v_userid%>W<%=i%>" value="w" <%=v_wchecked%>>
                      		</td>
<%            } else {                                       %>
                    	<tr>
                      		<td width ='25%' class="<%=v_classcenter%>"> R </td>
                      		<td width ='25%' class="<%=v_classright%>"> 
                        	<input type="checkbox" name="p_<%=v_userid%>R<%=i%>" value="r" <%=v_rchecked%>>&nbsp
                      		<td width ='25%' class="<%=v_classcenter%>"> W </td>
                      		<td width ='25%' class="<%=v_classright%>"> 
                        	<input type="checkbox" name="p_<%=v_userid%>W<%=i%>" value="w" <%=v_wchecked%>>&nbsp
                      		</td>
<%            }                                              %>
                  	</table>
                </td>
          	</tr>
<%
        }
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
