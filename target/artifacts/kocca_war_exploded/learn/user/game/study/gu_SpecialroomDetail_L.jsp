<%
/**
 * file name : gu_SpecialroomDetail_L.jsp
 * date      : 2005/12/16
 * programmer:	lyh
 * function  : Ư���� list ���
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
	DataBox dbox = null;		//��
	DataBox dbox2 = null;	//������
	DataBox dbox3 = null;	//������

	box = (RequestBox)request.getAttribute("requestbox");
	String v_userid = box.getSession("userid");
	String lDate = "";
	
    ArrayList list = (ArrayList)request.getAttribute("SpecialroomListDetail");			//�ش�� ��
    ArrayList preList = (ArrayList)request.getAttribute("SpecialroomListDetailPre");	//������
    ArrayList nextList = (ArrayList)request.getAttribute("SpecialroomListDetailNext");	//������


	if(list.size() != 0 ){
		dbox = (DataBox)list.get(0);
	}

	lDate = FormatDate.getFormatDate(dbox.getString("d_ldate"),"yyyy/MM/dd");

%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topMystudy.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--
function listGo(){
	location.href = "/servlet/controller.study.SpecialroomServlet?p_process=SpecialroomList";
}

function preNextGo(seq,grcode){
	document.frm1.seq.value = seq;
	document.frm1.grcode.value = grcode;
	document.frm1.p_process.value = "SpecialroomDetail";
	document.frm1.action = "/servlet/controller.study.SpecialroomServlet";
	document.frm1.submit();
}


//-->
</SCRIPT>
<!-- title -->
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="720" height="35" align="right"  background="/images/user/game/mystudy/<%=tem_subimgpath%>/tit_specialroom.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
      HOME > ���� ���ι� > Ư����</td>
  </tr>
  <tr> 
    <td height="20"> 
      <!-- page sub -->
    </td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="81" height="2" class="linecolor_board3"></td>
	<td width="639" height="2" class="linecolor_board4"></td>
  </tr>
</table>
<!--  -->


<table width="720" border="2" cellspacing="0" 
    cellpadding="0"  style="border-collapse:collapse;" bordercolor="#DFE4CA" frame="hsides" rules="rows" >
  <tr> 
    <td width="79" class="tbl_grc"><img src="/images/user/game/mystudy/text_t_subject02.gif" width="29" height="12"></td>
    <td width="1" valign="bottom" ><img src="/images/user/game/mystudy/vline.gif"></td>
    <td width="640" class="font_specialroom_list"><%=dbox.getString("d_subjnm")%></td>
  </tr>
  <tr> 
    <td  class="tbl_grc"><img src="/images/user/game/mystudy/text_day.gif" width="29" height="12"></td>
    <td  valign="bottom"><img src="/images/user/game/mystudy/vline.gif"></td>
    <td bgcolor="F8F7EF" class="tbl_bleft">
	<table width="300" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="611" ><%=lDate%></td>
        </tr>
     </table>
  </td>
  </tr>

<!--  -->
<table width="720" border="2" cellspacing="0" 
    cellpadding="0"  style="border-collapse:collapse;" bordercolor="#DFE4CA" frame="hsides" rules="rows" >
  <tr> 
   <td width="10" class="tbl_grc"></td>
    <td>
	<br>
	<table width="700" border="0"  cellspacing="0" cellpadding="0">
        <tr> 
          <td class="tbl_gleft">- �Ͻ� : <%=FormatDate.getFormatDate(dbox.getString("d_dday"),"yyyy.MM.dd")%> <%=FormatDate.getFormatTime(dbox.getString("d_starttime"),"HH:mm")%>  ~ <%=FormatDate.getFormatTime(dbox.getString("d_endtime"),"HH:mm")%></td>
        </tr>
        <tr> 
          <td class="tbl_gleft">- ��� : <%=dbox.getString("d_place")%></td>
        </tr>
        <tr> 
          <td class="tbl_gleft">- ���� : <%=dbox.getString("d_tname")%></td>
        </tr>
        <tr> 
          <td class="tbl_gleft">- ���� : <%=dbox.getString("d_codenm")%></td>
        </tr>
        <tr> 
          <td class="tbl_gleft">- ���� : 
				 <% if(!dbox.getString("d_limitmember").equals("")){
						out.print(dbox.getString("d_limitmember")+" ��");
						} else{ out.print(" - ");}
					%>
			</td>
        </tr>
        <tr> 
          <td class="tbl_gleft">
					- ���� : 
				  <TABLE border="0"  cellspacing="0" cellpadding="0" >
				  <TR><TD height="5"></TD></TR>
				  <TR>
					<TD valign="top"><%=dbox.getString("d_content")%></TD>
				  </TR>
				  </TABLE>
		  </td>
        </tr>
		</table>
	  </td>
  </tr>
</table>
<!-- ������,������  ����-->
<FORM name="frm1" METHOD=POST>
		<INPUT TYPE="hidden" NAME="seq">
		<INPUT TYPE="hidden" NAME="grcode">
		<INPUT TYPE="hidden" NAME="p_process">
</FORM>
<table width="720" border="0" cellspacing="0" cellpadding="0">
<%
	//�������� �ִٸ�
	if(preList.size() != 0 ){
		dbox2 = (DataBox)preList.get(0);
%>
  <tr> 
    <td height="1" colspan="5" class="linecolor_board4"></td>
  </tr>
  <tr class="next_list_bg"> 
    <td width="3" height="26" ><img src="/images/user/game/mystudy/blank002.gif" width="3" height="26"></td>
    <td width="74" height="26" class="tbl_grc"><img src="/images/user/game/mystudy/text_pre_text.gif" width="27" height="12"></td>
    <td width="1" height="26" valign="bottom" ><img src="/images/user/game/mystudy/vline.gif" width="1" height="8"></td>
    <td height="26" class="font_specialroom_list">
	<A HREF="javascript:preNextGo('<%=dbox2.getString("d_seq")%>','<%=dbox2.getString("d_grcode")%>')"><%=dbox2.getString("d_subjnm")%></A>
	</td>
    <td width="3" height="26" ><img src="/images/user/game/mystudy/blank002.gif" width="3" height="26"></td>
  </tr>
<%
	}
%>	

<%
	//�������� �ִٸ�
	if(nextList.size() != 0 ){
		dbox3 = (DataBox)nextList.get(0);
%>
  <tr> 
    <td height="1" colspan="5" class="linecolor_board4" ></td>
  </tr>
  <tr class="next_list_bg"> 
    <td width="3" height="26" ><img src="/images/user/game/mystudy/blank002.gif" width="3" height="26"></td>
    <td width="74" height="26" class="tbl_grc"><img src="/images/user/game/mystudy/text_next_text.gif" width="28" height="12"></td>
    <td height="26" valign="bottom" ><img src="/images/user/game/mystudy/vline.gif" width="1" height="8"></td>
    <td height="26" class="font_specialroom_list">
		<A HREF="javascript:preNextGo('<%=dbox3.getString("d_seq")%>','<%=dbox3.getString("d_grcode")%>')"><%=dbox3.getString("d_subjnm")%></A>
    <td height="26" ><img src="/images/user/game/mystudy/blank002.gif" width="3" height="26"></td>
  </tr>
  <tr> 
    <td height="2" colspan="5" class="linecolor_board4"></td>
  </tr>

<%
	}else{		// �������� ��� ������ �Ʒ� ������ ���̵���
%>	
  <tr> 
    <td height="1" colspan="5" class="linecolor_board4" ></td>
  </tr>

<%
}
%>
</table>
<!-- ������,������  ��-->

<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="2" colspan="2" class="lcolor"></td>
  </tr>
  <tr> 
    <td height="1" colspan="2" ></td>
  </tr>
  <tr> 
    <td height="5" colspan="2" ></td>
  </tr>
  <tr> 
    <td align="center" valign="bottom">&nbsp;</td>
    <td align="right" valign="bottom"><a href="javascript:listGo();"><img src="/images/user/game/button/btn_list.gif" border="0"></a></td>
  </tr>
  <tr> 
    <td height="5" colspan="2" ></td>
  </tr>
</table>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->