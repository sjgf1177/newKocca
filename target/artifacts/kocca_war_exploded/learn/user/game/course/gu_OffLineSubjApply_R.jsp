<%
//**********************************************************
//  1. ��      ��: �������� ���� �󼼺���
//  2. ���α׷��� : zu_OffLineSubjApply_R.jsp
//  3. ��      ��: �������� ���� �󼼺���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: �ϰ��� 2005.12.19
//  7. ��      ��: 
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    box.put("leftmenu","05");                       // �޴� ���̵� ����

	String v_grcode = box.getStringDefault("p_grcode","G01");
	String  v_process  = box.getString("p_process");
	String v_gubunNm = "";
    
    if(v_grcode.equals("K01"))
	{
		v_gubunNm = "kocca";
	}
	else
	{
		v_gubunNm = "game";
	}

    String v_server   = conf.getProperty(v_gubunNm + ".url.value");
    String v_tem_url  = conf.getProperty("url.namo.template");
    String v_tem_name = conf.getProperty("name.namo.template.ini");
    String v_tem_url_name = v_server + v_tem_url + v_tem_name;
    
    String  s_gadmin    = box.getSession("gadmin");
    String v_gadmin ="";

    if(!s_gadmin.equals("")){
      v_gadmin = s_gadmin.substring(0,1);
    }

	int  v_seq  = box.getInt("p_seq");

    String v_subjgubun	= "";
    String v_subj		= "";
    String v_subjnm		= "";
    String v_subjseq	= "";
    String v_propstart	= "";
    String v_propend	= "";
    String v_dday		= "";
    String v_starttime	= "";
    String v_endtime	= "";
    String v_place		= "";
    String v_gubunnm	= "";
    String v_content	= "";
    String v_ldate		= "";
    String v_tname		= "";
	String v_useyn  	= "";
	String v_limitmember = "";
	String v_target = "";

	DataBox dbox = (DataBox)request.getAttribute("OffLineSubjApply");
    if (dbox != null) {
        v_subjgubun		= dbox.getString("d_subjgubun");
        v_subj			= dbox.getString("d_subj");
        v_subjnm		= dbox.getString("d_subjnm");
        v_subjseq		= dbox.getString("d_subjseq");
        v_propstart		= dbox.getString("d_propstart");
        v_propend		= dbox.getString("d_propend");
        v_dday			= dbox.getString("d_dday");
        v_starttime		= dbox.getString("d_starttime");
        v_endtime		= dbox.getString("d_endtime");
        v_place			= dbox.getString("d_place");
        v_gubunnm		= dbox.getString("d_gubunnm");
        v_content		= dbox.getString("d_content");
        v_ldate			= dbox.getString("d_ldate");
        v_tname			= dbox.getString("d_tname");
		v_useyn   		= dbox.getString("d_useyn");
		v_target   		= dbox.getString("d_target");
		v_limitmember	= dbox.getString("d_limitmember");
		v_grcode		= dbox.getString("d_grcode");
	}

	//��¥ ó��
	if(v_propstart.equals("")){v_propstart = "����";}
	else{v_propstart     = FormatDate.getFormatDate(v_propstart,"yyyy/MM/dd");}

	if(v_propend.equals("")){v_propend = "����";}
	else{v_propend = FormatDate.getFormatDate(v_propend,"yyyy/MM/dd");}

	if(v_dday.equals("")){v_dday = "����";}
	else{v_dday     = FormatDate.getFormatDate(v_dday,"yyyy/MM/dd");}

	if(v_target.equals("S"))
	{
		v_target = "���� ������";
	}
	else if(v_target.equals("P"))
	{
		v_target = "������� + ���� ������";
	}
	else
	{
		v_target = "��ȸ��";
	}
%>
<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topApply.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script>
	// ���ø� ini ���� �ε�
    function initPage() {

		if("<%=v_subjgubun%>" == "00000000000000000002")
		{
			document.getElementById("tr_subj").style.display = "";
			document.getElementById("tr_subjseq").style.display = "";
			document.getElementById("tr_subjLine1").style.display = "";
			document.getElementById("tr_subjLine2").style.display = "";
		}
		else
		{
			document.getElementById("tr_subj").style.display = "none";
			document.getElementById("tr_subjseq").style.display = "none";
			document.getElementById("tr_subjLine1").style.display = "none";
			document.getElementById("tr_subjLine2").style.display = "none";
		}
    }

	if (window.addEventListener)
        window.addEventListener("load", initPage, false)
    else if (window.attachEvent)
        window.attachEvent("onload", initPage)
    else
        window.onload=initPage

</script>
<form name="form1" method="post" enctype="multipart/form-data">
    <input type = "hidden" name="p_process"	value = "<%= v_process %>">
    <input type = "hidden" name="p_seq"		value = "<%=v_seq %>">
<!-- title -->
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="35" align="right"  background="/images/user/game/apply/<%=tem_subimgpath%>/tit_offline_apply.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
      HOME > ������û > �������ΰ��� ��û/Ȯ��</td>
  </tr>
  <tr> 
    <td height="20"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/user/game/apply/st_offline_info.gif" ></td>
  </tr>
  <tr>
    <td height="10">&nbsp;</td>
  </tr>
</table>
<table cellpadding="0" cellspacing="0" width="720">
  <col width="87">
  <col width="3">
  <col width="630">
  <tr valign="bottom" bgcolor="#E1EBF4" height="25"> 
    <td style="padding:0 0 4 10;color:#000000;">�з�</td>
    <td><img src="/images/user/game/apply/tbl_bar.gif"></td>
    <td style="padding:0 0 4 10;color:#37669a;font-weight:bold;"><%=v_gubunnm %></td>
  </tr>
  <tr height="1" id="tr_subjLine1"> 
    <td colspan="3" background="/images/user/game/apply/tbl_dot.gif"></td>
  </tr>
  <tr height="25" valign="bottom" id="tr_subj"> 
    <td style="padding:0 0 4 10;color:#000000;">����/������</td>
    <td><img src="/images/user/game/apply/tbl_bar.gif"></td>
    <td style="padding:0 0 4 10;">���α׷���</td>
  </tr>
  <tr height="1" id="tr_subjLine2"> 
    <td colspan="3" background="/images/user/game/apply/tbl_dot.gif"></td>
  </tr>
  <tr valign="bottom" bgcolor="#E1EBF4" height="25" id="tr_subjseq"> 
    <td style="padding:0 0 4 10;color:#000000;">����</td>
    <td><img src="/images/user/game/apply/tbl_bar.gif"></td>
    <td style="padding:0 0 4 10;"><%=v_subjnm%>��</td>
  </tr>
  <tr height="1"> 
    <td colspan="3" background="/images/user/game/apply/tbl_dot.gif"></td>
  </tr>
  <tr height="25" valign="bottom"> 
    <td style="padding:0 0 4 10;color:#000000;">��û�Ⱓ</td>
    <td><img src="/images/user/game/apply/tbl_bar.gif"></td>
    <td style="padding:0 0 4 10;"> <%=v_propstart%> ~ <%=v_propend%></td>
  </tr>
  <tr height="1"> 
    <td colspan="3" background="/images/user/game/apply/tbl_dot.gif"></td>
  </tr>
  <tr valign="bottom" bgcolor="#E1EBF4" height="25"> 
    <td style="padding:0 0 4 10;color:#000000;">���Ǹ�</td>
    <td><img src="/images/user/game/apply/tbl_bar.gif"></td>
    <td style="padding:0 0 4 10;color:#37669a;font-weight:bold;"><%= v_subjnm%></td>
  </tr>
  <tr height="1"> 
    <td colspan="3" background="/images/user/game/apply/tbl_dot.gif"></td>
  </tr>
  <tr height="25" valign="bottom"> 
    <td style="padding:0 0 4 10;color:#000000;">��米��</td>
    <td><img src="/images/user/game/apply/tbl_bar.gif"></td>
    <td style="padding:0 0 4 10;"> <%=v_tname%></td>
  </tr>
  <tr height="1"> 
    <td colspan="3" background="/images/user/game/apply/tbl_dot.gif"></td>
  </tr>
  <tr valign="bottom" bgcolor="#E1EBF4" height="25"> 
    <td style="padding:0 0 4 10;color:#000000;">�Ͻ�</td>
    <td><img src="/images/user/game/apply/tbl_bar.gif"></td>
    <td style="padding:0 0 4 10;"> <%=v_dday%></td>
  </tr>
  <tr height="1"> 
    <td colspan="3" background="/images/user/game/apply/tbl_dot.gif"></td>
  </tr>
  <tr height="25" valign="bottom"> 
    <td style="padding:0 0 4 10;color:#000000;">�ð�</td>
    <td><img src="/images/user/game/apply/tbl_bar.gif"></td>
    <td style="padding:0 0 4 10;"> <%=v_starttime%> ~ <%=v_endtime%></td>
  </tr>
  <tr height="1"> 
    <td colspan="3" background="/images/user/game/apply/tbl_dot.gif"></td>
  </tr>
  <tr valign="bottom" bgcolor="#E1EBF4" height="25"> 
    <td style="padding:0 0 4 10;color:#000000;">���</td>
    <td><img src="/images/user/game/apply/tbl_bar.gif"></td>
    <td style="padding:0 0 4 10;"> <%=v_place%></td>
  </tr>
  <tr height="1"> 
    <td colspan="3" background="/images/user/game/apply/tbl_dot.gif"></td>
  </tr>
  <tr height="25" valign="bottom"> 
    <td style="padding:0 0 4 10;color:#000000;">�ο�</td>
    <td><img src="/images/user/game/apply/tbl_bar.gif"></td>
    <td style="padding:0 0 4 10;"> <%=v_limitmember%>��</td>
  </tr>
  <tr height="1"> 
    <td colspan="3" background="/images/user/game/apply/tbl_dot.gif"></td>
  </tr>
  <tr valign="bottom" bgcolor="#E1EBF4" height="25"> 
    <td style="padding:0 0 4 10;color:#000000;">���</td>
    <td><img src="/images/user/game/apply/tbl_bar.gif"></td>
    <td style="padding:0 0 4 10;"> <%=v_target%></td>
  </tr>
  <tr height="1"> 
    <td colspan="3" background="/images/user/game/apply/tbl_dot.gif"></td>
  </tr>
  <tr height="4"> 
    <td colspan="3" bgcolor="#d9e5f3"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="15"></td>
  </tr>
  <tr> 
    <td><img src="/images/user/game/apply/st_offline_guide.gif" ></td>
  </tr>
  <tr> 
    <td height="10">&nbsp;</td>
  </tr>
</table>
<table width="720" border="0" cellpadding="0" cellspacing="0" background="/images/user/game/apply/off_box_bg.gif">
  <tr>
    <td valign="top"><img src="/images/user/game/apply/off_box_top.gif"></td>
  </tr>
  <tr>
    <td align="center">
	<!-- �ȳ������ڸ����̺� -->
	<table width="680" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><%=v_content%></td>
        </tr>
    </table>
	<!-- �ȳ������ڸ����̺� ��-->
	</td>
  </tr>
  <tr>
    <td><img src="/images/user/game/apply/off_box_bo.gif"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="20">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" align="right"><img src="/images/user/game/button/btn_list.gif" onClick="history.back()" style="cursor:hand"></td>
  </tr>
  
</table>
	<br>
	<br>


<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
</BODY>
</HTML>
