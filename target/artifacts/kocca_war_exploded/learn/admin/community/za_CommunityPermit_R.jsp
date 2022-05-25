<%
//**********************************************************
//  1. ��      ��: COMMUNITY PERMIT SELECT
//  2. ���α׷���: za_CommunityPermit_R.jsp
//  3. ��      ��: Ŀ�´�Ƽ ���� ��ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004.02.17
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");    
    String  v_process   = box.getString("p_process");    
    String  v_search    = box.getString("p_search");    //�˻���(Ŀ�´�Ƽ��)
    String  v_select    = box.getString("p_select");    //�˻��׸�(ī�װ� ���̵�)
    String  v_commId    = box.getString("p_commId");    //��ȣȸ ���̵�
      
    int     v_userCnt   =   0;                          //��ȣȸ �ο���
    String  v_sdesc     =   "";                         //��ȣȸ��
    String  v_categoryId=   "";                         //ī�װ� ���̵�
    String  v_master    =   "";                         //��ȣȸ �ü�
    String  v_requestDate=  "";                         //��û��
    String  v_intros    =   "";                         //��ȣȸ �Ұ�
    String  v_topics    =   "";                         //��ȣȸ ����
    String  v_permittedStatus="";                       //���ο���
    String  v_permittedDate="";                         //������
    String  v_rejectedDate=  "";                        //�����
    String  v_rejectedReason="";                        //������     
    String  v_category_value    =   "";                 //ī�װ� value
    String  v_permit_value      =   "";                 //���ο��� value
    String  v_data_value        =   "";                 //��¥ value  
    //DEFINED class&variable END

    DataBox dbox  = (DataBox)request.getAttribute("permitSelect");    
    v_userCnt           = dbox.getInt	("d_usercnt");  
    v_sdesc             = dbox.getString("d_sdesc");  
    v_categoryId        = dbox.getString("d_categoryid");
    v_master            = dbox.getString("d_master");
    v_requestDate       = dbox.getString("d_requestdate");
    v_intros            = dbox.getString("d_intros");
    v_topics            = dbox.getString("d_topics");
    v_permittedStatus   = dbox.getString("d_permittedstatus");
    v_permittedDate     = dbox.getString("d_permitteddate");
    v_rejectedDate      = dbox.getString("d_rejecteddate");   
    v_rejectedReason    = dbox.getString("d_rejectedreason");
    v_category_value    = CodeConfigBean.getCodeName("communityCategory",v_categoryId);
    v_requestDate       = FormatDate.getFormatDate(v_requestDate,"yyyy/MM/dd");
    if(v_permittedStatus.equals("01")){
        v_permit_value  = "������";
        v_data_value    = FormatDate.getFormatDate(v_permittedDate,"yyyy/MM/dd");
    }else if(v_permittedStatus.equals("02")){
        v_permit_value  = "�����";   
        v_data_value    = FormatDate.getFormatDate(v_rejectedDate,"yyyy/MM/dd");
    }else if(v_permittedStatus.equals("03")){
        v_permit_value  = "ó����"; 
        v_data_value    = "����";
    }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language="JavaScript" type="text/JavaScript">
	   function permit() {
                document.form1.action = "/servlet/controller.community.CommunityAdminServlet";
                document.form1.p_process.value = "permitHandling";      
                document.form1.submit();	
            }                        
	   function cancel() {
                document.form1.action = "/servlet/controller.community.CommunityAdminServlet";
                document.form1.p_process.value = "permitList";      
                document.form1.submit();	
            }                        
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
    <input type = "hidden" name = "p_process" value = "<%= v_process %>">  
    <input type = "hidden" name = "p_commId" value = "<%= v_commId %>">  
    <input type = "hidden" name = "p_search" value = "<%= v_search %>">   
    <input type = "hidden" name = "p_select" value = "<%= v_select %>">       
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
      <td align="center" valign="top"> 
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr> 
            <td><img src="../../../images/admin/community/tit_comm_04.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <!----------------- title �� ----------------->
      <br>
        <br>
        <!----------------- ����������ȸ ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="4" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>�н���ȣȸ��</strong></td>
            <td width="30%" class="table_02_1"><%=v_sdesc%></td>
            <td width="15%" class="table_title"><b>ī�װ�</b> : <%=v_category_value%></td>
            <td width="30%" class="table_title"><b>�û�</b> : <%=v_master%></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>ȸ����</strong></td>
            <td width="30%" class="table_02_1"><%=v_userCnt%>��</td>
            <td width="15%" class="table_title"><strong>��û��</strong></td>
            <td width="30%" class="table_02_1"> <p><%=v_requestDate%></p></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>�н���ȣȸ�Ұ�</strong></td>
            <td height="25" colspan="3" class="table_02_2" style="padding-top=10;padding-right=10;padding-bottom=10;padding-left=10">
                <%= StringManager.replace(v_intros,"\r\n","<br>") %>
            </td>
          </tr>      
          <tr>
            <td width="15%" class="table_title"><strong>�н���ȣȸ����</strong></td>
            <td height="25" colspan="3" class="table_02_2" style="padding-top=10;padding-right=10;padding-bottom=10;padding-left=10">
                <%= StringManager.replace(v_topics,"\r\n","<br>") %>
            </td>    
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>���ο���</strong></td>
            <td width="30%" class="table_02_1">
                <select name="p_permittedStatus">
                    <option value="01" <% if(v_permittedStatus.equals("01")){ %> selected <%}%>>����</option>
                    <option value="02" <% if(v_permittedStatus.equals("02")){ %> selected <%}%>>���</option>
                </select>
            </td>
            <td width="15%" class="table_title"><strong><%=v_permit_value%></strong></td>
            <td width="30%" class="table_02_1"><%=v_data_value%></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>�źλ���</strong></td>
            <td colspan="3" class="table_02_2">
                <input name="p_rejectedReason" type="text" class="input" size="80" value="<%=v_rejectedReason%>"> 
            </td>
          </tr>
        </table>
        <!----------------- ����������ȸ �� ----------------->
        <!----------------- total ���� ----------------->
        <br>
        <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="right" class="ms"><a href="javascript:permit();"><img src="/images/admin/button/btn_checkok.gif"  border="0"></a></td>
            <td width="1%" align="center" class="ms">&nbsp;</td>
            <td align="left" class="ms"><a href="javascript:cancel();"><img src="/images/admin/button/btn_cancel.gif"  border="0"></a></td>
          </tr>
        </table>
      <!----------------- total �� ----------------->     
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>         
</table>
</form>
</body>
</html>
