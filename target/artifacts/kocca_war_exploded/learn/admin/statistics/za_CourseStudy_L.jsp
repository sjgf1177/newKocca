<%
//**********************************************************
//  1. ��      ��: ����� ��� - �н���Ȳ
//  2. ���α׷��� : za_CourseStudy_L.jsp
//  3. ��      ��: �н���Ȳ
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.11
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
    
    String	v_grcode		= "";
    String	v_gyear			= "";
    String	v_grseq			= "";  
    String	v_grseqnm		= "";
    String	v_edustart		= "";
    String	v_eduend		= "";
    int		v_subj_cnt		= 0;
    int		v_user_cnt		= 0;
    int		v_grad_cnt		= 0;
	double	v_grad_rate		= 0;
    double	v_sul_rate		= 0;
    double	v_biyong		= 0;
    double	v_price			= 0;
    int		v_sul_cnt2		= 0;
    double	v_sul_cnt_rate	= 0;
	
    int		v_total_subj_cnt	= 0;
    int		v_total_user_cnt	= 0;
    int		v_total_grad_cnt	= 0;
	double	v_total_grad_rate	= 0;
    double	v_total_sul_rate	= 0;
    double	v_total_biyong		= 0;
    double	v_total_price		= 0;
    int		v_total_sul_cnt2	= 0;
    double	v_total_sul_cnt_rate= 0;
    
    String	v_total_grad_rate_rate	= "";
    String	v_total_sul_rate_rate	= "";
    String	v_total_sul_cnt_rate_rate	= "";           
	
    int     i           		= 0;
    
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
	
    int v_today = Integer.parseInt(FormatDate.getDate("yyyyMMdd"));  //���� ��¥ �Ͻ� �ʱ�ȭ
    int i_eduend   = 0;
    
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
	$("#s_startdate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#s_enddate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--
// �˻�
function whenSelection(ss_action) {
	var process = 'selectStudyListPre';            //�˻���
  
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
		process='selectStudyList';   //�˻���
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
    document.form1.p_process.value = 'selectStudyListExcel';
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
                        <kocca_select:select name="s_option1" sqlNum="coursestatistics1"  param=" " onChange="selectOption1(this.value);" attr="��豸��1" selectedValue="selectStudyListPre" isLoad="true" all="none" type="1" styleClass=""/>
                      </td>
                      <td align="left" valign="middle">
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
          <td align="left" height="20">&nbsp;<b>�н���Ȳ</b></td>
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
          <td colspan="23" class="table_top_line"></td>
        </tr>
        <tr>
          <td class="table_title"><b>��������</b></td>
          <td class="table_title"><b>�����Ⱓ</b></td>
          <td class="table_title"><b>������</b></td>
          <td class="table_title"><b>�����ο�</b></td>
          <td class="table_title"><b>�����ο�</b></td>
          <td class="table_title"><b>������</b></td>
          <td class="table_title"><b>������</b></td>
          <td class="table_title"><b>�����ݾ�</b></td>
          <td class="table_title"><b>�ǰ�����</b></td>
          <td class="table_title"><b>���� �����ο�</b></td>
          <td class="table_title"><b>���� ������</b></td>
        </tr>
<%  	if (v_action.equals("go")) {
        	ArrayList  list = (ArrayList)request.getAttribute("selectList");

        	for (i=0; i<list.size(); i++) {
				DataBox dbox = (DataBox)list.get(i);

			    v_grcode		= dbox.getString("d_grcode");
				v_gyear			= dbox.getString("d_gyear");
				v_grseq			= dbox.getString("d_grseq");
				v_grseqnm		= dbox.getString("d_grseqnm");
				v_edustart		= dbox.getString("d_edustart");
				v_eduend		= dbox.getString("d_eduend");
			    v_subj_cnt		= dbox.getInt("d_subj_cnt");
			    v_user_cnt		= dbox.getInt("d_user_cnt");
			    v_grad_cnt		= dbox.getInt("d_grad_cnt");
				v_grad_rate		= dbox.getDouble("d_grad_rate");
			    v_sul_rate		= dbox.getDouble("d_sul_rate");
			    v_biyong		= dbox.getDouble("d_biyong");
			    v_price			= dbox.getDouble("d_price");
			    v_sul_cnt2		= dbox.getInt("d_sul_cnt2");
			    v_sul_cnt_rate	= dbox.getDouble("d_sul_cnt_rate");
			    
			    if(!v_eduend.equals("")){
			        i_eduend = Integer.parseInt(v_eduend.substring(0,8));
			    }
%>
        <tr class="table_02_1">
          <td class="table_02_2"><%= v_gyear %>-<%= v_grseq %> <%= v_grseqnm %></td>
          <td class="table_02_1"><%= FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd") %> ~ <%= FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd") %></td>
          <td class="table_02_1"><%= v_subj_cnt %></td>
          <td class="table_02_1"><%= v_user_cnt %></td>
<%
			if (v_today >= i_eduend) {

			    v_total_subj_cnt	+= v_subj_cnt;		 
			    v_total_user_cnt	+= v_user_cnt;		
			    v_total_grad_cnt	+= v_grad_cnt;		
				v_total_grad_rate	+= v_grad_rate;		
			    v_total_sul_rate	+= v_sul_rate;	
			    v_total_biyong		+= v_biyong;		
			    v_total_price		+= v_price;			
			    v_total_sul_cnt2	+= v_sul_cnt2;		
			    v_total_sul_cnt_rate+= v_sul_cnt_rate;

%>
          <td class="table_02_1"><%= v_grad_cnt %></td>
          <td class="table_02_1"><%= v_grad_rate %></td>
          <td class="table_02_1"><%= v_sul_rate %>%</td>
<%
			} else {
%>
          <td class="table_02_1" colspan="3">���</td>
<%
			}
%>
          <td class="table_02_1"><%= new java.text.DecimalFormat("###,###,###.##").format(v_biyong) %></td>
          <td class="table_02_1"><%= new java.text.DecimalFormat("###,###,###.##").format(v_price) %></td>
          <td class="table_02_1"><%= v_sul_cnt2 %></td>
          <td class="table_02_1"><%= v_sul_cnt_rate %>%</td>
        </tr>
<%
        	}
			if (i == 0) {
%>
        <tr>
        	<td align="center" bgcolor="#FFFFFF" height="100" colspan="23">��ϵ� ������ �����ϴ�.</td>
        </tr>
<%			} else { 
   				v_total_grad_rate_rate		= new java.text.DecimalFormat("###,###,###.##").format(v_total_grad_rate / i );
   				v_total_sul_rate_rate		= new java.text.DecimalFormat("###,###,###.##").format(v_total_sul_rate	/ i );
   				v_total_sul_cnt_rate_rate	= new java.text.DecimalFormat("###,###,###.##").format(v_total_sul_cnt_rate / i );
%>
	    <tr class="table_02_3">
          <td class="table_02_3" colspan="2"><%= v_gyear %>�� �Ѱ�</td>
          <td class="table_02_3"><%= v_total_subj_cnt %></td>
          <td class="table_02_3"><%= v_total_user_cnt %></td>
          <td class="table_02_3"><%= v_total_grad_cnt %></td>
          <td class="table_02_3"><%= v_total_grad_rate_rate %>%</td>
          <td class="table_02_3"><%= v_total_sul_rate_rate %>%</td>
          <td class="table_02_3"><%= new java.text.DecimalFormat("###,###,###.##").format(v_total_biyong) %></td>
          <td class="table_02_3"><%= new java.text.DecimalFormat("###,###,###.##").format(v_total_price) %></td>
          <td class="table_02_3"><%= v_total_sul_cnt2 %></td>
          <td class="table_02_3"><%= v_total_sul_cnt_rate_rate %></td>
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