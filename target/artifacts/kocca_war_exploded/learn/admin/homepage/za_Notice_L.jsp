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
<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="com.credu.homepage.*" %>
<%@ page import="com.credu.library.*" %>
<%@ page import="com.credu.common.*" %>
<%@ page import="com.credu.course.*" %>
<%@ page import="com.credu.system.*" %>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />
<%

    NoticeAdminBean selectData = new NoticeAdminBean();

    RequestBox box      = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");

    String  ss_grcode   = box.getString("s_grcode");            //�����׷�
    String  s_gadmin    = box.getSession("gadmin");
    String  v_gadmin    = StringManager.substring(s_gadmin, 0, 1);
    String  isAll       = !v_gadmin.equals("A") ? "false" : "true";
    String  v_selGroup  = box.getStringDefault("p_selGroup", "ALL");

    //out.println(v_selcomp);

    int v_tabseq          = box.getInt("p_tabseq");

    int     v_pageno   = box.getInt("p_pageno");
    int     v_pagesize = box.getInt("p_pagesize");


    String  v_searchtext  = box.getString("p_searchtext");
    String  v_search      = box.getString("p_search");


    int    v_seq     = 0;            // �Ϸù�ȣ
    int    v_cnt     = 0;            // ��ȸ��

    String v_adtitle   = "";           // ����
    String v_adcontent = "";           // ����
    String v_addate    = "";           // �����
    String v_adname    = "";            // �����
    String v_grcode    = "";              // �����׷�
    String v_grcodenm  = "";
    String v_filecnt   = "";
    String v_onoffgugun   = "";

    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
    int     v_totalrowcount =  0;

    ArrayList edugroup  = (ArrayList)request.getAttribute("selectGrcode");
    // ArrayList list1     = (ArrayList)request.getAttribute("selectList1");
    ArrayList list2     = (ArrayList)request.getAttribute("selectList2");

%>
<html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.homepage.NoticeAdminServlet";
         document.form1.p_process.value = "select";
         document.form1.submit();
    }
    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.homepage.NoticeAdminServlet";
         document.form1.p_process.value = "select";
         document.form1.submit();
    }

    function selectComp() {
        document.form1.p_pageno.value = 1;
        document.form1.action = "/servlet/controller.homepage.NoticeAdminServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }

    function view(seq) {
        document.form1.action = "/servlet/controller.homepage.NoticeAdminServlet";
        document.form1.p_seq.value = seq;
        document.form1.p_process.value = "selectView";
        document.form1.submit();
    }

    function insert() {
//        if (document.form1.p_comp.value=="ALL") {
//          alert("ȸ�縦 �������ּ���");
//          return;
//      }
        document.form1.action = "/servlet/controller.homepage.NoticeAdminServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.method = "post";
        document.form1.submit();
    }

    function search() {
        <%if (!StringManager.substring(box.getSession("gadmin"),0,1).equals("A")) { %>
        whenSelection();
        <% } %>
        
        document.form1.action = "/servlet/controller.homepage.NoticeAdminServlet";
        document.form1.p_process.value = "select";
        document.form1.method = "post";
        document.form1.submit();
    }

// ���� �˻�
function whenSelection() {
    var ff = document.form1;
        //�����׷�����ڴ� �����׷��� �����ؾ���
        <%if (!StringManager.substring(box.getSession("gadmin"),0,1).equals("A")) { %>
          if (ff.s_grcode.value == 'ALL' || ff.s_grcode.value == '----' || ff.s_grcode.value == '' ) {
                alert("�����׷��� �����ϼ���.");
                return;
            }
        <% } %>
        //ff.p_selGroup.value = ff.s_grcode.value;

        document.form1.action = "/servlet/controller.homepage.NoticeAdminServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
}
<%if (!StringManager.substring(box.getSession("gadmin"),0,1).equals("A") && box.getString("s_grcode").equals("")) { %>
location.href = "/servlet/controller.homepage.NoticeAdminServlet?p_process=select&s_grcode=<%=box.getSession("tem_grcode")%>&p_selGroup=<%=box.getSession("tem_grcode")%>&p_tabseq=<%=v_tabseq %>&&p_search=adtitle";
<% } %>

    function pagesize(pageSize) {
        document.form1.target = "_self";
        document.form1.p_pageno.value = 1;
        document.form1.p_pagesize.value = pageSize;
        document.form1.action = '/servlet/controller.homepage.NoticeAdminServlet';
        document.form1.p_process.value = "select";
        document.form1.submit();
    }
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "get">
    <input type = "hidden" name = "p_process"   value = "<%= v_process %>">
    <input type = "hidden" name = "p_pageno"    value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_pagesize"  value = "<%=v_pagesize%>">
    <input type = "hidden" name = "p_tabseq"    value = "<%=v_tabseq %>">
    <input type = "hidden" name = "p_seq"       value = "">


<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
      <td align="center" valign="top">
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr>
            <td><img src="/images/admin/homepage/homepage_title1.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <!----------------- title �� ----------------->

        <br>
        <!----------------- form ���� ----------------->
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="250">
              <!-- �����׷� ���� -->
              <%= !v_gadmin.equals("A") ? "<font color=\"red\">��</font>":"" %>
                                     �����׷� <kocca_select:select name="s_grcode" sqlNum="course.0001"  param=" "
                    onChange="whenSelection('go')" attr=" " selectedValue="<%= ss_grcode %>" isLoad="true" all="<%= isAll %>" />
              <% //�����׷� �����ڴ� ALL �˻��� �ȵǰ� ���� %>
              <input type="hidden" name="s_grseq" value="ALL">
            <!-- �����׷� ���� -->
<input type="hidden" name="s_grseq" value="ALL">
            </td>
            <td width="670" align="right">
              <select name="p_search" >
                <option value='adtitle'     <% if (v_search.equals("adtitle")) out.println("selected"); %>>����</option>
                <option value='adcontents' <% if (v_search.equals("adcontents")) out.println("selected"); %>>����</option>
              </select>
              <input name="p_searchtext" type="text" class="input" value="<%=v_searchtext%>">
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


        <!----------------- �������� ���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="10" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title" width="5%" height="25"><b>NO</b></td>
            <td class="table_title" width="8%" height="25"><b>�������� ����</b></td>
            <td class="table_title" ><b>����</b></td>
            <td class="table_title" width="8%"><b>�ۼ���</b></td>
            <td class="table_title" width="5%"><b>��/����</b></td>
            <td class="table_title" width="12%"><b>�����</b></td>
            <td class="table_title" width="8%"><b>��뿩��</b></td>
            <td class="table_title" width="7%" height="25"><b>�˾�����</b></td>
            <!--td class="table_title" width="5%" height="25"><b>gubun</b></td-->
            <td class="table_title" width="8%" height="25"><b>�α��ο���</b></td>
            <td class="table_title" width="8%" ><b>��ȸ��</b></td>
          </tr>
          <!-- ��ü�������� ���� -->
<%
            String v_gubun     = "";
            String v_useyn     = "";
            String v_popup     = "";
            String v_loginyn   = "";

            for(int i = 0; i < list2.size(); i++) {

                //NoticeData data2   = (NoticeData)list2.get(i);

                DataBox dbox1 = (DataBox)list2.get(i);

                v_seq      = dbox1.getInt("d_seq");
                v_cnt      = dbox1.getInt("d_cnt");
                v_adtitle  = dbox1.getString("d_adtitle");
                v_addate   = dbox1.getString("d_addate");
                v_adname   = dbox1.getString("d_adname");
                v_gubun    = dbox1.getString("d_gubun");
                v_useyn    = dbox1.getString("d_useyn");
                v_loginyn  = dbox1.getString("d_loginyn");
                v_popup    = dbox1.getString("d_popup");
                v_filecnt  = dbox1.getString("d_filecnt");
                v_addate   = FormatDate.getFormatDate(v_addate,"yyyy/MM/dd");

                v_dispnum   = dbox1.getInt("d_dispnum");
                v_totalpage = dbox1.getInt("d_totalpage");
                v_totalrowcount = dbox1.getInt("d_totalrowcount");

                if(v_loginyn.equals("Y")){
                  v_loginyn = "�α�����";
                }
                else if(v_loginyn.equals("Y")){
                  v_loginyn = "�α�����";
                }
                else if(v_loginyn.equals("AL")){
                  v_loginyn = "��ü";
                }

                v_onoffgugun    = dbox1.getString("d_onoffgubun");
                if( v_onoffgugun.equals("C") ) {
                    v_onoffgugun = "�¶���";
                } else if( v_onoffgugun.equals("S") ) {
                    v_onoffgugun = "��������";
                } else {
                    v_onoffgugun = "";
                }
%>

          <tr>
            <td class="table_01" ><%=v_dispnum%></td>
            <td class="table_02_1"><%= (v_gubun.equals("N") ? "����" : (v_gubun.equals("G") ? "�ȳ�" : "����") ) %></td>
            <td class="table_02_2"><a href="javascript:view('<%=v_seq%>', '<%=v_filecnt%>')"><%=v_adtitle%></a></td>
            <td class="table_02_1"><%=v_adname%></td>
            <td class="table_02_1"><%=v_onoffgugun%></td>
            <td class="table_02_1"><%=v_addate%></td>
            <td class="table_02_1" ><%=v_useyn%></td>
            <td class="table_02_1" ><%=v_popup%></td>
            <td class="table_02_1" ><%=v_loginyn%></td>
            <td class="table_02_1"><%=v_cnt%></td>
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
