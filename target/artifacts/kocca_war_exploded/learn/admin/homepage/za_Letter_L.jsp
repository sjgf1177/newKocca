<%
//**********************************************************
//  1. ��      ��: Letter
//  2. ���α׷��� : za_Letter_L.jsp
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

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%

    LetterAdminBean selectData = new LetterAdminBean();

    RequestBox box    = (RequestBox)request.getAttribute("requestbox");
    String  v_process = box.getString("p_process");

	String  s_gadmin			= box.getSession("gadmin");
    String  v_selGroup = box.getStringDefault("p_selGroup", "ALL");

    //out.println(v_selcomp);

    int v_tabseq          = box.getInt("p_tabseq");
    int     v_pageno   = box.getInt("p_pageno");
    int     v_pagesize = box.getInt("p_pagesize");
    
    String  v_searchtext  = box.getString("p_searchtext");
    String  v_search      = box.getString("p_search");
    
    int     v_totalrowcount =  0;
    int     v_dispnum       = 0;           // �ѰԽù���
    int     v_totalpage     = 0;           // �Խù�����������


    int    v_seq     = 0;            // �Ϸù�ȣ
    int    v_cnt     = 0;            // ��ȸ��

    String v_adtitle   = "";           // ����
    String v_adcontent = "";           // ����
    String v_addate    = "";           // �����
    String v_adname    = "";           // �����
    String v_grcode    = ""; 		   // �����׷�
	String v_grcodenm  = "";
    String v_filecnt   = "";

	ArrayList edugroup = (ArrayList)request.getAttribute("selectGrcode");
    ArrayList list1 = (ArrayList)request.getAttribute("selectList1");
    ArrayList list2 = (ArrayList)request.getAttribute("selectList2");

%>
<html>
<head>
<title>eIBIs</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.homepage.LetterAdminServlet";
         document.form1.p_process.value = "select";
         document.form1.submit();
    }
    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.homepage.LetterAdminServlet";
         document.form1.p_process.value = "select";
         document.form1.submit();
    }

    function selectComp() {
        document.form1.p_pageno.value = 1;
        document.form1.action = "/servlet/controller.homepage.LetterAdminServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }

    function view(seq, filecnt) {
        document.form1.p_upfilecnt.value = filecnt
        document.form1.action = "/servlet/controller.homepage.LetterAdminServlet";
        document.form1.p_seq.value = seq;
        document.form1.p_process.value = "selectView";
        document.form1.submit();
    }

    function insert() {
//        if (document.form1.p_comp.value=="ALL") {
//			alert("ȸ�縦 �������ּ���");
//			return;
//		}
        document.form1.action = "/servlet/controller.homepage.LetterAdminServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }

    function search() {
        document.form1.action = "/servlet/controller.homepage.LetterAdminServlet";
        document.form1.p_process.value = "select";
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
        ff.p_selGroup.value = ff.s_grcode.value;
}
<%if (!StringManager.substring(box.getSession("gadmin"),0,1).equals("A") && box.getString("s_grcode").equals("")) { %>
location.href = "/servlet/controller.homepage.LetterAdminServlet?p_process=select&s_grcode=<%=box.getSession("tem_grcode")%>&p_selGroup=<%=box.getSession("tem_grcode")%>&p_tabseq=<%=v_tabseq %>&&p_search=adtitle";
<% } %>
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
    <input type = "hidden" name = "p_process" value = "<%= v_process %>">
    <input type = "hidden" name = "p_pageno"  value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_tabseq"    value = "<%=v_tabseq %>">
    <input type = "hidden" name = "p_seq"     value = "">
    <input type = "hidden" name = "p_upfilecnt"  value = "">


<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
      <td align="center" valign="top">
        <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
            <td><img src="/images/admin/homepage/tit_news.gif"></td>
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
                                               <% //�����׷� �����ڴ� ALL �˻��� �ȵǰ� ���� %>
                                              <%if (!StringManager.substring(box.getSession("gadmin"),0,1).equals("A")) { %>
                                                <font color="red">��</font>  <%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
                                              <% } else { %>
                                                  <%= SelectEduBean.getGrcode(box, true, true)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
                                              <% } %>
                                             <input type="hidden" name="p_selGroup">
                                            <!-- �����׷� ���� -->
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
            <td colspan="9" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title" width="5%" height="25"><b>NO</b></td>
            <td class="table_title" ><b>����</b></td>
            <td class="table_title" width="8%"><b>�ۼ���</b></td>
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

            for(int i = 0; i < list1.size(); i++) {

                //NoticeData data1   = (NoticeData)list1.get(i);
                //
                //v_seq      = data1.getSeq();
                //v_cnt      = data1.getCnt();
                //v_adtitle  = data1.getAdtitle();
                //v_addate   = data1.getAddate();
                //v_addate   = FormatDate.getFormatDate(v_addate,"yyyy/MM/dd");
                //v_adname   = data1.getAdname();

                DataBox dbox = (DataBox)list1.get(i);
                v_seq      = dbox.getInt("d_seq");
                v_cnt      = dbox.getInt("d_cnt");
                v_adtitle  = dbox.getString("d_adtitle");
                v_addate   = dbox.getString("d_addate");
                v_adname   = dbox.getString("d_adname");
                v_gubun    = dbox.getString("d_gubun");
                v_useyn    = dbox.getString("d_useyn");
                v_loginyn  = dbox.getString("d_loginyn");
                v_filecnt  = dbox.getString("d_filecnt");
                v_popup    = dbox.getString("d_popup");
                v_addate   = FormatDate.getFormatDate(v_addate,"yyyy/MM/dd");

                if(v_loginyn.equals("Y")){
                  v_loginyn = "�α�����";
                }
                else if(v_loginyn.equals("Y")){
                  v_loginyn = "�α�����";
                }
                else if(v_loginyn.equals("AL")){
                  v_loginyn = "��ü";
                }


%>

          <tr>
            <td class="table_01" >*</td>
            <td class="table_02_6"><a href="javascript:view('<%=v_seq%>', '<%=v_filecnt%>')"><%=v_adtitle%></a></td>
            <td class="table_02_5"><%=v_adname%></td>
            <td class="table_02_5"><%=v_addate%></td>
            <td class="table_02_5" ><%=v_useyn%></td>
            <td class="table_02_5" ><%=v_popup%></td>
            <!--td class="table_02_5" ><%=v_gubun%></td-->
            <td class="table_02_5" ><%=v_loginyn%></td>

            <td class="table_02_5"><%=v_cnt%></td>
          </tr>
<%
        }
%>
          <!-- ��ü�������� �� -->

<%


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
                v_totalrowcount = dbox1.getInt("d_totalrowcount");;

                if(v_loginyn.equals("Y")){
                  v_loginyn = "�α�����";
                }
                else if(v_loginyn.equals("Y")){
                  v_loginyn = "�α�����";
                }
                else if(v_loginyn.equals("AL")){
                  v_loginyn = "��ü";
                }
%>

          <tr>
            <td class="table_01" ><%=v_dispnum%></td>
            <td class="table_02_2"><a href="javascript:view('<%=v_seq%>', '<%=v_filecnt%>')"><%=v_adtitle%></a></td>
            <td class="table_02_1"><%=v_adname%></td>
            <td class="table_02_1"><%=v_addate%></td>
            <td class="table_02_1" ><%=v_useyn%></td>
            <td class="table_02_1" ><%=v_popup%></td>
            <!--td class="table_02_1" ><%=v_gubun%></td-->
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
