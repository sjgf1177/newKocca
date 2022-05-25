 <%
//**********************************************************
//  1. ��      ��: ��꼭 �������� ����
//  2. ���α׷���: za_TaxbillAdmin_U
//  3. ��      ��: ��꼭 �������� ����(�˾�)
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.20
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");

    String  v_searchtext  = box.getString("p_searchtext");
    String  v_search      = box.getString("p_search");

    String  ss_grcode			= box.getString("s_grcode");		//�����׷�
    String  ss_gyear			= box.getString("s_gyear");			//�⵵
    String  ss_grseq			= box.getString("s_grseq");			//��������
    String  ss_grseqnm			= box.getString("s_grseqnm");		//����������
    String  ss_mastercd			= box.getString("s_mastercd");		//����&�ڽ�
    String  ss_upperclass		= box.getString("s_upperclass");	//������з�
    String  ss_middleclass		= box.getString("s_middleclass");	//�����ߺз�
    String  ss_lowerclass		= box.getString("s_lowerclass");	//�����Һз�
    String  ss_paystatus		= box.getString("s_paystatus");	    //��������
    String  ss_startdate		= box.getString("s_startdate");		//�Ⱓ��ȸ ����
    String  ss_enddate			= box.getString("s_enddate");		//�Ⱓ��ȸ ��
	
    String  v_action    = box.getString("p_action");

	String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
	String  v_orderColumn  = box.getString("p_orderColumn"); //����Į��
	String  v_dispnum	= "";
    
    
    int     v_pageno    = box.getInt("p_pageno")== 0 ? 1 : box.getInt("p_pageno");
    int     v_pagesize  = box.getInt("p_pagesize")== 0 ? 10 : box.getInt("p_pagesize");
    
	String  v_grcode	 = "";
	String  v_grcodenm	 = "";
	String  v_gyear		 = "";
	String  v_grseq		 = "";
	String  v_grseqnm	 = "";
	String  v_tid   	 = "";;
	String  v_goodname	 = "";
	int     v_studentcnt = 0;
	double  v_price	     = 0;
	String  v_note	     = "";
	String  v_pgauthdate = "";
	String  v_pgauthtime = "";
	String  v_name	     = "";
	String  v_buyeremail = "";
	String  v_buyertel	 = "";
	String  v_paystatus	 = "";
	String  v_cancelyn   = "";
	String  v_canceldate = "";
	String  v_canceltime = "";
	String  v_admin_note = "";

	DataBox dbox = (DataBox)request.getAttribute("taxbillInfo");
    if (dbox != null) {
		v_grcode	 = dbox.getString("d_grcode");
		v_grcodenm	 = dbox.getString("d_grcodenm");
		v_gyear		 = dbox.getString("d_gyear");
		v_grseq		 = dbox.getString("d_grseq");
		v_grseqnm	 = dbox.getString("d_grseqnm");
		v_tid   	 = dbox.getString("d_tid");
		v_goodname	 = dbox.getString("d_goodname");
		v_studentcnt = dbox.getInt("d_studentcnt");
		v_price	     = dbox.getDouble("d_price");
		v_note	     = dbox.getString("d_note");
		v_pgauthdate = dbox.getString("d_pgauthdate");
		v_pgauthtime = dbox.getString("d_pgauthtime");
		v_name	     = dbox.getString("d_name");
		v_buyeremail = dbox.getString("d_buyeremail");
		v_buyertel	 = dbox.getString("d_buyertel");
		v_paystatus	 = dbox.getString("d_paystatus");
		v_cancelyn	 = dbox.getString("d_cancelyn");
		v_canceldate = dbox.getString("d_canceldate");
		v_canceltime = dbox.getString("d_canceltime");
		
		if ("N".equals(v_paystatus)) {
			v_admin_note = "";
		} else if ("Y".equals(v_paystatus)) {
			v_admin_note = "�����ڿ� ���� ���� Ȯ�νð�(" + FormatDate.getFormatDate(v_pgauthdate+v_pgauthtime,"yyyy-MM-dd HH:mm ss") + ")";
		} else if ("R".equals(v_paystatus)) {
			v_admin_note = "�����ڿ� ���� ȯ�ҽð�(" + FormatDate.getFormatDate(v_canceldate+v_canceltime,"yyyy-MM-dd HH:mm ss") + ")";
		}
    }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<SCRIPT LANGUAGE = "JAVASCRIPT" SRC = "/script/hhi_lib.js"></SCRIPT>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<Script language="javascript">
//��꼭 ���
function UpdateTax() {
    window.self.name = "winSelectView";
    document.form1.target = "winSelectView";
    document.form1.action = "/servlet/controller.polity.TaxbillAdminServlet";
    document.form1.p_process.value = "taxUpdate";
    document.form1.submit();
}
</Script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<table width="600" border="0" cellpadding="0" cellspacing="10" bgcolor="#f7f7f7">
  <tr>
    <td align="left">
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
          <tr>
            <td align="center" bgcolor="#FFFFFF">
			 <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/portal/s.1_admin01.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
            <br>

<form name="form1" method = "post">
  <input type="hidden" name="p_process" value="<%=v_process%>">
  <input type="hidden" name="p_mode1"   value = "name">
  <input type="hidden" name="p_mode2"   value = "">
  <input type="hidden" name="p_grcode"  value = "<%= v_grcode %>">
  <input type="hidden" name="p_gyear"   value = "<%= v_gyear %>">
  <input type="hidden" name="p_grseq"   value = "<%= v_grseq %>">
  <input type="hidden" name="p_tid"   value = "<%= v_tid %>">

  <input type="hidden" name="p_orderColumn"  value="<%=v_orderColumn%>">
  <input type="hidden" name="p_orderType" value="<%=v_orderType%>">
  <input type="hidden" name="p_pageno" value="<%=v_pageno%>">
  <input type="hidden" name="p_pagesize"  value = "<%=v_pagesize%>">

  <input type="hidden" name="p_grseqnm"    value="<%=ss_grseqnm%>">
  <input type="hidden" name="p_uclass"     value="<%=ss_upperclass%>">
  <input type="hidden" name="p_mclass"     value="<%=ss_middleclass%>">
  <input type="hidden" name="p_lclass"     value="<%=ss_lowerclass%>">


  <input type="hidden" name="s_grcode"      value = "<%= ss_grcode %>">
  <input type="hidden" name="s_gyear"       value = "<%= ss_gyear %>">
  <input type="hidden" name="s_grseq"       value = "<%= ss_grseq %>">
  <input type="hidden" name="s_grseqnm"     value="<%= ss_grseqnm %>">
  <input type="hidden" name="s_upperclass"  value="<%= ss_upperclass %>">
  <input type="hidden" name="s_middleclass" value="<%= ss_middleclass %>">
  <input type="hidden" name="s_lowerclass"  value="<%=ss_lowerclass%>">
  <input type="hidden" name="s_paystatus"   value="<%=ss_paystatus%>">
  <input type="hidden" name="s_startdate"   value="<%=ss_startdate%>">
  <input type="hidden" name="s_enddate"     value="<%=ss_enddate%>">
  <input type="hidden" name="p_action"      value="go">
  <input type="hidden" name="p_searchtext"  value="<%= v_searchtext %>">
  <input type="hidden" name="p_search"      value="<%= v_search %>">
  
        <table class="box_table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title" width="30%"><b>������</b></td>
            <td class="table_02_2" ><%= v_goodname %></td>
          </tr>
          <tr>
            <td class="table_title" ><b>�����ݾ�</b></td>
            <td class="table_02_2" ><%= new java.text.DecimalFormat("###,###,##0").format(v_price) %>��</td>
          </tr>
          <tr>
            <td class="table_title" ><b>���</b></td>
            <td class="table_02_2" ><%= v_note %></td>
          </tr>
          <tr>
            <td class="table_title" ><b>�������</b></td>
            <td class="table_02_2" >��꼭</td>
          </tr>
          <tr>
            <td class="table_title" ><b>������</b></td>
            <td class="table_02_2" ><%= !"".equals(v_pgauthdate) ? FormatDate.getFormatDate(v_pgauthdate,"yyyy/MM/dd") : "" %></td>
          </tr>
          <tr>
            <td class="table_title" ><b>�̸���</b></td>
            <td class="table_02_2" ><%= v_buyeremail %></td>
          </tr>
          <tr>
            <td class="table_title" ><b>��ȭ��ȣ</b></td>
            <td class="table_02_2" ><%= v_buyertel %></td>
          </tr>
          <tr>
            <td class="table_title" ><b>��������</b></td>
            <td class="table_02_2" >
              <select name="p_paystatus">
                <option value="N" <%= "N".equals(v_paystatus) ? " SELECTED" : "" %>>�̰���</option>
                <option value="Y" <%= "Y".equals(v_paystatus) ? " SELECTED" : "" %>>�����Ϸ�</option>
                <option value="R" <%= "R".equals(v_paystatus) ? " SELECTED" : "" %>>ȯ�ҿϷ�</option>
              </select>
            </td>
          </tr>
          <tr>
            <td class="table_title" ><b>�����ڸ޸�</b></td>
            <td class="table_02_2" ><%= v_admin_note %></td>
          </tr>
        </table>

        <!----------------- �ݱ� ��ư ���� ----------------->
        <table cellspacing="0" cellpadding="0" >
          <tr>
            <td align="right" style="padding-top=10"><a href="javascript:UpdateTax()"><img src="/images/admin/button/btn_apply.gif" border="0"></a></td>
  		  <td width=8></td>
            <td align="right" style="padding-top=10"><a href="javascript:self.close()"><img src="/images/admin/button/btn_close.gif" border="0"></a></td>
          </tr>
        </table>
        <!----------------- �ݱ� ��ư �� ----------------->
        <br>




          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
