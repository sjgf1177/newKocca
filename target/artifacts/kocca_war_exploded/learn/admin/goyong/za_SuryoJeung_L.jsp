<%
//**********************************************************
//  1. ��      ��: �������߱޴���
//  2. ���α׷���:  za_SuryoJeung_L.jsp
//  3. ��      ��: �������߱޴��� ����Ʈ ��ȸȭ��
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2005. 7. 15 �̿���
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "java.lang.String.*"%>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.scorm.*" %>
<%@ page import = "com.credu.goyong.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String  ss_grcode       = box.getString("s_grcode");          //�����׷�
    String  ss_gyear        = box.getString("s_gyear");           //�⵵
    String  ss_grseq        = box.getString("s_grseq");           //��������
    String  ss_grseqnm      = box.getString("s_grseqnm");         //����������
    String  ss_upperclass   = box.getString("s_upperclass");      //������з�
    String  ss_middleclass  = box.getString("s_middleclass");     //�����ߺз�
    String  ss_lowerclass   = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse   = box.getString("s_subjcourse");      //����&�ڽ�
    String  ss_subjseq      = box.getString("s_subjseq");         //���� ����
//    String  ss_company      = box.getString("s_company");          //ȸ��

    String  v_process  = "listPage";
    String  v_action    = box.getString("p_action");

    ArrayList list = null;
    int listsize = 0;
    if ( v_action.equals("go") ) {
        list = (ArrayList)request.getAttribute("StudentList");
        listsize = list.size();
    }
    
    String  v_searchStart = box.getString("p_searchStart");
	String  v_searchEnd   = box.getString("p_searchEnd");
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
<script language="JavaScript">
$(document).ready(function(){
	$("#p_searchStart").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_searchEnd").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
//��ȸ
function whenSelection(p_action) {

  document.form1.p_action.value = p_action;
  if (p_action == 'go') {
    top.ftop.setPam();
  }
  
  document.form1.p_startdate.value = make_date(document.form1.p_searchStart.value);
  document.form1.p_enddate.value = make_date(document.form1.p_searchEnd.value);
  
  document.form1.action='/servlet/controller.goyong.GoYongManageServlet';
  document.form1.target = "_self";
  document.form1.p_process.value = 'SuryoJeung';                  //com.goyong.GoYongManageBean.selectStudentList(box);
  document.form1.submit();
}

//select �ڽ� ����
function chkParam() {
  if (document.form1.s_grcode.value == '----') {
    alert("�����׷��� �����ϼ���.");
    return false;
  }
  if (document.form1.s_subjcourse.value == 'ALL') {
    alert("������ �����ϼ���.");
    return false;
  }
  if (document.form1.s_subjseq.value == 'ALL') {
    alert("������ �����ϼ���.");
    return false;
  }
  //if (document.form1.s_company.value == 'ALL') {
  //  alert("ȸ�縦 �����ϼ���.");
  //  return false;
  //}
}

//�̸�����
function ViewPrint(){

    //document.form1.p_companynm.value = document.form1.s_company.options[document.form1.s_company.selectedIndex].text;
    //alert(document.form1.p_companynm.value);
    
    window.self.name = "SuryoJeungList";
    open_window("openSuryoJeungList","","50","50","750","730",'no','no','no','yes','no');
    document.form1.target = "openSuryoJeungList";
    document.form1.action='/servlet/controller.goyong.GoYongManageServlet';
    document.form1.p_process.value = 'SuryoJeungList';
    document.form1.submit();
    document.form1.target = window.self.name;
}

//���������
function SuryoPrint(){
    

  //  document.form1.p_companynm.value = document.form1.s_company.options[document.form1.s_company.selectedIndex].text;
    //alert(document.form1.p_companynm.value);

    var selectedcnt = 0;
    if ( document.form1.p_checks.length > 0 ) {
        for ( var i=0; i< document.form1.p_checks.length; i++ ) {
            if ( document.form1.p_checks[i].checked == true) {
                selectedcnt++;
            }
        }

    }
    if ( chkSelected() < 1 ) {
        alert('1�� �̻� �����ϼ���.');
        return;
    }
    
    window.self.name = "SuryoJeungPrint";
    open_window("openSuryoJeungPrint","","50","50","950","500",'yes','yes','yes','yes','yes');
    document.form1.target = "openSuryoJeungPrint";
    document.form1.action='/servlet/controller.goyong.GoYongManageServlet';
    document.form1.p_process.value = 'SuryoJeungFrame';
    document.form1.submit();
    document.form1.target = window.self.name;
}
//üũ����
    function chkSelected() {
      var selectedcnt = 0;
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            if (document.form1.p_checks[i].checked == true) {
              selectedcnt++;
            }
          }
        } else {
          if (document.form1.p_checks.checked == true) {
            selectedcnt++;
          }
        }
      }
      return selectedcnt;
    }
//��ü����    
    function whenAllSelect() {
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            document.form1.p_checks[i].checked = true;
          }
        } else {
          document.form1.p_checks.checked = true;
        }
      }
    }
//��ü��������
    function whenAllSelectCancel() {
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            document.form1.p_checks[i].checked = false;
          }
        } else {
          document.form1.p_checks.checked = false;
        }
      }
    }
//�ؽ�Ʈ ���� ����    
function whenTxt() {
    window.self.name = "TxtList2";
    open_window("openTxtList2","","100","100","300","300","yes","yes","yes","yes","yes");
    document.form1.target = "openTxtList2";
    document.form1.action='/servlet/controller.goyong.GoYongManageServlet';
    document.form1.p_process.value = 'TxtList2';
    document.form1.submit();    
}

//�������
function whenExcel() {
    window.self.name = "ExcelList2";
    open_window("openExcelList2","","100","100","800","600","yes","yes","yes","yes","yes");  
    document.form1.target = "openExcelList2";
    document.form1.action='/servlet/controller.goyong.GoYongManageServlet';
    document.form1.p_process.value = 'ExcelList2';
    document.form1.submit();
}
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/hrd/hrd_title03.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->
        <br>

        <!----------------- form ���� ----------------->
<form name = "form1" method = "post" action="/servlet/controller.goyong.GoYongManageServlet">
    <input type="hidden" name="p_process" 	value="listPage">
    <input type="hidden" name="p_masternm"  value="">
    <input type="hidden" name="p_mastercd"  value="">
    <input type="hidden" name="p_action"  	value="">
    <input type="hidden" name="p_order"  		value="name">
    <input type="hidden" name="p_companynm" value="">
    <input type="hidden" name="p_startdate" value="">
    <input type="hidden" name="p_enddate" 	value="">
    <input type="hidden" name="p_gubun"  >
    
        <table class="form_table_out" cellspacing="0" cellpadding="1">
          <tr>
            <td bgcolor="#C6C6C6" align="center">
              <table class="form_table_bg" cellspacing="0" cellpadding="0" border='0'>
                <tr>
                  <td height="7"></td>
                </tr>
                <tr>
                  <td align="center">
                  <table border="0" cellspacing="0" cellpadding="0" width="99%" class="form_table">
                    <tr>
                      <td width="27%" colspan="2" align="left" valign="middle">
                      	<!------------------- ���ǰ˻� ���� ------------------------->
						 	<%= SelectEduBean.getGrcode(box, true, true)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
					  </td>	  
					  <td width="73%" colspan="2">
						  <%= SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)   �����⵵  -->
						  <%= SelectEduBean.getGrseq(box, true, true)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  -->
						  <%= SelectSubjBean.getUpperClass(box, true, true, true)%><!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  -->
						  <%= SelectSubjBean.getMiddleClass(box, true, true, true)%><!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  -->
						  <%= SelectSubjBean.getLowerClass(box, true, true, true)%><!-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    �����Һз�  -->
					   </td>
					</tr>
					<tr>
					 	<td height="5"></td>
				    </tr>
				    <tr>
				      <td align="left" width="20%">
				        <%@ include file="/incmenu/search_subjnm.jsp"%>
				      </td>
				      <td width="63%">
						  <%= SelectSubjBean.getSubj(box, true, true)%><!-- getSubj(RequestBox, isChange, isALL)    ����  -->
						  <%= SelectSubjBean.getSubjseq(box, false, true)%><!-- getSubjseq(RequestBox, isChange, isALL)    ��������  -->
                      	  <!--%= SelectCompanyBean.getCompany(box, true, true)%--><!-- getCompany(RequestBox, isChange, isALL)    ȸ��  -->
                  <td width="10%" align="right"><%@ include file="/learn/admin/include/za_GoButton.jsp" %></td><!-- whenSelection('go') -->

                  	</tr>
					<tr>
					 	<td height="5"></td>
				    </tr>
				    <tr>
					  <td width="100%" colspan="4">
						�н��Ⱓ <input name="p_searchStart" id="p_searchStart" type="text" class="datepicker_input1" size="10" value="<%=v_searchStart%>"> &nbsp;
						- <input name="p_searchEnd" id="p_searchEnd" type="text" class="datepicker_input1" size="10" value="<%=v_searchEnd%>">
					  </td>					  
					</tr>
                  </table>
                  </td>
                </tr>
                <tr>
                  <td height="9"></td>
                </tr>
                <tr>
                  <td align="center">
                  </td>
                </tr>
                <tr>
                  <td height="7"></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
 
        <!----------------- form �� ------------------->


        <!----------------- ��ư ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="499" height="10" colspan="9"></td>
          </tr>
          <tr>
            <td valign="bottom"></td>
            <td align="right" height="20" width="58"></td>
<%
    if ( listsize > 0 ) {
%>          
            
            <td align="right" height="20" width="620">&nbsp;</TD>
            <td  align="right"width=8></td>
            <TD>&nbsp;</td>
            <td width=8></td>
            <TD>
			<a href="javascript:SuryoPrint()"><img src="/images/admin/button/btn_suryojangprint.gif" border="0"></a></td>
			<td align="right" height="20"><a href="javascript:SuryoPrint()"><img src="/images/admin/button/btn_suryoprint.gif" border="0"></a></td>
            <td align="right" height="20"><a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif" border="0"></a></td>

			</td>
<%
    }
%>
          </tr>
          <tr>
            <td height="3" colspan="9"></td>
          </tr>
        </table>
        <!----------------- ��ư �� ----------------->

        <!----------------- ��ȸ ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="11" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title" width="5%">No</td>
            <td class="table_title" width="20%">��������ȣ</td>
            <td class="table_title" width="20%">ID</td>
            <td class="table_title" width="20%">����</td>
            <td class="table_title" width="10%">ȸ������</td>
            <td class="table_title" width="20%">�ֹε�Ϲ�ȣ</td>
            <td class="table_title" width="5%"><%@ include file="/learn/admin/include/za_checkboxall.jsp" %></td>
          </tr>
<%
    if ( v_action.equals("go") ) {
        for ( int i=0; i<listsize; i++ ) {
            DataBox dbox = (DataBox)list.get(i);
%>
          <tr class="table_02_1">
                <td class="table_02_1"><%= (i+1) %></td>
                <td class="table_02_1"><%= dbox.getString("d_serno") %></td>
                <td class="table_02_1"><%= dbox.getString("d_userid") %></td>
                <td class="table_02_1"><%= dbox.getString("d_name") %></td>
                <td class="table_02_1"><%= dbox.getString("d_membergubunnm") %></td>
                <td class="table_02_1"><%= dbox.getString("d_resno")%></td>
                <td class="table_02_1"><input type="checkbox" name="p_checks" value="<%=dbox.getString("d_userid")%>,<%=dbox.getString("d_subj")%>,<%=dbox.getString("d_year")%>,<%=dbox.getString("d_subjseq")%>"></td>
            </tr>
<%
        }
    }
%>
        </table>
        
        
        <!----------------- ��ȸ �� ----------------->
<%
    if ( v_action.equals("go") ) {
%>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="right" class="ms">��<b> TOTAL : <%= listsize %> ��</b></td>
          </tr>
        </table>
<%
    }
%>
        </form>
        <br>
      </td>
  </tr>
</table>

<table>
    <tr><td>
    <%@ include file = "/learn/library/getJspName.jsp" %>
    </td></tr>
</table>

</body>
</html>
