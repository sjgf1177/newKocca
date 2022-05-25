<%
/**
 * file name : za_GoyongReport_L.jsp
 * date      : 2004/12/29
 * programmer: Lee Chang Hun
 * function  : ������
 */
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
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
    String startDate  = FormatDate.getRelativeDate(-60);
    String endDate = FormatDate.getRelativeDate(30);

    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
 
    String  v_action    = box.getString("p_action");
    
    String  ss_grcode       = box.getString("s_grcode");          //�����׷�
    String  ss_gyear        = box.getString("s_gyear");           //�⵵
    String  ss_grseq        = box.getString("s_grseq");           //��������
    String  ss_grseqnm      = box.getString("s_grseqnm");         //����������
    String  ss_subjcourse   = box.getString("s_subjcourse");      //����&�ڽ�
    String  ss_subjseq      = box.getString("s_subjseq");         //���� ����
    String  ss_company      = box.getString("s_company");          //ȸ��
    

/*
    ArrayList list = null;
    int listsize = 0;
    if ( v_action.equals("go") ) {
        list = (ArrayList)request.getAttribute("StudentList");
        listsize = list.size();
    }
*/
    String searchStart = FormatDate.getFormatDate(startDate,"yyyy-MM-dd");
    String searchEnd   = FormatDate.getFormatDate(endDate,"yyyy-MM-dd");

    String  v_searchStart = box.getStringDefault("p_searchStart",searchStart);
    String  v_searchEnd   = box.getStringDefault("p_searchEnd",searchEnd);  
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
function whenSelection(p_action) {

  document.form1.p_action.value = p_action;
  if (p_action == 'go') {
    if (chkParam() == false) {
      return;
    }
    top.ftop.setPam();
  }
  document.form1.action='/servlet/controller.goyong.GoYongManageServlet';
  document.form1.target = "_self";
  document.form1.p_process.value = 'report';                  //com.goyong.GoYongManageBean.selectStudentList(box);
  document.form1.submit();
}

function chkParam() {
  if (document.form1.s_grcode.value == '----') {
    alert("�����׷��� �����ϼ���.");
    return false;
  }
  /*if (document.form1.s_subjcourse.value == 'ALL') {
    alert("������ �����ϼ���.");
    return false;
  }
  if (document.form1.s_subjseq.value == 'ALL') {
    alert("������ �����ϼ���.");
    return false;
  }*/
  //if (document.form1.s_company.value == 'ALL') {
  //  alert("ȸ�縦 �����ϼ���.");
  //  return false;
  //}
}

function HuryunDailyPrint(){
    window.self.name = "HuryunDailyPrint";
    open_window("openHuryunDailyPrint","","50","50","750","730",'no','no','no','yes','no');
    document.form1.target = "openHuryunDailyPrint";
    document.form1.action='/learn/admin/goyong/za_HuryunDiaryFrame.jsp';
    //document.form1.p_process.value = 'HuryunDailyPrint';
    document.form1.submit();
    document.form1.target = window.self.name;
}

function whenExcel() {
    window.self.name = "ExcelList";
    open_window("openExcelList","","100","100","700","400","yes","yes","yes","yes","yes");  
    document.form1.target = "openExcelList";
    document.form1.action='/servlet/controller.goyong.GoYongManageServlet';
    document.form1.p_process.value = 'ExcelList';
    document.form1.submit();
}

function whenTxt() {

    window.self.name = "TxtList";
    open_window("openTxtList","","100","100","300","300","yes","yes","yes","yes","yes");
    document.form1.target = "openTxtList";
    document.form1.action='/servlet/controller.goyong.GoYongManageServlet';
    document.form1.p_process.value = 'TxtList';
    document.form1.submit();    
}


    function whenExcel1(report_flag) {
          if (chkParam() == false) {
            return;
          }
          top.ftop.setPam();

        window.self.name = "CompleteRateList";
        open_window("openExcel","","100","100","800","600","yes","yes","yes","yes","yes");
        document.form1.target = "openExcel";
        document.form1.action='/servlet/controller.goyong.GoYongManageServlet';
        document.form1.p_process.value = 'reportCourseList';
        document.form1.p_report_flag.value = report_flag;
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
          <td><img src="../../../images/admin/hrd/hrd_title05.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->
        <br>

<!------------------------------------- form ���� ------------------------------------->
<form name = "form1" method = "post" action="/servlet/controller.goyong.GoYongManageServlet">
    <input type="hidden" name= "p_process" value="report">
    <input type="hidden" name= "p_masternm"  value="">
    <input type="hidden" name= "p_mastercd"  value="">
    <input type="hidden" name= "p_action"  value="">
    <input type="hidden" name= "p_order"  value="name">
    <input type="hidden" name= "p_gubun"  >
    <input type="hidden" name= "p_startdate" value = "">
    <input type="hidden" name= "p_enddate"   value = "">
    <input type="hidden" name= "p_subj"  >
    <input type="hidden" name= "p_year" value = "">
    <input type="hidden" name= "p_subjseq"   value = "">
    <input type="hidden" name= "p_grcode" value = "">
    <input type="hidden" name= "p_grseq"   value = "">
    <input type="hidden" name= "p_report_flag"   value = "">
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
                      <td width="73%" colspan="2">
                          <!------------------- ���ǰ˻� ���� ------------------------->
                          <font color="red">��</font><%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->                   
                          <font color="red">��</font><%= SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)   �����⵵  -->
                          <%= SelectEduBean.getGrseq(box, true, true)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  -->
                      </td>
                    </tr>
                    <tr>
                        <td height="5"></td>
                    </tr>
                    <tr>
                      <td width="63%">
                          <%= SelectSubjBean.getSubj(box, true, true)%><!-- getSubj(RequestBox, isChange, isALL)    ����  -->
                          <%= SelectSubjBean.getSubjseq(box, false, true)%><!-- getSubjseq(RequestBox, isChange, isALL)    ��������  -->
                          <%= SelectCompanyBean.getCompany(box, true, true)%><!-- getCompany(RequestBox, isChange, isALL)    ȸ��  -->
                      <td width="10%" align="right"><a href="javascript:whenSelection('go')"><img src="/images/admin/button/b_go.gif"  border="0" align=absmiddle></a></td>
                    </tr>
                    <tr>
                        <td height="5"></td>
                    </tr>
                    <tr>
                      <td width="45%" colspan="2">�н��Ⱓ
                        <input name="p_searchStart" id="p_searchStart" type="text" class="datepicker_input1" size="10" value="<%=v_searchStart%>"> �� ~ 
                        <input name="p_searchEnd" id="p_searchEnd" type="text" class="datepicker_input1" size="10" value="<%=v_searchEnd%>"> ��
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
 
<!------------------------------------- form �� ------------------------------------->


        <!----------------- ��ư ���� ----------------->
        <!--<table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr><td width="642" height="10"><a href="javascript:whenExcel1(1)">��������Ʈ</a></td></tr>
          <tr><td width="642" height="10"><a href="javascript:whenExcel1(2)">�뵿��������û����</a></td></tr>
          <tr><td width="642" height="10"><a href="javascript:whenExcel1(3)">�ƷýǽýŰ���(1)</a></td></tr>
          <tr><td width="642" height="10"><a href="javascript:whenExcel1(4)">�ƷýǽýŰ���(2)</a></td></tr>
          <tr><td width="642" height="10"><a href="javascript:whenExcel1(5)">���������(1)</a></td></tr>
          <tr><td width="642" height="10"><a href="javascript:whenExcel1(6)">�����ں���</a></td></tr>
          <tr><td width="642" height="10"><a href="javascript:whenExcel1(7)">���������ڸ��</a></td></tr>
          <tr><td width="642" height="10"><a href="javascript:whenExcel1(8)">�����Ʒü������߱޴���</a></td></tr>
          <tr><td width="642" height="10"><a href="javascript:whenExcel1(9)">����Ȯ�μ�</a></td></tr>
          <tr><td width="642" height="10"><a href="javascript:whenExcel1(10)">����������ɷ°����Ʒú�� ���곻����</a></td></tr>
          <tr><td width="642" height="10"><a href="javascript:whenExcel1(11)">AES��ü������ ȯ�޾� ��û���� ����</a></td></tr>
        </table>-->
        <br>

        <table class="form_table_out" cellspacing="0" cellpadding="1">
          <tr>
            <td bgcolor="#C6C6C6" align="center">
              <table class="form_table_bg" cellspacing="0" cellpadding="0" border='0'>
                <tr>
                  <td height="7"></td>
                </tr>
                <tr>
                  <td align="center">
                  <table border="0" cellspacing="3" cellpadding="3" width="99%" class="form_table">


	      <tr>
	        <td width='10%'></td>
            <td width="40%"><a href="javascript:whenExcel1(1)"><img src='/images/admin/button/btn_courselist.gif' alt='��������Ʈ' border=0></a></td>
	        <td width='10%'></td>            
            <td width="40%"><a href="javascript:whenExcel1(2)"><img src='/images/admin/button/btn_workpage.gif' alt='�뵿��������û����' border=0></a></td>
          </tr>
	      <tr>
	        <td width='10%'></td>	      
            <td width="40%"><a href="javascript:whenExcel1(3)"><img src='/images/admin/button/btn_training1.gif' alt='�ƷýǽýŰ���(1)' border=0></a></td>
	        <td width='10%'></td>            
            <td width="40%"><a href="javascript:whenExcel1(4)"><img src='/images/admin/button/btn_training2.gif' alt='�ƷýǽýŰ���(2)' border=0></a></td>
          </tr>
	      <tr>
	        <td width='10%'></td>	      
            <td width="40%"><a href="javascript:whenExcel1(5)"><img src='/images/admin/button/btn_peobogo1.gif' alt='���������(1)' border=0></a></td>
	        <td width='10%'></td>            
            <td width="40%"><a href="javascript:whenExcel1(6)"><img src='/images/admin/button/btn_pbogo.gif' alt='�����ں���' border=0></a></td>
          </tr>
	      <tr>
	        <td width='10%'></td>	      
            <td width="40%"><a href="javascript:whenExcel1(7)"><img src='/images/admin/button/btn_edupeoname.gif' alt='���������ڸ��' border=0></a></td>
	        <td width='10%'></td>            
            <td width="40%"><a href="javascript:whenExcel1(8)"><img src='/images/admin/button/btn_edupeobal.gif' alt='�����Ʒü������߱޴���' border=0></a></td>
          </tr>
	      <tr>
	        <td width='10%'></td>	      
            <td width="40%"><a href="javascript:whenExcel1(9)"><img src='/images/admin/button/btn_sunab.gif' alt='����Ȯ�μ�' border=0></a></td>
	        <td width='10%'></td>            
            <td width="40%"><a href="javascript:whenExcel1(10)"><img src='/images/admin/button/btn_busitrain.gif' alt='����������ɷ°����Ʒú�� ���곻����' border=0></a></td>
          </tr>
	      <tr>
	        <td width='10%'></td>	      
            <td width="40%"><a href="javascript:whenExcel1(11)"><img src='/images/admin/button/btn_aes.gif' alt='AES��ü������ ȯ�޾� ��û���� ����' border=0></a></td>
	        <td width='10%'></td>            
            <td width="40%"></td>
          </tr>

                <tr>
                  <td height="7"></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
            </td>
          </tr>
        </table>                
        <!----------------- ��ư �� ----------------->

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
