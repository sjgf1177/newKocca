

<%
//**********************************************************
//  1. ��      ��: Ȩ������ �αⰭ��
//  2. ���α׷��� : Good_course.jsp
//  3. ��      ��: Ȩ������ �αⰭ��
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.22
//  7. ��      ��:
//***********************************************************
%>
	   
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.study.KRecommandBean"%>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />


<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

	KRecommandBean krecommandBean = new KRecommandBean();
	DataBox dbox = krecommandBean.selectMainRecommandSubj(box);
	String v_newphoto = "";

		if(dbox.getString("d_newphoto") != ""){
			v_newphoto = conf.getProperty("url.upload")+"bulletin/" + dbox.getString("d_newphoto");
		}else{
			v_newphoto = "/images/user/kocca/homepage/type1/blank_photo1.gif";
		}

if(dbox != null){
%>	

  <SCRIPT LANGUAGE="JavaScript">
  <!--
 // ���� ���뺸��
function whenSubjInfo(subj,sphere){
	document.frm3.p_subj.value       = subj;
	document.frm3.p_sphere.value = sphere;
	document.frm3.p_process.value  = 'SubjectPreviewPage';
	document.frm3.p_rprocess.value = 'SubjectListAlway';
	document.frm3.action='/servlet/controller.course.KCourseIntroServlet';
	document.frm3.target = "_self";
	document.frm3.submit();
}

 
  //-->
  </SCRIPT>

  <FORM  name="frm3" METHOD=POST ACTION="" >
	<input type="hidden" name="p_searchYn">
	<input type='hidden' name='p_sphere' >
	<input type='hidden' name='p_subj'    value="">
	<input type='hidden' name='p_rprocess' value="">
	<input type='hidden' name='p_process' value="">
  </FORM>

<table width="223" border="0" cellspacing="0" cellpadding="0">
	<tr> 
	  <td colspan="4"><img src="/images/user/kocca/homepage/type1/st_good_course.gif" width="223" height="35"></td>
	</tr>

	<tr valign="top" > 
	  <td height="28" colspan="4"><table width="223" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td width="30" valign="top"><img src="/images/user/kocca/homepage/type1/inter_1lst.gif"></td>
			<td width="193" background="/images/user/kocca/homepage/type1/inter_text_bg.gif"><strong><%=dbox.getString("d_agegubun")%>�� �αⰭ�� 1��</strong></td>
		  </tr>
		</table></td>
	</tr>
	<tr> 
	  <td height="10" colspan="4"></td>
	</tr>
	<tr> 
	  <td width="4" rowspan="2">&nbsp;</td>
	  <td width="80" rowspan="2"><table width="78" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
		  <tr> 
			<td><a href="javascript:whenSubjInfo('<%=dbox.getString("d_subj")%>','<%=dbox.getString("d_sphere")%>')"><img src="<%=v_newphoto%>" border="0" width="76" height="58" ></a></td>
		  </tr>
		</table></td>
	  <td width="4" rowspan="2">&nbsp;</td>
	  <td width="132" height="19" class="main_contents01"><a href="javascript:whenSubjInfo('<%=dbox.getString("d_subj")%>','<%=dbox.getString("d_sphere")%>')"><%=dbox.getString("d_subjnm")%></a></td>
	</tr>
	<tr> 
	  <td class="tbl_gleft_small"><a href="javascript:whenSubjInfo('<%=dbox.getString("d_subj")%>','<%=dbox.getString("d_sphere")%>')"><%=dbox.getString("d_intro")%></a><font style="font-size:5pt">...</font></td>
	</tr>

	<tr> 
	  <td height="20" colspan="4">&nbsp;</td>
	</tr>
  </table>
<%
}else{		
%>

<table width="223" border="0" cellspacing="0" cellpadding="0">
	<tr> 
	  <td colspan="4"><img src="/images/user/kocca/homepage/type1/st_good_course.gif" width="223" height="35"></td>
	</tr>

	<tr valign="top" > 
	  <td height="28" colspan="4"><table width="223" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td width="30" valign="top"><img src="/images/user/kocca/homepage/type1/inter_1lst.gif"></td>
			<td width="193" background="/images/user/kocca/homepage/type1/inter_text_bg.gif"><strong>20���� �αⰭ�� 1��</strong></td>
		  </tr>
		</table></td>
	</tr>
	<tr> 
	  <td height="10" colspan="4"></td>
	</tr>
	<tr> 
	  <td width="4" rowspan="2">&nbsp;</td>
	  <td width="80" rowspan="2"><table width="78" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
		  <tr> 
			<td><img src="/images/user/kocca/homepage/type1/blank_photo1.gif" border="0" width="76" height="58" ></td>
		  </tr>
		</table></td>
	  <td width="4" rowspan="2">&nbsp;</td>
	  <td width="132" height="19" class="main_contents01"></td>
	</tr>
	<tr> 
	  <td class="tbl_gleft_small">�˻��� ���°� �����ϴ�.</td>
	</tr>

	<tr> 
	  <td height="20" colspan="4">&nbsp;</td>
	</tr>
  </table>


<%
}	
%>
