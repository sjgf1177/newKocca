<%
//**********************************************************
//  1. ��      ��: ������������������
//  2. ���α׷���: za_SubjGong_L.jsp
//  3. ��      ��: ���ð��������� ���� ����Ʈ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 23
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    
    int v_tabseq          = box.getInt("p_tabseq");

    int     v_pageno   = box.getInt("p_pageno");
    int     v_pagesize = box.getInt("p_pagesize");

    //2009.10.26 �������� �߰�
    if (v_pageno == 0)  v_pageno = 1;
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));

    //2009.10.27 �������� ���ڵ�� �߰�
    if (v_pagesize == 0)  v_pagesize = 10;
    
    int     v_totalrowcount =  0;
    
    String  v_searchtext  = box.getString("p_searchtext");
    String  v_search      = box.getString("p_search");

    int     v_seq       = 0;            // �Ϸù�ȣ
    int     v_cnt       = 0;            // ��ȸ��

    String  v_type      = "";           // ���� �з� �ڵ�(A1 ���� ����, B1 ��� ����)
    String  v_typenm    = "";           // ���� �з� �ڵ� �̸�
    String  v_content   = "";           // ��� ����
    String  v_startdate = "";           // ������
    String  v_enddate   = "";           // ������
    String  v_month     = "";           // ���
    String  v_ldate     = "";           // ���� ������
    String  v_userid    = "";           // �ۼ��� ���̵�
    String  v_usernm    = "";           // �ۼ��� �̸�
    String  v_flagYn    = "";           // ���� ����
    String  v_date      = "";           // ���⼳���� ǥ��
    
    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
    
    int     i = 0;
    
    ArrayList list    = (ArrayList)request.getAttribute("selectList");       // ��������Ʈ
    
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--

    function go(index) {
        document.form1.p_pageno.value = index;
        document.form1.action = "/servlet/controller.homepage.WelcomeMessageAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }
    function goPage(pageNum) {
        document.form1.p_pageno.value = pageNum;
        document.form1.action = "/servlet/controller.homepage.WelcomeMessageAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }
    
    function whenSelection(p_action) {
        document.form1.p_action.value = "go";
        document.form1.p_process.value = "selectList";
        document.form1.action = "/servlet/controller.homepage.WelcomeMessageAdminServlet";
        document.form1.submit();
    }

    // ���ð������
    function insert() {
        document.form1.action = "/servlet/controller.homepage.WelcomeMessageAdminServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }

    // �󼼺���
    function view(seq) {
        document.form1.action = "/servlet/controller.homepage.WelcomeMessageAdminServlet";
        document.form1.p_seq.value      = seq;
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

function whenOrder(column) {
    if (document.form1.p_orderType.value == " asc") {
        document.form1.p_orderType.value = " desc";
    } else {
        document.form1.p_orderType.value = " asc";
    }

    document.form1.p_orderColumn.value = column;
    whenSelection("go");
}

function search() {
  
  document.form1.action = "/servlet/controller.homepage.WelcomeMessageAdminServlet";
  document.form1.p_process.value = "selectList";
  document.form1.p_action.value = "go";
  document.form1.submit();
}

function pagesize(pageSize) {
    document.form1.target = "_self";
    document.form1.p_pageno.value = 1;
    document.form1.p_pagesize.value = pageSize;
    document.form1.action = '/servlet/controller.homepage.WelcomeMessageAdminServlet';
    document.form1.p_process.value = "selectList";
    document.form1.submit();
}
-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
    <form name="form1" method="post" action="">
    <input type="hidden" name="p_process" >
    <input type="hidden" name="p_action">
    <input type="hidden" name="p_pagesize" value="<%=v_pagesize%>">
    <input type="hidden" name="p_pageno"   value="<%=v_pageno %>">
    <input type="hidden" name="p_tabseq"   value=<%=v_tabseq %>>
    <input type="hidden" name="p_seq" value=>
    
    
    <input type="hidden" name="p_orderColumn">
    <input type="hidden" name="p_orderType" value="<%=v_orderType%>">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/portal/s.1_13.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->
      <br>
        <!----------------- form ���� ----------------->
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="870" align="right">
              ���� : 
              <input name="p_searchtext" type="text" class="input" value="<%=v_searchtext%>">
              <input type="hidden" name="p_search" value='content' >
            </td>
            <td width="100" align="right" valign="middle"> <a href='javascript:search()'><img src="/images/admin/button/btn_inquiry.gif" border="0"></a>
              <a href='javascript:insert()'><img src="/images/admin/button/btn_add.gif" border="0"></a>
            </td>
          </tr>
          <tr>
            <td height="3"></td>
          </tr>
        </table>
        <!----------------- form �� ----------------->


        <!----------------- �������װ��� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td class="table_top_line" colspan="4" ></td>
          </tr>
          <tr> 
            <td class="table_title" width="5%" height="25"><b>NO</b></td>
            <td class="table_title">�����</td>
            <td class="table_title" width="10%">��������</td>
            <td class="table_title" width="16%">���� ������</td>
            
          </tr>

<%
            for(i = 0; i < list.size(); i++) {
                DataBox dbox = (DataBox)list.get(i);

                v_seq           = dbox.getInt("d_seq");
                v_content       = dbox.getString("d_content");
                v_type          = dbox.getString("d_type");
                v_ldate         = dbox.getString("d_ldate");
                v_userid        = dbox.getString("d_userid");
                v_usernm        = dbox.getString("d_name");
                v_flagYn        = dbox.getString("d_flagyn");
                v_startdate     = dbox.getString("d_startdate");
                v_enddate       = dbox.getString("d_enddate");
                v_month         = dbox.getString("d_month");
                System.out.println("Ÿ�� : " + v_type);
                System.out.println("v_startdate : " + v_startdate);
                System.out.println("v_enddate : " + v_enddate);
                System.out.println("v_month : " + v_month);
                if(v_type.equals("A1")){
                	v_date      = FormatDate.getFormatDate(v_startdate,"yyyy/MM/dd") + " ~ " + FormatDate.getFormatDate(v_enddate,"yyyy/MM/dd");
                } else if(v_type.equals("B1")){
                	v_date      = v_month.substring(0, 4) + "�� "+ v_month.substring(4)+"��";
                }
                
                v_dispnum   = dbox.getInt("d_dispnum");
                v_totalpage = dbox.getInt("d_totalpage");
                v_totalrowcount = dbox.getInt("d_totalrowcount");
%>

          <tr> 
            <td class="table_01" height="25"><%= v_dispnum%></td>
            <td class="table_02_2"><a href="javascript:view('<%= v_seq%>')"><%= v_content %></a></td>
            <td class="table_02_1"><%= v_flagYn.equals("Y") ? "���缳��" : "--" %> </td>
            <td class="table_02_1"><%= v_date %> </td>
          </tr>

<%
            }

          if(list.size() == 0){ %>
              <tr>
                <td class="table_02_1" colspan="6">��ϵ� ������ �����ϴ�</td>
              </tr>
<%  } %>
        </table>
        <!----------------- �������װ��� �� ----------------->
        <br>
        <!----------------- total ���� ----------------->
        <br>
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" valign="absmiddle">
              <%= PageUtil.printPageSizeList(v_totalpage, v_pageno, row, v_pagesize, v_totalrowcount) %>
            </td>
          </tr>
        </table>
        <!----------------- total �� ----------------->
        <br>
     </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
