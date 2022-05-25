<%
/**
 * file name : za_DamunSubjQuestion_L.jsp
 * date      : 2003/08/20
 * programmer:
 * function  : �ٸ��� �������� - ����Ʈ������
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.multiestimate.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
	RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    int v_classdepth = conf.getInt("subj.class.depth");

    String  v_process      = box.getString("p_process");
    String  v_action       = box.getString("p_action");
    String  v_gubun        = box.getStringDefault("p_gubun",DamunSubjBean.DEFAULT_SUBJ);
    String  v_distcode    = box.getString("s_distcode");        //�����з�

    String  v_grcode    = box.getStringDefault("s_grcode","ALL");        //�����׷�
    String  v_gyear     = box.getString("s_gyear"); 
	String  v_grseq     = box.getString("s_grseq");

	String  ss_upperclass  = box.getStringDefault("s_upperclass","ALL");
    String  ss_middleclass = box.getStringDefault("s_middleclass","ALL");
    String  ss_lowerclass  = box.getStringDefault("s_lowerclass","ALL");
    String  ss_subjcourse  = box.getString("s_subjcourse");

    String  ss_distcode    = box.getStringDefault("s_distcode","ALL");

    String  s_gadmin = box.getSession("gadmin");
    String v_tab_color1 = "blue";
    String v_tab_color2 = "black";
    String v_tab_color3 = "black";
	String v_tab_color4 = "black";
%>
<html>
<head>
<title>�ٸ��򰡹�������-����Ʈ</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language="JavaScript">
<!--
function changeTabpage(p_gubun) {

   if (p_gubun == "COMMON") {
      document.form1.action = "/servlet/controller.multiestimate.DamunCommonQuestionServlet";
	
	} 
	  document.form1.p_process.value = "DamunQuestionListPage";
	  document.form1.p_gubun.value = p_gubun;
      document.form1.s_grcode.value = "";
      document.form1.submit();     
}
function whenSelection(p_action) {

    var v_grcode, v_gubun, v_subj, v_distcode, v_upperclass, v_middleclass, v_lowerclass;

	v_grcode        = document.form1.s_grcode.options[document.form1.s_grcode.selectedIndex].value;
	v_gubun       = document.form1.p_gubun.value;

    v_subj        = document.form1.s_subjcourse.value;
    v_upperclass  = document.form1.s_upperclass.value;
    v_middleclass = document.form1.s_middleclass.value;
    v_lowerclass  = document.form1.s_lowerclass.value;

    if (p_action=="go") {
		if (document.form1.s_grcode.value == '----') {
				alert("�����׷��� �����ϼ���.");
				return ;
		}
		if (document.form1.s_grseq.value == '----') {
				alert("���������� �����ϼ���.");
				return ;
		}    
        if (v_subj=="----"){
            alert("������ �����ϼ���");
            return;
        }
     document.form1.p_process.value = 'DamunQuestionListPage';
     document.form1.p_action.value  = p_action;
	 document.form1.submit();		
      top.ftop.setPam();
	} else {
     document.form1.p_process.value = 'DamunQuestionListPage';
     document.form1.p_action.value  = p_action;
     document.form1.p_grcode.value  = v_grcode;
	 document.form1.submit();	
	}
}
function detailSelect(p_damunnum) {
       window.self.name = "winSelectView";
        farwindow = window.open("", "openWinQuestion", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no, width = 667, height = 767, top=0, left=0");
        document.form1.target = "openWinQuestion";
		document.form1.action = "/servlet/controller.multiestimate.DamunSubjQuestionServlet";
		document.form1.p_process.value = "DamunQuestionUpdatePage";
		document.form1.p_damunnum.value = p_damunnum;
		document.form1.p_subj.value = document.form1.s_subjcourse.value;
		document.form1.submit();

        farwindow.window.focus();
        document.form1.target = window.self.name;
}
function insert() {

	if (document.form1.s_grcode.value == '----') {
			alert("�����׷��� �����ϼ���.");
			return ;
	}
	if (document.form1.s_grseq.value == '----') {
			alert("���������� �����ϼ���.");
			return ;
	}    	
    if (document.form1.s_subjcourse.value=="----"){
            alert("������ �����ϼ���");
            return;
    }
        window.self.name = "winSelectView";
        farwindow = window.open("", "openWinQuestion", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no, width = 667, height = 767, top=0, left=0");
        document.form1.target = "openWinQuestion";
		document.form1.action = "/servlet/controller.multiestimate.DamunSubjQuestionServlet";
		document.form1.p_process.value = "DamunQuestionInsertPage";
		document.form1.p_subj.value = document.form1.s_subjcourse.value;
		document.form1.submit();

        farwindow.window.focus();
        document.form1.target = window.self.name;
}
function insertPool() {
	if (document.form1.s_grcode.value == '----') {
			alert("�����׷��� �����ϼ���.");
			return ;
	}
	if (document.form1.s_grseq.value == '----') {
			alert("���������� �����ϼ���.");
			return ;
	}    	
    if (document.form1.s_subjcourse.value=="----"){
            alert("������ �����ϼ���");
            return;
    }
    window.self.name = "winInsertPage";     //      opener ��ü�� name �� �����Ѵ�
    farwindow = window.open("", "openWinInsert", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 1017, height = 700, top=0, left=0");
    document.form1.target = "openWinInsert"
    document.form1.p_process.value = "DamunQuestionPoolPage";
    document.form1.p_action.value = "go";
	document.form1.p_subj.value = document.form1.s_subjcourse.value;
    document.form1.action = "/servlet/controller.multiestimate.DamunSubjQuestionServlet";
	document.form1.submit();

    farwindow.window.focus();
    document.form1.target = window.self.name;
}
function scaleview() {
	if (document.form1.s_grcode.value == '----') {
			alert("�����׷��� �����ϼ���.");
			return ;
	}
        window.self.name = "winScaleView";
        farwindow = window.open("", "openWinScale", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no, width = 667, height = 562, top=0, left=0");
        document.form1.target = "openWinScale";
		document.form1.action = "/servlet/controller.multiestimate.ScaleServlet";
		document.form1.p_process.value = "ScaleListPage";
		document.form1.p_scalecode.value = 0;
		document.form1.submit();

        farwindow.window.focus();
        document.form1.target = window.self.name;
}
function ReloadPage(p_action) {
  document.form1.p_process.value = 'DamunQuestionListPage';
  document.form1.p_action.value  = p_action;
  document.form1.submit();
}
-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post" action="/servlet/controller.multiestimate.DamunSubjQuestionServlet">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="p_gubun"   value="<%=v_gubun%>">
    <input type="hidden" name="p_action"  value="<%=v_action%>">
    <input type="hidden" name="p_grcode"  value="<%=v_grcode%>">
    <input type="hidden" name="p_distcode"  value="<%=v_distcode%>">
    <input type="hidden" name="p_scalecode"  value="">
    <input type="hidden" name="p_subj"  value="">
    <input type="hidden" name="p_damunnum"  value="">
<%  if (v_classdepth > 1) {                        %>
    <input type="hidden" name="s_lowerclass" value="">
<%  } else if (v_classdepth > 0) {                        %>
    <input type="hidden" name="s_lowerclass" value="">
    <input type="hidden" name="s_middleclass" value="">
<%  }                                                     %>

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/multiestimate/m_title01.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <table cellspacing="0" cellpadding="0" class="table1">
        <tr>
          <td width="85" height="23" align="center" valign="middle">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td rowspan="3" class="<%=v_tab_color1%>_butt_left"></td>
                <td class="<%=v_tab_color1%>_butt_top"></td>
                <td rowspan="3" class="<%=v_tab_color1%>_butt_right"></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color1%>_butt_middle">������</td>
              </tr>
              <tr>
                <td class="<%=v_tab_color1%>_butt_bottom"></td>
              </tr>
            </table>
          </td>
          <td width="2"></td>
          <td width="85" height="23" align="center" valign="middle">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td rowspan="3" class="<%=v_tab_color3%>_butt_left"></td>
                <td class="<%=v_tab_color3%>_butt_top"></td>
                <td rowspan="3" class="<%=v_tab_color3%>_butt_right"></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color3%>_butt_middle"><a href="javascript:changeTabpage('COMMON')" class="c">�Ϲ���</a></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color3%>_butt_bottom"></td>
              </tr>
            </table>
          </td>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table cellspacing="0" cellpadding="0" class="table_out">
        <tr>
          <td bgcolor="#636563">
            <table cellspacing="1" cellpadding="0" class="s_table">
              <tr>
                <td bgcolor="#FFFFFF" align="center" valign="top">
                  <br>
                  <!----------------- form ���� ----------------->
                  <table cellspacing="0" cellpadding="1" class="form_table_out">

                    <tr>
                      <td bgcolor="#C6C6C6" align="center">
                        <table cellspacing="0" cellpadding="0" class="form_table_bg">
                          <tr>
                            <td height="7"></td>
                          </tr>
                          <tr>
                            <td align="center">
                              <table width="99%" cellspacing="0" cellpadding="0" class="form_table">
                                <tr>
                                  <td>
                                   <font color="red">��</font> <%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
                                   <%= SelectEduBean.getGyear(box, true )%><!-- getGyear(RequestBox, isChange)   �ش翬��  -->
                                   <font color="red">��</font> <%= SelectEduBean.getGrseq(box, true, false)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  -->
                                   <br>
                                   <%= SelectSubjBean.getUpperClass(box, true, true, false)%><!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  -->
                                   <%= SelectSubjBean.getMiddleClass(box, true, true, false)%><!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  -->
                                   <%= SelectSubjBean.getLowerClass(box, true, true, false)%><!-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    �����Һз�  -->
                                   <font color="red">��</font> <%= SelectSubjBean.getSubj(box, true, false)%><!-- getSubj(RequestBox, isChange, isALL)    ����  -->
                                  <%@ include file="/learn/admin/include/za_GoButton.jsp" %>
                                  </td>
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
                  <!----------------- �߰���ư ���� ----------------->
                    <table cellpadding="0" cellspacing="0" >
                      <tr> 
                        <td align="left"><a href="javascript:scaleview()" class="c"><img src="/images/admin/button/btn_sulmunchuckdo.gif" border="0"></a></td>
                        <td width=750></td>
                        <td align="right"><a href="javascript:insert()" class="c"><img src="/images/admin/button/btn_add.gif" border="0"></a></td>
                        <td width=8></td>
                        <td align="right"><a href="javascript:insertPool()" class="c"><img src="/images/admin/button/btn_poolplus.gif" border="0"></a></td>
                      </tr>
                      <tr>
                        <td height=8></td>
                        <td height=8></td>
                       <td height=8></td>
                      </tr>
                    </table>
                  <!----------------- �߰���ư �� ----------------->
                  <!----------------- ����ٸ��� ���� ----------------->
                  <table cellspacing="1" cellpadding="5" class="table_out">
                    <tr>
                      <td colspan="4" class="table_top_line"></td>
                    </tr>

                    <tr>
                      <td width="5%" class="table_title">NO</td>
                      <td class="table_title">����</td>
                      <td width="10%" class="table_title">�����з�</td>
                    </tr>
<%  ArrayList  list = (ArrayList)request.getAttribute("DamunQuestionList");
    DataBox dbox = null;
    for (int i=0; i<list.size(); i++) {
        dbox  = (DataBox)list.get(i); %>
                    <tr>
                      <td class="table_01"><%=String.valueOf(dbox.getInt("d_damunnum"))%></td>
                      <td class="table_02_1"><a href="javascript:detailSelect('<%=String.valueOf(dbox.getInt("d_damunnum"))%>')" class="e"><%=dbox.getString("d_damuntext")%></a></td>
                      <td class="table_02_1"><%=dbox.getString("d_damuntypenm")%></td>
                    </tr>
<%  } %>
                 </table>
				 <br>
                  <!----------------- ����ٸ��� �� ----------------->
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <br>
    </td>
  </tr>

</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
