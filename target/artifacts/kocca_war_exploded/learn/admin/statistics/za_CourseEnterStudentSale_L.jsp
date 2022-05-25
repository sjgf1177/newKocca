<%
//**********************************************************
//  1. ��      ��: ����� ��� - �԰���Ȳ - �������� - �����׺� ��Ȳ
//  2. ���α׷��� : za_CourseenterStudentSale_L.jsp
//  3. ��      ��: �԰���Ȳ - �������� - �����׺� ��Ȳ
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.08
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String	v_tid				= "";
    String	v_userid			= "";
    String	v_name				= "";
    String	v_subj				= "";
    String	v_year				= "";
    String	v_subjseq			= "";
    String	v_subjnm			= "";
    String	v_edustart			= "";
    String	v_eduend			= "";
    String	v_paymethod			= "";
    double	v_biyong			= 0;
    String	v_result			= "";
    String	v_pgauthdate		= "";
    String	v_pgauthtime		= "";
    String	v_inputname			= "";
    double	v_price				= 0;
    int		v_rank				= 0;
    String	v_istaxyn			= "";
    String	v_middleclassname	= "";
    String	v_lowerclassname	= "";
    String	v_grseqnm			= "";
    double	v_realtotal			= 0;
    double	v_subtotal			= 0;
    int		v_rowspan			= 0;
    String	v_resno				= "";
    String	v_appdate			= "";
    String	v_comptext			= "";
    String	v_email				= "";
    String	v_handphone			= "";
    int     i           		= 0;
    
    double	v_totalbiyong		= 0;
    double	v_totaldiscount		= 0;
    double	v_totalsubtotal		= 0;
    double	v_totalrealtotal	= 0;
 	
    String	ss_grcode			= box.getString("s_grcode");		//�����׷�
    String	ss_gyear			= box.getString("s_gyear");			//�⵵
    String	ss_grseq			= box.getString("s_grseq");			//��������
    String	ss_grseqnm			= box.getString("s_grseqnm");		//����������
    String  ss_upperclass		= box.getString("s_upperclass");	//������з�
    String  ss_middleclass		= box.getString("s_middleclass");	//�����ߺз�
    String  ss_lowerclass		= box.getString("s_lowerclass");	//�����Һз�
    String  ss_startdate		= box.getString("s_startdate");		//�Ⱓ��ȸ ����
    String  ss_enddate			= box.getString("s_enddate");		//�Ⱓ��ȸ ��
    String  ss_option1			= box.getString("s_option1");		//��豸��
    String  ss_option2			= box.getString("s_option2");		//��躰 ����2
    String  ss_option3			= box.getString("s_option3");		//��躰 ����3

    if (ss_enddate.equals("")) {
    	ss_startdate	= FormatDate.getDateAdd(FormatDate.getDate("yyyyMMdd"), "yyyy-MM-dd", "month", -1);
    	ss_enddate		= FormatDate.getFormatDate(FormatDate.getDate("yyyyMMdd"), "yyyy-MM-dd");
    }
    
    String  v_action	= box.getString("p_action");
	String  v_orderType	= box.getStringDefault("p_orderType"," asc"); //���ļ���
%>

<html>
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script><head>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">

<script language="JavaScript">
$(document).ready(function(){
	$("#s_startdate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#s_enddate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--
// �˻�
function whenSelection(ss_action) {
	var process = 'selectEnterStudentSaleListPre';            //�˻���
  
	if (ss_action=="go")  {
		if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
			alert("�����׷��� �����ϼ���.");
			return;
		}
		//if (document.form1.s_grseq.value == 'ALL' || document.form1.s_grseq.value == '') {
		//   alert("���������� �����ϼ���.");
		//   return;
		//}
		top.ftop.setPam();
		process='selectEnterStudentSaleList';   //�˻���
	}
	document.form1.target = "_self";  
	document.form1.action = "/servlet/controller.course.CourseStateAdminServlet";
	document.form1.p_action.value = ss_action;
	document.form1.p_process.value = process;
	document.form1.submit();
}

// ����
function ordering(column) {
	if (document.form1.p_orderType.value == " asc") {
		document.form1.p_orderType.value = " desc";
	} else {
		document.form1.p_orderType.value = " asc";
	}

	document.form1.p_order.value = column;
	whenSelection("go");
}

// ȸ������
function whenMemberInfo(userid) {
	window.self.name = "ProposeList";
	open_window("openMember","","100","100","600","260");
	document.form1.target = "openMember";
	document.form1.action='/servlet/controller.library.SearchServlet?p_userid='+userid;
	document.form1.p_process.value = 'memberInfo';
	document.form1.submit();
	document.form1.target = window.self.name;
}

// ��������
function whenExcel() {
	if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
        alert("�����׷��� �����ϼ���.");
        return ;
    }
    //window.self.name = "CourseSale";
    //open_window("openExcel1","","100","100","800","600","yes","yes","yes","yes","yes");
    //document.form1.target = "openExcel1";
    document.form1.target = "_self";
    document.form1.action='/servlet/controller.course.CourseStateAdminServlet';
    document.form1.p_process.value = 'selectEnterStudentSaleListExcel';
	document.form1.p_action.value = "go";
    document.form1.submit();
}

// ��¥ ����(�޷�)
function whenclick(caldate) {
	caldate.value = "";
}

// ��躯��1
function selectOption1(p) {
	//alert(p);
	document.form1.target = "_self";  
	document.form1.action = "/servlet/controller.course.CourseStateAdminServlet";
	document.form1.p_action.value = "change";
	document.form1.p_process.value = p;
	document.form1.submit();
}

//��躯��3
function selectOption3(p) {
	var p_process;
	if( p == "PRI") {
		p_process = "selectEnterStudentSaleList";
	} else {
		p_process = "selectEnterStudentGubunList";
	}
	document.form1.target = "_self";  
	document.form1.action = "/servlet/controller.course.CourseStateAdminServlet";
	document.form1.p_action.value = "change";
	document.form1.p_option3.value = p;
	document.form1.p_process.value = p_process;
	document.form1.submit();
}

//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title04.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <!------------------------------------- form ���� ------------------------------------->
      <form name = "form1" method = "post">
        <input type="hidden" name="p_process">
        <input type="hidden" name="p_action">
        <input type="hidden" name="p_order"     value="">
        <input type="hidden" name="p_orderType" value="">
        <input type="hidden" name="p_grcode" >
        <input type="hidden" name="p_grseq" >
        <input type="hidden" name="p_gyear">
        <input type="hidden" name="p_subj" >
        <input type="hidden" name="p_subjseq" >
        <input type="hidden" name="p_option3" value="">
      
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center">
                  <table border="0" cellspacing="0" cellpadding="0" width="99%" class="form_table">
                    <tr>
                      <td align="left" valign="middle">
                        <!------------------- ���ǰ˻� ���� ------------------------->
                        <font color="red">��</font> <%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
                      </td>
                      <td align="left" valign="middle">
                        <font color="red">��</font> <%= SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)   �����⵵  -->
                      </td>
                      <td align="left" valign="middle">  
                        <font color="red">��</font> <%= SelectEduBean.getGrseq(box, true, true)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  -->
                      </td>
                    </tr>
                    <tr>
                      <td height="5" colspan="4"></td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <%= SelectSubjBean.getUpperClass(box, true, true, true)%><!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  -->
                      </td>
                      <td align="left" valign="middle">
                        <%= SelectSubjBean.getMiddleClass(box, true, true, true)%><!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  -->
                      </td>
                      <td align="left" valign="middle">
                        <%= SelectSubjBean.getLowerClass(box, true, true, true)%><!-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    �����Һз�  -->
                      </td>
  		  		      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td height="5" colspan="4"></td>
                    </tr>
  		  		    <tr>
                      <td align="left" valign="middle">
                                                          ��ȸ�Ⱓ&nbsp;<input name="s_startdate" id="s_startdate" value="<%=ss_startdate%>" type="text" class="datepicker_input1" size="10">&nbsp;
		  				  			~&nbsp;<input name="s_enddate" id="s_enddate" value="<%=ss_enddate%>" type="text" class="datepicker_input1" size="10">&nbsp;
                      </td>
                      <td align="left" valign="middle">
                                                         ��豸��
                        <kocca_select:select name="s_option1" sqlNum="coursestatistics1"  param=" " onChange="selectOption1(this.value);" attr="��豸��1" selectedValue="selectEnterStudentSaleListPre" isLoad="true" all="none" type="1" styleClass=""/>
                      </td>
                      <td align="left" valign="middle">
		  		        <kocca_select:select name="s_option2" sqlNum="coursestatistics2"  param=" " onChange="selectOption1(this.value);" attr="��豸��2" selectedValue="selectEnterStudentSaleListPre" isLoad="true" all="none" type="1" styleClass=""/>
				        &nbsp;
		  		        <kocca_select:select name="s_option3" sqlNum="coursestatistics3"  param=" " onChange="selectOption3(this.value);" attr="��豸��3" selectedValue="PRI" isLoad="true" all="none" type="1" styleClass=""/>
                      </td>
                      <td width="20%" align="right"><%@ include file="/learn/admin/include/za_GoButton.jsp" %></div><!-- whenSelection('go') --></td>
			        </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="9"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table><br>
      <!----------------- ������� ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="left" height="20">&nbsp;<b>�������� �����׺� �԰���Ȳ</b></td>
          <td align="right">
            <a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif"  border="0"></a>
          </td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>           
      <!----------------- �����ȸ ���� ----------------->
      <table class="table_out" cellspacing="1" cellpadding="5">		
        <tr>
          <td colspan="17" class="table_top_line"></td>
        </tr>
        <tr>
          <td class="table_title" width="5%"><b>No</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>���̵�</b></td>
          <td class="table_title"><b>�ֹι�ȣ</b></td>
          <td class="table_title"><b>�о�</b></td>
          <td class="table_title"><b>���̵�</b></td>
          <td class="table_title"><b>�����ڵ�</b></td>
          <td class="table_title"><b>�����ݾ�</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>������</b></td>
          <td class="table_title"><b>��������</b></td>
          <td class="table_title"><b>�������ξ�</b></td>
          <td class="table_title"><b>�ǰ����ݾ�</b></td>
          <td class="table_title"><b>��û��</b></td>
          <td class="table_title"><b>�Ҽ�</b></td>
          <td class="table_title"><b>EMAIL</b></td>
          <td class="table_title"><b>�̵���ȭ</b></td>
        </tr>
<%  	if (v_action.equals("go")) {
        	ArrayList  list = (ArrayList)request.getAttribute("selectList");

        	String	v_biyong_text		= "";
	        String	v_price_text		= "";
	        String	v_realtotal_text	= "";
	        String	v_subtotal_text		= "";
	        String	v_discount_text		= "";

        	for (i=0; i<list.size(); i++) {
				DataBox dbox = (DataBox)list.get(i);

		        v_tid				= dbox.getString("d_tid");
		        v_userid			= dbox.getString("d_userid");
		        v_name				= dbox.getString("d_name");
		        v_subj				= dbox.getString("d_subj");
		        v_year				= dbox.getString("d_year");
		        v_subjseq			= dbox.getString("d_subjseq");
		        v_subjnm			= dbox.getString("d_subjnm");
		        v_edustart			= dbox.getString("d_edustart");
		        v_eduend			= dbox.getString("d_eduend");
		        v_paymethod			= dbox.getString("d_paymethod");
		        v_biyong			= dbox.getDouble("d_biyong");
		        v_result			= dbox.getString("d_result");
		        v_pgauthdate		= dbox.getString("d_pgauthdate");
		        v_pgauthtime		= dbox.getString("d_pgauthtime");
		        v_inputname			= dbox.getString("d_inputname");
		        v_price				= dbox.getDouble("d_price");
		        v_rank				= dbox.getInt("d_rank");
		        v_istaxyn			= dbox.getString("d_istaxyn");
		        v_middleclassname	= dbox.getString("d_middleclassname");
		        v_lowerclassname	= dbox.getString("d_lowerclassname");
		        v_grseqnm			= dbox.getString("d_grseqnm");
		        v_realtotal			= dbox.getDouble("d_realtotal");
		        v_subtotal			= dbox.getDouble("d_subtotal");
		        v_rowspan			= dbox.getInt("d_rowspan");
		        v_resno				= dbox.getString("d_resno");
		        v_appdate			= dbox.getString("d_appdate");
		        v_comptext			= dbox.getString("d_comptext");
		        v_email				= dbox.getString("d_email");
		        v_handphone			= dbox.getString("d_handphone");

		        v_biyong_text		= new java.text.DecimalFormat("###,###,##0").format(v_biyong);
		        v_price_text		= new java.text.DecimalFormat("###,###,##0").format(v_price);
		        v_realtotal_text	= new java.text.DecimalFormat("###,###,##0").format(v_realtotal);
		        v_subtotal_text		= new java.text.DecimalFormat("###,###,##0").format(v_subtotal);
		        v_discount_text		= new java.text.DecimalFormat("###,###,##0").format(v_subtotal - v_realtotal);
		        
		        v_totalbiyong		+= v_biyong;
		        v_totaldiscount		+= (v_subtotal - v_realtotal);
		        v_totalsubtotal		+= v_subtotal;
		        v_totalrealtotal	+= v_realtotal;

		        if ("Card".equals(v_paymethod) || "VCard".equals(v_paymethod)) {
		        	v_paymethod	= "�ſ�ī��";
		        } else if ("DirectBank".equals(v_paymethod)) {
		        	v_paymethod	= "������ü";
		        } else if ("VBank".equals(v_paymethod)) {
		        	v_paymethod	= "�������";
		        } else if ("BankBook".equals(v_paymethod)) {
		        	v_paymethod	= "�������Ա�";
		        }
%>
        <tr class="table_02_1">
          <td class="table_02_1"><%= i + 1 %></td>
          <td class="table_02_1"><%= v_name %></td>
          <td class="table_02_1"><%= v_userid %></td>
          <td class="table_02_1"><%= StringManager.substring(v_resno,0,6) %>-<%= StringManager.substring(v_resno,7,13) %></td>
          <td class="table_02_1"><%= v_middleclassname %></td>
          <td class="table_02_1"><%= v_lowerclassname %></td>
          <td class="table_02_1"><%= v_subj %></td>
          <td class="table_02_1"><%= v_biyong_text %></td>
          <td class="table_02_1"><%= StringManager.cutZero(v_subjseq) %></td>
          <td class="table_02_1"><%= v_subjnm %></td>
          <td class="table_02_1"><%= v_paymethod %></td>
<%
      	     	if (v_rowspan != 0) {
%>
          <td class="table_02_1" rowspan="<%= v_rowspan %>"><%= v_discount_text %></td>
          <td class="table_02_1" rowspan="<%= v_rowspan %>"><%= v_realtotal_text %></td>
<%
            	}
%>
          <td class="table_02_1"><%= FormatDate.getFormatDate(v_appdate,"yyyy/MM/dd") %></td>
          <td class="table_02_1"><%= v_comptext %></td>
          <td class="table_02_1"><%= v_email %></td>
          <td class="table_02_1"><%= v_handphone %></td>
        </tr>
<%
        	}
			if (i == 0) {
%>
        <tr>
        	<td align="center" bgcolor="#FFFFFF" height="100" colspan="17">��ϵ� ������ �����ϴ�.</td>
        </tr>
<%			} else { %>
	    <tr class="table_02_3">
          <td class="table_02_3"></td>
          <td class="table_02_3" colspan="6">�հ�</td>
          <td class="table_02_3"><%= new java.text.DecimalFormat("###,###,##0").format(v_totalbiyong) %></td>
          <td class="table_02_3" colspan="3">�հ�</td>
          <td class="table_02_3"><%= new java.text.DecimalFormat("###,###,##0").format(v_totaldiscount) %></td>
          <td class="table_02_3"><%= new java.text.DecimalFormat("###,###,##0").format(v_totalrealtotal) %></td>
          <td class="table_02_3" colspan="4"></td>
        </tr>
<%			}
		}
%>
      </form>
      </table>
    <!----------------- �����ȸ �� ----------------->
    <br>
    </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>