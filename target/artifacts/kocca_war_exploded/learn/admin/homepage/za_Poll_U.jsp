<%
//**********************************************************
//  1. ��      ��: Poll
//  2. ���α׷��� : za_Poll_U.jsp
//  3. ��      ��: Poll ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2005. 7. 13
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String v_process    = box.getString("p_process");
    String v_searchtext = box.getString("p_searchtext");

    int    v_seq     = 0;            // ���Ϸù�ȣ
    int    v_total   = 0;            // �����

    String v_title   = "";           // Ÿ��Ʋ
    String v_started = "";           // ������
    String v_ended   = "";           // �����
    String v_f_use   = "";           // ��뿩��
    String v_f_use_chk1 = "";
    String v_f_use_chk2 = "";
    String v_grcodenm= "";
    String v_grcode  = "";



    DataBox dbox  = (DataBox)request.getAttribute("selectPoll");

    v_seq     = dbox.getInt("d_seq");
    v_total   = dbox.getInt("d_total");
    v_title   = dbox.getString("d_title");
    v_grcodenm= dbox.getString("d_grcodenm");
    v_started = dbox.getString("d_started");
    v_ended   = dbox.getString("d_ended");
    v_f_use   = dbox.getString("d_f_use");
    v_total   = dbox.getInt("d_total");
    v_grcode  = dbox.getString("d_grcode");

    v_ended   = FormatDate.getFormatDate(v_ended,"yyyy/MM/dd");
    v_started = FormatDate.getFormatDate(v_started,"yyyy/MM/dd");
    
    box.put("s_grcode",v_grcode);

    if (v_f_use.equals("Y")) v_f_use_chk1 = "checked";
    else v_f_use_chk2 = "checked";


    int v_cnt     = 0;
    int v_percent = 0;
    int v_selnum  = 0;
    String v_seltxt = "";
    
    ArrayList list = (ArrayList)request.getAttribute("selectResultPoll");

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
	$("#p_ldate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});

    function insert_check() {
        var checkcnt = 0;
        var st_date = make_date(document.form1.p_sdate.value);
        var ed_date = make_date(document.form1.p_ldate.value);

        if (blankCheck(document.form1.p_title.value)) {
            alert("������ �Է��ϼ���!");
            document.form1.p_title.focus();
            return;
        }
        if(document.form1.p_title.value.length >= 300){
            alert("������ 300�� �̳��� ���ּ���.!");
            document.form1.p_title.focus();
            return;    
        }
        
        if(blankCheck(document.form1.p_sdate.value)){
        alert("���� �������� �Է��ϼ���.");
        return;
      }
    
        if(blankCheck(document.form1.p_ldate.value)){
        alert("���� �������� �Է��ϼ���.");
        return;
        }

        if(st_date > ed_date){
        alert("polling �������� �����Ϻ��� Ů�ϴ�.");
        return;
        }

       for(i = 0; i < document.form1.elements.length; i++) {
           if(document.form1.elements[i].name == 'p_seltxt') {
               if (!(document.form1.elements[i].value== '') ) checkcnt++;
           }
       }

        if (checkcnt < 2 ) {
            alert("������ �ΰ��̻� �ԷµǾ���մϴ�.");
            return;
        }

        quotation_chk();
        document.form1.p_started.value = st_date;
        document.form1.p_ended.value   = ed_date;
        document.form1.p_searchtext.value = "";

        document.form1.action = "/servlet/controller.homepage.PollAdminServlet";
        document.form1.p_process.value = "update";
        document.form1.submit();
    }

    function list() {
        document.form1.action = "/servlet/controller.homepage.PollAdminServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }

//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form name = "form1" method = "post">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top"> 
    <input type = "hidden" name = "p_process"    value = "<%= v_process %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext%>">
    <input type = "hidden" name = "p_seq"        value = "<%=v_seq%>">
    <input type = "hidden" name = "p_started"    value = "">
    <input type = "hidden" name = "p_ended"      value = "">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td background="/images/admin/homepage/title_bg.gif" class="page_title"><img src="/images/admin/homepage/homepage_title2.gif"  border="0"></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->

        <br>
        <br>
        <!----------------- CyberPoll���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="18%" height="25" class="table_title"><b>������ȣ</b></td>
            <td class="table_02_2" width="79%"><%=v_seq%></td>
          </tr>
		  <tr>
            <td width="18%" height="25" class="table_title"><b>�����׷�</b></td>
			<td class="table_02_2" width="79%">
				<!------------------- �����׷� ���� ------------------------->
				<%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
			</td>
		  </tr>
          <tr> 
            <td class="table_title" height="25"><b>����</b></td>
            <td class="table_02_2"> 
              <input name="p_title" type="text" class="input" size="112" value='<%=v_title%>'>
            </td>
          </tr>
          <tr> 
            <td height="25" class="table_title"><b>�Ⱓ����</b></td>
            <td class="table_02_2"> 
              <input name="p_sdate" id="p_sdate" class="datepicker_input1" type="text" size="10" value='<%=v_started%>'>
              ~ 
              <input name="p_ldate" id="p_ldate" class="datepicker_input1" type="text" size="10" value='<%=v_ended%>'>
            </td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>����</b></td>
            <td class="table_02_2">

              <table width="100%" border="0" cellspacing="0" cellpadding="0">
<%
int i = 0;
            for(i = 0; i < list.size(); i++) {

                
                DataBox dbox1 = (DataBox)list.get(i);

                v_selnum = dbox1.getInt("d_selnum");
                v_seltxt = dbox1.getString("d_seltxt");
                v_cnt    = dbox1.getInt("d_cnt");
                
%>
                <tr>
                  <td><b><%=i+1%></b> 
                    <input name="p_seltxt" type="text" class="input" size="110" value='<%=v_seltxt%>'>
                  </td>
                </tr>
               <tr><td height="4"></td></tr>
<%
              }
%>

<%
               // 0���� ���������Ƿ� (11-list.size())
               for(i = (11-list.size()); i <= 10; i++) {

%>
                <tr>
                  <td><b><%=i%></b> 
                    <input name="p_seltxt" type="text" class="input" size="110">
                  </td>
                </tr>
               <tr><td height="4"></td></tr>
<%
              }
%>

              </table>

            </td>
          </tr>
          <tr> 
            <td height="25" class="table_title"><b>���ε��</b></td>
            <td class="table_02_2">
              <input type="radio" name="p_f_use" value="Y" <%=v_f_use_chk1%>>���ε�� 
              <input type="radio" name="p_f_use" value="N" <%=v_f_use_chk2%>>��Ͼ���
            </td>
          </tr>
        </table>
        <!----------------- CyberPoll���� �� ----------------->

        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr><td height="6"></td></tr>
          <tr>
            <td>* ���� 1,2�� �ݵ�� �Է��� �ּ���.</td>
          </tr>
        </table>

        <br>
        <!----------------- ����, ��� ��ư ���� ----------------->
        <table width="11%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"><a href='javascript:insert_check()'><img src="/images/admin/button/btn_save.gif"  border="0"></a>&nbsp;</td>
            <td align="center"><a href='javascript:list()'><img src="/images/admin/button/btn_list.gif"  border="0"></a>&nbsp;</td>
          </tr>
        </table>
        <!----------------- ����, ��� ��ư �� ----------------->

        <br>
      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %> 
</form>
</body>
</html>
