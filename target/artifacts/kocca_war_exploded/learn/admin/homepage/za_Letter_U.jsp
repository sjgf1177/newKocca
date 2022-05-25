<%
//**********************************************************
//  1. ��      ��: Notice
//  2. ���α׷��� : za_Letter_U.jsp
//  3. ��      ��: �������� ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 13
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.dunet.common.util.*" %>  
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process  = box.getString("p_process");
    String  v_selcomp  = box.getString("p_selcomp");

    int     v_pageno   = box.getInt("p_pageno");
    int     v_pagesize = box.getInt("p_pagesize");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
//    String  v_comp    = box.getString("p_comp");
    int v_tabseq   = box.getInt("p_tabseq");
    int     v_seq          = box.getInt("p_seq");
    int v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�

    int    v_cnt       = 0;            // ��ȸ��
    String v_gubun     = "";           // ��ü����
    String v_startdate = "";           // �˾�����������
    String v_enddate   = "";           // �˾�����������
    String v_adtitle   = "";           // ����
    String v_adcontent = "";           // ����
    String v_addate    = "";           // �����
    String v_adname    = "";           // �����
    String v_loginyn    = "";			// �α�������
    String v_useyn   	= "";			// �������
    String v_compcd	    = "";           // ���ȸ��
	int v_popwidth	 = 0;               // �˾�����
    int v_popheight  = 0;               // �˾�����
    int v_popxpos    = 0;               // �˾�x��ġ
    int v_popypos    = 0;               // �˾�y��ġ
    String v_popup   = "";              //�˾���������
    String v_uselist  = "";              //
    String v_useframe = "";
    String v_isall    = "";              //
    String  v_upfile    = "";
    String  v_upfile_value    = "";
    String  v_grcodecd  ="";
    Vector v_realfileVector = null;
    Vector v_savefileVector = null;
    Vector v_fileseqVector  = null;

    //NoticeData data = (NoticeData)request.getAttribute("selectNotice");
    DataBox dbox = (DataBox)request.getAttribute("selectNotice");
    if (dbox != null) {
        v_gubun     = dbox.getString("d_gubun");
		v_startdate = dbox.getString("d_startdate");
		v_enddate   = dbox.getString("d_enddate");
        v_adtitle   = dbox.getString("d_adtitle");
        v_adcontent = dbox.getString("d_adcontent");
        v_addate    = dbox.getString("d_addate");
        v_adname    = dbox.getString("d_adname");
        v_cnt       = dbox.getInt("d_cnt");
		v_loginyn   = dbox.getString("d_loginyn");
		v_useyn   	= dbox.getString("d_useyn");
		v_compcd	= dbox.getString("d_compcd");
		v_popwidth	= dbox.getInt("d_popwidth");
		v_popheight = dbox.getInt("d_popheight");
		v_popxpos   = dbox.getInt("d_popxpos");
		v_popypos   = dbox.getInt("d_popypos");
		v_popup     = dbox.getString("d_popup");
		v_uselist   = dbox.getString("d_uselist");
		v_useframe  = dbox.getString("d_useframe");
		v_isall     = dbox.getString("d_isall");
		v_grcodecd  = dbox.getString("d_grcodecd");
		v_realfileVector    = (Vector)dbox.getObject("d_realfile");
        v_savefileVector    = (Vector)dbox.getObject("d_savefile");
        v_fileseqVector  = (Vector)dbox.getObject("d_fileseq");
    }
    v_adcontent = StringManager.replace(v_adcontent, "&nbsp;","&amp;nbsp;" );
    String s_username  = box.getSession("name");

    String v_server   = conf.getProperty("kocca.url.value");
    String v_tem_url  = conf.getProperty("url.namo.template");
    String v_tem_name = conf.getProperty("name.namo.template.ini");
    String v_tem_url_name = v_server + v_tem_url + v_tem_name;


    String  s_gadmin    = box.getSession("gadmin");
    String v_gadmin ="";
    if(!s_gadmin.equals("")){
      v_gadmin = s_gadmin.substring(0,1);
    }
    
    int fileCnt = v_realfileVector != null ? v_realfileVector.size() : 0 ;
%>


<html>
<head>
<title>eIBIs</title>
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

    function insert_check() {
        var st_date = make_date(document.form1.p_sdate.value);
        var ed_date = make_date(document.form1.p_edate.value);
        
       // var chkselectcnt = chkSelected();
        var chkselectcntgrcode = chkSelectedgrcode();

        document.form1.p_adcontent.value = document.form1.Wec.MIMEValue;
        document.form1.p_adcontent.value.replace("&","&amp;");

       // alert(document.form1.p_grocdecd.value);
       // return;

        if (blankCheck(document.form1.p_adtitle.value)) {
            alert("������ �Է��ϼ���");
            document.form1.p_adtitle.focus();
            return;
        }
        if (realsize(document.form1.p_adtitle.value) > 200) {
            alert("������ �ѱ۱��� 2000�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_adtitle.focus();
            return;
        }

        if (blankCheck(document.form1.p_adcontent.value)) {
            alert("������ �Է��ϼ���");
            document.form1.p_adcontent.focus();
            return;
        }

        <%if(!v_gadmin.equals("K")){   //ȸ������ڰ� �ƴҶ�%>
        if(document.form1.p_login[0].checked == true || document.form1.p_login[1].checked == true ){
          if(chkselectcntgrcode < 1){
            alert("������׷��� �����Ͽ��ֽʽÿ�");
            return;
          }
        }
        <%}%>


        if(document.form1.p_isAll.checked == true){
            document.form1.p_isAllvalue.value = 'Y';
        }else {
            document.form1.p_isAllvalue.value = 'N';
        }


        if(document.form1.p_popup[0].checked == true){

          if(st_date > ed_date){
            alert("�������� �����Ϻ��� Ů�ϴ�.");
            return;
          }

          if (document.form1.p_popsize1.value == "") {
            alert("���λ���� �Է��Ͽ��ֽʽÿ�");
            document.form1.p_popsize1.focus();
            return;
          }

          if (!number_chk_noalert(document.form1.p_popsize1.value)) {
            alert('���λ���� �߸��ԷµǾ����ϴ�.');
            return;
          }

          if (document.form1.p_popsize2.value == "") {
            alert("���λ���� �Է��Ͽ��ֽʽÿ�");
            document.form1.p_popsize2.focus();
            return;
          }

          if (!number_chk_noalert(document.form1.p_popsize2.value)) {
            alert('���λ���� �߸��ԷµǾ����ϴ�.');
            return false;
          }

          if (document.form1.p_popposition1.value == "") {
            alert("X�� ���� �Է��Ͽ��ֽʽÿ�");
            document.form1.p_popposition1.focus();
            return;
          }

          if (!number_chk_noalert(document.form1.p_popposition1.value)) {
            alert('X�� ���� �߸��ԷµǾ����ϴ�.');
            return false;
          }

          if (document.form1.p_popposition2.value == "") {
            alert("Y�� ���� �Է��Ͽ��ֽʽÿ�");
            document.form1.p_popposition2.focus();
            return;
          }

          if (!number_chk_noalert(document.form1.p_popposition2.value)) {
            alert('Y�� ���� �߸��ԷµǾ����ϴ�.');
            return false;
          }

          if(document.form1.p_uselist.checked == true){
            document.form1.p_uselist.value = 'Y';
          }
          if(document.form1.p_useframe.checked == true){
            document.form1.p_useframe.value = 'Y';
          }

        }

        document.form1.p_popsize1.disabled = false;
        document.form1.p_popsize2.disabled = false;

        document.form1.p_startdate.value  = st_date;
        document.form1.p_enddate.value    = ed_date;
        document.form1.p_pageno.value = 1;
        document.form1.p_searchtext.value = "";
        document.form1.p_search.value     = "";
        document.form1.action = "/servlet/controller.homepage.LetterAdminServlet";
        document.form1.p_process.value = "update";
        document.form1.submit();
    }

    function list() {
        document.form1.action = "/servlet/controller.homepage.LetterAdminServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }


  //�˾��̸�����
    function popUpPreview(){
         var popupObj = document.getElementsByName("p_popup");
            var popupObjLen = popupObj.length;

            for(var i = 0 ; i < popupObjLen ; i ++) {
                if(popupObj[i].checked && popupObj[i].value == "N") {
                    alert("�˾� ������ �ϼž� �̸� ���Ⱑ �����մϴ�.");
                    return;
                }
            }
                
            var  width  = document.form1.p_popsize1.value;
            var  height = document.form1.p_popsize2.value;
            var  left   = document.form1.p_popposition1.value;
            var  top    = document.form1.p_popposition2.value;

            window.self.name = "CurrentPage";
            open_window("openPopUpView","",left,top,width,height, "no","no","no","yes","no");  

            document.form1.p_content.value = document.form1.Wec.MIMEValue;
            document.form1.p_content.value.replace("&","&amp;");

            document.form1.target = "openPopUpView";
            document.form1.action='/servlet/controller.homepage.EventAdminServlet';
            document.form1.p_process.value = 'popupView';
            document.form1.submit();
            document.form1.target = window.self.name;
    
    }

	//�α䱸�� ���ý�
	function whenLoginSelect(){
	  if(document.form1.p_login[2].checked == true) { //�α�����
          if (grcodeFrame.grcodeform.p_grcode.length > 0) {
            for (i=0; i<grcodeFrame.grcodeform.p_grcode.length; i++) {
              grcodeFrame.grcodeform.p_grcode[i].checked = false;
              grcodeFrame.grcodeform.p_grcode[i].disabled = true;
            }
          } else {
              grcodeFrame.grcodeform.p_grcode.checked = false;
              grcodeFrame.grcodeform.p_grcode.disabled = true;
          }
      }

      else if(document.form1.p_login[0].checked == true || document.form1.p_login[1].checked == true){ //�α�����
          if (grcodeFrame.grcodeform.p_grcode.length > 0) {
            for (i=0; i<grcodeFrame.grcodeform.p_grcode.length; i++) {
              grcodeFrame.grcodeform.p_grcode[i].checked = false;
              grcodeFrame.grcodeform.p_grcode[i].disabled = false;
            }
          } else {
              grcodeFrame.grcodeform.p_grcode.checked = false;
              grcodeFrame.grcodeform.p_grcode.disabled = false;
          }
      }
	}

	//üũ�ڽ� üũ
    function chkSelectedgrcode() {
      var selectedcnt = 0;

      document.form1.p_grocdecd.value = "";

        if (grcodeFrame.grcodeform.p_grcode.length > 0) {
          for (i=0; i<grcodeFrame.grcodeform.p_grcode.length; i++) {
            if (grcodeFrame.grcodeform.p_grcode[i].checked == true) {
              selectedcnt++;
              document.form1.p_grocdecd.value += grcodeFrame.grcodeform.p_grcode[i].value+",";
            }
          }
        } else {
          if (grcodeFrame.grcodeform.p_grcode.checked == true) {
            selectedcnt++;
            document.form1.p_grocdecd.value += grcodeFrame.grcodeform.p_grcode.value+",";
          }
        }
      <%if(v_gadmin.equals("K")){   //ȸ������ڰ� �϶�%>
          document.form1.p_grocdecd.value = "<%=v_grcodecd%>,";
          return 1;
      <%} else {%>
          return selectedcnt;
      <%}%>
    }



	//�˾����μ��ý�
	function whenPopupSelect(){
	  if(document.form1.p_popup[0].checked == true) { //Y

	    document.form1.p_popsize1.value = "686";
	    document.form1.p_popsize2.value = "600";
	    document.form1.p_popposition1.value = "0";
	    document.form1.p_popposition2.value = "0";
	    document.form1.p_sdate.value = "";
	    document.form1.p_edate.value = "";

	    document.form1.p_popsize1.disabled = false;
	    document.form1.p_popsize2.disabled = false;
	    document.form1.p_popposition1.disabled = false;
	    document.form1.p_popposition2.disabled = false;
	    document.form1.p_sdate.disabled = false;
	    document.form1.p_edate.disabled = false;
	    document.form1.p_useframe.disabled = false;
	    document.form1.p_uselist.disabled = false;

	  }

	  else if(document.form1.p_popup[1].checked == true){ //N
	    document.form1.p_popsize1.value = "";
	    document.form1.p_popsize2.value = "";
	    document.form1.p_popposition1.value = "";
	    document.form1.p_popposition2.value = "";
	    document.form1.p_sdate.value = "";
	    document.form1.p_edate.value = "";

	    document.form1.p_popsize1.disabled = true;
	    document.form1.p_popsize2.disabled = true;
	    document.form1.p_popposition1.disabled = true;
	    document.form1.p_popposition2.disabled = true;
	    document.form1.p_sdate.disabled = true;
	    document.form1.p_edate.disabled = true;
	    document.form1.p_useframe.disabled = true;
	    document.form1.p_uselist.disabled = true;

	  }
	}

	function whenUseframe(){
	  if(document.form1.p_useframe.checked == true){ //N
	    document.form1.p_popsize1.disabled = false;
	    document.form1.p_popsize2.disabled = false;
	    document.form1.p_popsize1.value = "";
	    document.form1.p_popsize2.value = "";
	  }else{
	    document.form1.p_popsize1.disabled = true;
	    document.form1.p_popsize2.disabled = true;
	    document.form1.p_popsize1.value = "686";
	    document.form1.p_popsize2.value = "600";
	  }
	}

//-->


</SCRIPT>

</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form name="form1" method="post" enctype="multipart/form-data">
    <input type= "hidden" name= "p_process"    value= "<%= v_process %>">
    <input type= "hidden" name= "p_pageno"     value= "<%=v_pageno %>">
    <input type= "hidden" name= "p_pagesize"   value= "<%=v_pagesize %>">
    <input type= "hidden" name= "p_search"     value= "<%=v_search %>">
    <input type= "hidden" name= "p_searchtext" value= "<%=v_searchtext %>">
    <input type= "hidden" name= "p_seq"        value= "<%=v_seq %>">
	<input type= "hidden" name= "p_tabseq"     value= "<%=v_tabseq %>">
    <input type= "hidden" name= "p_startdate"  value= "">
    <input type= "hidden" name= "p_enddate"    value= "">
    <input type= "hidden" name= "p_compcd"     value= "">
    <input type= "hidden" name="p_grocdecd"    value= "">
	<input type= "hidden" name= "p_selcomp"    value= "<%=v_selcomp%>">
	<input type= "hidden" name= "p_adcontent"  value= "<%=StringUtil.convertHtmlchars(v_adcontent)%>">
	<input type= "hidden" name= "p_content"    value= "">
	<input type= "hidden" name= "p_isAllvalue" value= "">


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
        <br>
        <!----------------- �������� ���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>�ۼ���</strong></td>
            <td height="25" class="table_02_2"><%=s_username%></td>
          </tr>
          <tr class="table_02_2">
            <td height="25" class="table_title" ><strong>�����</strong></td>
            <td height="25" class="table_02_2"><%= FormatDate.getDate("yyyy/MM/dd") %></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>��ü��������</strong></td>
            <td height="25" class="table_02_2">
              <input type="checkbox" name="p_isAll" value='Y' <%if(v_isall.equals("Y")){%>checked<%}%>> ��ü����(��ܰɱ�)���� �����Ͽ��ֽʽÿ�.
            </td>
          </tr>
          <tr class="table_02_2">
            <td height="25" class="table_title" ><strong>�α�������</strong></td>
            <td height="25" class="table_02_2">
			   <input type="radio" name="p_login" value='AL' onclick="javascript:whenLoginSelect()" <%if (v_loginyn.equals("AL")){%>checked<%}%>>��ü&nbsp;
			   <input type="radio" name="p_login" value='N'  onclick="javascript:whenLoginSelect()" <%if (v_loginyn.equals("N")) {%>checked<%}%>>�α�����&nbsp;
               <input type="radio" name="p_login" value='Y'  onclick="javascript:whenLoginSelect()" <%if (v_loginyn.equals("Y")) {%>checked<%}%>>�α�����&nbsp;
			</td>
          </tr>
          <%if(!v_gadmin.equals("K")){   //ȸ������ڰ� �ƴҶ�%>
          <tr class="table_02_2">
            <td height="25" class="table_title" ><strong>������׷�</strong></td>
            <td height="25" class="table_02_2">
            <iframe name="grcodeFrame" width="850" height="80"  frameborder="0"  src="/servlet/controller.homepage.LetterAdminServlet?p_process=grcodelist&p_grcodecd=<%=v_grcodecd%>&p_loginyn=<%=v_loginyn%>"></iframe>
			</td>
          </tr>
          <%}else{%>
              <input type="hidden" name="p_login"  value='Y' >
              <iframe name="grcodeFrame" width="0" height="0"  frameborder="0"  src="/servlet/controller.homepage.LetterAdminServlet?p_process=grcodelist&p_grcodecd=<%=v_grcodecd%>&p_loginyn=<%=v_loginyn%>"></iframe>
          <%}%>
          <tr>
            <td width="15%" class="table_title"><strong>�˾�����</strong></td>
            <td height="25" class="table_02_2">
              <input type="radio" name="p_popup" value='Y' <%if (v_popup.equals("Y")){%>checked<%}%> onclick="javascript:whenPopupSelect()">Y&nbsp;
              <input type="radio" name="p_popup" value='N' <%if (v_popup.equals("N")){%>checked<%}%> onclick="javascript:whenPopupSelect()">N&nbsp;
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><b>�˾�����</b></td>
            <td class="table_02_2">
              <input name="p_sdate" id="p_sdate" class="datepicker_input1" type="text" size="10" value='<%=FormatDate.getFormatDate(v_startdate,"yyyy-MM-dd")%>'>
              ~
              <input name="p_edate" id="p_edate" class="datepicker_input1" type="text" size="10" value='<%=FormatDate.getFormatDate(v_enddate,"yyyy-MM-dd")%>'>
			  <br>
			  ������ : ���� <input type="text" size="5" name="p_popsize1" class="input" value="<%=v_popwidth%>" maxlength="4"> / ���� <input type="text" size="5" name="p_popsize2" class="input" value="<%=v_popheight%>" maxlength="4">
              <br>
			  ��ġ   : x <input type="text" size="5" name="p_popposition1" class="input" value="<%=v_popxpos%>" maxlength="3"> / y <input type="text" size="5" name="p_popposition2" class="input" value="<%=v_popypos%>" maxlength="3">
			  <br>
			  <input type="checkbox" name="p_useframe" value='Y' onclick="javascript:whenUseframe()" <%if(v_useframe.equals("Y")){out.println("checked");}%>>�ۼ����븸���̱�&nbsp;
			  <input type="checkbox" name="p_uselist"  value='Y' <%if(v_uselist.equals("Y")){out.println("checked");}%>>Ȩ����������Ʈ���&nbsp;
			  <br>
			  <a href="javascript:popUpPreview()"><img src="/images/admin/button/btn_preview.gif" border="0"></a>
            </td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>�������</strong></td>
            <td height="25" class="table_02_2">
              ���<input type="radio" name="p_use" value='Y' class="input" <%if (v_useyn.equals("Y")){%>checked<%}%>>&nbsp;
              �̻��<input type="radio" name="p_use" value='N' class="input" <%if (v_useyn.equals("N")){%>checked<%}%>>&nbsp;
            </td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2"><input type="text" name="p_adtitle" size = 100 class="input" value='<%= v_adtitle %>' maxlength="80"></td>          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2">
                <p align="left">
				<!-- ���� ��Ƽ�� ������  ���� -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript" for="Wec" event="OnInitCompleted()">document.form1.Wec.TemplateIniURL = "<%=v_tem_url_name%>"; namoActiveInitCompleted("p_adcontent");</script>
                <script language="javascript">object_namoActivepatch('100%','500');</script>
                <!-- ���� ��Ƽ�� ������  ���� -->
            </td>
          </tr>
			  <tr>
		  <td height="25" class="table_title">÷������</td>
            <td class="table_02_2"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="90%">
                  <%
                  Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
                  Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
                  Vector i_fileseqVector     = (Vector)dbox.getObject("d_fileseq");         // ���� �Ϸù�ȣ
                  
                  int    i_fileLimit         = NoticeAdminBean.getFILE_LIMIT();              // ���� ÷�� ���ϼ�
                   
                  %>
                  <%@ include file="/learn/admin/include/za_MultiAttach.jsp" %> 
			      </td>
                  <td width="50">
                  </td>
                </tr>
              </table></td>
		  </tr>
        </table>
        <!----------------- �������� ���� �� ----------------->

        <br>
        <!----------------- ����, ��� ��ư ����----------------->
        <table width="11%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><a href="javascript:insert_check()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
            <td align="center"><a href="javascript:list()"><img src="/images/admin/button/btn_cancel.gif"  border="0"></a></td>
          </tr>
        </table>
        <!----------------- ����, ��� ��ư �� ----------------->
      </td>
  </tr>
</table>

<script language="javascript">

<%if(!v_popup.equals("Y")){%>
        document.form1.p_popsize1.disabled = true;
	    document.form1.p_popsize2.disabled = true;
	    document.form1.p_popposition1.disabled = true;
	    document.form1.p_popposition2.disabled = true;
	    document.form1.p_sdate.disabled = true;
	    document.form1.p_edate.disabled = true;
	    document.form1.p_useframe.disabled = true;
	    document.form1.p_uselist.disabled = true;
<%} else if(!v_useframe.equals("Y")){%>
	    document.form1.p_popsize1.disabled = true;
	    document.form1.p_popsize2.disabled = true;
<% } %>
</script>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
