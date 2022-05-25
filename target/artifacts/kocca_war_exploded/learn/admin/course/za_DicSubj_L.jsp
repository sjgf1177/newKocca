
<%
//**********************************************************
//  1. ��      ��: ������(�Ϲ�)
//  2. ���α׷���: za_DicSubj_L.jsp
//  3. ��      ��: ������(�Ϲ�) ����Ʈ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 9. 1
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.lang.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process       = box.getString("p_process");
    String  v_searchtext    = box.getString("p_searchtext");
    String ss_upperclass    = box.getString("s_upperclass");    // �����з�
    String ss_middleclass   = box.getString("s_middleclass");   // �����з�
    String ss_lowerclass    = box.getString("s_lowerclass");    // �����з�
    

	//2005.12.05_�ϰ��� : ������ ����
	String  ss_grcode       = box.getString("s_grcode");          //�����׷�
	String ss_subj          = box.getString("s_grcode");    // �����ڵ�

    int     v_seq      = 0;
    String  v_subjcode = "";
    String  v_subjnm   = "";
    String  v_words    = "";
    String  v_descs    = "";
    String  v_groups   = "";

    ArrayList list = (ArrayList)request.getAttribute("selectList");
    
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���

%>

<html>
<head>
<title>::: ������ :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    // ����
    function modify_dic(subj, seq) {
        document.form1.action = "/servlet/controller.course.DicSubjAdminServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.p_subj.value = subj;
        document.form1.p_seq.value  = seq;
        document.form1.submit();
    }

    // ����
    function delete_dic(subj, seq) {
        if(confirm('�����Ͻðڽ��ϱ�?')){
            document.form1.p_searchtext.value = "";
            document.form1.action = "/servlet/controller.course.DicSubjAdminServlet";
            document.form1.p_process.value = "delete";
            document.form1.p_subj.value = subj;
            document.form1.p_seq.value  = seq;            
            document.form1.submit();
        }
    }
    
    // ��ȸ
    function whenSelection(p_action) 
	{
		if (p_action == 'go') 
		{
			if (document.form1.s_grcode.value == '----' )
			{
			  alert("�����׷��� �����ϼ���.");
			  return;
			}
		}
            
        document.form1.target = "_self";
        document.form1.action='/servlet/controller.course.DicSubjAdminServlet';
        document.form1.p_process.value = 'select';
        document.form1.submit();
    }

    // �󼼺���
    function view(subj,seq) {
    	document.form1.target = "_self";
        document.form1.action = "/servlet/controller.course.DicSubjAdminServlet";
        document.form1.p_subj.value  = subj;
        document.form1.p_seq.value   = seq;
        document.form1.p_process.value = "selectView";
        document.form1.submit();
    }

    // ���
    function insert() {
        if (document.form1.s_grcode.value == '----' ){
          alert("�����׷��� �����ϼ���.");
          return;
        }
		
		document.form1.target = "_self";
        document.form1.p_subj.value  = document.form1.s_grcode.value;
        document.form1.action = "/servlet/controller.course.DicSubjAdminServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }

    // �̸�����(������� ������ ����)
    function preview(subj) {
        if (document.form1.s_grcode.value == '----' ){
          alert("�����׷��� �����ϼ���.");
          return;
        }

        window.self.name = "winSelectView";
        farwindow = window.open("", "openWinDic", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no, width = 900, height = 600, top=0, left=0");
        document.form1.target = "openWinDic";
		//document.form1.action = "/servlet/controller.course.DicSubjServlet";
		document.form1.action = "/servlet/controller.study.DicSubjStudyServlet";
        document.form1.p_subj.value  = subj;
		document.form1.p_process.value = "selectListPre";
		document.form1.submit();

        farwindow.window.focus();
        document.form1.target = window.self.name;
    }

	//���Ĺٲٱ�
    function whenOrder(column) {
	if (document.form1.p_orderType.value == " asc") {
		document.form1.p_orderType.value = " desc";
	} else {
		document.form1.p_orderType.value = " asc";
	}

    document.form1.p_orderColumn.value = column;
    
	whenSelection('go');

}

//�������ε�
function excelupload() {
        
  ff = document.form1;

  if   (ff.s_grcode.value  ==   ''  ||   ff.s_grcode.value  ==   'ALL' ||   ff.s_grcode.value  ==   '----'){
      alert("UPLOAD�� �����׷��� �����ϼ���."); return; 
  }
       
  ff.s_subjnm.value = ff.s_grcode.options[ff.s_grcode.selectedIndex].text;	

  window.self.name = "winDicExcel";
  window.open("", "openDicExcel", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes, resizable=yes,copyhistory=no, width=800, height=600, top=0, left=0");
  document.form1.target = "openDicExcel";
  document.form1.action = "/servlet/controller.course.DicSubjAdminServlet";
  document.form1.p_process.value = "ExcelUploadPage";

  document.form1.submit();
}

//�˻�â���� enter key������
	function press_enter(e) { 
		if (e.keyCode =='13'){  whenSelection('go');  }
	}
//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process"     value = "<%= v_process %>">
    <input type = "hidden" name = "p_subj"        value = "">
    <input type = "hidden" name = "p_seq"         value = "">
    <input type = "hidden" name = "s_subjnm"      value = "">
    <input type = "hidden" name = "p_flagpreview" value = "Y">
    <input type="hidden" name="p_orderColumn">
	<input type="hidden" name="p_orderType" value="<%=v_orderType%>">


  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 


      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title02.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->

        <br>
        <!----------------- form ���� ----------------->
        <table class="form_table_out" cellspacing="0" cellpadding="1">
          <tr> 
            <td align="center"> 
              <table class="form_table_bg" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="7"></td>
                </tr>
                <tr> 
                  <td align="left"> &nbsp;

<!--  ���� �з� ����  ���� 
				  <%= SelectSubjBean.getUpperClass(box, true, true, true)%><!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  
				  <%= SelectSubjBean.getMiddleClass(box, true, true, true)%><!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  
				  <%= SelectSubjBean.getLowerClass(box, true, true, true)%><!-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    �����Һз� 
				  <font color="red">��</font> <%= SelectSubjBean.getSubj(box, true, false)%><!-- getSubj(RequestBox, isChange, isALL)    ����  -->
<!--  �����з� ����  �� -->
<!-- �����׷� ���� -->
	<%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
<!-- �����׷� ���� -->

                  </td>
                </tr>
                <tr> 
                  <td height="9"></td>
                </tr>
                <tr> 
                  <td align="center"> 
                    <table class="form_table" width="99%" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="24%"> &nbsp;&nbsp;&nbsp;��� 
                          <input name="p_searchtext" type="text" class="input" value="<%=v_searchtext%>" onkeypress="press_enter(event)">
                        </td>
                        <td width="4%"><a href="javascript:whenSelection('go')"><img src="/images/admin/button/b_go.gif" border="0"></a></td>
                        <td width="79%">(�Է°� ���� ��ȸ�� ������ ��ü�� �� �� �ֽ��ϴ�.)</td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr> 
                  <td height="7"></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <!----------------- form �� ----------------->

        <br>
        <br>
        <!----------------- �̸�����, �߰� ��ư ���� ----------------->
        <table width="97%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="929" height="20" align="right"><a href="javascript:preview('<%=ss_subj%>')"><img src="/images/admin/button/btn_preview.gif" border="0"></a></td>
			<td width=9></td>
            <td align="right" height="20" width="32"><a href="javascript:insert()"><img src="/images/admin/button/btn_add.gif" border="0"></a></td>
            <td width=9></td>
            <td align="right" height="20" width="32"><a href="javascript:excelupload()"><img src="/images/admin/button/btn_excelupload.gif" border="0"></a></td>
          </tr>
          <tr> 
            <td height="3"></td>
          </tr>
        </table>
        <!----------------- �̸�����, �߰� ��ư �� ----------------->
 
        <!----------------- ������(�Ϲ�) ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="5" class="table_top_line"></td>
          </tr>
          <tr> 
            <td class="table_title" width="5%" height="25"><b>NO</b></td>
            <td class="table_title" width="10%" ><a href="javascript:whenOrder('groups')" class="e">�з�</a></td>
            <td class="table_title" width="25%" ><a href="javascript:whenOrder('subjnm')" class="e">�����׷�</a></td>
            <td class="table_title" ><a href="javascript:whenOrder('words')" class="e">���</a></td>
            <td class="table_title" width="15%">���</td>            
            <!--<td class="table_title" ><a href="javascript:whenOrder('descs')" class="e">����</a></td>-->
          </tr>
<%       for(int i = 0; i < list.size(); i++) {
           DataBox data   = (DataBox)list.get(i);
           
           /*v_seq      = data.getSeq();
           v_words    = data.getWords();
           v_descs    = data.getDescs();
           v_groups   = data.getGroups();
           v_subjcode = data.getSubj();
           v_subjnm   = data.getSubjnm();
           v_descs = StringManager.formatTitle(v_descs, 140);*/
           
           v_seq      = data.getInt("d_seq");
           v_words    = data.getString("d_words");
           //v_descs    = data.getString("d_descs");
           v_groups   = data.getString("d_groups");
           v_subjcode = data.getString("d_subj");
           v_subjnm   = data.getString("d_grcodenm");
%>           

          <tr> 
            <td class="table_01" height="25"><%=i+1%></td>
            <td class="table_02_1"><%=v_groups%></td>
            <td class="table_02_2"><%=v_subjnm%></td>
            <td class="table_02_1"><!--<a href="javascript:view('<%=v_subjcode%>','<%=v_seq%>')">--><%=v_words%><!--</a>--></td>
            <td class="table_03_1" width="20%">
            <a href="javascript:modify_dic('<%=v_subjcode%>','<%=v_seq%>');"><img src='/images/admin/button/b_modify.gif' border=0></a> &nbsp; 
            <a href="javascript:delete_dic('<%=v_subjcode%>','<%=v_seq%>');"><img src='/images/admin/button/b_delete.gif' border=0></a>
            </td>                        
            <!--<td class="table_02_2"><%=v_descs%></td>-->
          </tr>
<%   } %>

		<% if (list.size()==0) { %>
		<tr><td colspan=5 class="table_02_1">��ϵ� �� �����ϴ�.</td></tr>
		<% } %>
        </table>
        <!-----------------������(�Ϲ�)��----------------->
        <br>
      </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>