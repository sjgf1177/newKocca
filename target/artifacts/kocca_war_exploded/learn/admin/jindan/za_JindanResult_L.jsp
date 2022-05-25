<%
/**
 * file name : za_JindanResult_L.jsp
 * date      : 2003/08/29
 * programmer:
 * function  : ���ܰ�� �м� - ����Ʈ������
 */
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.exam.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String	v_process		= box.getString("p_process");
    String	v_action		= box.getString("p_action");
    String	v_grcode		= box.getStringDefault("s_grcode","ALL");        //�����׷�

    String  v_searchStart	= box.getString("p_searchStart");
    String  v_searchEnd		= box.getString("p_searchEnd");
    String  v_name			= box.getString("p_name");

    int		v_pageno	= box.getInt("p_pageno");
    int		v_pagesize	= box.getInt("p_pagesize");

    //��������
    if (v_pageno == 0)  v_pageno = 1;
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));

    //�������� ���ڵ��
    if (v_pagesize == 0)  v_pagesize = 10;

    int     v_totalpage		 = 0;
    int     v_rowcount		 = 1;
    int     v_totalrowcount	 = 0;
    int     v_rowspan		 = 0;
    int     v_total			 = 0;
    int		v_dispnum		 = 0;
%>
<html>
<head>
<title>�򰡹�������-����Ʈ</title>
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

// ���� ��ȸ
function whenSelection(p_action) {

    var v_grcode, v_subj, v_upperclass, v_middleclass, v_lowerclass;

    v_grcode        = document.form1.s_grcode.options[document.form1.s_grcode.selectedIndex].value;

//    v_upperclass  = document.form1.s_upperclass.value;
//   v_middleclass = document.form1.s_middleclass.value;
//    v_lowerclass  = document.form1.s_lowerclass.value;

    if (document.form1.s_grcode.value == '----') {
            alert("�����׷��� �����ϼ���.");
            return ;
    }

    document.form1.p_startdate.value = make_date(document.form1.p_searchStart.value);
    document.form1.p_enddate.value = make_date(document.form1.p_searchEnd.value);
    
    if (p_action=="go") {
     document.form1.p_process.value = 'JindanResultListPage';
     document.form1.p_action.value  = p_action;
     document.form1.p_pageno.value = 1;
     document.form1.target = "_self"
     document.form1.submit();
     top.ftop.setPam();
    } else {
     document.form1.p_process.value = 'JindanResultListPage';
     document.form1.p_action.value  = p_action;
     document.form1.target = "_self"
     document.form1.submit();

    }
}


//�����̷»󼼳���
function historyGo(class1, class2, class3, ldate, userid){

    window.open("", "selfHistory", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 720, height = 680, top=0, left=0");
    document.form1.target = "selfHistory"
    document.form1.p_upperclass.value = class1;
    document.form1.p_middleclass.value = class2;
    document.form1.p_lowerclass.value = class3;
    document.form1.p_jindanDate.value = ldate;
    document.form1.p_userid.value = userid;
    document.form1.p_process.value = 'JindanResultDetail';
    document.form1.action = "/servlet/controller.jindan.JindanResultServlet";
    document.form1.submit();
    }

//������ �̵�
function go(index) {
     document.form1.target = "_self";
     document.form1.p_pageno.value = index;
     document.form1.p_startdate.value = make_date(document.form1.p_searchStart.value);
     document.form1.p_enddate.value = make_date(document.form1.p_searchEnd.value);
     document.form1.action = '/servlet/controller.jindan.JindanResultServlet';
     document.form1.p_process.value = "JindanResultListPage";
     document.form1.submit();
}

// ������ �̵�
function goPage(pageNum) {
     document.form1.target = "_self";
     document.form1.p_pageno.value = pageNum;
     document.form1.p_startdate.value = make_date(document.form1.p_searchStart.value);
     document.form1.p_enddate.value = make_date(document.form1.p_searchEnd.value);
     document.form1.action = '/servlet/controller.jindan.JindanResultServlet';
     document.form1.p_process.value = "JindanResultListPage";
     document.form1.submit();
}

// ������ ������ ����
function pagesize(pageSize) {
     document.form1.target = "_self";
     document.form1.p_pageno.value = 1;
     document.form1.p_pagesize.value = pageSize;
     document.form1.p_startdate.value = make_date(document.form1.p_searchStart.value);
     document.form1.p_enddate.value = make_date(document.form1.p_searchEnd.value);
     document.form1.action = '/servlet/controller.jindan.JindanResultServlet';
     document.form1.p_process.value = "JindanResultListPage";
     document.form1.submit();
}

//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/etest/jindan_title02.gif" ></td>
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
            <form name="form1" method="post" action="/servlet/controller.jindan.JindanResultServlet">
               <input type="hidden" name="p_process" value="">
                <input type="hidden" name="p_action"  value="<%=v_action%>">
                <INPUT TYPE="hidden" NAME="p_upperclass">
                <INPUT TYPE="hidden" NAME="p_middleclass">
                <INPUT TYPE="hidden" NAME="p_lowerclass">
                <INPUT TYPE="hidden" NAME="p_jindanDate">
                <INPUT TYPE="hidden" NAME="p_userid">
                <input type="hidden" name="p_startdate" value = "">
                <input type="hidden" name="p_enddate"   value = "">
                <input type="hidden" name="p_pageno" value="<%=v_pageno%>">
                <input type="hidden" name="p_pagesize" value="<%=v_pagesize%>">

              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center">
                  <table class="form_table" border=0 cellspacing="0" cellpadding="0" width="99%">
                    <tr>
                      <td colspan=3><font color="red">��</font>
                         <%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
                         <%= SelectSubjBean.getUpperClass(box, true, true, false)%><!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  -->
                         <%= SelectSubjBean.getMiddleClass(box, true, true, false)%><!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  -->
                         <%= SelectSubjBean.getLowerClass(box, true, true, false)%><!-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    �����Һз�  -->
                         <%//SelectSubjBean.getSubj(box, true, false)%><!-- getSubj(RequestBox, isChange, isALL)    ����  -->
                         <%//@ include file="/learn/admin/include/za_GoButton.jsp" %>
                         �Ⱓ
                        <input name="p_searchStart" id="p_searchStart" type="text" class="datepicker_input1" size="10" value="<%=v_searchStart%>"> -
                        <input name="p_searchEnd" id="p_searchEnd" type="text" class="datepicker_input1" size="10" value="<%=v_searchEnd%>">
                      </td>
                    </tr>
                    <tr>
                      <td align="left" width="20%">
                      ���� <input name="p_name" type="text" class="input" value="<%= v_name %>"> <a href="javascript:whenSelection('go')"><img src="/images/admin/button/search3_butt.gif"  border="0" align="absmiddle"></a>
                      </td>
                      <td width="63%"></td>

                      <td width="10%" align="right"><%@ include file="/learn/admin/include/za_GoButton.jsp" %></td><!-- whenSelection('go') -->
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="7"></td>
              </tr>
            </form>
            </table>
          </td>
        </tr>
      </table>
      <!----------------- form �� ----------------->
      <br>
      <br>
      <!----------------- ������, �߰���ư ���� ----------------->
      <table cellpadding="0" cellspacing="0" class="heed_table">
        <tr>
          <td height="3"></td>
           <td height="3"></td>
            <td height="3"></td>
             <td height="3"></td>
              <td height="3"></td>
        </tr>
      </table>
      <!-----------------  ������, �߰���ư �� ----------------->
      <!----------------- ���ܰ���м� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr>
          <td colspan="7" class="table_top_line"></td>
        </tr>
        <tr>
          <td width="10%" class="table_title">NO</td>
          <td width="15%" class="table_title">ID</td>
          <td width="15%" class="table_title">����</td>
          <td width="15%" class="table_title">�ߺз�</td>
          <td width="15%" class="table_title">�Һз�</td>
          <td width="20%" class="table_title">������</td>
          <td width="10%" class="table_title">�������</td>


        </tr>
<%
        ArrayList  list = (ArrayList)request.getAttribute("JindanResultAdminList");

if ( list.size() != 0 ) {       //������ �ִٸ�

        DataBox dbox = null;
        String lDate = "";
        String lDate2 = "";
        int avg = 0;
        int totalcnt = list.size();

        for (int i=0; i<list.size(); i++) {
        dbox    = (DataBox)list.get(i);
        lDate   = FormatDate.getFormatDate(dbox.getString("d_ldate"),"yyyy/MM/dd");
        lDate2  = FormatDate.getFormatDate(dbox.getString("d_ldate"),"yyyyMMdd");
        avg     = dbox.getInt("d_score") / dbox.getInt("d_cnt");

        //������ ������
		v_totalpage     = dbox.getInt("d_totalpage");
        v_rowcount      = dbox.getInt("d_rowcount");
        v_totalrowcount = dbox.getInt("d_totalrowcount");
        v_dispnum       = dbox.getInt("d_dispnum");

%>
        <tr>
          <td class="table_01"><%=v_dispnum%></td>
          <td class="table_01"><A HREF="javascript:historyGo('<%=dbox.getString("d_upperclass")%>','<%=dbox.getString("d_middleclass")%>','<%=dbox.getString("d_lowerclass")%>','<%=lDate2%>','<%=dbox.getString("d_userid")%>')"  class="e"><%=dbox.getString("d_userid")%></A></td>
          <td class="table_02_2"><%=dbox.getString("d_name")%></td>
          <td class="table_02_1"><%=dbox.getString("d_middleclassnm")%></td>
          <td class="table_02_1"><%=dbox.getString("d_lowerclassnm")%></td>
          <td class="table_02_1"><%=lDate%></td>
          <td class="table_02_1"><%=avg%></td>
       </tr>
<%      }
    }

 %>
      </table>
      <!----------------- ���ܰ���м� �� ----------------->
      <br>
      <!----------------- page navi ���� ----------------->
      <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="right" valign="absmiddle">
            <%= PageUtil.printPageSizeList(v_totalpage, v_pageno, row, v_pagesize, v_totalrowcount) %>
          </td>
        </tr>
      </table>
      <!----------------- page navi �� ----------------->

    </td>
  </tr>


</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
