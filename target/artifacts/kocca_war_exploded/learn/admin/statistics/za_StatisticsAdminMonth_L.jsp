<%
//**********************************************************
//  1. ��      ��: 
//  2. ���α׷���:  
//  3. ��      ��: 
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "java.lang.*" %>
<%@ page import = "java.lang.String.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.scorm.*" %>
<%@ page import = "com.credu.statistics.*" %>
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
    String  v_edustart  =  "";
    String  v_eduend    =  "";
    String  v_fmt_biyong    =  "";
    String  v_stucnt     =  "";
    int     v_fmt_stucnt_tatal      =   0;
    int     v_fmt_subjsales_tatal   =   0;
    
    String  ss_grcode       = box.getString("s_grcode");          //�����׷�
    String  ss_gyear        = box.getString("s_gyear");           //�⵵
    String  ss_grseq        = box.getString("s_grseq");           //��������
    String  ss_grseqnm      = box.getString("s_grseqnm");         //����������
    String  ss_upperclass   = box.getString("s_upperclass");      //������з�
    String  ss_middleclass  = box.getString("s_middleclass");     //�����ߺз�
    String  ss_lowerclass   = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse   = box.getString("s_subjcourse");      //����&�ڽ�
    String  ss_subjseq      = box.getString("s_subjseq");         //���� ����

    String  ss_edustart     = box.getString("s_start");            //����������
    String  ss_eduend       = box.getString("s_end");              //����������


    ArrayList list = null;
    int listsize = 0;
    if ( v_action.equals("go") ) {
        list = (ArrayList)request.getAttribute("StatisticsMonthList");

        listsize = list.size();
    }

    int v_stucnt_total      = 0;
    int v_subjsales_total   = 0;
    int v_scbiyong  = 0;
    int v_stucnt_i  = 0;
    int v_eduend_i  = 0;
    int v_subjsales = 0;

    String searchStart = FormatDate.getFormatDate(startDate,"yyyy-MM-dd");
    String searchEnd   = FormatDate.getFormatDate(endDate,"yyyy-MM-dd");
    
    String v_searchStart = box.getString("p_searchStart");
    String v_searchEnd   = box.getString("p_searchEnd");
    String v_script_month = "";
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
function whenSelection(p_action) {

  document.form1.p_action.value = p_action;
  if (p_action == 'go') {
    top.ftop.setPam();
  }
  
  document.form1.p_startdate.value = make_date(document.form1.p_searchStart.value);
  document.form1.p_enddate.value = make_date(document.form1.p_searchEnd.value);

  document.form1.action='/servlet/controller.statistics.StatisticsAdminServlet';
  document.form1.target = "_self";
  document.form1.p_process.value = 'StatisticsMonth';                  //com.statistics.StatisticsAdminBean.selectStudentList(box);
  document.form1.submit();
}

//�޺��ڽ� �Է¿��ο� ���� �޼����� ����ش�.
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

// ����
function whenOrder(column) {
  if (document.form1.p_orderType.value == " asc") {
        document.form1.p_orderType.value = " desc";
    } else {
        document.form1.p_orderType.value = " asc";
    }

    document.form1.p_order.value = column;
    whenSelection("go");
}

// �� ����
function select_tab(sel){
    document.form1.target = "_self";
    if(sel == "1")      { document.form1.p_process.value = "StatisticsExe";    }
    else if(sel == "2") { document.form1.p_process.value = "StatisticsMonth";}
    document.form1.action = '/servlet/controller.statistics.StatisticsAdminServlet';
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
          <td><img src="/images/admin/statistics/tit_sum_d1.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->
        <br>

<!------------------------------------- form ���� ------------------------------------->
<form name = "form1" method = "post" action="/servlet/controller.statistics.StatisticsAdminServlet">
    <input type="hidden" name= "p_process" value="listPage">
    <input type="hidden" name= "p_masternm"  value="">
    <input type="hidden" name= "p_mastercd"  value="">
    <input type="hidden" name= "p_action"  value="<%=v_action%>">
    <input type="hidden" name= "p_order"  value="name">
    <input type="hidden" name= "p_gubun"  >
    <input type="hidden" name= "p_startdate" value = "">
    <input type="hidden" name= "p_enddate"   value = "">
    <input type="hidden" name= "p_subj"  >
    <input type="hidden" name= "p_year" value = "">
    <input type="hidden" name= "p_subjseq"   value = "">
    <input type="hidden" name= "p_grcode" value = "">
    <input type="hidden" name= "p_grseq"   value = "">

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
                      <td width="22.5%" colspan="2" align="left" valign="middle">
                        <!------------------- ���ǰ˻� ���� ------------------------->
                            <%= SelectEduBean.getGrcode(box, true, true)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
                      </td>   
                      <td width="76.5%" colspan="2">
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
                      <td colspan="4">
                        <input name="p_searchStart" type="hidden" class="input" size="10" maxlength=10  value="<%=v_searchStart%>" OnClick="MiniCal(this)" readonly> &nbsp;
                        <input name="p_searchEnd" type="hidden" class="input" size="10" maxlength=10  value="<%=v_searchEnd%>" OnClick="MiniCal(this)" readonly>
                        <%= SelectSubjBean.getSubj(box, true, true)%><!-- getSubj(RequestBox, isChange, isALL)    ����  -->
                        <%= SelectSubjBean.getSubjseq(box, false, true)%><!-- getSubjseq(RequestBox, isChange, isALL)    ��������  -->
                        </td>
                      <td width="10%" align="right"><%@ include file="/learn/admin/include/za_GoButton.jsp" %></td><!-- whenSelection('go') -->
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


    <!----------------- tab ���� ----------------->
       <br>
       <br>
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="12%"> 

        <!----------------- button 1 ����----------------->
              <table cellspacing="0" cellpadding="0" class="s_table">
                <tr>
                  <td rowspan="3" class="black_butt_left"></td>
                  <td class="black_butt_top"></td>
                  <td rowspan="3" class="black_butt_right"></td>
                </tr>
                <tr>
                  <td class="black_butt_middle"><a href="javascript:select_tab('1')" class="c">������</a></td>
                </tr>
                <tr>
                  <td class="black_butt_bottom"></td>
                </tr>
              </table>
        <!----------------- button 1 ��----------------->

          </td>
          <td width="1%"></td>
          <td width="12%">

        <!----------------- button 2 ����----------------->
              <table cellspacing="0" cellpadding="0" class="s_table">
                <tr>
                  <td rowspan="3" class="blue_butt_left"></td>
                  <td class="blue_butt_top"></td>
                  <td rowspan="3" class="blue_butt_right"></td>
                </tr>
                <tr>
                  <td class="blue_butt_middle">����</td>
                </tr>
                <tr>
                  <td class="blue_butt_bottom"></td>
                </tr>
              </table>
        <!----------------- button 2 ��----------------->
             </td>
          <td width="75%">&nbsp;</td>
        </tr>
        <tr> 
          <td height="2" colspan="4" bgcolor="#6699CC"></td>
        </tr>
      </table>
    <!----------------- tab �� ----------------->


        <!----------------- ��ȸ ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="11" class="table_top_line"></td>
          </tr>
 
          <tr>
            <td class="table_title" width="20%">��</td>
            <td class="table_title" width="40%">�����ο�</td>
            <td class="table_title" width="40%">�����</td>
          </tr>
<%
    if ( v_action.equals("go") ) {
        int k = 0;
        for(int j=1; j<=12; j++){
            NumberFormat fmt = NumberFormat.getInstance();              //��ȭ���� ,ǥ��

            if (k < list.size()) {
                DataBox dbox = (DataBox)list.get(k);

                v_eduend    =   dbox.getString("d_submonth");               //�������������� "��"
                if (v_eduend.equals("")) v_eduend = "01";
                v_eduend_i  =   Integer.parseInt(v_eduend);
                v_stucnt    =   dbox.getString("d_stucnt");                 //�����ο�
                v_scbiyong  =   dbox.getInt("d_totalbiyong");               //�����
                v_stucnt_i  =   Integer.parseInt(v_stucnt);                 //�ο��� int ������
//              v_subjsales =   Integer.parseInt(v_scbiyong);   
                
                v_fmt_stucnt_tatal  +=  v_stucnt_i;
                v_fmt_subjsales_tatal   +=  v_scbiyong;

                k++;
              } else {
                v_eduend    = String.valueOf(j);
                v_eduend_i  = Integer.parseInt(v_eduend);
                v_stucnt_i  = 0;
                v_scbiyong  = 0;
              }

              while (StringManager.toInt(v_eduend)  >j) {
%>
                <tr class="table_02_1">
                    <td class="table_02_1"><%=j+" ��"%></td>
                    <td class="table_02_1">0</td>   
                    <td class="table_02_1">0</td>
                </tr>
<%
                  j++;
              }
%>
                <tr class="table_02_1">
                    <td class="table_02_1"><%=v_eduend_i+" ��"%></td>
                    <td class="table_02_1"><%=fmt.format(v_stucnt_i)%></td> 
                    <td class="table_02_1"><%=fmt.format(v_scbiyong)%></td>
                </tr>
<%  
        }
            NumberFormat fmt = NumberFormat.getInstance();              //��ȭ���� ,ǥ��
%>
          <tr> 
            <td class="table_title">��</td>
            <td class="table_title" width="10%"><%=fmt.format(v_fmt_stucnt_tatal)%></td>
            <td class="table_title" width="25%"><%=fmt.format(v_fmt_subjsales_tatal)%></td>
          </tr>
<%
    }
%>
        </table>
        
   
        <!----------------- ��ȸ �� ----------------->

        <br>
      </td>
  </tr>
</table>
</form>
<table>
    <tr><td>
    <%@ include file = "/learn/library/getJspName.jsp" %>
    </td></tr>
</table>
<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false' 
ondragstart='return false' onselectstart='return false' 
style="background : buttonface; margin: 5; margin-top: 2;border-top: 1 
solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1 
solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99">
</div>
</body>
</html>
