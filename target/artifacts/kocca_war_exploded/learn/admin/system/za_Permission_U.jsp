<%
//**********************************************************
//  1. ��      ��: ���Ѱ��� ����
//  2. ���α׷��� : za_Permission_U.jsp
//  3. ��      ��: ���Ѱ��� ����
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
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    String  v_pageno    = box.getString("p_pageno");

    String v_searchtext = box.getString("p_searchtext");
    String v_search     = box.getString("p_search");
    String ss_gadmin      = box.getStringDefault("s_gadmin","ALL");       //gadmin

    String v_userid     = box.getString("p_userid");
    String v_gadmin     = box.getString("p_gadmin");

   // �����ڵ� + "," + �����׷��ʿ俩��  + "," + �����ڵ��ʿ俩�� + "," + ȸ���ڵ��ʿ俩�� +  "," + �μ��ڵ��ʿ俩��
    String v_gadminview = GadminAdminBean.getGadminIsNeed(v_gadmin);
    String v_isneedgrcode  = "";
    String v_isneedsubj    = "";
    String v_isneedcomp    = "";
    String v_isneeddept    = "";
    StringTokenizer st = new StringTokenizer(v_gadminview,",");

    // �׷�/����/�μ� �ʿ俩��
    if (st.hasMoreElements()) {
        v_gadmin        = (String)st.nextToken();
        v_isneedgrcode  = (String)st.nextToken();
        v_isneedsubj    = (String)st.nextToken();
        v_isneedcomp    = (String)st.nextToken();
        v_isneeddept    = (String)st.nextToken();
    }

    String v_isneedgrcodedisplay  = "none";
    String v_isneedsubjdisplay    = "none";
    String v_isneedcompdisplay    = "none";
    String v_isneeddeptdisplay    = "none";
    if (v_isneedgrcode.equals("Y")) v_isneedgrcodedisplay = "";
    if (v_isneedsubj.equals("Y"))   v_isneedsubjdisplay   = "";
    if (v_isneedcomp.equals("Y"))   v_isneedcompdisplay   = "";
    if (v_isneeddept.equals("Y"))   v_isneeddeptdisplay   = "";


    // ������ �⺻����
    String v_gadminnm   = "";
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

    //�����μ�����
    String v_subcomp       = "";
    String v_subcompanynm  = "";
    String v_subgpmnm      = "";
    String v_subdeptnm     = "";

    // ������ �⺻����
    ManagerData data = (ManagerData)request.getAttribute("selectManager");
    v_gadmin     = data.getGadmin();
    v_gadminnm   = data.getGadminnm();
    v_comp       = data.getComp();
    v_isdeleted  = data.getIsdeleted();
    v_fmon       = data.getFmon();
    v_tmon       = data.getTmon();
    v_fmonview   = FormatDate.getFormatDate(v_fmon,"yyyy/MM/dd");
    v_tmonview   = FormatDate.getFormatDate(v_tmon,"yyyy/MM/dd");
    v_commented  = data.getCommented();
    v_luserid    = data.getLuserid();
    v_ldate      = data.getLdate();

    v_cono       = data.getCono();
    v_name       = data.getName();
    v_jikwi      = data.getJikwi();
    v_jikwinm    = data.getJikwinm();
    v_compnm     = data.getCompnm();

    ArrayList list1 = (ArrayList)request.getAttribute("selectManagerGrcode");     //���������׷�����
    ArrayList list2 = (ArrayList)request.getAttribute("selectManagerSubj");       //������������
    ArrayList list3 = (ArrayList)request.getAttribute("selectManagerComp");       //����ȸ������
    ArrayList list4 = (ArrayList)request.getAttribute("selectManagerDept");       //�����μ�����
%>

<html>
<head>
<title></title>
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
	$("#p_ldate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--

    function insert_check() {
        var st_date = make_date(document.form1.p_sdate.value);
        var ed_date = make_date(document.form1.p_ldate.value);
        var ga = '<%=v_gadminview%>';
        arrStr = ga.split(",");

        if (document.form1.p_userid.value == "") {
            alert("�����ڸ� �����ϼ���");
            return;
        }
/*
        if (document.form1.p_gadminview.value == "" ) {
            alert("������ �����ϼ���");
            return;
        }
*/
        if(blankCheck(document.form1.p_sdate.value)){
        alert("�������� �Է��ϼ���.");
        return;
        }

        if(blankCheck(document.form1.p_ldate.value)){
        alert("�������� �Է��ϼ���.");
        return;
        }

        if(st_date > ed_date){
        alert("�������� �����Ϻ��� Ů�ϴ�.");
        return;
        }

        for(var i=0;i<document.form1.p_grcode.length;i++){
            document.form1.p_grcode.options[i].selected = true;
        }
        for(var i=0;i<document.form1.p_subj.length;i++){
            document.form1.p_subj.options[i].selected = true;
        }
        for(var i=0;i<document.form1.p_company.length;i++){
            document.form1.p_company.options[i].selected = true;
        }
        for(var i=0;i<document.form1.p_dept.length;i++){
            document.form1.p_dept.options[i].selected = true;
        }

        document.form1.p_fmon.value = st_date;
        document.form1.p_tmon.value = ed_date;
        document.form1.p_gadmin.value = arrStr[0];

        document.form1.p_searchtext.value = "";
        document.form1.p_search.value     = "";
        document.form1.action = "/servlet/controller.system.PermissionServlet";
        document.form1.p_process.value = "update";
        document.form1.submit();
    }

    function list() {
        document.form1.action = "/servlet/controller.system.PermissionServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }

/*
    //���� ������ ���� �׷�/����/ȸ��/�μ� ��� ȭ�� ���÷���
    function changeGadmin() {
        var ga = document.form1.p_gadminview.options[document.form1.p_gadminview.selectedIndex].value;
        arrStr = ga.split(",");

        if (arrStr[1]=="Y") {
            document.all.grcode.style.display = '';
        } else {
            document.all.grcode.style.display = 'none';
        }

        if (arrStr[2]=="Y") {
            document.all.subj.style.display = '';
        } else {
            document.all.subj.style.display = 'none';
        }

        if (arrStr[3]=="Y") {
            document.all.company.style.display = '';
        } else {
            document.all.company.style.display = 'none';
        }

        if (arrStr[4]=="Y") {
            document.all.dept.style.display = '';
        } else {
            document.all.dept.style.display = 'none';
        }
    }
*/

    // ��� �˻�
    function searchMember() {
        if (document.form1.p_searchtext.value == "") {
            alert("���/�̸��� �����ϴ�.");
            return;
        }
        if (document.form1.p_key1.value == "") {
            alert("�˻�� �Է����ּ���");
            return;
        }

        var url = "/servlet/controller.library.SearchServlet?p_process=member&p_gubun="+ document.form1.p_gubun.value +"&p_key1="+ document.form1.p_key1.value +"&p_key2=";
        open_window("",url,"0","0","100","100");
    }

    // ��� �˻� �� ó��
    function receiveMember(comp , compnm , compnm , jikwi , jikwinm, userid, cono , name){
      document.form1.p_comp.value   = comp;
//      document.form1.p_jikwi.value  = jikwi;
      document.form1.p_userid.value = userid;

      document.all.t_compnm.innerText  = compnm;
      document.all.t_jikwinm.innerText  = jikwinm;
      document.all.t_userid.innerText  = userid;
      document.all.t_cono.innerText  = cono;
      document.all.t_name.innerText  = name;
    }

    // �׷� �˻�
    function searchGrcode() {
        var url = "/servlet/controller.library.SearchServlet?p_process=grcode&p_gubun=grcodenm&p_key1=&p_key2=";
        open_window("",url,"0","0","100","100");
    }

    // �׷� �˻� �� ó��
    function receiveGrcode(grcode,grcodenm){
        var j = document.form1.p_grcode.length;
        var f_exist = "";
        for(var i=0;i<j;i++){
            if(document.form1.p_grcode.options[i].value==grcode){
                f_exist = "Y";
                alert(grcodenm+"��(��) �̹� �����Ǿ� �ֽ��ϴ�");
            }
        }
        if (f_exist != "Y"){
            document.form1.p_grcode.options[j] = new Option(grcodenm,grcode);
            document.form1.p_grcode.options[j].selected = true;
        }
    }

    // ���� �׷� ����
    function delGrcode(){
        for(var i = 0 ;i<document.form1.p_grcode.length;i++){
            if(document.form1.p_grcode.options[i].selected==true)
                document.form1.p_grcode.options[i] = null;
            }
    }

    // ���� �˻�
    function searchSubj() {
        var url = "/servlet/controller.library.SearchServlet?p_process=subj&p_gubun=subjnm&p_key1=&p_key2=";
        open_window("",url,"0","0","100","100");
    }

    // ���� �˻� �� ó��
    function receiveSubj(subj,subjnm){
        var j = document.form1.p_subj.length;
        var f_exist = "";
        for(var i=0;i<j;i++){
            if(document.form1.p_subj.options[i].value==subj){
                f_exist = "Y";
                alert(subjnm+"��(��) �̹� �����Ǿ� �ֽ��ϴ�");
            }
        }
        if (f_exist != "Y"){
            document.form1.p_subj.options[j] = new Option(subjnm,subj);
            document.form1.p_subj.options[j].selected = true;
        }
    }

    // ���� ���� ����
    function delSubj(){
        for(var i = 0 ;i<document.form1.p_subj.length;i++){
            if(document.form1.p_subj.options[i].selected==true)
                document.form1.p_subj.options[i] = null;
            }
    }

    // ȸ�� �˻�
    function searchCompany() {
        var url = "/servlet/controller.library.SearchServlet?p_process=grpcomp&p_gubun=companynm&p_key1=&p_key2=";
        open_window("",url,"0","0","100","100");
    }

    // ȸ�� �˻� �� ó��
    function receiveGrpComp(comp , compnm, comptype, groupnm, companynm, tmp1, tmp2, tmp3){
        var compnm = companynm;
        var j = document.form1.p_company.length;
        var f_exist = "";
        for(var i=0;i<j;i++){
            if(document.form1.p_company.options[i].value==comp){
                f_exist = "Y";
                alert(compnm+"��(��) �̹� �����Ǿ� �ֽ��ϴ�");
            }        
        }
        if (f_exist != "Y"){
            document.form1.p_company.options[j] = new Option(compnm,comp);
            document.form1.p_company.options[j].selected = true;
        }
    }
    
    // ȸ�� �μ� ����
    function delCompany(){
        for(var i = 0 ;i<document.form1.p_company.length;i++){
            if(document.form1.p_company.options[i].selected==true)
                document.form1.p_company.options[i] = null;
            }
    }

    // �μ� �˻�
    function searchDept() {
        var url = "/servlet/controller.library.SearchServlet?p_process=dept&p_gubun=deptnm&p_key1=&p_key2=";
        open_window("",url,"0","0","100","100");
    }

    // �μ� �˻� �� ó��
    function receiveDept(comp , compnm, comptype, groupnm, companynm, gpmnm, deptnm, partnm, tmp1, tmp2, tmp3){
        var compnm = companynm+"/"+gpmnm+"/"+deptnm;
        var j = document.form1.p_dept.length;
        var f_exist = "";
        for(var i=0;i<j;i++){
            if(document.form1.p_dept.options[i].value==comp){
                f_exist = "Y";
                alert(compnm+"��(��) �̹� �����Ǿ� �ֽ��ϴ�");
            }
        }
        if (f_exist != "Y"){
            document.form1.p_dept.options[j] = new Option(compnm,comp);
            document.form1.p_dept.options[j].selected = true;
        }
    }

    // ���� �μ� ����
    function delDept(){
        for(var i = 0 ;i<document.form1.p_dept.length;i++){
            if(document.form1.p_dept.options[i].selected==true)
                document.form1.p_dept.options[i] = null;
            }
    }
//-->
</SCRIPT>
</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form name="form1" method="post">
    <input type = "hidden" name = "p_process"    value = "<%= v_process %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno%>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext%>">
    <input type = "hidden" name = "p_search"     value = "<%=v_search%>">
    <input type = "hidden" name = "p_userid"     value = "<%=v_userid%>">
    <input type = "hidden" name = "p_gadmin"     value = "<%=v_gadmin%>">
    <input type = "hidden" name = "p_fmon"       value = "<%=v_fmon%>">
    <input type = "hidden" name = "p_tmon"       value = "<%=v_tmon%>">
    <input type = "hidden" name = "p_comp"       value = "<%=v_comp%>">
    <input type = "hidden" name = "p_userid"     value = "<%=v_userid%>">
    <input type = "hidden" name = "s_gadmin"     value = "<%=ss_gadmin%>">
    <input type = "hidden" name = "p_gadminview"     value = "<%=v_gadminview%>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="665">
  <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/system/unite_title03.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
        <br>
        <!----------------- ��ڵ�� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="15%" height="25" class="table_title"><strong>�Ҽ�</strong></td>
            <td class="table_02_2"><span id='t_compnm'><%= v_compnm %></span></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2"><span id='t_jikwinm'><%=v_jikwinm%></span></td>
          </tr>
          <tr class="table_02_2">
            <td height="25" class="table_title"><strong>ID</strong></td>
            <td height="25" align="left"><span id='t_userid'></span><%=v_userid%></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>���</strong></td>
            <td height="25" class="table_02_2"><span id='t_cono'><%=v_cono%></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2"><span id='t_name'><%=v_name%></span></td>
          </tr>
          <!------------------------  ���Ѻз� ���� ---------------------->

          <tr>
            <td class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2">
               <!--%= GadminAdminBean.getGadminSelectNop("p_gadminview",v_gadminview,"onChange=\"changeGadmin()\"",0) %-->
               <%=GadminAdminBean.getGadminName(v_gadmin)%>
            </td>
          </tr>
          <!------------------------  ���Ѻз� ��   ---------------------->

        <!------------------------  �׷�˻� ���� ---------------------->
          <tr>
            <td class="table_title"><strong>�����׷�</strong></td>
            <td height="25" class="table_02_2">
              <div id="grcode" style="display:<%=v_isneedgrcodedisplay%>">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>
                    <select name="p_grcode" size=4  multiple>
<%
         if (list1 != null && v_isneedgrcode.equals("Y")) {
            for(int i = 0; i < list1.size(); i++) {
                GrcodemanData data1  = (GrcodemanData)list1.get(i);
                v_grcode    = data1.getGrcode();
                v_grcodenm  = data1.getGrcodenm();
                out.println ("<option value=\"" + v_grcode + "\" selected>" + v_grcodenm + "</option>");
            }
         }
%>
                    </select>
                    <a href="javascript:searchGrcode()"><img src="/images/admin/button/btn_groupsearch.gif" border="0"></a>
                    <a href="javascript:delGrcode()"><img src="/images/admin/button/btn_groupdelete.gif" border="0"></a>
                  </td>
                </tr>
              </table>
              </div>
            </td>
          </tr>

        <!------------------------  �׷�˻� ��   ---------------------->

        <!------------------------  �����˻� ���� ---------------------->
          <tr>
            <td class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2">
              <div id="subj" style="display:<%=v_isneedsubjdisplay%>">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>
                    <select name="p_subj" size=4  multiple>

<%
         if (list2 != null && v_isneedsubj.equals("Y")) {
            for(int i = 0; i < list2.size(); i++) {
                SubjmanData data2  = (SubjmanData)list2.get(i);
                v_subj    = data2.getSubj();
                v_subjnm  = data2.getSubjnm();
                out.println ("<option value=\"" + v_subj + "\" selected>" + v_subjnm + "</option>");
            }
         }
%>
                    </select>
                    <a href="javascript:searchSubj()"><img src="/images/admin/button/btn_csearch.gif" border="0"></a>
                    <a href="javascript:delSubj()"><img src="/images/admin/button/btn_cdelete.gif" border="0"></a>
                  </td>
                </tr>
              </table>
              </div>
            </td>
          </tr>
        <!------------------------  �����˻� ��   ---------------------->

        <!------------------------  ȸ��˻� ���� ---------------------->
          <tr>
            <td class="table_title"><strong>ȸ��</strong></td>
            <td height="25" class="table_02_2">
              <div id="company" style="display:<%=v_isneedcompdisplay%>">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>
                    <select name="p_company" size=4  multiple>

<%
         if (list3 != null && v_isneedcomp.equals("Y")) {
            for(int i = 0; i < list3.size(); i++) {
                CompmanData data3  = (CompmanData)list3.get(i);
                v_company    = data3.getComp();
                v_companynm  = data3.getCompanynm();
                out.println ("<option value=\"" + v_company + "\" selected>" + v_companynm + "</option>");
            }
         }
%>
                    </select>
                    <a href="javascript:searchCompany()"><img src="/images/admin/button/btn_comsearch.gif" border="0"></a>
                    <a href="javascript:delCompany()"><img src="/images/admin/button/btn_comdelete.gif" border="0"></a>
                  </td>
                </tr>
              </table>
              </div>
            </td>
          </tr>
        <!------------------------  ȸ��˻� ��   ---------------------->

        <!------------------------  �μ��˻� ���� ---------------------->
          <tr>
            <td class="table_title"><strong>�μ�</strong></td>
            <td height="25" class="table_02_2">
              <div id="dept" style="display:<%=v_isneeddeptdisplay%>">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>
                    <select name="p_dept" size=4  multiple>
<%
         if (list4 != null && v_isneeddept.equals("Y")) {
            for(int i = 0; i < list4.size(); i++) {
                CompmanData data4  = (CompmanData)list4.get(i);
                v_subcomp       = data4.getComp();
                v_subcompanynm  = data4.getCompanynm();
                v_subgpmnm      = data4.getGpmnm();
                v_subdeptnm     = data4.getDeptnm();
                out.println ("<option value=\"" + v_subcomp + "\" selected>" + v_subcompanynm + "/" + v_subgpmnm + "/" + v_subdeptnm + "</option>");
            }
         }
%>
                    </select>
                    <a href="javascript:searchDept()"><img src="/images/admin/button/btn_partsearch.gif" border="0"></a>
                    <a href="javascript:delDept()"><img src="/images/admin/button/btn_partdelete.gif" border="0"></a>
                  </td>
                </tr>
              </table>
              </div>
            </td>
          </tr>
        <!------------------------  �μ��˻� ��   ---------------------->
          <tr>
            <td height="25" class="table_title"><b>���ѻ��Ⱓ</b></td>
            <td class="table_02_2">
              <input name="p_sdate" id="p_sdate" class="datepicker_input1" type="text" size="10" value='<%=v_fmonview%>'>
              ~
              <input name="p_ldate" id="p_ldate" class="datepicker_input1" type="text" size="10" value='<%=v_tmonview%>'>
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><b>���ѻ��뵵</b></td>
            <td class="table_02_2">
              <input name="p_commented" class="input" type="text" size="100" value='<%=v_commented%>'>
            </td>
          </tr>
        </table>
        <!----------------- ��ڵ�� �� ----------------->


        <br>
        <!----------------- ����, ��� ��ư ���� ----------------->
        <table  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><a href="javascript:insert_check()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td> 
			<td width=8></td>
            <td align="center"><a href="javascript:list()"><img src="/images/admin/admin/btn_cancel.gif"  border="0"></a></td>
          </tr>
        </table>
        <!----------------- ����, ��� ��ư �� ----------------->


    </td>
  </tr>
</table>


<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
