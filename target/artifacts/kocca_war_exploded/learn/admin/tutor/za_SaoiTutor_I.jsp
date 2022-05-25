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
    String  p_process   =  "TutorInsert";
    //DEFINED class&variable END
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
    <script language = "javascript" src = "/script/cresys_lib.js"></script>
    <script language = "javascript">
    <!--
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
            if (blankCheck(document.form1.p_userid.value)) {
                alert("�ֹε�Ϲ�ȣ�� �Է��ϼ���!");
                document.form1.p_userid.focus();
                return;
            }
            if (blankCheck(document.form1.p_careeryear.value)) {
                document.form1.p_careeryear.value = "0";
            }
/*
            if ( document.form1.p_subj.length == 0 ) {
                alert("���ǰ����� �������ֽʽÿ�. ");
                return;
            }
*/
            for(i=0;i<document.form1.p_subj.length;i++) {
                document.form1.p_subj[i].selected = true;
            }
            document.form1.target = "_self";
            document.form1.action = "/servlet/controller.tutor.TutorAdminServlet?p_file=1";
            document.form1.p_process.value = "TutorInsert";
            document.form1.submit();
        }
		
		function whenSelection() {
		    document.form1.p_process.value = 'SaoiTutorInsertPage';
			//��з� ���ý� �ߺз��� ALL�� �ʱ�ȭ
			//document.form1.s_middleclass.value = '';
		    document.form1.submit();
		}  
    -->
    </script>
</head>



<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post" enctype = "multipart/form-data">
<!-- <form name = "form1" method = "post"> -->
<input type="hidden" name="p_process">
<input type="hidden" name="isgubun" value="2">  <!--isgubun 2 : ��ܰ��� -->
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/tutor/t_title01.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->

      <br>

        <!----------------- form ���� ----------------->
        <table class="form_table_out" cellspacing="0" cellpadding="3">
          <tr>
            <td bgcolor="#C6C6C6" align="center">

              <table cellspacing="0" cellpadding="0" class="form_table_bg">
                <tr>
                  <td height="7" width="99%" colspan="2"></td>
                </tr>
                <tr>
                  <td width="15%" valign="middle"> &nbsp;���籸�� :
                    <select name="p_isgubun" onChange="javascript:gubunCheck()">
                      <option value="1" <% if(v_isgubun.equals("1")){ %> selected <%} %>>�系����</option>
                      <option value="2" <% if(v_isgubun.equals("2")){ %> selected <%} %>>��ܰ���</option>
                    </select>
                  </td>
                  <td valign="middle"> <!--�����׷� : --><%//= TutorAdminBean.getGrcodeSelect("p_grcode","",1) %>
                  </td>
                </tr>
                <tr>
                  <td height="7" width="99%" colspan="2"></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <!----------------- form �� ----------------->
        <br>
        <br>
        <!----------------- ������ ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="3" class="table_top_line"></td>
          </tr>
          <tr> 
            <td class="table_title"><b>���Ǻо�</b></td>
            <td class="table_02_2"><%= SelectSubjBean.getUpperClass(box, true, true, false)%> 
              <!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  -->
              <%= SelectSubjBean.getMiddleClass(box, false, true, false)%> 
              <!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  -->
            </td>
          </tr>
          <tr> 
            <td class="table_title"><b>������ѿ���</b></td>
            <td class="table_02_2"> <input type="radio" name="p_manager" value="Y">
              Yes 
              <input type="radio" name="p_manager" value="N" checked>
              No</td>
          </tr>
          <tr>
            <td class="table_title"><b>�����ID</b></td>
            <td class="table_02_2"><input name="p_name2" type="text" class="input" size="20" maxlength="20">
			&nbsp;<a href="javascript:tutor_search()"><img src="/images/admin/button/b_searchb.gif" border="0"></a>
            </td>
          </tr>
          <tr> 
            <td class="table_title" width="18%"><b>����</b></td>
            <td class="table_02_2"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td> <input name="p_name" type="text" class="input" size="20" maxlength="20"> 
                  </td>
                </tr>
              </table></td>
          </tr>
          <!--tr>
            <td class="table_title"><strong>����</strong></td>
            <td class="table_02_2">
              <input type="radio" name="p_sex" value="1" checked>
              ����
              <input type="radio" name="p_sex" value="2">
              ���� </td>
          </tr-->
          <tr> 
            <td class="table_title"><strong>�ֹε�Ϲ�ȣ</strong></td>
            <td class="table_02_2"> <input name="p_userid" type="text" class="input" size="13" maxlength="13">
              ('-'���� �Է��ϼ���.) </td>
          </tr>
          <tr> 
            <td class="table_title" rowspan='2'> <b>�ּ�</b></td>
            <td class="table_02_2"> <input type="text" name="p_post1" size="3" value="" maxlength="3" class="input" readonly>
              - 
              <input type="text" name="p_post2" size="3" value=""  maxlength="3" class="input" readonly> 
              &nbsp;<a href="javascript:searchPost()"><img src="/images/admin/button/btn_address.gif" border="0"></a> 
            </td>
          </tr>
          <tr> 
            <td class="table_02_2"> <input name="p_addr" type="text" class="input" size="50"> 
            </td>
          </tr>
          <tr> 
            <td class="table_title"><b>��ȭ��ȣ</b></td>
            <td class="table_02_2" colspan="2"> <input name="p_phone" type="text" class="input" size="20" maxlength="20">
            </td>
          </tr>
          <tr> 
            <td class="table_title"><b>�޴�����ȣ</b></td>
            <td class="table_02_2" colspan="2"> <input name="p_handphone" type="text" class="input" size="20" maxlength="20">
            </td>
          </tr>
          <tr> 
            <td class="table_title"><b>E-mail</b></td>
            <td class="table_02_2" colspan="2"> <input name="p_email" type="text" class="input" size="50" maxlength="50"> 
            </td>
          </tr>
          <tr> 
            <td class="table_title"><b>�Ҽ�</b></td>
            <td class="table_02_2" colspan="2"> <input name="p_comp" type="text" class="input" size="40"> 
            </td>
          </tr>
          <tr> 
            <td class="table_title"><b>�μ�</b></td>
            <td class="table_02_2" colspan="2"> <input name="p_dept" type="text" class="input" size="40"> 
            </td>
          </tr>
          <tr> 
            <td class="table_title"><b>����</b></td>
            <td class="table_02_2" colspan="2"> <input name="p_jik" type="text" class="input" size="20"> 
            </td>
          </tr>
          <!--tr>
            <td class="table_title"><b>���籸��</b></td>
            <td class="table_02_2" colspan="2">
              <input type="radio" name="p_isgubuntype" value="1"d>
              ����
              <input type="radio" name="p_isgubuntype" value="2" checked>
              Part Time
              <input type="radio" name="p_isgubuntype" value="3">
              ��������
              <input type="radio" name="p_isgubuntype" value="4">
              ��Ÿ</td>
          </tr-->
          <tr> 
            <td class="table_title"><b>���ǰ���</b></td>
            <td class="table_02_2" colspan="2"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td> <select name="p_subj" size=4  multiple>
                    </select> <a href="javascript:searchSubj()"><img src="/images/admin/button/btn_csearch.gif" border="0"></a> 
                    <a href="javascript:delSubj()"><img src="/images/admin/button/btn_cdelete.gif" border="0"></a> 
                  </td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td class="table_title"><b>����Ұ���</b></td>
            <td class="table_02_2" colspan="2"> <textarea name="p_intro" cols="110" style="height:80"></textarea> 
            </td>
          </tr>
          <tr> 
            <td class="table_title"><b>�з»���</b></td>
            <td class="table_02_2"> <textarea name="p_academic" cols="110" style="height:80"></textarea> 
            </td>
          </tr>
          <tr> 
            <td class="table_title"><b>��»���</b></td>
            <td class="table_02_2"> <textarea name="p_career" cols="110" style="height:80"></textarea> 
            </td>
          </tr>
          <tr> 
            <td class="table_title"><b>����</b></td>
            <td class="table_02_2"> <textarea name="p_book" cols="110" style="height:80"></textarea> 
            </td>
          </tr>
          <tr> 
            <td class="table_title"><b>�����</b></td>
            <td class="table_02_2"> <input type="text" class="input" size="15" name="p_charge">
              ��</td>
          </tr>
          <tr> 
            <td class="table_title"><b>����Ұ�����</b></td>
            <td class="table_02_2" height="16" colspan="2"> <input type="radio" name="p_isinfo" value="Y">
              Yes 
              <input type="radio" name="p_isinfo" value="N" checked>
              No (üũ�� Ȩ������ ����Ұ��� ��Ÿ���ϴ�.)</td>
          </tr>
        </table>
        <!----------------- ������ �� ----------------->
        <br>
        <!----------------- ���, ��� ��ư ����----------------->
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><a href="javascript:insert()"><img src="/images/admin/button/btn_apply.gif" border="0"></a></td>
			<td width=8></td>
            <td><a href="javascript:cancel()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
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
