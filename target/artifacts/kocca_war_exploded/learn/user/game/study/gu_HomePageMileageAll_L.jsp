<%
//**********************************************************
//  1. ��      ��: EDUCATION SUBJECT PAGE
//  2. ���α׷���: gu_HomePageMileage_L.jsp
//  3. ��      ��: ���ǰ��ǽ�
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2006.01.10 �ϰ���
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.homepage.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    box.put("leftmenu","10");                       // �޴� ���̵� ����

    String  v_process   = box.getString("p_process");
    String  v_user_id   = box.getSession("userid");
    String  v_user_nm   = box.getSession("name");
    int v_pageno         = box.getInt("p_pageno");

	int v_point = 0;
	int v_total = 0;
	int v_tmp_total = 0;


	String v_mileagenm = "";
	String v_ldate	= "";
	String v_minus_num	= "";
	String v_plus_num	= "";

	int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
	int v_totalmil	= 0;
	int i = 0;

	v_totalmil = HomePageMileageBean.TotalMileage(box);

	ArrayList list = null;

	list = (ArrayList)request.getAttribute("MileageList");

%>


<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topMystudy.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script>
	function mileageList()
	{
		document.form1.action = "/servlet/controller.homepage.HomePageMileageServlet?p_process=mileageList";
		document.form1.submit();
	}

	function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.homepage.HomePageMileageServlet";
         document.form1.p_process.value = "mileageList";
         document.form1.submit();
    }
    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.homepage.HomePageMileageServlet";
         document.form1.p_process.value = "mileageList";
         document.form1.submit();
    }
</script>

<form name= "form1" method= "post">

<!-- title -->
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="720" height="35" align="right"  background="/images/user/game/mystudy/<%=tem_subimgpath%>/tit_mile.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
      HOME > ���� ���ι� > ���ϸ���</td>
  </tr>
  <tr> 
    <td height="20">&nbsp; </td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td colspan="2"><img src="/images/user/game/mystudy/mile_top.gif"></td>
  </tr>
  <tr> 
    <td width="192"><img src="/images/user/game/mystudy/mile_img.jpg" width="192" height="82"></td>
    <td width="528">
	<!-- ���ϸ���ǥ��â -->
	<table width="511" border="0" cellpadding="0" cellspacing="0" bgcolor="E0EBE4">
        <tr> 
          <td colspan="2" valign="top"><img src="/images/user/game/mystudy/mile_boxtop.gif" width="511" height="6"></td>
        </tr>
        <tr> 
          <td width="213" align="center"><strong><font color="#000000"><%=v_user_nm%> <img src="/images/user/game/mystudy/mile_text.gif" align="absmiddle"></font></strong></td>
          <td width="298"><table width="272" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="265" height="45" align="center" bgcolor="CAE4CD"><img src="/images/user/game/mystudy/mile_icon.gif" align="absmiddle"> 
                  <font color="#CC3300">�� <%=v_totalmil%> point</font></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td colspan="2" valign="bottom"><img src="/images/user/game/mystudy/mile_boxbo.gif" width="511" height="6"></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
<table width="675" border="0" cellspacing="0" cellpadding="0">
  <tr valign="top"> 
    <td width="675"> 
      <!--���ϸ������̺�
-->
      <table width="720" border="2" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
        <tr  class="lcolor"> 
          <td height="3" colspan="5" class="linecolor_my"></td>
        </tr>
        <tr> 
          <td width="115" class="tbl_ptit2">��/��</td>
          <td width="120" class="tbl_ptit">�߻����ϸ���</td>
          <td width="124" class="tbl_ptit2">��븶�ϸ���</td>
          <td width="124" class="tbl_ptit2">�������ϸ���</td>
          <td width="193" class="tbl_ptit">���</td>
        </tr>
        <%
			for(i = 0; i < list.size(); i++)
			{
				DataBox dbox = (DataBox)list.get(i);
					
				
				v_point		= dbox.getInt("d_point");
				v_mileagenm	= dbox.getString("d_usememo");
				v_ldate		= dbox.getString("d_ldate");
				v_totalpage = dbox.getInt("d_totalpage");
				v_total		+= v_point;

				v_ldate		= FormatDate.getFormatDate(v_ldate,"yyyy/MM");

				if(v_point > 0)
				{
					v_plus_num = String.valueOf(v_point);
					v_minus_num = "-";
				}
				else
				{
					v_plus_num = "-";
					v_minus_num = String.valueOf(Math.abs(v_point));
				}

		%>
			  <tr> 
				<td class="tbl_grc"><%=v_ldate%></td>
				<td class="tbl_grc"><%=v_plus_num%> </td>
				<td class="tbl_grc"><%=v_minus_num%></td>
				<td class="tbl_grc"><%=v_total%></td>
				<td class="tbl_grc"><%=v_mileagenm%></td>
			  </tr>
		<% } 
			if(i == 0)
			{	%>
				<tr>
					<td colspan="5" align="center"> ���ϸ��� ��� ������ �����ϴ�.</td>
				</tr>
		<%	}
		%>
        <tr  bgcolor="#ededed"> 
          <td height="2" colspan="5"></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="20"></td>
  </tr>
</table>

<!----------------- ����¡ ���� ----------------->
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" valign="absmiddle">
              <%= PageUtil.printPageList(v_totalpage, v_pageno, 10) %>
            </td>
          </tr>
        </table>
        <!----------------- ����¡ �� ----------------->

</form>
<br><br>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->