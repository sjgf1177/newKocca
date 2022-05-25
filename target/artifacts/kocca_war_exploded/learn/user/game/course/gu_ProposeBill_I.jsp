<%
//**********************************************************
//  1. ��      ��: SUBJECT PREVIEW PAGE
//  2. ���α׷���: gu_SubjectPreviewOn.jsp
//  3. ��      ��: �����ȳ�
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004. 01.12
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.homepage.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<jsp:useBean id = "memberBean" class = "com.credu.system.MemberAdminBean"  scope = "page" />
<jsp:useBean id = "code" class = "com.credu.system.CodeConfigBean"  scope = "page" />
<jsp:useBean id = "probean" class = "com.credu.propose.ProposeBean"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    box.put("leftmenu","01");                       // �޴� ���̵� ����
    String upload_url = conf.getProperty("url.upload");

    String  v_process      = box.getString("p_process");
    String  v_rprocess     = box.getString("p_rprocess");
    String  v_subj         = box.getString("p_subj");
    String  v_subjnm       = box.getString("p_subjnm");
    String  v_isonoff      = box.getString("p_isonoff");
    String  v_upperclassnm = box.getString("p_upperclassnm");
    String  v_upperclass   = box.getString("p_upperclass");
    String  v_select       = box.getString("p_select");
    String  v_actionurl    = box.getString("p_actionurl");
    String  v_lsearchsubject = box.getString("p_lsearchsubject");
    String  v_gubun			= box.getString("p_gubun");
	String	v_year			= box.getString("p_year");
	String	v_subjseq		= box.getString("p_subjseq");


    String  v_preurl    =  "";
    String  v_sdesc     =  "";
    String  v_propstart =  "";
    String  v_propend   =  "";
    String  v_edustart  =  "";
    String  v_eduend    =  "";
    String  v_place     =  "";
    String  v_tutor     =  "";
    String  v_muserid   =  "";
    String  v_mastermail=  "";
    String  v_mastertel =  "";
    String  v_isgoyong  =  "";
    String  v_subjtarget=  "";
    String  v_edumans   =  "";
    String  v_intro     =  "";
    String  v_explain   =  "";
    String  v_memo      =  "";
    String  v_isonoff_value="";
    String  v_prop_img  =  "";
    String  v_isgoyong_value="";
    String  v_edutype   =  "";
    String  v_masteruser=  "";
    String  v_env       =  "";
    String  v_owner     =  "";  //�������ڵ�
    String  v_ownerman  =  "";  //ũ�����ڸ�
    String  v_ownertel  =  "";  //����� ��ȭ��ȣ
    String  v_isessential = ""; // ��������
    String  v_purl        = "";
    String  v_introducefilenamereal = "";
    String  v_introducefilenamenew  = "";
    String  v_introducefilenamenew_view  = "";
    String  v_contenttype  = "";
    String  v_studentlimitch="";
	String	v_musername		="";
	String	v_course		= "";
	String	v_coursenm		= "";
	String	v_tmp_subj		= "";
	String	v_iscourseYn	= "";

    int     v_studentlimit =0;
    int     v_biyong    =  0;
    int     v_edudays   =  0;
    int     v_edutimes  =  0;
    int     v_ratewbt   =  0;
    int     v_ratevod   =  0;
    int     v_score     =  0;   // ��������
    int     v_propcnt   = 0;
    int     v_bookprice   = 0;
	int		v_realpay	=	0;
	int		v_subjcnt	= 0;

    String  v_isessential_view = "";
    String  v_lesson    =  "";
    String  v_lecture   =  "";
    String  v_lecturedate= "";
    String  v_biyong_view = "";
    String  v_studentlimit_view  = "";
    String  v_isoutsourcing  ="";
    String  v_conturl        = "";
	int		v_discount = v_discount = DiscountBean.returnDiscount(box);
	
    int     i           =  0;

	int v_totalmil = 0;
	v_totalmil = HomePageMileageBean.TotalMileage(box);

    v_preurl               =  EduEtc1Bean.make_previewURL(v_subj);
    String v_hasPreviewObj = EduEtc1Bean.hasPreviewObj(v_subj);

    String  s_userid = box.getSession("userid");
    String  s_jikwi  = box.getSession("jikwi");
    String  v_prop_check = "";
	String	v_grtype = GetCodenm.get_grtype(box,box.getSession("tem_grcode"));

    String v_classname  = "";
    String v_eduperiod  = "";


    Hashtable outputData = new Hashtable();

    DataBox dbox = (DataBox)request.getAttribute("selectEduBill");

	if(dbox != null)
	{
		v_subjseq		= dbox.getString("d_subjseq");
		v_subjnm		= dbox.getString("d_subjnm");
		v_studentlimit	= dbox.getInt("d_studentlimit");
		v_propstart		= dbox.getString("d_propstart");
		v_propend		= dbox.getString("d_propend");
		v_edustart		= dbox.getString("d_edustart");
		v_eduend		= dbox.getString("d_eduend");
		v_biyong		= dbox.getInt("d_biyong");
		v_musername		= dbox.getString("d_name");
	    v_bookprice		= dbox.getInt("d_bookprice");

		v_course		= dbox.getString("d_course");
		v_coursenm		= dbox.getString("d_coursenm");
		v_iscourseYn	= dbox.getString("d_isbelongcourse");

		if(v_iscourseYn.equals("Y"))
		{
			v_classname = v_coursenm;
			DataBox dbox2 = KProposeCourseBean.getBill(v_course, v_subjseq, v_year);

			if(dbox2 != null)
			{
				v_biyong        = dbox2.getInt("d_scbiyong");
				v_bookprice     = dbox2.getInt("d_bookprice");
			}
		}
		else
		{
			v_classname = v_subjnm;
		}
		
		if(v_discount == 0)
		{
			v_realpay = v_biyong ;
		}
		else
		{
			v_realpay = v_biyong - (v_biyong* v_discount / 100);
		}
	}


%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topApply.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script>

	//�ݾװ��
	function rbo_change(oTarget)
	{
		var frm = document.form1;
		
		if(oTarget.value == "Y")
		{
			document.getElementById("v_realpay").innerHTML = <%=v_realpay%> + <%=v_bookprice %>;
			frm.p_realpay.value = <%=v_realpay%> + <%=v_bookprice %>;
		}
		else
		{
			document.getElementById("v_realpay").innerHTML = <%=v_realpay%>;
			frm.p_realpay.value = <%=v_realpay%>;
		}	
	}

	// ���üũ ȭ������
	function input_bill(oFlag)
	{
		var mil = document.form1.p_usemileage;
		var url = "";

		if(mil.value.length < 1)
		{
			mil.value = 0;
		}
		if(mil.value > <%=v_totalmil%>)
		{
		   alert("�ִ� ��� ���ϸ����� �ʰ� �ϼ̽��ϴ�");
			mil.focus();
			mil.select();
			return;
		}
		if(document.getElementById("rbo_mileage").value == "Y" && mil.value.length >= 1)
		{
			document.form1.p_realpay.value = document.form1.p_realpay.value - mil.value;
		}

		if(oFlag == 'D')
		{
			url = "/servlet/controller.propose.ProposeCourseServlet";

			var new_Open = window.open("","EduInputBill","scrollbars=auto,width=330,height=430,resizable=no");
			document.form1.target = "EduInputBill";
			document.form1.p_process.value = "SubjectEduInputCredit";
		}
		else if(oFlag == 'C')
		{
			url = "/servlet/controller.propose.ProposeCourseServlet";

			var new_Open = window.open("","EduInputBill","scrollbars=auto,width=700,height=300,resizable=no");
			
			document.form1.target = "EduInputBill";
			document.form1.p_process.value = "SubjectEduInputBill";
		}
		document.form1.action=url;
		document.form1.submit();
	}

	//���ڸ� �Է� ����
	function numcheck(oTarget)
	{
		if(((event.keyCode < 48) || (event.keyCode > 57)) && ((event.keyCode < 96) || (event.keyCode > 105)))
			if((event.keyCode == 9) || (event.keyCode == 8) || (event.keyCode == 46))
				event.returnValue = true;
			else
				event.returnValue = false;
	}

	// ���ϸ��� ��뿩��
	function mileageView(oTarget)
	{ 
		if(oTarget.value == "Y")
		{
			document.getElementById("tr_dot").style.display = "";
			document.getElementById("tr_mileage").style.display = "";
		}
		else
		{
			document.getElementById("tr_dot").style.display = "none";
			document.getElementById("tr_mileage").style.display = "none";
		}
	}
//-->
</SCRIPT>


<form name="form1" method="post" >
    <input type='hidden' name='p_process' value="<%=v_process%>" >
    <input type='hidden' name='p_select' value="<%=v_select%>">
    <input type='hidden' name='p_gubun' value="<%=v_gubun%>">
    <input type='hidden' name='p_biyong' value="<%=v_biyong%>">
    <input type='hidden' name='p_bookprice' value="<%=v_bookprice%>">
    <input type='hidden' name='p_discount' value="<%=v_discount%>">
    <input type='hidden' name='p_realpay' value="<%=v_realpay%>">

    <input type='hidden' name='p_subj' value="<%=v_subj%>">
    <input type='hidden' name='p_course' value="<%=v_course %>">
    <input type='hidden' name='p_coursenm' value="<%=v_coursenm %>">
    <input type='hidden' name='p_iscourseYn' value="<%=v_iscourseYn%>">
    <input type='hidden' name='p_grtype' value="<%=v_grtype%>">

    <input type='hidden' name='p_year' value="<%=v_year%>">
    <input type='hidden' name='userid'>
    <input type='hidden' name='p_subjseq' value="<%=v_subjseq%>">
    <input type='hidden' name='p_subjnm' value="<%=v_subjnm%>">
    <input type='hidden' name='p_rprocess' value="<%=v_rprocess%>">
    <input type='hidden' name='p_actionurl' value="<%=v_actionurl%>">
    <input type='hidden' name='p_purl' value="<%=v_purl%>">

    <input type='hidden' name='p_isonoff' value="<%=v_isonoff%>">
    <input type='hidden' name='p_upperclass' value="<%=v_upperclass%>">
    <input type='hidden' name='p_upperclassnm' value="<%=v_upperclassnm%>">
    <input type='hidden' name='p_lsearchsubject' value="<%=v_lsearchsubject%>">
    <input type='hidden' name='p_returnurl' value="/servlet/controller.propose.ProposeCourseServlet">

    <!-- title -->
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="35" align="right"  background="/images/user/game/apply/<%=tem_subimgpath%>/title02.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
      HOME > ������û > ������û</td>
  </tr>
  <tr> 
    <td height="20"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/images/user/game/apply/st_card.gif"></td>
  </tr>
  <tr>
    <td height="10">&nbsp;</td>
  </tr>
</table>
<!-- ����ó�� -->
<table width="720" border="2" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides"   >
  <tr  class="lcolor"> 
    <td height="3" class="linecolor_app"></td>
    <td height="3" class="linecolor_app2"></td>
    <td height="3" class="linecolor_app"></td>
    <td height="3" class="linecolor_app2"></td>
  </tr>
  <tr>
    <td class="tbl_gtit2">������</td>
    <td class="tbl_gleft"><%=v_classname%></td>
    <td class="tbl_gtit">����</td>
    <td class="tbl_gleft"><%=v_subjseq%></td>
  </tr>
  <tr> 
    <td width="102" class="tbl_gtit2">������û������</td>
    <td width="230" class="tbl_gleft"><%=FormatDate.getFormatDate(v_propstart,"yyyy/MM/dd")%></td>
    <td width="123" class="tbl_gtit">������û������</td>
    <td width="229" class="tbl_gleft"><%=FormatDate.getFormatDate(v_propend,"yyyy/MM/dd")%></td>
  </tr>
  <tr> 
    <td height="26" class="tbl_gtit2">����������</td>
    <td class="tbl_gleft"><%=FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd")%></td>
    <td class="tbl_gtit">����������</td>
    <td class="tbl_gleft"><%=FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd")%></td>
  </tr>
  <tr> 
    <td class="tbl_gtit2">��������</td>
    <td class="tbl_gleft"><%=v_studentlimit%>��</td>
    <td class="tbl_gtit">������</td>
    <td class="tbl_gleft"><%=v_biyong%></td>
  </tr>
  <tr> 
    <td class="tbl_gtit2">�ִ�簭��</td>
    <td class="tbl_gleft"><%=v_musername%></td>
	<td class="tbl_gtit">�����</td>
    <td class="tbl_gleft"><%=v_bookprice%></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="20">&nbsp;</td>
  </tr>
</table>
<!-- ����ó�� -->
<table width="720" border="0" cellpadding="0" cellspacing="0" background="/images/user/game/apply/card_box_bg.gif">
  <tr>
    <td valign="top"><img src="/images/user/game/apply/card_box_top.gif"></td>
  </tr>
  <tr>
    <td align="center"><table width="680" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="196" valign="top"><img src="/images/user/game/apply/card_img.jpg"></td>
          <td width="484" align="right" valign="top">
		  <table width="472" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="100"><img src="/images/user/game/apply/card_text_01.gif"></td>
                <td width="376" class="tbl_bleft">
                    <input type="radio" name="rbo_1" value="Y" onClick="javascript:rbo_change(this)">
                  ���� 
                  <input type="radio" name="rbo_1" value="N" onClick="javascript:rbo_change(this)" checked> 
                  ���� </td>
              </tr>
              <tr > 
                <td height="1" colspan="2" background="/images/user/game/apply/card_line.gif"></td>
              </tr>
              <tr> 
                <td><img src="/images/user/game/apply/card_text_02.gif"></td>
                <td class="tbl_bleft"><%=v_biyong%></td>
              </tr>
              <tr > 
                <td height="1" colspan="2" background="/images/user/game/apply/card_line.gif"></td>
              </tr>
              <tr> 
                <td><img src="/images/user/game/apply/card_text_03.gif"></td>
                <td class="tbl_bleft"><%=v_discount %>%</td>
              </tr>
			  <tr > 
                <td height="1" colspan="2" background="/images/user/game/apply/card_line.gif"></td>
              </tr>
              <tr> 
                <td><img src="/images/user/game/apply/card_text_05.gif"></td>
                <td class="tbl_bleft">
					<input type="radio" name="rbo_mileage" id="rbo_mileage" value="Y" onClick="javascript:mileageView(this)">��� 
					<input type="radio" name="rbo_mileage" id="rbo_mileage" value="N" checked onClick="javascript:mileageView(this)">�̻��
				</td>
              </tr>
			  <tr id="tr_dot" style="display:none;"> 
                <td height="1" colspan="2" background="/images/user/game/apply/card_line.gif"></td>
              </tr>
              <tr id="tr_mileage" style="display:none;"> 
                <td><img src="/images/user/game/apply/card_text_06.gif"></td>
                <td class="tbl_bleft">
					<input type="text" name="p_usemileage" class="input2" onkeydown="javascript:return numcheck(this)">��밡���� �ִ� ���ϸ��� : <%=v_totalmil %>
				</td>
              </tr>
              <tr > 
                <td height="1" colspan="2" background="/images/user/game/apply/card_line.gif"></td>
              </tr>
			   <tr> 
                <td><img src="/images/user/game/apply/card_text_04.gif"></td>
                <td class="tbl_bleft"><div id="v_realpay"><%=v_realpay%></div></td>
              </tr>
                <tr > 
                <td height="1" colspan="2" background="/images/user/game/apply/card_line.gif"></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td valign="bottom"><img src="/images/user/game/apply/card_box_bo.gif" width="720" height="14"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="5"></td>
  </tr>
  <tr>
    <td height="20" align="center"><table width="178" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="64"><a href="javascript:input_bill('C')"><img src="/images/user/game/button/btn_money.gif" border="0"></a></td>
          <td width="63"><a href="javascript:input_bill('D')"><img src="/images/user/game/button/btn_card.gif" border="0"></a></td>
          <td width="51"><a href="javascript:history.back();"><img src="/images/user/game/button/btn_list.gif" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="20">&nbsp;</td>
  </tr>
</table>
<!-- ���� �� -->
</form>


<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->