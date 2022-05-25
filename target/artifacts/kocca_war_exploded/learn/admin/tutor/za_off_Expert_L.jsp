<%
//**********************************************************
//  1. ��      ��: Notice
//  2. ���α׷��� : za_Notice_L.jsp
//  3. ��      ��: �������� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 13
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.system.*" %>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%

    RequestBox box      = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");

    //String  ss_grcode   = box.getString("s_grcode");            //�����׷�
    String  s_gadmin    = box.getSession("gadmin");
    String  v_gadmin    = StringManager.substring(s_gadmin, 0, 1);
    String  isAll       = !v_gadmin.equals("A") ? "false" : "true";
    //String  v_selGroup  = box.getStringDefault("p_selGroup", "ALL");

    //int v_tabseq          = box.getInt("p_tabseq");
    
    int     v_pageno   = box.getInt("p_pageno");
    int     v_pagesize = box.getInt("p_pagesize");
    int     v_totalrowcount =  0;
    
    String  v_searchtext  = box.getString("p_searchtext");
    String  v_search      = box.getString("p_search");


    int    v_seq     = 0;              // �Ϸù�ȣ
    int    v_cnt     = 0;              // ��ȸ��

    String v_gubun              = "";   // ��Ϻо� �ڵ�
    String v_gubunnm            = "";   // ��Ϻо� �ڵ� �̸�
    String v_name               = "";   // �̸�
    String v_comp               = "";   // �Ҽ� ȸ��
    String v_dept               = "";   // �Ҽ� �μ�
    String v_mobile_phone          = "";   // �ڵ��� ��ȣ
    String v_email              = "";   // �̸���
    String v_approve_yn         = "";   // ���� ����
    String v_reg_yn             = "";   // ��� ����
    String v_indate             = "";   // �����

    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������

    ArrayList list     = (ArrayList)request.getAttribute("selectList");
    
%>
<html>
<head>
<title>�̺�Ʈ ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.tutor.OffExpertAdminServlet";
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }
    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.tutor.OffExpertAdminServlet";
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }

    function selectComp() {
        document.form1.p_pageno.value = 1;
        document.form1.action = "/servlet/controller.tutor.OffExpertAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

    function view(seq, gubun) {
        document.form1.action = "/servlet/controller.tutor.OffExpertAdminServlet";
        document.form1.p_seq.value = seq;
        document.form1.p_gubun.value = gubun;
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    function search() {
        <%if (!StringManager.substring(box.getSession("gadmin"),0,1).equals("A")) { %>
        whenSelection();
        <% } %>
        document.form1.action = "/servlet/controller.tutor.OffExpertAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

// ���� �˻�
function whenSelection() {
    var ff = document.form1;
        //�����׷�����ڴ� �����׷��� �����ؾ���
        <%if (!StringManager.substring(box.getSession("gadmin"),0,1).equals("A")) { %>
          if (ff.s_grcode.value == 'ALL' || ff.s_grcode.value == '----' || ff.s_grcode.value == '' ) {
                alert("�����׷��� �����ϼ���.");
                return ;
            }
        <% } %>
        //ff.p_selGroup.value = ff.s_grcode.value;

        document.form1.action = "/servlet/controller.tutor.OffExpertAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
}
<%//if (!StringManager.substring(box.getSession("gadmin"),0,1).equals("A") && box.getString("s_grcode").equals("")) { %>
//location.href = "/servlet/controller.tutor.OffExpertAdminServlet?p_process=select&s_grcode=<%=box.getSession("tem_grcode")%>&p_selGroup=<%=box.getSession("tem_grcode")%>&&p_search=adtitle";
<%// } %>

    function pagesize(pageSize) {
        document.form1.target = "_self";
        document.form1.p_pageno.value = 1;
        document.form1.p_pagesize.value = pageSize;
        document.form1.action = '/servlet/controller.tutor.OffExpertAdminServlet';
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "get">
    <input type = "hidden" name = "p_process"    value = "<%= v_process %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_pagesize"   value = "<%=v_pagesize%>">
    <input type = "hidden" name = "p_seq"        value = "">
    <input type = "hidden" name = "p_gubun"      value = "">


<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
      <td align="center" valign="top">
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr>
            <td><img src="/images/admin/homepage/s.1_002.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <!----------------- title �� ----------------->

        <br>
        <!----------------- form ���� ----------------->
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="250"><!-- 
              <%= !v_gadmin.equals("A") ? "<font color=\"red\">��</font>":"" %>
                                     �����׷� <kocca_select:select name="s_grcode" sqlNum="course.0001"  param=" "
                    onChange="whenSelection('go')" attr=" " selectedValue="<%// ss_grcode %>" isLoad="true" all="<%= isAll %>" />
              <% //�����׷� �����ڴ� ALL �˻��� �ȵǰ� ���� %>
              <input type="hidden" name="s_grseq" value="ALL">
            
            <input type="hidden" name="s_grseq" value="ALL">  -->
            </td>
            <td width="670" align="right">
              <select name="p_search" >
                <option value='name'     <% if (v_search.equals("name")) out.println("selected"); %>>�̸�</option>
                <option value='comp' <% if (v_search.equals("comp")) out.println("selected"); %>>ȸ��</option>
              </select>
              <input name="p_searchtext" type="text" class="input" value="<%=v_searchtext%>">
            </td>

            <td width="100" align="right" valign="middle"> <a href='javascript:search()'><img src="/images/admin/button/btn_inquiry.gif" border="0"></a>
            </td>
          </tr>
          <tr>
            <td height="3"></td>
          </tr>
        </table>
        <!----------------- form �� ----------------->


        <!----------------- �������� ���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="9" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title" width="5%" height="25"><b>NO</b></td>
            <td class="table_title" width="10%" height="25"><b>�з�</b></td>
            <td class="table_title"><b>�̸�</b></td>
            <td class="table_title" width="15%"><b>ȸ���</b></td>
            <td class="table_title" width="15%"><b>�μ���</b></td>
            <td class="table_title" width="15%"><b>��ȭ��ȣ</b></td>
            <td class="table_title" width="10%" height="25"><b>���ο���</b></td>
            <td class="table_title" width="10%" ><b>�����Ͽ���</b></td>
            <td class="table_title" width="10%" ><b>�����</b></td>
          </tr>
          <!-- ��ü�������� �� -->

<%

            for(int i = 0; i < list.size(); i++) {

                DataBox dbox = (DataBox)list.get(i);

                v_seq               = dbox.getInt("d_seq");            
                v_gubun             = dbox.getString("d_gubun");           
                v_gubunnm           = dbox.getString("d_gubunnm");         
                v_name              = dbox.getString("d_name");            
                v_comp              = dbox.getString("d_comp");            
                v_dept              = dbox.getString("d_dept");            
                v_mobile_phone         = dbox.getString("d_mobile_phone");       
                v_email             = dbox.getString("d_email");           
                v_approve_yn        = dbox.getString("d_approve_yn");      
                v_reg_yn            = dbox.getString("d_reg_yn");          
                v_indate            = dbox.getString("d_indate"); 

                v_dispnum   = dbox.getInt("d_dispnum");
                v_totalpage = dbox.getInt("d_totalpage");
                v_totalrowcount = dbox.getInt("d_totalrowcount");

                if(v_approve_yn.equals("A")){
                	v_approve_yn = "��û���";
                }
                else if(v_approve_yn.equals("Y")){
                	v_approve_yn = "����";
                }
                else if(v_approve_yn.equals("N")){
                	v_approve_yn = "�̽���";
                }
                
                if(v_reg_yn.equals("Y")){
                	v_reg_yn = "���";
                } else if(v_reg_yn.equals("N")){
                	v_reg_yn = "�̵��";
                } 
%>

          <tr>
            <td class="table_01" ><%=v_dispnum %></td>
            <td class="table_02_1"><%=v_gubunnm%></td>
            <td class="table_02_1"><a href="javascript:view('<%=v_seq%>', '<%=v_gubun %>')"><%=v_name%></a></td>
            <td class="table_02_1"><%=v_comp%></td>
            <td class="table_02_1" ><%=v_dept%></td>
            <td class="table_02_1" ><%=v_mobile_phone%></td>
            <td class="table_02_1" ><%=v_approve_yn%></td>
            <td class="table_02_1"><%=v_reg_yn%></td>
            <td class="table_02_1"><%=FormatDate.getFormatDate(v_indate,"yyyy/MM/dd")%></td>
          </tr>
<%
        }
%>

        </table>
        <!----------------- �������� ���� �� ----------------->

        <!----------------- total ���� ----------------->
        <br>
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" valign="absmiddle">
              <%= PageUtil.printPageSizeList(v_totalpage, v_pageno, 0, v_pagesize, v_totalrowcount) %>
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
