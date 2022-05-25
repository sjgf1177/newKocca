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
    
    String  v_selGubun    = box.getString("p_selGubun");
    String  v_selSeminarNm = box.getString("p_selSeminarNm");
    
    String  v_propstart = box.getString("p_propstart");
    String  v_propend   = box.getString("p_propend");
    
    int    v_seq     = 0;              // �Ϸù�ȣ
    int    v_cnt     = 0;              // ��ȸ��
    int    v_member  = 0;              // ��ũ�� �ο�

    String v_code      = "";
    String v_codenm    = "";
    String v_seminargubun     = "";
    String v_seminargubunnm   = "";            
    String v_seminarnm = "";           // ����
    String v_content   = "";           // ����
    String v_tname     = "";           // ��米����
    String v_indate    = "";           // �����
    String v_name      = "";           // �����
    String v_startdate = "";           // ��ũ�� ������
    String v_enddate   = "";           // ��ũ�� ������
    //String v_propstart = "";           // ��ũ�� ���� ������
    //String v_propend   = "";           // ��ũ�� ���� ������
    String v_passyn  = "";             // ������ ���� ����
    //String v_grcode    = "";           // �����׷�
    //String v_grcodenm  = "";
    //String v_filecnt   = "";

    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������

    //ArrayList list1     = (ArrayList)request.getAttribute("selectListSeminarType");
    //ArrayList list2     = (ArrayList)request.getAttribute("selectListSeminarName");
    ArrayList list3     = (ArrayList)request.getAttribute("selectList");
    
%>
<html>
<head>
<title>��ũ�� ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
$(document).ready(function(){
	$("#p_sdate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_edate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--
    function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.homepage.SeminarAdminServlet";
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }
    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.homepage.SeminarAdminServlet";
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }

    function selectComp() {
        document.form1.p_pageno.value = 1;
        document.form1.action = "/servlet/controller.homepage.SeminarAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

    function view(seq) {
        document.form1.action = "/servlet/controller.homepage.SeminarAdminServlet";
        document.form1.p_seq.value = seq;
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    function insert() {
        document.form1.action = "/servlet/controller.homepage.SeminarAdminServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }

    function search() {
        <%if (!StringManager.substring(box.getSession("gadmin"),0,1).equals("A")) { %>
        whenSelection();
        <% } %>

        document.form1.p_selGubun.value = document.form1.p_selGubun1.options[document.form1.p_selGubun1.selectedIndex].value;

        var st_date = make_date(document.form1.p_sdate.value);
        var ed_date = make_date(document.form1.p_edate.value);

        document.form1.p_propstart.value  = st_date;
        document.form1.p_propend.value    = ed_date;
        
        document.form1.action = "/servlet/controller.homepage.SeminarAdminServlet";
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
        
        document.form1.action = "/servlet/controller.homepage.SeminarAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
}
<%//if (!StringManager.substring(box.getSession("gadmin"),0,1).equals("A") && box.getString("s_grcode").equals("")) { %>
//location.href = "/servlet/controller.homepage.SeminarAdminServlet?p_process=select&s_grcode=<%=box.getSession("tem_grcode")%>&p_selGroup=<%=box.getSession("tem_grcode")%>&&p_search=adtitle";
<%// } %>

    function pagesize(pageSize) {
        document.form1.target = "_self";
        document.form1.p_pageno.value = 1;
        document.form1.p_pagesize.value = pageSize;
        document.form1.action = '/servlet/controller.homepage.SeminarAdminServlet';
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

    function viewPassContent(p) {
         var  width  = "720";
         var  height = "650";
         var  left   = "100";
         var  top    = "100";

         var params  = "?p_process=selectPass&p_seq="+p+"&p_pageno=<%=v_pageno%>&p_pagesize=<%=v_pagesize%>";
         open_window("SeminarPreview","/learn/admin/homepage/za_SeminarPreview.jsp"+params,left,top,width,height, "no","no","no","yes","no");
    }

    function regPass(p) {
        var  width  = "720";
        var  height = "650";
        var  left   = "100";
        var  top    = "100";

        var params  = "?p_process=insertPage&p_seq="+p+"&p_pageno=<%=v_pageno%>&p_pagesize=<%=v_pagesize%>";
        open_window("SeminarPreview","/learn/admin/homepage/za_SeminarPreview.jsp"+params,left,top,width,height, "no","no","no","yes","no");
    }

    function goRegList() {
        document.form1.target = "_self";
        document.form1.action = '/servlet/controller.homepage.SeminarAdminServlet';
        document.form1.p_process.value = "selectRegList";
        document.form1.submit();
    }

    function whenSelection2(p){
       	document.form1.p_selGubun.value = document.form1.p_selGubun2.value;
        document.form1.action = "/servlet/controller.homepage.SeminarAdminServlet";
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
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_search"     value = "<%=v_search%>">
    <input type = "hidden" name = "p_propstart"  value = "<%=v_propstart%>">
    <input type = "hidden" name = "p_propend"    value = "<%=v_propend  %>">
    <input type = "hidden" name = "p_seq"        value = "">
    <input type = "hidden" name = "p_selGubun"   value = "">


<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
      <td align="center" valign="top">
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr>
            <td><img src="/images/admin/portal/s.1_16.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <!----------------- title �� ----------------->

        <br>
        <!----------------- form ���� ----------------->
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="450"> ��ũ���з�
              <kocca_select:select name="p_selGubun1" sqlNum="seminar.list1"  param=" "              
                onChange="changep_selSeminarNm(this.value)" attr=" " selectedValue="<%= v_selGubun %>" isLoad="true" all="Y" />
                &nbsp;&nbsp;&nbsp;��ũ����
              <kocca_select:select name="p_selSeminarNm" sqlNum="seminar.list2"  param="<%=v_selGubun %>"              
                onChange="search()" attr=" " selectedValue="<%= v_selSeminarNm %>" isLoad="true" all="Y" />
            </td>
            <td width="170" align="right">
            </td>
            <td width="300" align="right">��û�Ⱓ
             <input name="p_sdate" id="p_sdate" class="datepicker_input1" type="text" size="10" value='<%=FormatDate.getFormatDate(v_propstart, "yyyy/MM/dd") %>'>
~
              <input name="p_edate" id="p_edate" class="datepicker_input1" type="text" size="10" value='<%=FormatDate.getFormatDate(v_propend, "yyyy/MM/dd") %>'>
            </td>
            <td width="50" align="right" valign="middle"> <a href='javascript:search()'><img src="/images/admin/button/btn_inquiry.gif" border="0"></a>
            </td>
          </tr>
          <tr>
           <td colspan="4" align="right">
              <a href='javascript:insert()'><img src="/images/admin/portal/s.2_35.gif" border="0"></a>&nbsp;
              <a href="javascript:goRegList()"><img src="/images/admin/portal/s.2_36.gif" border="0"></a>
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
            <td colspan="8" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title" width="5%" height="25"><b>NO</b></td>
            <td class="table_title" width="8%"><b>       <kocca_select:select                    
                name="p_selGubun2"             
                sqlNum="seminar.list1"                
                onChange="whenSelection2(this.value);"             
                attr= "�з�"                
                selectedValue="<%= v_selGubun %>"             
                isLoad="true"               
                type="3"                
                styleClass="table_title"                
                all="true" />    </b></td>
            <td class="table_title"><b>��ũ����</b></td>
            <td class="table_title" width="8%"><b>��米��</b></td>
            <td class="table_title" width="8%"><b>��ũ�� �Ͻ�</b></td>
            <td class="table_title" width="8%"><b>��ũ�� ��û�Ⱓ</b></td>
            <td class="table_title" width="5%" height="25"><b>�ο�</b></td>
            <td class="table_title" width="8%" ><b>������ ��ǥ</b></td>
          </tr>
          <!-- ��ü�������� ���� -->
            <%
            for(int i = 0; i < list3.size(); i++) {

                DataBox dbox = (DataBox)list3.get(i);
                
                v_seq           = dbox.getInt("d_seq");
                v_seminargubun  = dbox.getString("d_seminargubun");
                v_seminargubunnm= dbox.getString("d_seminargubunnm");
                v_seminarnm     = dbox.getString("d_seminarnm");
                v_tname         = dbox.getString("d_tname");
                v_startdate     = dbox.getString("d_startdate");
                v_enddate       = dbox.getString("d_enddate");
                v_propstart     = dbox.getString("d_propstart");
                v_propend       = dbox.getString("d_propend");
                v_member        = dbox.getInt("d_limitmember");
                v_passyn = dbox.getString("d_pass_yn");

                
                if(v_passyn.equals("A")){
                    v_passyn = "������";
                } else if(v_passyn.equals("B")){
                    v_passyn = "������";
                } else if(v_passyn.equals("Y")){
                    v_passyn = "<a href='javascript:viewPassContent("+v_seq+")'>������ ��������</a>";
                } else {
                    v_passyn = "<a href='javascript:regPass("+v_seq+")'>������ ����ϱ�</a>";
                }


                v_dispnum   = dbox.getInt("d_dispnum");
                v_totalpage = dbox.getInt("d_totalpage");
                v_totalrowcount = dbox.getInt("d_totalrowcount");
            
                
%>

          <tr>
            <td class="table_01" ><%=v_dispnum %></td>
            <td class="table_02_1"><%=v_seminargubunnm%></td>
            <td class="table_02_2"><a href="javascript:view('<%=v_seq%>')"><%=v_seminarnm%></a></td>
            <td class="table_02_1"><%=v_tname%></td>
            <td class="table_02_1"><%=FormatDate.getFormatDate(v_startdate,"yyyy/MM/dd") + " ~ " + FormatDate.getFormatDate(v_enddate,"yyyy/MM/dd")%></td>
            <td class="table_02_1"><%=FormatDate.getFormatDate(v_propstart,"yyyy/MM/dd") + " ~ " + FormatDate.getFormatDate(v_propend,"yyyy/MM/dd")%></td>
            <td class="table_02_1" ><%=v_member%>��</td>
            <td class="table_02_1"><%=v_passyn%></td>
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
