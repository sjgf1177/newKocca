<%
//**********************************************************
//  1. ��      ��: �系 TUTOR INSERT PAGE
//  2. ���α׷���: za_SaneTutor_I.jsp
//  3. ��      ��: �系 ���� ��� page
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 8. 18
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.tutor.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String v_isgubun    =  box.getString("p_isgubun");
    String p_process    =  "TutorInsert";
    //DEFINED class&variable END

    //����˻� popupâ parameter ����
    String v_pagegubun  = box.getString("p_pagegubun"); //����/��������˻� Popopâ���� ȣ��Ȱ��� value="popup"
    String v_tutorgubun = box.getString("p_tutorgubun");
    String v_searchtext = box.getString("p_searchtext");
    //����˻� popupâ parameter ��

%>

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script language = "javascript" src = "/script/tutor.js"></script>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "javascript">
$(document).ready(function(){
	$("#p_sdate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_ldate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--
    //�ּ�ã��
    function searchPost() {
        window.self.name = "personalInform";
        open_window("openPost","","100","100","367","500","","","","yes","");
        document.form1.target = "openPost";
        document.form1.action='/servlet/controller.library.PostSearchServlet';
        document.form1.p_process.value = 'SearchPostOpenPage';
        document.form1.submit();
    }

    function changedOn(x) {
<!--                //alert("changedOn");-->
<!--            if (x == 1) {-->
<!--                //alert("sane :  "+x);-->
<!--                do_sane();-->
<!--            } -->
<!--            else if (x == 2) {-->
<!--                //alert("saoi :  "+x);-->
<!--                do_saoi();-->
<!--            }-->

        do_sane();
    }

    //�系����,�׷�簭�� �϶� ȭ�� ��ȯ
    function do_sane() {
        //�系���� ==> ���� ȭ������
        //���� �˻� ��ư Disable
        //���̵�/PW Enabled
        //ReadOnly Disable
        srchnm.style.display ='';
        srchid.style.display ='none';
        pwd.style.display ='none';
        addr.style.display ='none';
        chk_readOnly(true);
        document.all.span_userid.innerHTML = "<strong>* ���̵�</strong>";
//          document.all.span_resno.innerHTML = "";
/*
        if (document.form1.p_isgubun[0].checked) {
            document.form1.p_tutorgubun.value = "1";
        } else if (document.form1.p_isgubun[2].checked) {
            document.form1.p_tutorgubun.value = "3";
        }

    */
        //alert(document.form1.p_tutorgubun.value);
        document.form1.p_tutorgubun.value = "1";

        auth();
        value_ini();

    }

    //��ܰ��� ���Ѻ� ȭ�� ��ȯ
    function do_saoi() {
        //��ܰ��� ==> ���� ȭ������
         srchnm.style.display ='none';
         srchid.style.display ='';
         pwd.style.display ='';
         addr.style.display ='';
         chk_readOnly(false);
         document.all.span_userid.innerHTML = "<strong>* ���̵�</strong>";
//           document.all.span_resno.innerHTML = "�ֹε�Ϲ�ȣ";
/*
        if (document.form1.p_isgubun[1].checked) {
            document.form1.p_tutorgubun.value = "2";
        }
*/
        document.form1.p_tutorgubun.value = "2";
         auth();
         value_ini();

<!--                        //�系���� ==> ���� ȭ������-->
<!--            //���� �˻� ��ư Disable-->
<!--            //���̵�/PW Enabled-->
<!--            //ReadOnly Disable-->
<!--            srchnm.style.display ='';-->
<!--            srchid.style.display ='none';-->
<!--            pwd.style.display ='none';-->
<!--            addr.style.display ='none';-->
<!--            chk_readOnly(true);-->
<!--            document.all.span_userid.innerHTML = "<strong>* ���̵�</strong>";-->
<!--//          document.all.span_resno.innerHTML = "";-->
<!--/*-->
<!--            if (document.form1.p_isgubun[0].checked) {-->
<!--                document.form1.p_tutorgubun.value = "1";-->
<!--            } else if (document.form1.p_isgubun[2].checked) {-->
<!--                document.form1.p_tutorgubun.value = "3";-->
<!--            }-->
<!--        -->
<!--        */-->
<!--            //alert(document.form1.p_tutorgubun.value);-->
<!--            document.form1.p_tutorgubun.value = "1";-->
<!--            -->
<!--            auth();-->
<!--            value_ini();-->

    }
    //�Է� �ʵ庰 ���Ѻο�
    function chk_readOnly(gubun) {
        if (gubun) {
            //�系����� �Է��� �� ������ ����
            document.form1.p_userid.readOnly = true;
            document.form1.p_phone.readOnly = true;
            document.form1.p_handphone.readOnly = true;
            document.form1.p_comp.readOnly = true;
            document.form1.p_email.readOnly = true;
            //document.form1.p_jik.readOnly = true;
            document.form1.p_addr.readOnly = true;
            document.form1.p_resno.readOnly = true;
        } else {
            //��ܰ���� �Է��� �� �ֵ��� ����
            document.form1.p_userid.readOnly = false;
            document.form1.p_phone.readOnly = false;
            document.form1.p_handphone.readOnly = false;
            document.form1.p_comp.readOnly = false;
            document.form1.p_email.readOnly = false;
            //document.form1.p_jik.readOnly = false;
            document.form1.p_addr.readOnly = false;
            document.form1.p_resno.readOnly = false;
        }
    }

    //���� �⺻�� ����
    function value_ini() {

        document.form1.p_userid.value = "";
//          document.form1.p_loginid.value = "";
        document.form1.p_loginpw.value = "";
        document.form1.p_idchk.value = "";
        document.form1.p_name.value = "";
        document.form1.p_phone.value = "";
        document.form1.p_handphone.value = "";
        document.form1.p_comp.value = "";
        document.form1.p_compcd.value = "";
        document.form1.p_email.value = "";
        //document.form1.p_jik.value = "";
        document.form1.p_post1.value = "";
        document.form1.p_post2.value = "";
        document.form1.p_addr.value = "";
        document.form1.p_resno.value = "";

    }

    //���Ѻο�
    function auth() {
        ff = document.form1;
        <% if (StringManager.substring(box.getSession("gadmin"),0,1).equals("A") || StringManager.substring(box.getSession("gadmin"),0,1).equals("B")) { %>
        if (ff.p_manager[0].checked) { //���Ѻο�
            term.style.display = '';
            subj.style.display = '';

            //��ܰ���
            if(ff.p_isgubun.value == 1) {
                //loginid.style.display ='none';
            } else {
                //loginid.style.display ='';
            }
        } else {//���� �̺ο�
            term.style.display ='none';
            subj.style.display ='none';
            //loginid.style.display ='none';
        }
        <% } %>

    }

    //������ȸȭ�� �˾�
    function open_window(name, url, left, top, width, height, toolbar, menubar, statusbar, scrollbar, resizable)
    {
        toolbar_str = toolbar ? 'yes' : 'no';
        menubar_str = menubar ? 'yes' : 'no';
        statusbar_str = statusbar ? 'yes' : 'no';
        scrollbar_str = scrollbar ? 'yes' : 'no';
        resizable_str = resizable ? 'yes' : 'no';
        window.open(url, name, 'left='+left+',top='+top+',width='+width+',height='+height+',toolbar='+toolbar_str+',menubar='+menubar_str+',status='+statusbar_str+',scrollbars='+scrollbar_str+',resizable='+resizable_str).focus();
    }

    //��� ��ȸȭ������ �̵�
    function cancel() {
        document.form1.target = "_self";
        document.form1.action = "/servlet/controller.tutor.TutorAdminServlet";
        document.form1.p_process.value = "TutorList";
        document.form1.submit();
    }

    function gubunCheck(){
        document.form1.target = "_self";
        if(document.form1.p_isgubun.value == 1){
            document.form1.action = "/servlet/controller.tutor.TutorAdminServlet";
            document.form1.p_process.value = "SaneTutorInsertPage";
            document.form1.submit();
        }else if(document.form1.p_isgubun.value == 2){
            document.form1.action = "/servlet/controller.tutor.TutorAdminServlet";
            document.form1.p_process.value = "SaoiTutorInsertPage";
            document.form1.submit();
        }
    }

    //����ã��
    function searchSubj() {
        var url = "/servlet/controller.library.SearchServlet?p_process=subjseq&p_gubun=subjnm&p_key1=&p_key2=";
        open_window("",url,"0","0","100","100");
    }

    //���� ��Ī
    function receiveSubj(subj,subjnm){
        var j = document.form1.p_subj.length;
        var f_exist = "";
        for(var i=0;i<j;i++){
            if(document.form1.p_subj.options[i].value==subj){
                f_exist = "Y";
                alert(subjnm+"�� �̹� �����Ǿ� �ֽ��ϴ�");
            }
        }
        if (f_exist != "Y"){
            document.form1.p_subj.options[j] = new Option(subjnm,subj);
            document.form1.p_subj.options[j].selected = true;
        }
    }

    function receiveSubjseq(subj,subjnm,key,year,subjseq){
        var j = document.form1.p_subj.length;
        var f_exist = "";
        var tmp=subj+"/"+year+"/"+subjseq;

        for(var i=0;i<j;i++){
            if(document.form1.p_subj.options[i].value==tmp){
                f_exist = "Y";
                alert(subjnm+"�� �̹� �����Ǿ� �ֽ��ϴ�");
            }
        }
        if (f_exist != "Y"){
            document.form1.p_subj.options[j] = new Option(subjnm,tmp);
            document.form1.p_subj.options[j].selected = true;
        }
    }

    //���� ��Ī���� ����
    function delSubj(){
        for(var i = 0 ;i<document.form1.p_subj.length;i++){
            if(document.form1.p_subj.options[i].selected==true)
                document.form1.p_subj.options[i] = null;
            }
    }

    //�������� ����
    function insert() {
        ff = document.form1;

        /*���� üũ
        if (ff.p_subjclass.value=="") {
            alert("���Ǻо߸� �����ϼ���.");
            return;
        }
        */

    <%  if (StringManager.substring(box.getSession("gadmin"),0,1).equals("A") || StringManager.substring(box.getSession("gadmin"),0,1).equals("B")) { %>
		// ���Ѻο��ÿ��� ����üũ
		if(ff.p_manager[0].checked) {
		    if (ff.p_sdate.value=="") {
		        alert("���ѻ��Ⱓ�� �Է��ϼ���.");
		        return;
		    }
		
		    if (ff.p_ldate.value=="") {
		        alert("���ѻ��Ⱓ�� �Է��ϼ���.");
		        return;
		    }
		
		    if ( ff.p_subj.length == 0 ) {
		        alert("���ǰ����� �������ֽʽÿ�. ");
		        return;
		    }
		}
    <% } %>
		
		if (blankCheck(ff.p_name.value)) {
		    alert("������ �Է��ϼ���!");
		    ff.p_name.focus();
		    return;
		}
		
		if (blankCheck(ff.p_userid.value)) {
		    if(ff.p_isgubun.value == 1) {
		        alert("��������ȸ��ư�� Ŭ���Ͽ� �系���縦 �����ϼ���.");
		    } else {
		        alert("���̵� �Է��ϼ���.");
		    }
		    ff.p_userid.focus();
		    return;
		}

/*
		alert(ff.p_isgubun.value);
		
		if(ff.p_isgubun.value == 2) {
		
		    //��� ����� ���̵� üũ,��й�ȣ�� üũ�Ѵ�.
		        if (ff.p_userid.value=="") {
		            alert("Login ���̵� �Է��ϼ���.")
		            ff.p_userid.focus();
		            return;
		        }
		
		        if(ff.p_isidchk.value == "N"){
		            alert("���̵� �ߺ�üũ�� ���ּ���");
		            ff.p_userid.focus();
		            return;
		        }
		
		        if (ff.p_loginpw.value=="") {
		            alert("��й�ȣ�� �Է��ϼ���.")
		            ff.p_loginpw.focus();
		            return;
		        }
		
		        if (ff.p_loginpw2.value=="") {
		            alert("��й�ȣ�� �Է��ϼ���.")
		            ff.p_loginpw2.focus();
		            return;
		        }
		
		        if (ff.p_loginpw.value!=ff.p_loginpw2.value) {
		            alert("��й�ȣ�� Ȯ���ϼ���.")
		            ff.p_loginpw.focus();
		            return;
		        }
		
		        //�ֹι�ȣ ��ȿ�� üũ
		        //p_userid
		        if (!validPersono(ff.p_resno.value.substring(0,6), ff.p_resno.value.substring(6,13))) {
		
		            ff.p_resno.focus();
		            return;
		        }
		}
*/
		var st_date = make_date(ff.p_sdate.value);
		var ed_date = make_date(ff.p_ldate.value);
		ff.p_fmon.value = st_date;
		ff.p_tmon.value = ed_date;
		
		
		
		//��ܰ���� ���,�з�,�Ҽ��Է� �ʼ�
		//��ܰ���� ��ȭ��ȣ,�̵���ȭ�� �ϳ��� �Է� �ʼ�
		if(ff.p_isgubun.value == 2) {
/*
			if (ff.p_phone.value=='' && ff.p_handphone.value=='') {
			    alert('��ȭ��ȣ �Ǵ� �޴�����ȣ�� �Է��ϼ���.');
			    return;
			}
			
			if (ff.p_comp.value=='') {
			    alert('����Ҽ��� �Է��ϼ���.');
			    ff.p_comp.focus();
			    return;
			}
			
			if (ff.p_academic.value=='') {
			    alert('�з��� �Է��ϼ���.');
			    ff.p_academic.focus();
			    return;
			}
			
			if (ff.p_career.value=='') {
			    alert('����� �Է��ϼ���.');
			    ff.p_career.focus();
			    return;
			}
*/
		}
		
		
		var islimit1 = true;
		var file1 = document.form1.p_file1.value;
		
		
		if(file1!="") {islimit1 = limitFile(file1);}
		if(!islimit1){  return; }
		
		for(i=0;i<document.form1.p_subj.length;i++) {
		    document.form1.p_subj[i].selected = true;
		}
		document.form1.target = "_self";
		document.form1.action = "/servlet/controller.tutor.TutorAdminServlet";
		document.form1.p_process.value = "TutorInsert";
		document.form1.submit();
    }

// �系���� ��������ȸ
function tutor_search() {
    if (blankCheck(document.form1.p_name.value)) {
        alert("������� �Է����ֽʽÿ�. ");
        return;
    }
    window.self.name = "winSelectView";
    open_window("openWinView","","100","100","560","400");
    document.form1.p_mode2.value = document.form1.p_name.value;
    document.form1.target = "openWinView";
    document.form1.action = "/servlet/controller.tutor.TutorAdminServlet";
    document.form1.p_process.value = "SearchTutorOpenPage";
    document.form1.submit();
}

// ȸ�����̵� ��ȸ
function mem_check(){
    var tf = document.form1;

    if(tf.p_userid.value.length == 0){
        alert("���̵� �Է��ϼž� �մϴ�.");
        tf.p_userid.focus();
        return;
    }

    if(!useridCheck(tf.p_userid.value)){
        alert("���̵�  ����, ���ڷ� �Է��ϼž� �մϴ�.");
        tf.p_userid.value="";
        tf.p_userid.focus();
        return;
    }
    else{
        //document.form1.p_process.value   = "usercheck";
        //document.form1.action            = "/servlet/controller.cp.CPCompServlet";
        //document.form1.target            = "chk_frame";
        //document.form1.submit();
        //document.form1.target            = "";

//          window.self.name = "exituserchk";
        //(name, url, left, top, width, height, toolbar, menubar, statusbar, scrollbar, resizable)
        open_window("userchk","","100","100","400","250","no","no","yes","no","no");
        document.form1.target = "userchk";
        document.form1.p_isidchk.value = "Y";
        document.form1.action='/servlet/controller.cp.CPCompServlet';
        document.form1.p_process.value = 'usercheck';
        document.form1.submit();

    }
}

//-->
</script>


<!-- /////////////////////////////////////////////////////////-->
<!--
  ����Ȯ����üũ INCLUDE

  1. page import = "com.credu.system.*" �߰�
  2. �ڹٽ�ũ��Ʈ ȣ��κ� �߰�
    ����)
    //���� Ȯ���� ���͸�
    var islimit = true;
    var file = document.form1.p_file1.value;
    if(file!="") {
        islimit = limitFile(file);    //return�� true/false
    }

    if(islimit) {
        document.form1.submit();
    }else{
        return;
    }

-->
<%@ include file = "/learn/library/fileFilter.jsp" %>
<!-- /////////////////////////////////////////////////////////-->


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" onload="do_sane()">

<form name = "form1" method = "post" enctype ="multipart/form-data">
    <input type="hidden" name="p_process">
    <input type="hidden" name="isgubun" value="1">  <!--isgubun 1 : �系���� -->
    <input type="hidden" name="p_mode1"         value = "name">
    <input type="hidden" name="p_mode2"         value = "">
    <input type="hidden" name="p_compcd"        value = "">
    <input type="hidden" name="p_fmon"          value = "">
    <input type="hidden" name="p_tmon"          value = "">
    <input type="hidden" name="p_pagegubun"     value = "<%=v_pagegubun%>">
    <input type="hidden" name="p_tutorgubun"    value = "<%=v_tutorgubun%>">
    <input type="hidden" name="p_searchtext"    value = "<%=v_searchtext%>">
    <input type="hidden" name="p_ischk"         value= "0">
    <input type="hidden" name="p_isidchk"       value= "N">
    <input type="hidden" name="p_isoverlap"     value= "N">
    <input type="hidden" name="p_isinfo"        value= "N">
    <input type="hidden" name="p_tutorgubun"    value= "">
    <input type="hidden" name="p_grcode"    value= "">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">

       <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/tutor/tit_new_01.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>

        <!----------------- form ���� ----------------->

        <table class="form_table_out" cellspacing="1" cellpadding="0">
          <tr>
            <td>
              <table cellspacing="1" cellpadding="1" class="form_table_bg">


                <%//���Ѻο��� �Ѱ������ڸ� %>
                <%  if (StringManager.substring(box.getSession("gadmin"),0,1).equals("A") || StringManager.substring(box.getSession("gadmin"),0,1).equals("B")) { %>
                <tr>
                    <td width="10%" class="table_title"><b>������ѿ���</b></td>
                    <td class="table_02_2" colspan="5">
                        <input type="radio" name="p_manager" value="Y" onClick="auth();">Yes
                        <input type="radio" name="p_manager" value="N" checked onClick="auth();">No
                    </td>
                </tr>
                <% } else { %>
                    <input type="hidden" name="p_manager" value="N">
                <% } %>

                <!--
                <tr>
                  <td width="15%" valign="middle"> &nbsp;���籸�� :

                    <input type="radio" name="p_isgubun" value="1" checked  onClick="do_sane();">����
                    <input type="radio" name="p_isgubun" value="2" onClick="do_saoi();">����
                    <input type="radio" name="p_isgubun" value="3" onClick="do_sane();">�׷�簭��
                  </td>
                </tr>
                -->

              </table>
            </td>
          </tr>
        </table>

        <!----------------- form �� ----------------->
        <br>
        <!----------------- ������ ���� ----------------->
        <table width="970" border="0" cellpadding="0" cellspacing="1" class="table_out">
			<tr>
				<td colspan="4" class="table_top_line"></td>
			</tr>
		
			<tr>
				<td width="120" class="table_title" align="center"><b>���籸��</b></td>
				<td class="table_02_2" colspan="3">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<select name="p_isgubun" style="width:100" onchange="changedOn(this.value);">
									<option value="1">����</option>
									<option value="2">����</option>
								</select>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		
			<tr style="display:none;">
				<td width="10%" class="table_title" align="center"><b>���Ǻо�</b></td>
				<td  class="table_02_2" colspan="5">
					<%=CodeConfigBean.getCodeGubunSelect ("0039", "", 1, "p_subjclass", "", "", 1)%>
				</td>
			</tr>
		
			<tr id=term style="display: none">
				<td class="table_title" align="center"><b>���ѻ��Ⱓ</b></td>
				<td class="table_02_2" colspan="3">
					<input name="p_sdate" id="p_sdate" class="datepicker_input1" type="text" value=''> ~ <input name="p_ldate" id="p_ldate" class="datepicker_input1" type="text" value=''>
				</td>
			</tr>
		
			<tr>
				<td class="table_title" align="center"><b>* ����</b></td>
				<td class="table_02_2">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td><input name="p_name" type="text" class="input" maxlength="10"></td>
							<td><div id="srchnm">&nbsp;<a href="javascript:tutor_search()"><img src="/images/admin/button/btn_imsearch.gif" border="0"></a></div></td>
						</tr>
					</table>
				</td>
				<td class="table_title" align="center"><span id="span_userid"><strong>* ���̵�</strong></span></td>
				<td class="table_02_2">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td><input name="p_userid" type="text" class="input" maxlength="13" readonly></td>
							<td><div id="srchid">&nbsp;<a href="javascript:mem_check()"><img src="/images/admin/button/btn_idcheck.gif" border="0"></a><input type="hidden" name="p_idchk" value="false"></div></td>
						</tr>
					</table>
				</td>
			</tr>
		
			<tr id="pwd" style="display: none">
				<td class="table_title" align="center"><strong>* ��й�ȣ</strong></td>
				<td class="table_02_2"> <input name="p_loginpw" type="password" class="input" maxlength="20"></td>
				<td class="table_title" align="center"><strong>* ��й�ȣ Ȯ��</strong></td>
				<td class="table_02_2"><input name="p_loginpw2" type="password" class="input" maxlength="20"></td>
			</tr>
		
			<tr>
				<td class="table_title" align="center"><strong>�ֹε�Ϲ�ȣ</strong></td>
				<td class="table_02_2"> <input name="p_resno" type="text" class="input" maxlength="13" onkeyup="numeric_chk(this)">(- ����)</td>
				<td class="table_title" align="center"><b>E-mail</b></td>
				<td class="table_02_2"><input name="p_email" type="text" class="input" maxlength="40" readonly onkeyup="isValidEmail(this)"></td>
			</tr>
			
			<tr>
				<td class="table_title" align="center"><b>��ȭ��ȣ</b></td>
				<td class="table_02_2"><input name="p_phone" type="text" class="input" maxlength="13" readonly></td>
				<td class="table_title" align="center"><b>�޴���</b></td>
				<td class="table_02_2"> <input name="p_handphone" type="text" class="input" maxlength="13" readonly></td>
			</tr>
		
			<tr>
				<td class="table_title" align="center"><b>�ּ�</b></td>
				<td class="table_02_2" colspan="3">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<input type="text" name="p_post1" value="" size="4" maxlength="3" class="input" readonly> - <input type="text" name="p_post2" value=""  size="4" maxlength="3" class="input" readonly>
							</td>
							<td id=addr style="display: none"><a href="javascript:searchPost()"><img src="/images/admin/button/btn_address.gif" border="0"></a></td>
						</tr>
						<tr>
							<td colspan="2">
								<input name="p_addr" type="text" class="input" maxlength="50" size="50"><br>
								<input name="p_addr2" type="text" class="input" maxlength="50" size="50">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		
		
			<tr>
				<td class="table_title" align="center"><b>����Ҽ�</b></td>
				<td class="table_02_2" colspan = "3"><input name="p_comp" type="text" class="input" maxlength="40" readonly></td>
			</tr>
		
			<tr id=subj style="display: none">
				<td class="table_title" align="center"><b>���ǰ���</b></td>
				<td class="table_02_2" colspan="3">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<select name="p_subj" size=4  multiple></select> <a href="javascript:searchSubj()"><img src="/images/admin/button/btn_csearch.gif" border="0"></a><a href="javascript:delSubj()"><img src="/images/admin/button/btn_cdelete.gif" border="0"></a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		
			<tr>
				<td class="table_title" align="center"><b>����Ұ���</b></td>
				<td class="table_02_2" colspan="3"> <textarea name="p_intro" style="height:80"></textarea></td>
			</tr>
		
			<tr>
				<td class="table_title" align="center"><b>�з»���</b></td>
				<td class="table_02_2" colspan="3"> <textarea name="p_academic" style="height:80"></textarea></td>
			</tr>
		
			<tr>
				<td class="table_title" align="center"><b>��»���</b></td>
				<td class="table_02_2" colspan="3"> <textarea name="p_career" style="height:80"></textarea></td>
			</tr>
		
			<tr>
				<td class="table_title" align="center"><b>����</b></td>
				<td class="table_02_2" colspan="3"><textarea name="p_book" style="height:80"></textarea></td>
			</tr>
		
			<tr>
				<td class="table_title" align="center"><b>��������</b></td>
				<td class="table_02_2" colspan="3"><input name="p_file1" type="file" class="input" maxlength="100" size="93" tabindex=65></td>
			</tr>
		</table>
        <!----------------- ������ �� ----------------->
        <br>
        <!----------------- ���, ��� ��ư ����----------------->
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center" class="ms"><a href="javascript:insert()"><img src="/images/admin/button/btn_apply.gif" border="0"></a></td>
            <td width=8></td>
            <td align="center" class="ms"><a href="javascript:cancel()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
          </tr>
        </table>
        <!----------------- ���, ��� ��ư ��----------------->
        <br>
        <br>
      </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>

