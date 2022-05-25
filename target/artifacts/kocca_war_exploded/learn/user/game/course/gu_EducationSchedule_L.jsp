<%
//**********************************************************
//  1. ��      ��: �������� ����Ʈ
//  2. ���α׷���:  gu_EducationSchedule_L.jsp
//  3. ��      ��: �������� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 12. 20
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process         = box.getString("p_process");
    box.put("leftmenu","04");                       // �޴� ���̵� ����
    String  ss_year    = box.getStringDefault("s_year",FormatDate.getDate("yyyy"));

    String  v_upperclass      =  "";
    String  v_middleclass     =  "";
    String  v_lowerclass      =  "";
    String  v_isonoff         =  "";
    String  v_course          =  "";
    String  v_coursenm        =  "";
    String  v_subj            =  "";
    String  v_year            =  "";
    String  v_subjseq         =  "";
    String  v_subjseqgr       =  "";
    String  v_subjnm          =  "";
    String  v_classnm         =  "";
    String  v_propstart       =  "";
    String  v_propend         =  "";
    int     v_biyong          =  0;
    String  v_eduperiod       =  "";

    String  v_isonoff_value   =  "";
    String  v_propstart_value =  "";
    String  v_propend_value   =  "";
    int     v_total           =  0;
    int     i                 =  0;
    DecimalFormat  df = new DecimalFormat("###,##0");

    ArrayList list   = (ArrayList)request.getAttribute("EducationList");


    SelectEduBean selectEdu = new SelectEduBean();
    ArrayList yearList = selectEdu.getGyear(box);
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topCourse.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--
    function whenSelect(){
        document.form1.p_process.value = 'EducationSchedule';
        document.form1.action='/servlet/controller.propose.MainSubjSearchServlet';
        document.form1.target = "_self";
        document.form1.submit();
    }

// ���� ���뺸��
function whenSubjInfo(subj){
    document.form1.p_subj.value = subj;
    document.form1.p_process.value  = 'SubjectPreviewPage';
    document.form1.p_rprocess.value = 'EducationSchedule';
    document.form1.action='/servlet/controller.course.CourseIntroServlet';
    document.form1.target = "_self";
    document.form1.submit();
}

// �Ϲ�/������, ��з��ڵ� ����
function whenSelect(sel,gubun){
    document.form1.p_iscourseYn.value = sel;
    document.form1.p_gubun.value   = gubun;
    document.form1.p_tabnum.value  = gubun;
    document.form1.target = "_self";
    document.form1.action='/servlet/controller.propose.ProposeCourseServlet';
    document.form1.p_process.value = 'SubjectList';

    document.form1.submit();
}
//-->
</SCRIPT>

<form name="form1" method="post">
  <input type='hidden' name='p_process'  value="<%=v_process%>">
  <input type='hidden' name='p_rprocess' value="">
  <input type='hidden' name='p_subj'     value="">
  <input type='hidden' name='p_iscourseYn' value="">
  <input type='hidden' name='p_tabnum'  value="1">
  <input type='hidden' name='p_gubun'  value="1">

<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="35" align="right"  background="/images/user/game/course/<%=tem_subimgpath%>/tit_eduplan.gif" class="location" ><img src="/images/user/game/common/location_bl.gif">
      HOME > �����ȳ� > ��������</td>
  </tr>
  <tr>
    <td height="20"></td>
  </tr>
</table>


<table border="0" width="100%">
	<tr>
		<td align="center">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td><img src="/images/user/game/course/img00.gif"></td>
				</tr>
				<tr>
					<td><a href="javascript:whenSelect('N','1');"><img src="/images/user/game/course/img01.gif" border="0"></a></td>
				</tr>
				<tr>
					<td style="padding-top:15px"><a href="javascript:whenSelect('N','2');"><img src="/images/user/game/course/img02.gif" border="0"></a></td>
				</tr>
				<tr>
					<td style="padding-top:15px"><a href="javascript:whenSelect('N','3');"><img src="/images/user/game/course/img03.gif" border="0"></a></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br><br>

<!--<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="35">
      <select name="s_year" onChange="whenSelect('v_select')" >
<%
    String yearStr = "";
    for(int k = 0; k < yearList.size(); k++) {
        DataBox dbox = (DataBox)yearList.get(k);
        yearStr += "<option value = '"+ dbox.getString("d_gyear")+"' ";
        if (ss_year.equals(dbox.getString("d_gyear"))) {
          yearStr += " selected";
        }
        yearStr += " >";
        yearStr += dbox.getString("d_gyear");
        yearStr += "</option>\n";
    }
    out.print(yearStr);
%>
      </select>
    </td>
  </tr>
  <tr>
    <td height="2"></td>
  </tr>
</table>-->

<!-- �������� -
<table width="720" border="2" cellspacing="0" cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
  <tr>
    <td height="3" colspan="8" class="linecolor_board6"></td>
  </tr>
  <tr>
    <td width="50" class="tbl_gtit3">����</td>
    <td width="70" class="tbl_gtit3">�з�</td>
    <td class="tbl_gtit3">������</td>
    <td width="30" class="tbl_gtit3">����<br></td>
    <td width="60"  class="tbl_gtit3">������</td>
    <td width="150"  class="tbl_gtit3">������û�Ⱓ</td>
    <td width="50"  class="tbl_gtit3">�����Ⱓ</td>
    <td width="60"  class="tbl_gtit3">�����Ⱓ</td>
  </tr>

<%

    v_total = list.size();
    for(i = 0; i < v_total; i++) {
        DataBox dbox = (DataBox)list.get(i);
        v_upperclass      = dbox.getString("d_scupperclass");
        v_middleclass     = dbox.getString("d_scmiddleclass");
        v_lowerclass      = dbox.getString("d_sclowerclass");
        v_isonoff         = dbox.getString("d_isonoff");
        v_course          = "";
        v_coursenm        = "";
        v_subj            = dbox.getString("d_scsubj");
        v_year            = dbox.getString("d_scyear");
        v_subjseq         = dbox.getString("d_scsubjseq");
        v_subjseqgr       = dbox.getString("d_subjseqgr");
        v_subjnm          = dbox.getString("d_scsubjnm");
        v_classnm         = dbox.getString("d_classname");
        v_propstart       = dbox.getString("d_scpropstart");
        v_propend         = dbox.getString("d_scpropend");
        v_biyong          = dbox.getInt   ("d_scbiyong");
        v_eduperiod       = dbox.getString("d_eduperiod");

		if (v_eduperiod.equals("0")) v_eduperiod = "-";
		else                         v_eduperiod = v_eduperiod + " ��";
        if(v_isonoff.equals("ON")) v_isonoff_value = "���̹�";
        else                       v_isonoff_value = "����";

        //��¥ ó��
        if(v_propstart.equals("")) {v_propstart = " - ";}
        else                       {v_propstart     = FormatDate.getFormatDate(v_propstart,"yyyy/MM/dd");}

        if(v_propend.equals(""))   {v_propend = " - ";}
        else                       {v_propend = FormatDate.getFormatDate(v_propend,"yyyy/MM/dd");}

%>
  <tr>
    <td height="5" colspan="8" ></td>
  </tr>
  <tr>
    <td class="tbl_grc"><%=v_isonoff_value%></td>
    <td class="tbl_grc"><%=v_classnm%></td>
    <td class="tbl_bleft"><a href="javascript:whenSubjInfo('<%=v_subj%>')"><%=v_subjnm%></a></td>
    <td class="tbl_grc"><%=StringManager.toInt(v_subjseqgr)%></td>
    <td class="tbl_grc"><%=df.format(v_biyong)%></td>
    <td class="tbl_grc"><%=v_propstart%> ~ <%=v_propend%></td>
    <td class="tbl_grc"><%=v_eduperiod%></td>
    <td class="tbl_grc">
    <%
    String v_reviewdays = "";
    String v_reviewtype = "";
    String v_reviewtypedesc = "";

    v_reviewdays = dbox.getString("d_reviewdays");
    v_reviewtype = dbox.getString("d_reviewtype");

    if (v_reviewdays.equals("")) v_reviewdays = "0";

    if (v_reviewtype.equals("D")) v_reviewtypedesc = "��";
    else if (v_reviewtype.equals("W")) v_reviewtypedesc = "��";
    else if (v_reviewtype.equals("M")) v_reviewtypedesc = "��";
    else if (v_reviewtype.equals("Y")) v_reviewtypedesc = "��";
    else v_reviewtypedesc = "";

    if (!v_reviewtypedesc.equals("")) { %>
    	<%=v_reviewdays%><%=v_reviewtypedesc%>
    <% } %></td>
  </tr>

<%
    }
    if(v_total == 0) {
%>
  <tr>
    <td class="tbl_grc" colspan="8">���� ������ �����ϴ�.</td>
  </tr>
<%
    }
%>

</table>-->

</form>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->