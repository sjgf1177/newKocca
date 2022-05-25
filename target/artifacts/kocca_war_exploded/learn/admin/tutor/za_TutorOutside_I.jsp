<%
//**********************************************************
//  1. ��      ��: ��� TUTOR INSERT PAGE
//  2. ���α׷���: za_SaoiTutor_I.jsp
//  3. ��      ��: ��� ���� ��� page
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 15
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.tutor.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String v_isgubun    =  box.getString("p_isgubun");
    String  p_process   =  box.getString("p_process");
    String  p_chkgubun  =  box.getStringDefault("p_chkgubun","2");

    String p_userid  = box.getString("p_userid");
    //DEFINED class&variable END
    FormatDate fd = new FormatDate();
    String v_sysyear = fd.getDate("yyyy");

%>
<html>
<head>
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
<script language = "javascript" src = "/script/cresys_lib.js"></script>
    <script LANGUAGE='JavaScript' SRC='/magicweblight/mwl_func.js'></SCRIPT>
    <script language = "javascript">
    $(document).ready(function(){
    	$("#p_firstmon").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    	$("#p_endmon").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    });
    <!--
		function  CheckJumin (arg_jumin_number)
		{
		    var valid = arg_jumin_number;
		    var total = 0;
		    var conn=1;
		
		    for( var i=1; i <=12 ; i++) {
		        if( i<= 8 ) {
		            total += (parseInt(valid.substring(i-1,i)) * (i+1))
		        }
		        else {
		            total += parseInt(valid.substring(i-1,i)) * (i-7)
		        }
		    }    
		
		    total %= 11
		    total = 11 - total
		
		    if( (total == 11) || (total == 10)) {
		        total -= 10
		    }
		 
		    if ( total != valid.substring(12,13) )  return  false
		    else                                    return  true
		}
        function open_window(name, url, left, top, width, height, toolbar, menubar, statusbar, scrollbar, resizable)
        {
            toolbar_str = toolbar ? 'yes' : 'no';
            menubar_str = menubar ? 'yes' : 'no';
            statusbar_str = statusbar ? 'yes' : 'no';
            scrollbar_str = scrollbar ? 'yes' : 'no';
            resizable_str = resizable ? 'yes' : 'no';
            window.open(url, name, 'left='+left+',top='+top+',width='+width+',height='+height+',toolbar='+toolbar_str+',menubar='+menubar_str+',status='+statusbar_str+',scrollbars='+scrollbar_str+',resizable='+resizable_str).focus();
        }

        function searchPost() {
            window.self.name = "personalInform";
            open_window("openPost","","100","100","367","500","","","","yes","");
            document.form1.target = "openPost";
			document.form1.action='/servlet/controller.library.PostSearchServlet';
            document.form1.p_process.value = 'SearchPostOpenPage';
            document.form1.submit();
        }

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

        function searchSubj() {
            var url = "/servlet/controller.library.SearchServlet?p_process=subj&p_gubun=subjnm&p_key1=&p_key2=";
            open_window("",url,"0","0","100","100");
        }

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

        function delSubj(){
            for(var i = 0 ;i<document.form1.p_subj.length;i++){
                if(document.form1.p_subj.options[i].selected==true)
                    document.form1.p_subj.options[i] = null;
                }
        }

        function insert() {
            if (blankCheck(document.form1.p_name.value)) {
                alert("������ �Է��ϼ���!");
                document.form1.p_name.focus();
                return;
            }
            if(blankCheck(document.form1.p_email.value)) {
            	alert("�̸����� �Է��ϼ���");
            	document.form1.p_email.focus();
            	return;
            }
            if(!isValidEmail(form1.p_email)) {
            	alert("�ùٸ� �̸��� ������ �ƴմϴ�.");
            	document.form1.p_email.focus();
            	return;
            }
          
            if(!CheckJumin(document.form1.p_resno.value)){
                alert("�ֹι�ȣ ������ Ʋ�Ƚ��ϴ�.");
            	document.form1.p_resno.focus();
            	return;
            }

            var gubun = "";
            for(var i=0;i<document.form1.length;i++){
            	if(document.form1.elements[i].name == "p_isgubuntype"){
	            	if(document.form1.elements[i].checked == true ){
	            		gubun = document.form1.elements[i].value;
	            	}
            	}
            }

            if (blankCheck(document.form1.p_resno.value) && gubun !="1") {
                alert("�ֹε�Ϲ�ȣ�� �Է��ϼ���!");
                document.form1.p_resno.focus();
                return;
            }
            if (blankCheck(document.form1.p_careeryear.value)) {
                document.form1.p_careeryear.value = "0";
            }
            if(document.form1.p_file1.value.length > 0 ){
	        	if(chkFile() == false){
	        		return;
	        	}
	        }
/*
            if ( document.form1.p_subj.length == 0 ) {
                alert("���ǰ����� �������ֽʽÿ�. ");
                return;
            }
*/
			var sresult = Encrypt(document.form1.p_resno.value);
			if(sresult !=0){
				alert('�ֹι�ȣ ��ȣȭ ����');
				return;
			}
			
			var EncData = document.MWLSubmit.GetEncData;
			
            for(i=0;i<document.form1.p_subj.length;i++) {
                document.form1.p_subj[i].selected = true;
            }

            document.form1.p_resno.value = EncData;
            document.form1.p_fmon.value = make_date(document.form1.p_firstmon.value);
            document.form1.p_tmon.value = make_date(document.form1.p_endmon.value);
            document.form1.target = "_self";
            document.form1.action = "/servlet/controller.tutor.TutorAdminServlet?p_file=1";
            document.form1.p_process.value = "TutorInsert";
            document.form1.submit();
        }
        function whenSearch(){

        	if(document.form1.p_name.value == ""){
        		alert("�˻��� ������ �Է��ϼ���.");
        		return;
        	}
        	window.self.name = "search";
            open_window("memsearch","","100","100","600","500","yes","","","yes","");
            document.form1.target = "memsearch";
            document.form1.action='/servlet/controller.tutor.TutorAdminServlet';
            document.form1.p_process.value = 'TutorMemSearch';
            document.form1.submit();
        }
        function whenChgubun(gubun){
        	if(gubun == "1"){
        		v_process = "TutorInsertPage";
        	}else{
        		v_process = "TutorOutsideInsertPage";
        	}

    		document.form1.action='/servlet/controller.tutor.TutorAdminServlet';
    		document.form1.p_process.value = v_process;
    		document.form1.p_chkgubun.value = gubun;
    		document.form1.submit();

        }
        function whenOnload(){

        	for(var i=0;i<document.form1.p_isgubuntype.length;i++){
        		var v_gubun = document.form1.p_isgubuntype[i].value;

        		if(document.form1.p_chkgubun.value == v_gubun){
        			document.form1.p_isgubuntype[i].checked = true;
        		}
        	}
        }
         function chkFile(){
		   	extArray = new Array(".jpg", ".gif"); // ���ε� �� �� �ִ� ���� Ȯ���ڸ� ���� �մϴ�
			allowSubmit = false;

			var file = document.form1.p_file1.value;
			if (!file) return true;

				var first = file.lastIndexOf(".") ;
				ext = file.substring(first, file.length).toLowerCase() ;

				for (var i = 0; i < extArray.length; i++) {
					if (extArray[i] == ext) { allowSubmit = true; break; }
				}


			if (allowSubmit){ return true;
			}else{
				alert("���ε� ������ ������  " + (extArray.join("  ")) + "   �Դϴ�\n\n�ٽ� ���� �� �ּ���");
				return false;
			}
	   }
    -->
    </script>
</head>



<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" onLoad="whenOnload();">
<form name = "form1" method = "post" enctype = "multipart/form-data">
<!-- <form name = "form1" method = "post"> -->
<input type="hidden" name="p_process">
<input type="hidden" name="isgubun" value="2">  <!--isgubun 2 : ��ܰ��� -->
<input type="hidden" name="p_chkgubun" value="<%=p_chkgubun%>">
<input type="hidden" name="p_fmon" value="">
<input type="hidden" name="p_tmon" value="">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">

            <!----------------- title ���� ----------------->
      <br>
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="40"><img src="/images/admin/common/lms_titlebg01.gif" width="40" height="37"></td>
          <td width="170" background="/images/admin/common/lms_titlebg02.gif" style="padding-top:5" class="head_title">
         Ʃ�� ���
          </td>
          <td background="/images/admin/common/lms_titlebg03.gif">&nbsp;</td>
        </tr>
      </table>
      <!----------------- title �� --------------- -->
      <br>

    
        <br>
        <br>
        <!----------------- ������ ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="3" class="table_top_line"></td>
          </tr>
           <tr>
            <td class="table_title"><b>���籸��</b></td>
            <td class="table_02_2" colspan="2">
              <input type="radio" name="p_isgubuntype" value="1" onClick = "javascript:whenChgubun('1');" >
              �系
              <input type="radio" name="p_isgubuntype" value="2" onClick = "javascript:whenChgubun('2');" >
              ���
              </td>
          </tr>
 <tr>
            <td class="table_title" width="18%"><b>������� ��뿩��</b></td>
            <td class="table_02_2">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>
                    <select name="p_manager">
                    	<option value = "Y">Y</option>
                    	<option value = "N">N</option>
                    </select>
                    ���Ⱓ : <input name="p_firstmon" id="p_firstmon" type="text" class="datepicker_input1" size="10" value="<%=FormatDate.getFormatDate(v_sysyear+"0101","yyyy-MM-dd")%>">
                     ~ <input name="p_endmon" id="p_endmon" type="text" class="datepicker_input1" size="10" value="<%=FormatDate.getFormatDate(v_sysyear+"1231","yyyy-MM-dd")%>">

                  </td>
                </tr>
              </table>
            </td>
          </tr>

          <tr>
            <td class="table_title" width="18%"><b>����</b></td>
            <td class="table_02_2">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>
                    <input name="p_name" type="text" class="input" size="10" maxlength="10"  >
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td class="table_title"><strong>ID</strong></td>
            <td class="table_02_2">
              �ڵ�������
            </td>
          </tr>
          <tr>
            <td class="table_title"><strong>����</strong></td>
            <td class="table_02_2">
              <input type="radio" name="p_gender" value="1" checked>
              ����
              <input type="radio" name="p_gender" value="2">
              ���� </td>
          </tr>
          <tr>
            <td class="table_title"><strong>�ֹε�Ϲ�ȣ</strong></td>
            <td class="table_02_2">
              <input name="p_resno" type="text" class="input" size="13" maxlength="13" > ('-'���� �Է��ϼ���.)
            </td>
          </tr>

          <tr>
            <td class="table_title"><b>��ȭ��ȣ</b></td>
            <td class="table_02_2" colspan="2">
              <input name="p_phone1" type="text" class="input" size="20" maxlength="50" value="0">
            </td>
          </tr>


          <tr>
            <td class="table_title"><b>�޴�����ȣ</b></td>
            <td class="table_02_2" colspan="2">
              <input name="p_handphone1" type="text" class="input" size="5" maxlength="3" value="0">
              -
              <input name="p_handphone2" type="text" class="input" size="5" maxlength="4">
              -
              <input name="p_handphone3" type="text" class="input" size="5" maxlength="4">
            </td>
          </tr>

          <tr>
            <td class="table_title"><b>E-mail</b></td>
            <td class="table_02_2" colspan="2">
              <input name="p_email" type="text" class="input" size="50" maxlength="50">
            </td>
          </tr>

          <tr>
            <td class="table_title"><b>�Ҽӱ��</b></td>
            <td class="table_02_2" colspan="2">
              <input name="p_comp" type="text" class="input" size="40">
            </td>
          </tr>

          <tr>
            <td class="table_title"><b>�μ�</b></td>
            <td class="table_02_2" colspan="2">
              <input name="p_dept" type="text" class="input" size="40">
            </td>
          </tr>


          <tr>
            <td class="table_title"><b>��å</b></td>
            <td class="table_02_2" colspan="2">
              <input name="p_jik" type="text" class="input" size="20">
            </td>
          </tr>

          <tr>
            <td class="table_title"><b>���ǰ���</b></td>
            <td class="table_02_2" colspan="2">

              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>
                    <select name="p_subj" size=4  multiple></select>
                    <a href="javascript:searchSubj()"><img src="/images/admin/tutor/search3_butt.gif" width="58" height="18" border="0"></a>
                    <a href="javascript:delSubj()"><img src="/images/admin/tutor/course_del_butt.gif" width="58" height="18" border="0"></a>
                    </td>
                </tr>
              </table>

            </td>
          </tr>


          <tr>
            <td class="table_title"><b>�����о�</b></td>
            <td class="table_02_2" colspan="2">
              <!--%=CodeConfigBean.getCodeSelect("tutorProfessional","p_professional","")%-->
              <input type="text" class="input" size="30" name="p_professional">
            </td>
          </tr>


          <tr>
            <td class="table_title"><b>�����з�</b></td>
            <td class="table_02_2" colspan="2">
              <input type="text" class="input" size="30" name="p_academic">
            </td>
          </tr>


          <tr>
            <td class="table_title"><b>����</b></td>
            <td class="table_02_2" colspan="2">
              <input type="text" class="input" size="30" name="p_major">
            </td>
          </tr>

           <input type="hidden" name="p_iscyber" value="2">
          <tr>
            <td class="table_title"><b>������</b></td>
            <td class="table_02_2" colspan="2">
              <input type="text" class="input" size="5" name="p_careeryear" value="0" maxlength="2"> ��
            </td>
          </tr>


          <tr>
            <td class="table_title"><b>�ڰ���</b></td>
            <td class="table_02_2" colspan="2">
              <input type="text" class="input" size="40" name="p_license">
            </td>
          </tr>


          <tr>
            <td class="table_title"><b>��»���</b></td>
            <td class="table_02_2" colspan="2">
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <td height="25"> �� �� �� : <br>
                    <textarea name="p_career" cols="110"></textarea>
                  </td>
                </tr>
                <tr><td height="8"></td></tr>
                <tr>
                  <td height="25">�� �� �� :<br>
                    <textarea name="p_book" cols="110"></textarea>
                  </td>
                </tr>
                <tr><td height="8"></td></tr>
                <tr>
                  <td height="25">�� �� Ÿ : <br>
                    <textarea name="p_etc" cols="110"></textarea>
                  </td>
                </tr>
              </table>
            </td>
          </tr>

          <tr>
            <td class="table_title"><b>��������÷��</b></td>
            <td class="table_02_2" colspan="2">

              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="100%">
                    <input type="file" class="input" size="18" name="p_file1">
                  </td>
                </tr>
              </table>

            </td>
          </tr>


        </table>
        <!----------------- ������ �� ----------------->
        <br>
        <!----------------- ���, ��� ��ư ����----------------->
        <table width="11%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center" class="ms"><a href="javascript:insert()"><img src="/images/admin/tutor/record2_butt.gif" width="37" height="18" border="0"></a></td>
            <td align="center" class="ms"><a href="javascript:cancel()"><img src="/images/admin/tutor/cancel2_butt.gif" width="37" height="18" border="0"></a></td>
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
</html>
