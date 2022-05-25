<%
/**
 * file name : za_HuryunExe_L.jsp
 * date      : 2004/12/29
 * programmer: Lee Chang Hun
 * function  : �ƷýǽýŰ�
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
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

//    String  ss_company      = box.getString("s_company");		  //ȸ��
    
    String  v_action    	= box.getString("p_action");

	String  v_subj      	= box.getString("p_subj");
	String  v_year      	= box.getString("p_year");
	String  v_subjseq     	= box.getString("p_subjseq");

	ArrayList list = null;
	int listsize = 0;
	    list = (ArrayList)request.getAttribute("StudentListView");
    	listsize = list.size();


%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
//����Ʈȭ������ �̵�
function selectList() {
  document.form1.action='/servlet/controller.goyong.GoYongManageServlet';
  document.form1.target = "_self";
  document.form1.p_process.value = 'HuryunExe';
  document.form1.submit();
}  

//����������
function whenSelection(p_action) {

  document.form1.p_action.value = p_action;
  if (p_action == 'go') {
    top.ftop.setPam();
  }
  document.form1.action='/servlet/controller.goyong.GoYongManageServlet';
  document.form1.target = "_self";
  document.form1.p_process.value = 'HuryunExe1';                  //com.goyong.GoYongManageBean.selectStudentList(box);
  document.form1.submit();
}

function chkParam() {
  if (document.form1.s_grcode.value == '----') {
    alert("�����׷��� �����ϼ���.");
    return false;
  }
  else if (document.form1.s_subjcourse.value == 'ALL') {
  	alert("������ �����ϼ���.");
  	return false;
  }
  else if (document.form1.s_subjseq.value == 'ALL') {
  	alert("���������� �����ϼ���.");
  	return false;
  }
}

//�Ʒ����� �μ�
function HuryunDailyPrint(){
    window.self.name = "HuryunDailyPrint";
    open_window("openHuryunDailyPrint","","50","50","750","730",'no','no','no','yes','no');
   	document.form1.target = "openHuryunDailyPrint";
    document.form1.action='/learn/admin/goyong/za_HuryunDiaryFrame.jsp';
   	//document.form1.p_process.value = 'HuryunDailyPrint';
    document.form1.submit();
   	document.form1.target = window.self.name;
}

//���� ���
function whenExcel() {
    window.self.name = "ExcelList";
    open_window("openExcelList","","100","100","700","400","yes","yes","yes","yes","yes");  
    document.form1.target = "openExcelList";
    document.form1.action='/servlet/controller.goyong.GoYongManageServlet';
    document.form1.p_process.value = 'ExcelList';
    document.form1.submit();
}

//�ؽ�Ʈ ���� ����
function whenTxt() {
	window.self.name = "TxtList";
	open_window("openTxtList","","100","100","300","300","yes","yes","yes","yes","yes");
	document.form1.target = "openTxtList";
	document.form1.action='/servlet/controller.goyong.GoYongManageServlet';
	document.form1.p_process.value = 'TxtList';
	document.form1.submit();	
}

//��¥ �Է� üũ
function TxtCheck(key, CtlName, TextMask){
	if((key > 47&&key < 58)||(key > 95 && key <106)) {
		if(CtlName.value.length < TextMask.length) { 
		var aa = CtlName.value + String.fromCharCode(key);
	
		if(key > 47 && key < 58) var zz = aa.charAt(aa.length-1);
		else if(key > 95 && key < 106){
		
			switch(key){
				case 96: zz = '0'; break; case 97: zz = '1'; break;
				case 98: zz = '2'; break; case 99: zz = '3'; break;
				case 100: zz = '4'; break; case 101: zz = '5'; break;
				case 102: zz = '6'; break; case 103: zz = '7'; break;
				case 104: zz = '8'; break; case 105: zz = '9'; break;
			}
		}

		if(TextMask.charAt(aa.length-1) == '#') CtlName.value = CtlName.value + zz;
		else CtlName.value = CtlName.value + TextMask.charAt(aa.length-1) +zz;
		return false;
		}
	}
	else if(key == 8 || key == 9 || key == 13) return ; else return false;

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
          <td><img src="/images/admin/hrd/hrd_title01.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->
        <br>

<!------------------------------------- form ���� ------------------------------------->
<form name = "form1" method = "post" action="/servlet/controller.goyong.GoYongManageServlet">
    <input type="hidden" name="p_process" value="listPage">
    <input type="hidden" name="p_masternm"  value="">
    <input type="hidden" name="p_mastercd"  value="">
    <input type="hidden" name="p_action"  value="<%=v_action%>">
    <input type="hidden" name="p_order"  value="name">
    <input type="hidden" name="p_gubun">
    <input type = "hidden" name="p_subj"  value="<%=v_subj%>">
	<input type = "hidden" name = "p_year" value = "<%=v_year%>">
	<input type = "hidden" name = "p_subjseq"   value = "<%=v_subjseq%>">
	<input type="hidden" name="s_grcode"    	value="<%=ss_grcode%>">     <!--in relation to select-->
	<input type="hidden" name="s_gyear"     	value="<%=ss_gyear%>">      <!--in relation to select-->
    <input type="hidden" name="s_upperclass"    value="<%=ss_upperclass%>"> <!--in relation to select-->
	<input type="hidden" name="s_middleclass"   value="<%=ss_middleclass%>"><!--in relation to select-->
    <input type="hidden" name="s_subjcourse"	value="<%=ss_subjcourse%>"> <!--in relation to select-->
	<input type="hidden" name="s_subjseq"   	value="<%=ss_subjseq%>">    <!--in relation to select-->
<!-- 
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
					  <td width="45%" colspan="2">�н��Ⱓ
						<input name="p_propstart1" type="text" class="input" size="10" maxlength=10  value="" OnClick="MiniCal(this)" readonly> �� ~ 
						<input name="p_propstart1" type="text" class="input" size="10" maxlength=10  value="" OnClick="MiniCal(this)" readonly> ��
					  </td>
                      <td width="45%" colspan="2" align="left" valign="middle">
                      	<!------------------- ���ǰ˻� ���� 
	
						  <%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  

						<select size="1">
							<option value="">ALL</option>
							<option value="">��Ʊ�������</option>
							<option value="">���뱳������</option>
							<option value="">������뱳������</option>
						</select>
					  </td>	
            	      <td width="10%" align="right"><a href="javascript:whenSelection('go')"><img src="/images/admin/button/b_go.gif"  border="0" align=absmiddle></a></td>
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
 --> 
<!------------------------------------- form �� ------------------------------------->


        <!----------------- ��ư ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="642" height="10"></td>
          </tr>
          <tr>
            <td valign="bottom"></td>
            <td align="right" height="20" width="58"></td>
            <td align="right" height="20"><a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif" border="0"></a></td>
            <td align="right" height="20" width="75"><a href="javascript:selectList()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
          </tr>
          <tr>
            <td height="3"></td>
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
            <td class="table_title" width="15%">ȸ������</td>
            <td class="table_title" width="20%">�ֹε�Ϲ�ȣ</td>
            <td class="table_title" width="25%">ID</td>
            <td class="table_title" width="25%">����</td>
          </tr>

 <%
    //if ( v_action.equals("go") ) {
%>
<%
      String v_resno ="";
		for ( int i=0; i<list.size(); i++ ) {
			DataBox dbox = (DataBox)list.get(i);
			//out.println("resno=="+dbox.getString("d_resno"));
			//if(true) return;
			
			v_resno = dbox.getString("d_resno");
			
			if(v_resno.length()  == 13){
			  v_resno = dbox.getString("d_resno").substring(0,6) + "-*******";
			}else{
			  v_resno = v_resno +"(<font color=red>�ֹι�ȣ ����</font>)";
			}
			
%>

           <tr class="table_02_1">
                <td class="table_02_1"><%= (i+1) %></td>
                <td class="table_02_1"><%= dbox.getString("d_membergubunnm") %></td>
                <td class="table_02_1"><%=v_resno%></td>
                <td class="table_02_1"><%= dbox.getString("d_userid") %></td>
                <td class="table_02_1"><%= dbox.getString("d_name") %></td>
            </tr>

<%
		}
	//}
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
