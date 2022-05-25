<%
//**********************************************************
//  1. ��      ��: �������
//  2. ���α׷��� : za_UserEntryList_L.jsp
//  3. ��      ��: ������� - ������� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 8
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.statistics.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
    String v_action    = box.getString("p_action");
    String v_process = box.getString("p_process");

    String v_sindate  = box.getStringDefault("p_project_year_s",  FormatDate.getDate("yyyy"));
    String v_eindate  = box.getStringDefault("p_project_year_e",  FormatDate.getDate("yyyy"));

    String v_fmt_usercnt = "";
    String v_indate      = "";
    String v_usercnt     = "";
    int    v_maxcnt      = 0;
    int    v_usercnt_i   = 0;
    int    v_percent     = 0;
    
    int    v_man_i = 0;
    int    v_woman_i = 0;
    
    int    v_man_total = 0;
    int    v_woman_total = 0;    
    
    int    v_fmt_usercnt_tatal = 0;

    int     v_sindate_i = 0;
    int     v_eindate_i = 0;
    
    String 	v_man = "";
    String 	v_woman = "";

    ArrayList list = null;
    int listsize = 0;
    if ( v_action.equals("go") ) {
        list = (ArrayList)request.getAttribute("SubjQnaCnt");
        listsize = list.size();
    }

%>

<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>

 <link href="/css/layout.css" rel="stylesheet" type="text/css">
  <script language="javascript" type="text/javascript" src="/js/flot/excanvas.min.js"></script>
  <script language="javascript" type="text/javascript" src="/js/flot/jquery.js"></script>
  <script language="javascript" type="text/javascript" src="/js/flot/jquery.flot.js"></script>
  <script language="javascript" type="text/javascript" src="/js/flot/jquery.flot.pie.js"></script>
  
   
<SCRIPT LANGUAGE="JavaScript">
<!--

function whenSelection(p_action) {
/*	
  if (p_action == 'go') {
    if (document.form1.p_grtype.value == '' || document.form1.p_grtype.value == '----') {
        alert("��������� �����ϼ���.");
        return ;
    }
  }
*/
  document.form1.p_action.value = p_action;
  document.form1.action='/servlet/controller.statistics.VocStatusticServlet';
  document.form1.target = "_self";
  document.form1.p_process.value = 'selectSubQna';
  document.form1.submit();
}

function whenGrtype(){
    document.form1.p_action.value = 'change';
    document.form1.action='/servlet/controller.statistics.VocStatusticServlet';
    document.form1.target = "_self";
    document.form1.p_process.value = 'selectYearCnt';
    document.form1.submit();
}

// �� ����
function select_tab(sel){
    document.form1.p_action.value = 'change';
    document.form1.target = "_self";
    if(sel == "1")      { document.form1.p_process.value = "selectSubQna"; }
    else if(sel == "2") { document.form1.p_process.value = "selectQna";}
    else if(sel == "3") { document.form1.p_process.value = "selectVocCnt";}
    else if(sel == "4") { document.form1.p_process.value = "selectOnetoOne";}
    else if(sel == "5") { document.form1.p_process.value = "selectFactoryCnt";}
    document.form1.action = '/servlet/controller.statistics.VocStatusticServlet';
    document.form1.submit();
}

//-->
</SCRIPT>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process" value = "<%= v_process %>">
    <input type = "hidden" name = "p_action"  value = "<%=v_action%>">
    <input type = "hidden" name = "p_gubun"   value = "">


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/statistics/tit_sum_d2.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->
      <br>
      <!----------------- �����׷� ���� ----------------->
     <table class="form_table_out" cellspacing="0" cellpadding="1">
      <tr>
        <td bgcolor="#C6C6C6" align="center">
          <table class="form_table_bg" cellspacing="0" cellpadding="0" border='0'>
            <tr>
              <td height="7"></td>
            </tr>
            <tr>
              <td align="center">

              <table width="97%" cellspacing="1" cellpadding="5" >
                <tr>
                  
                  <td > �⵵
                    <select name = "p_project_year_s" >
                      <%=FormatDate.getDateOptions(2004,Integer.parseInt(FormatDate.getDate("yyyy"))+5, Integer.parseInt(v_sindate))%>
                    </select> -
                    <select name = "p_project_year_e">
                      <%=FormatDate.getDateOptions(2004,Integer.parseInt(FormatDate.getDate("yyyy"))+5, Integer.parseInt(v_eindate))%>
                    </select>
                  </td>
                  <td width="10%" align="right"><%@ include file="/learn/admin/include/za_GoButton.jsp" %></td><!-- whenSelection('go') --></td>    
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

    <br>
    <br>
    <!----------------- tab ���� ----------------->

      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="12%">

        <!----------------- button 1 ����----------------->
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td rowspan="3" class="blue_butt_left"></td>
                <td class="blue_butt_top"></td>
                <td rowspan="3" class="blue_butt_right"></td>
              </tr>
              <tr>
                <td class="blue_butt_middle">����Q/A</td>
              </tr>
              <tr>
                <td class="blue_butt_bottom"></td>
              </tr>
            </table>
        <!----------------- button 1 ��----------------->

          </td>
          <td width="1%"></td>
          <td width="12%">

        <!----------------- button 2 ����----------------->
            <table cellspacing="0" cellpadding="0" class="s_table">
                <tr>
                  <td rowspan="3" class="black_butt_left"></td>
                  <td class="black_butt_top"></td>
                  <td rowspan="3" class="black_butt_right"></td>
                </tr>
                <tr>
                  <td class="black_butt_middle"><a href="javascript:select_tab('2')" class="c">Q/A</a></td>
                </tr>
                <tr>
                  <td class="black_butt_bottom"></td>
                </tr>
              </table>
        <!----------------- button 2 ��----------------->

             </td>
             <td width="1%"></td>
                <td width="12%">

        <!----------------- button 3 ����----------------->
              <table cellspacing="0" cellpadding="0" class="s_table">
                <tr>
                  <td rowspan="3" class="black_butt_left"></td>
                  <td class="black_butt_top"></td>
                  <td rowspan="3" class="black_butt_right"></td>
                </tr>
                <tr>
                  <td class="black_butt_middle"><a href="javascript:select_tab('3')" class="c">VOC</a></td>
                </tr>
                <tr>
                  <td class="black_butt_bottom"></td>
                </tr>              
                
              </table>
        <!----------------- button 3 ��----------------->

          </td>
          <td width="1%"></td>
          
          <td width="12%">

        <!----------------- button 3 ����----------------->
              <table cellspacing="0" cellpadding="0" class="s_table">
                <tr>
                  <td rowspan="3" class="black_butt_left"></td>
                  <td class="black_butt_top"></td>
                  <td rowspan="3" class="black_butt_right"></td>
                </tr>
                <tr>
                  <td class="black_butt_middle"><a href="javascript:select_tab('4')" class="c">1:1</a></td>
                </tr>
                <tr>
                  <td class="black_butt_bottom"></td>
                </tr>              
                
              </table>
        <!----------------- button 3 ��----------------->

          </td>
          <td width="1%"></td>
          
          <td width="12%">

        <!----------------- button 3 ����----------------->
              <table cellspacing="0" cellpadding="0" class="s_table">
                <tr>
                  <td rowspan="3" class="black_butt_left"></td>
                  <td class="black_butt_top"></td>
                  <td rowspan="3" class="black_butt_right"></td>
                </tr>
                <tr>
                  <td class="black_butt_middle"><a href="javascript:select_tab('5')" class="c">�������丮</a></td>
                </tr>
                <tr>
                  <td class="black_butt_bottom"></td>
                </tr>              
                
              </table>
        <!----------------- button 3 ��----------------->

          </td>
          <td width="1%"></td>
          <td width="75%">&nbsp;</td>
        </tr>
        <tr>
          <td height="2" colspan="4" bgcolor="#6699CC"></td>
        </tr>
      </table>
    <!----------------- tab �� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="11" class="table_top_line"></td>
          </tr>

          <tr>
            <td class="table_title" width="10%">��ȣ</td>
            <td class="table_title" width="50%">������</td>
            <td class="table_title" width="20%">�����Ǽ�</td>                        
            <td class="table_title" width="20%">����Ǽ�</td>
          </tr>
<%
    if ( v_action.equals("go") ) {
        for ( int i=0; i<list.size(); i++ ) {
            DataBox dbox = (DataBox)list.get(i);           
     
%>
          <tr class="table_02_1">
            <td class="table_02_1"><%=i+1%></td>
            <td class="table_02_1"><%=dbox.getString("d_subjnm")%></td>
            <td class="table_02_1"><%=dbox.getString("d_que")%></td>
            <td class="table_02_1"><%=dbox.getString("d_ans")%></td>
           </tr>
<%
        }
%>
        
          </tr>

<%
            }
%>

          </tr>
        </table>
   </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
