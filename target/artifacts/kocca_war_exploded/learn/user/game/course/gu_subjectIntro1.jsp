<%
//**********************************************************
//  1. ��      ��: ���� > �н�����
//  2. ���α׷��� : gu_subjectIntro.jsp
//  3. ��      ��: �н�����
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.26
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
    RequestBox box       = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
	box.put("leftmenu","02"); 

    String  v_process     = box.getString("p_process");
	String  v_gubun		  = box.getStringDefault("p_gubun","1");
                  
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topCourse.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->


<SCRIPT>
var old_menu = ''; var old_cell = '';
function comment( submenu, cellbar) {

	if( old_menu != submenu ) {

		if( old_menu !='' ) {
			old_menu.style.display = 'none';
		}
		submenu.style.display = 'block';
		old_menu = submenu;
		old_cell = cellbar;

	} else {
		submenu.style.display = 'none';
		old_menu = '';
		old_cell = '';
	}
}


function tabmove(tab){
      document.form1.action='/servlet/controller.course.CourseIntroServlet';
	  document.form1.p_gubun.value = tab;
      document.form1.p_process.value = 'SubjectPage';
      document.form1.submit();
}

// ���� ���뺸��
/*
function whenSubjInfo(subj){
    document.form1.p_subj.value     = subj;
    document.form1.p_process.value  = 'SubjectPreviewPage';
    document.form1.p_rprocess.value = 'SubjectPage';
    document.form1.action='/servlet/controller.course.CourseIntroServlet';
    document.form1.target = "_self";
    document.form1.submit();
}
*/
// ���� ���뺸��
function whenSubjInfo(subj,subjnm,courseyn,upperclass,upperclassnm){
    document.form1.p_subj.value = subj;
    document.form1.p_subjnm.value = subjnm;
    document.form1.p_iscourseYn.value = courseyn;
    document.form1.p_upperclass.value = upperclass;
    document.form1.p_upperclassnm.value = upperclassnm;
    document.form1.p_process.value = 'SubjectPreviewPage';
    document.form1.p_rprocess.value = 'SubjectList';
    document.form1.action='/servlet/controller.propose.ProposeCourseServlet';
    document.form1.target = "_self";
    document.form1.submit();
}
</SCRIPT>

<style type="text/css">
<!--
.l-padding {
	padding-left: 12px;
}
-->
</style>


<form name="form1" method="post">
	<input type="hidden" name="p_gubun" value="<%=v_gubun%>">
	<input type="hidden" name="p_subj">
	<input type="hidden" name="p_subjnm">
	<input type="hidden" name="p_iscourseYn">
	<input type="hidden" name="p_upperclass">
	<input type="hidden" name="p_upperclassnm">
	<input type="hidden" name="p_process">
	<input type="hidden" name="p_rprocess">

<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="35" align="right"  background="/images/user/game/course/<%=tem_subimgpath%>/tit_learncourse.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
      HOME > �����ȳ� > �н�����</td>
  </tr>
  <tr> 
    <td height="20"></td>
  </tr>
</table>
<!-- �н����� -->

<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td align="right" style="padding-right:17px">
    <img src="/images/user/game/course/tab_learn1on_01.gif" name="Image201" border="0"><a href="javascript:tabmove(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image202','','/images/user/game/course/tab_learn2on_01.gif',1)"><img src="/images/user/game/course/tab_learn2_01.gif" name="Image202" border="0"></a><a href="javascript:tabmove(3)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image203','','/images/user/game/course/tab_learn3on_01.gif',1)"><img src="/images/user/game/course/tab_learn3_01.gif" name="Image203" border="0"></a></td>
  </tr>
   <tr> 
    <td align="center">
    	<table border="0" cellpadding="0" cellspacing="0" width="688">
    		<tr>
    			<td bgcolor="6A93B3" height="2"></td>
    		</tr>
    	</table>
    </td>
  </tr>
  <tr style="padding-top:15px;padding-right:25px"> 
    <td align="right">
    <img src="/images/user/game/course/pgm_btn_0102.gif" border="0">
    <a href="/learn/user/game/course/02.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image102','','/images/user/game/course/pgm_btn_0202.gif',1)"><img src="/images/user/game/course/pgm_btn_0201.gif" name="Image102" border="0"></a>
    <a href="/learn/user/game/course/03.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image103','','/images/user/game/course/pgm_btn_0302.gif',1)"><img src="/images/user/game/course/pgm_btn_0301.gif" name="Image103" border="0"></a>
    <a href="/learn/user/game/course/04.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image104','','/images/user/game/course/pgm_btn_0402.gif',1)"><img src="/images/user/game/course/pgm_btn_0401.gif" name="Image104" border="0"></a>
    <a href="/learn/user/game/course/05.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image105','','/images/user/game/course/pgm_btn_0502.gif',1)"><img src="/images/user/game/course/pgm_btn_0501.gif" name="Image105" border="0"></a></td>
  </tr>
</table>
<!-- 1 -->
<table border="0" cellpadding="0" cellspacing="0" width=720">
	<tr>
		<td align="center" style="padding-top:15px;padding-bottom:20px">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td><img src="/images/user/game/course/bg_top.gif"></td>
				</tr>
				<tr>
					<td background="/images/user/game/course/bg.gif" height="100%">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="240" valign="top" style="padding-left:10;padding-top:0"><img src="/images/user/game/course/pgm_title01.gif"></td>
								<td width="388">
								<!--����Ʈ-->
									<table border="0" cellpadding="0" cellspacing="0" width="388">
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_01.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('000102','��ǻ�� �ý��� ������','ON','G01','���Ӿ�ī����')">��ǻ�� �ý��� ������</a></td>
											<td width="168px"><img src="/images/user/game/course/common_icon.gif" align="absmiddle"></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px" width="220px"><img src="/images/user/game/course/num_02.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('000072','���α׷���1','ON','G01','���Ӿ�ī����')">���α׷���1</a></td>
											<td width="168px"><img src="/images/user/game/course/common_icon.gif" align="absmiddle"></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_03.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('000007','�ڷᱸ��','ON','G01','���Ӿ�ī����')">�ڷᱸ��</a></td>
											<td width="168px"><img src="/images/user/game/course/common_icon.gif" align="absmiddle"></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_04.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('000006','�˰���','ON','G01','���Ӿ�ī����')">�˰���</a></td>
											<td width="168px"><img src="/images/user/game/course/common_icon.gif" align="absmiddle"></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_05.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('000004','���α׷���2','ON','G01','���Ӿ�ī����')">���α׷���2</td>
											<td width="168px"><img src="/images/user/game/course/common_icon.gif" align="absmiddle"></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_06.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('000010','��ü���� ���α׷���1','ON','G01','���Ӿ�ī����')">��ü�������α׷���1</a></td>
											<td width="168px"><img src="/images/user/game/course/common_icon.gif" align="absmiddle"></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_07.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('002210','DirectX1(new)','ON','G01','���Ӿ�ī����')">DirectX1(new)</a></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_08.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('002205','DirectX2(new)','ON','G01','���Ӿ�ī����')">DirectX2(new)</a></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_09.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('000049','��ü���� ���α׷���2','ON','G01','���Ӿ�ī����')">��ü�������α׷���2</a></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_10.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('002212','���Ӽ���(new)','ON','G01','���Ӿ�ī����')">���Ӽ���(new)</a></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_11.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('002206','3D���α׷���1(new)','ON','G01','���Ӿ�ī����')">3D���α׷���1(new)</a></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_12.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('000090','3D ���α׷���2','ON','G01','���Ӿ�ī����')">3D ���α׷���2</a></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_13.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('001006','3D Data Exporting Techniques','ON','G01','���Ӿ�ī����')">3D Data Exporting Techniques</a></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_14.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('001002','3D�����������α׷���','ON','G01','���Ӿ�ī����')">3D�����������α׷���</a></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_15.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('002301','Shader Programming','ON','G01','���Ӿ�ī����')">Shader Programmings</a></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_16.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('001003','3D ��� ������ ��ũ��','ON','G01','���Ӿ�ī����')">3D ��� ������ ��ũ��</a></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_17.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('001001','3D�������α׷���','ON','G01','���Ӿ�ī����')">3D�������α׷���</a></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_18.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('000045','�����Ϸ�','ON','G01','���Ӿ�ī����')">�����Ϸ�</a></td>
											<td width="168px"><img src="/images/user/game/course/common_icon.gif" align="absmiddle"></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_19.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('001005','��ũ��Ʈ ���','ON','G01','���Ӿ�ī����')">��ũ��Ʈ ���</a></td>
											<td width="168px"><img src="/images/user/game/course/common_icon.gif" align="absmiddle"></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_20.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('000087','��Ʈ��ũ���α׷���','ON','G01','���Ӿ�ī����')">��Ʈ��ũ���α׷���</a></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
										<tr height="24">
											<td style="padding-left:10px"><img src="/images/user/game/course/num_21.gif" align="absmiddle"> &nbsp; <a href="javascript:whenSubjInfo('000063','�ΰ�����','ON','G01','���Ӿ�ī����')">�ΰ�����</a></td>
											<td width="168px"><img src="/images/user/game/course/common_icon.gif" align="absmiddle"></td>
										</tr>
										<tr>
											<td colspan="2"><img src="/images/user/game/course/point_bg.gif"></td>
										</tr>
									</table> 
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td><img src="/images/user/game/course/bg_bottom.gif"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

</form>



<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
