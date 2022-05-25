<%
//**********************************************************
//  1. ��      ��: ����
//  2. ���α׷���: za_SulmunAllResult_L.java
//  3. ��      ��: ��ü - �������� - ����м�
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������
//**********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.research.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

	String v_tem_grcode = box.getSession("tem_grcode");
	
	if(box.getString("s_grcode") == null || "".equals(box.getString("s_grcode"))){
		box.put("s_grcode", v_tem_grcode);
	}
    String  v_grcode    = box.getStringDefault("s_grcode",v_tem_grcode);        //�����׷�

    String  v_subj        = box.getString("s_subjcourse");
    String  v_gyear       = box.getString("s_gyear");
    String  v_grseq       = box.getString("s_grseq");
    String  v_subjseq       = box.getString("s_subjseq");
		int v_sulpapernum  = box.getInt("s_sulpapernum");

    String  v_company        = box.getString("s_company");
    String  v_jikwi       = box.getString("s_jikwi");
    String  v_jikun       = box.getString("s_jikun");
    String  v_workplc       = box.getString("s_workplc");

    int     v_replycount  = box.getInt("p_replycount");
    int     v_studentcount= box.getInt("p_studentcount");
    double  v_replyrate   = 0;
    if (v_studentcount != 0) {
        v_replyrate = (double)Math.round((double)v_replycount/v_studentcount*100*100)/100;
    }

		String  s_gadmin = box.getSession("gadmin");

    String v_tab_color1 = "black";
    String v_tab_color2 = "black";
    String v_tab_color3 = "black";
		String v_tab_color4 = "black";
		String v_tab_color5 = "blue";
		DecimalFormat  df = new DecimalFormat("0.00");

String  ss_action    = box.getString("p_action");
%>
<html>
<head>
<title>�����м�</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="JavaScript">
<!--
// ��ȸ �˻�
function whenSelection(p_action) {
	if (document.form1.s_grcode.value == '----') {
			alert("�����׷��� �����ϼ���.");
			return ;
	}
    if (p_action=="go") {
        if (document.form1.s_grseq.value=="ALL"){
            alert("���������� �����ϼ���");
            return;
        }
    }
  document.form1.target = "_self";
  document.form1.p_action.value  = p_action;
  document.form1.p_process.value = 'SulmunResultPage';
  document.form1.submit();
}

// ���� ���
function goExcel(p_action) {
	if (document.form1.s_grcode.value == '----') {
			alert("�����׷��� �����ϼ���.");
			return ;
	}
    if (p_action=="go") {
        if (document.form1.s_grseq.value=="ALL"){
            alert("���������� �����ϼ���");
            return;
        }
    }
  document.form1.target = '_self';
  document.form1.p_action.value  = p_action;
  document.form1.p_process.value = 'SulmunResultExcelPage';
  document.form1.submit();
}

// �ٸ� ���� �̵�
function changeTabpage(p_gubun) {

	if (p_gubun == "TARGET") {
      document.form1.action = "/servlet/controller.research.SulmunTargetResultServlet";

	} else if (p_gubun == "COMMON") {
      document.form1.action = "/servlet/controller.research.SulmunCommonResultServlet";

	} else if (p_gubun == "REGIST") {
      document.form1.action = "/servlet/controller.research.SulmunRegistResultServlet";
	} else if (p_gubun == "ALL") {
      document.form1.action = "/servlet/controller.research.SulmunAllResultServlet";
	}
	document.form1.p_action.value = 'change';
	document.form1.p_gubun.value = p_gubun;
    document.form1.s_grcode.value = "";
	document.form1.p_process.value = 'SulmunResultPage';
	document.form1.submit();
}

function setSubj(p_subj) {
  var v_test;
  v_test = getArrayTest(document.form1.all.p_subj.length);
  if (v_test == -1) {
    document.form1.p_subj.value = p_subj;
  } else if (v_test == 0) {
  } else {
    document.form1.p_subj.options[document.form1.p_subj.selectedIndex].value = p_subj;
  }
}
function getArrayTest(p_object) {
  var cnt;
  if (typeof(p_object) == 'undefined') {
    cnt = -1;
  } else {
    if (typeof(p_object) == 'number') {
        cnt = p_object;
    } else {
      cnt = -1;
    }
  }
  return cnt;
}

// ��������м����
function goDetailExcel(p_action) {
	if (document.form1.s_grcode.value == '----') {
			alert("�����׷��� �����ϼ���.");
			return ;
	}
    if (p_action=="go") {
        if (document.form1.s_subjcourse.value=="----"){
            alert("������ �����ϼ���");
            return;
        }
        if (document.form1.s_subjseq.value=="----"){
            alert("������ �����ϼ���");
            return;
        }
        if (document.form1.s_sulpapernum.value=='0'){
            alert("�������� �����ϼ���");
            return;
        }
// top.ftop.setPam();
    }

  window.self.name = "SulmunResultPage";
  farwindow = open_window("openDetailExcel","","100","100","700","400","yes","yes","yes","yes","yes");
  document.form1.p_action.value  = 'go';
  document.form1.target = "openDetailExcel";
  document.form1.p_process.value = 'SulmunDetailResultExcelPage';
  document.form1.p_sulpapernum.value = document.form1.s_sulpapernum.options[document.form1.s_sulpapernum.selectedIndex].value;
  document.form1.p_grcode.value = document.form1.s_grcode.options[document.form1.s_grcode.selectedIndex].value;
  document.form1.p_subj.value = document.form1.s_subjcourse.options[document.form1.s_subjcourse.selectedIndex].value;
  document.form1.p_gyear.value = document.form1.s_gyear.options[document.form1.s_gyear.selectedIndex].value;
  document.form1.submit();
  document.form1.target = window.self.name;
}
-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/research/r_title05.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <table cellspacing="0" cellpadding="0" class="table1">
        <tr>
          <!--<td width="85" height="23" align="center" valign="middle">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td rowspan="3" class="<%=v_tab_color1%>_butt_left"></td>
                <td class="<%=v_tab_color1%>_butt_top"></td>
                <td rowspan="3" class="<%=v_tab_color1%>_butt_right"></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color1%>_butt_middle"><a href="javascript:changeTabpage('SUBJ')" class="c">��������</a></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color1%>_butt_bottom"></td>
              </tr>
            </table>
          </td>-->

		  <td width="85">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td rowspan="3" class="<%=v_tab_color5%>_butt_left"></td>
                <td class="<%=v_tab_color5%>_butt_top"></td>
                <td rowspan="3" class="<%=v_tab_color5%>_butt_right"></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color5%>_butt_middle">��������</td>
              </tr>
              <tr>
                <td class="<%=v_tab_color5%>_butt_bottom"></td>
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
                <td class="<%=v_tab_color3%>_butt_middle"><a href="javascript:changeTabpage('COMMON')" class="c">�Ϲݼ���</a></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color3%>_butt_bottom"></td>
              </tr>
            </table>
          </td>
          <td width="2"></td>
          <td width="85" height="23" align="center" valign="middle">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td rowspan="3" class="<%=v_tab_color2%>_butt_left"></td>
                <td class="<%=v_tab_color2%>_butt_top"></td>
                <td rowspan="3" class="<%=v_tab_color2%>_butt_right"></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color2%>_butt_middle"><a href="javascript:changeTabpage('TARGET')" class="c">����ڼ���</a></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color2%>_butt_bottom"></td>
              </tr>
            </table>
          </td>
          <td width="2"></td>
		  <td width="85">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td rowspan="3" class="<%=v_tab_color4%>_butt_left"></td>
                <td class="<%=v_tab_color4%>_butt_top"></td>
                <td rowspan="3" class="<%=v_tab_color4%>_butt_right"></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color4%>_butt_middle"><a href="javascript:changeTabpage('REGIST')" class="c">���԰��</a></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color4%>_butt_bottom"></td>
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
                  <form name="form1" method="post" action="/servlet/controller.research.SulmunAllResultServlet">
                    <input type="hidden" name="p_process"  value="">
                    <input type="hidden" name="p_action"   value="">
                		<input type="hidden" name="p_grcode"      value="<%=v_grcode%>">
                		<input type="hidden" name="p_gyear"      value="<%=v_gyear%>">
                		<input type="hidden" name="p_grseq"      value="<%=v_grseq%>">
	                	<input type="hidden" name="p_subj"      value="<%=v_subj%>">
										<input type="hidden" name="p_subjsel"      value="<%=v_subj%>">
	                	<input type="hidden" name="p_subjseq"      value="<%=v_subjseq%>">
										<input type="hidden" name="p_sulpapernum"       value="<%=v_sulpapernum%>">
	                	<input type="hidden" name="p_company"      value="<%=v_company%>">
	                	<input type="hidden" name="p_jikwi"      value="<%=v_jikwi%>">
	                	<input type="hidden" name="p_jikun"      value="<%=v_jikun%>">
	                	<input type="hidden" name="p_workplc"      value="<%=v_workplc%>">
                		<input type="hidden" name="p_gubun"       value="">
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
                      <td colspan="2" align="left" valign="middle">
                        <!------------------- ���ǰ˻� ���� ------------------------->
                        <font color="red">��</font> <%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
                        &nbsp;
                        <font color="red">��</font> <%= SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)   �����⵵  -->
                        &nbsp;
                        <font color="red">��</font> <%= SelectEduBean.getGrseq(box, true, true)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  -->
                      </td>
                    </tr>
                    <tr>
                    	<td colspan="2" height=3></td>
					</tr>
                    <tr>
                      <td style="PADDING-LEFT: 16px;">
                      ������&nbsp;&nbsp;&nbsp;<%= SulmunAllPaperBean.getSulPaperSelect2 (v_grcode, v_gyear, v_grseq, "s_sulpapernum", v_sulpapernum, "")%>
                      </td>
                      <td width="30%" align=right style="PADDING-RIGHT: 40px;">
                      <%@ include file="/learn/admin/include/za_GoButton.jsp" %>
                      <!-------------------- ���ǰ˻� �� ---------------------------->
                      </td>
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
                  </table>
				  <br>
                  </form>
                  <!----------------- form �� ----------------->
                  <!----------------- ������� ��ư ���� ----------------->
                  <table cellpadding="0" cellspacing="0" class="table1">
                    <tr>
                      <td align="right"><a href="javascript:goExcel('go')" class="c"><img src="/images/admin/button/btn_excelprint.gif"  border="0"></a></td>
                    </tr>
                    <tr>
                      <td height="3"></td>
                    </tr>
                  </table>
                  <!----------------- ������� ��ư �� ----------------->
                  <!----------------- �����м� ���� ----------------->
                  <table cellspacing="1" cellpadding="0" class="box_table_out">
                    <tr>
                     <td colspan="5" class="table_top_line"></td>
                    </tr>
                    <tr>
                      <td colspan="5" class="table_title_02">�������ڼ� : <%=v_replycount%>�� / ��ü������ : <%=v_studentcount%>�� / ���������� : <%=df.format(v_replyrate)%>%</td>
                    </tr>
                  </table>

      <!----------------- ���������� ���� ----------------->
      <table cellspacing="1" cellpadding="0" class="box_table_out">
          <tr>
            <td colspan="11" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title" width="4%">No</td>
            <td class="table_title" width="6%">�����ڵ�</td>
            <td class="table_title" width="*">������</td>
            <td class="table_title" width="8%">���̵�</td>
            <td class="table_title" width="8%">����</td>
            <td class="table_title" width="14%">�Ҽ�</td>
            <td class="table_title" width="6%">������<br/>�ڵ�</td>
            <td class="table_title" width="10%">������</td>
            <td class="table_title" width="8%">��������</td>
            <td class="table_title" width="16%">���</td>
            <td class="table_title" width="6%">���</td>
          </tr>
<%
	ArrayList listUsr      = null;
	if(ss_action.equals("go")) {
    listUsr = (ArrayList)request.getAttribute("SulmunUserList");
					int v_total = listUsr.size();
					for (int i = 0; i < v_total; i++) {
					 DataBox dbox = (DataBox) listUsr.get(i);
					  if (dbox != null) {
%>
          <tr>
            <td class="table_01"><%=String.valueOf(i+1)%></td>
            <td class="table_02_1"><%=dbox.getString("d_subj")%></td>
			<td class="table_02_2"><%=dbox.getString("d_subjnm")%></td>
            <td class="table_02_1"><%=dbox.getString("d_userid")%></td>
            <td class="table_02_1"><%=dbox.getString("d_name")%></td>
            <td class="table_02_1"><%=dbox.getString("d_comp")%></td>
            <td class="table_02_1"><%=dbox.getString("d_sulpapernum")%></td>
            <td class="table_02_1"><%=dbox.getString("d_sulpapernm")%></td>
            <td class="table_02_1"><%=dbox.getString("d_ldate")%></td>
            <td class="table_02_1"><%=dbox.getString("d_answers")%></td>
            <td class="table_02_1"><%=dbox.getString("d_distcode1_avg")%></td>
          </tr>
<%
					  }
				   }
	}
%>
     </table>
      <!----------------- ���������� �� ----------------->
                  <table cellspacing="1" cellpadding="0" class="box_table_out">
                    <tr>
                     <td colspan="5" class="table_top_line"></td>
                    </tr>
<%  ArrayList    list = (ArrayList)request.getAttribute("SulmunResultList");
    SulmunQuestionExampleData data    = null;
    SulmunExampleData         subdata = null;

	int k = 0;
	int l = 0;

    for (int i=0; i < list.size(); i++) {
        data = (SulmunQuestionExampleData)list.get(i);
        if (data.getSultype().equals(SulmunSubjBean.OBJECT_QUESTION) || data.getSultype().equals(SulmunSubjBean.MULTI_QUESTION)) { %>
                    <tr>
                      <td class="table_title_01">����<%=i+1%></td>
                      <td colspan="4" style="padding-left:4px" class="table_title_02"><%="["+data.getDistcodenm()+"] [" + data.getSultypenm() + "] " + data.getSultext()%>
                      </td>
                    </tr>
<%          for (int j=1; j <= data.size(); j++) {
                subdata  = (SulmunExampleData)data.get(j);
                if (subdata != null) { %>
                    <tr>
                      <td width="7%" class="table_01"><%=subdata.getSelnum()%></td>
                      <td width="29%" style="padding-left=6" class="table_02_2"><%=subdata.getSeltext()%></td>
                      <td  width="11%" class="table_02_1"><%=subdata.getReplycnt()%>��</td>
                      <td width="11%" class="table_02_1"><%=subdata.getReplyrate()%>%</td>
                      <td width="39%" class="table_02_2">
                      <table cellspacing="0" cellpadding="0" class="s_table">
                        <tr>
<%                  if ((int)subdata.getReplyrate()==0) { %>
                          <td>&nbsp;</td>
<%                  } else { %>
                          <td width="<%=(int)subdata.getReplyrate()%>%" class="graph">&nbsp;</td>
<%                  } %>
                          <td style="padding-left:5px">&nbsp;</td>
                        </tr>
                        </table>
                      </td>
                    </tr>
<%              }
            }
       } else if (data.getSultype().equals(SulmunSubjBean.SUBJECT_QUESTION)) {

%>
                    <tr>
                      <td class="table_title_01">����<%=i+1%></td>
                      <td colspan="4" style="padding-left:4px" class="table_title_02"><%="["+data.getDistcodenm()+"] [" + data.getSultypenm() + "] " + data.getSultext()%></td>
                    </tr>
<%        int m = 0;   //out.println(data.getSubjectAnswer().size());//out.println(v_replycount);
			for (int j=0; j < data.getSubjectAnswer().size(); j++) {
				if(((data.getSubjectAnswer().size() / v_replycount)*m + (k+1)) == (j+1)) {
			//	if((m + (k+1)) == (j+1)) {
					if(m < v_replycount) m++;
				//	if(m < data.getSubjectAnswer().size()) m++;
%>
					<tr>
                      <td width="7%" class="table_01"></td>
                      <td  colspan="4" style="padding-left=6" class="table_02_2"><%=(String)data.getSubjectAnswer().get(j)%></td>
                    </tr>

<%           }
		   }
           k++;
       } else if (data.getSultype().equals(SulmunSubjBean.COMPLEX_QUESTION)) {

%>
                    <tr>
                      <td class="table_title_01">����<%=i+1%></td>
                      <td colspan="4" style="padding-left:4px" class="table_title_02"><%="["+data.getDistcodenm()+"] [" + data.getSultypenm() + "] " + data.getSultext()%></td>
                    </tr>
<%          for (int j=1; j <= data.size(); j++) {
                subdata  = (SulmunExampleData)data.get(j);
                if (subdata != null) { %>
                    <tr>
                      <td width="7%" class="table_01"><%=subdata.getSelnum()%></td>
                      <td width="29%" style="padding-left=6" class="table_02_2"><%=subdata.getSeltext()%></td>
                      <td  width="11%" class="table_02_1"><%=subdata.getReplycnt()%>��</td>
                      <td width="11%" class="table_02_1"><%=subdata.getReplyrate()%>%</td>
                      <td width="39%" class="table_02_2">
                      <table cellspacing="0" cellpadding="0" class="s_table">
                        <tr>
<%                  if ((int)subdata.getReplyrate()==0) { %>
                          <td>&nbsp;</td>
<%                  } else { %>
                          <td width="<%=(int)subdata.getReplyrate()%>%" class="graph">&nbsp;</td>
<%                  } %>
                          <td style="padding-left:5px">&nbsp;</td>
                        </tr>
                        </table>
                      </td>
                    </tr>
<%           }
           }
%>
<%       int n = 0;
			int etc = 0;
			for (int j=0; j < data.getComplexAnswer().size(); j++) {
				if(((data.getComplexAnswer().size() / v_replycount)*n + (l+1)) == (j+1)) {
					if(n < v_replycount) n++;
						if( !((String)data.getComplexAnswer().get(j)).equals("")) {
							etc++;
%>
					<tr>
                      <td width="7%" class="table_01"><%if(etc==1){%>��Ÿ<%}%></td>
                      <td  colspan="4" style="padding-left=6" class="table_02_2"><%=(String)data.getComplexAnswer().get(j)%></td>
                    </tr>
<%
					}
                }
		   }
           l++;
       } else if (data.getSultype().equals(SulmunSubjBean.FSCALE_QUESTION)) {

	          double d = 0;
			  int person = 0;
			  double v_point = 0;

		   for (int j=1; j <= data.size(); j++) {
	            subdata  = (SulmunExampleData)data.get(j);
                if (subdata != null) {

					d +=  (subdata.getReplycnt()) * subdata.getSelpoint();
					out.println("<!--subdata.getReplycnt() = " + subdata.getReplycnt() + "/-->");
					out.println("<!--subdata.getSelpoint() = " + subdata.getSelpoint() + "/-->");
					out.println("<!--d = " + d + "/-->");
					person += subdata.getReplycnt();
				}
            }

		v_point = d / person;
%>
<!-- here 4 -->
<!-- d=<%=d%> / person=<%=person%> / v_point=<%=v_point%> / data.getDistcodenm()=<%=data.getDistcodenm()%>-->
                    <tr>
                      <td class="table_title_01">����<%=i+1%></td>
                      <td colspan="3" style="padding-left:4px" class="table_title_02"><%="["+data.getDistcodenm()+"] [" + data.getSultypenm() + "] " + data.getSultext()%></td>
					  <td width="7%" class="table_01"><%if(v_point >=0){%><%=df.format(v_point)%>��<%}%></td>
                    </tr>
<%

		   for (int j=1; j <= data.size(); j++) {

                subdata  = (SulmunExampleData)data.get(j);
                if (subdata != null) {
%>

					<tr>
                      <td width="7%" class="table_01"><%=subdata.getSelnum()%></td>
                      <td width="29%" style="padding-left=6" class="table_02_2"><%=subdata.getSeltext()%></td>
                      <td  width="11%" class="table_02_1"><%=subdata.getReplycnt()%>��</td>
                      <td width="11%" class="table_02_1"><%=subdata.getReplyrate()%>%</td>
                      <td width="39%" class="table_02_2">
                      <table cellspacing="0" cellpadding="0" class="s_table">
                        <tr>
<%                  if ((int)subdata.getReplyrate()==0) { %>
                          <td>&nbsp;</td>
<%                  } else { %>
                          <td width="<%=(int)subdata.getReplyrate()%>%" class="graph">&nbsp;</td>
<%                  } %>
                          <td style="padding-left:5px">&nbsp;</td>
                        </tr>
                        </table>
                      </td>
                    </tr>
<%           }
            }
       } else if (data.getSultype().equals(SulmunSubjBean.SSCALE_QUESTION)) {

	          double d = 0;
			  int person = 0;
			  double v_point = 0;

		   for (int j=1; j <= data.size(); j++) {
	            subdata  = (SulmunExampleData)data.get(j);
                if (subdata != null) {

					d +=  (subdata.getReplycnt()) * subdata.getSelpoint();
					person += subdata.getReplycnt();
				}
            }

		v_point = d / person;
%>
                    <tr>
                      <td class="table_title_01">����<%=i+1%></td>
                      <td colspan="3" style="padding-left:4px" class="table_title_02"><%="["+data.getDistcodenm()+"] [" + data.getSultypenm() + "] " + data.getSultext()%></td>
					  <td width="7%" class="table_01"><%if(v_point >=0){%><%=df.format(v_point)%>��<%}%></td>
                    </tr>
<%

		   for (int j=1; j <= data.size(); j++) {

                subdata  = (SulmunExampleData)data.get(j);
                if (subdata != null) {
%>

					<tr>
                      <td width="7%" class="table_01"><%=subdata.getSelnum()%></td>
                      <td width="29%" style="padding-left=6" class="table_02_2"><%=subdata.getSeltext()%></td>
                      <td  width="11%" class="table_02_1"><%=subdata.getReplycnt()%>��</td>
                      <td width="11%" class="table_02_1"><%=subdata.getReplyrate()%>%</td>
                      <td width="39%" class="table_02_2">
                      <table cellspacing="0" cellpadding="0" class="s_table">
                        <tr>
<%                  if ((int)subdata.getReplyrate()==0) { %>
                          <td>&nbsp;</td>
<%                  } else { %>
                          <td width="<%=(int)subdata.getReplyrate()%>%" class="graph">&nbsp;</td>
<%                  } %>
                          <td style="padding-left:5px">&nbsp;</td>
                        </tr>
                        </table>
                      </td>
                    </tr>
<%           }
            }
	   }
    } %>
                  </table>
				  <br>
                  <!----------------- �����м� �� ----------------->
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <br>
    </td>
  </tr>


  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>

</table>
</body>
</html>