<%
//**********************************************************
//  1. ��      ��: HomePageSuperiorityMember
//  2. ���α׷��� : gu_HomePageService_L.jsp
//  3. ��      ��: Ȩ������ ���� ���ȸ�� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: �ϰ��� 2005.12. 14
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%

    HomePageSuperiorityMemberBean selectData = new HomePageSuperiorityMemberBean();
    RequestBox box    = (RequestBox)request.getAttribute("requestbox");
	box.put("leftmenu","02");                       // �޴� ���̵� ����
    String  v_process = box.getString("p_process");
    
    int v_pageno         = box.getInt("p_pageno");

    if (v_pageno == 0) {
        v_pageno = 1;
    }
    String  v_searchtext  = box.getString("p_searchtext");
    String  v_search      = box.getString("p_search");
	String  v_gubun		  = box.getString("p_gubun");

	int i = 0;
    int    v_seq     = 0;           // �Ϸù�ȣ
	int    v_cnt     = 0;           // ��ȸ��	

    String v_title   = "";          // ����
    String v_content = "";          // ����
    String v_ldate   = "";          // �����
    String v_name    = "";          // �����
	String v_useyn   = "";			// ���λ�뿩��
	String v_savefile = "";			// �������ϸ�
	String v_realfile = "";			// �������ϸ�
	String v_select_seq = "";		// ���� �Խü��õ� seq
	String v_month   = "";			// ����
	String v_singleword   = "";		// �Ѹ���


    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������

    ArrayList list1 = (ArrayList)request.getAttribute("selectHomePageSuperiorityMemberList");
   
%>

<SCRIPT LANGUAGE="JavaScript">
<!--
    function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.homepage.HomePageSuperiorityMemberServlet";
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }
    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.homepage.HomePageSuperiorityMemberServlet";
         document.form1.p_process.value = "selectList";
         document.form1.submit();
    }

	//�󼼺���
    function view(seq) {
        document.form1.action = "/servlet/controller.homepage.HomePageSuperiorityMemberServlet";
        document.form1.p_seq.value = seq;
        document.form1.p_process.value = "select";
        document.form1.submit();
    }
	// ��ȸ
    function search() {
        document.form1.action = "/servlet/controller.homepage.HomePageSuperiorityMemberServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

//-->
</SCRIPT>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topService.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<!-- title -->
<div align="center">
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="720" height="35" background="/images/user/game/service/<%=tem_subimgpath%>/tit_monthmember.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
      HOME > Service> �̴��� ���ȸ��</td>
  </tr>
  <tr> 
    <td height="20"></td>
  </tr>
</table>
<form name = "form1" method = "post">
    <input type = "hidden" name = "p_process" value = "<%= v_process %>">
    <input type = "hidden" name = "p_pageno"  value = "<%=v_pageno %>"> 
    <input type = "hidden" name = "s_grcode"  value = "<%=box.getSession("tem_grcode") %>"> 
    <input type = "hidden" name = "p_gubun"  value = "<%=v_gubun %>"> 
    <input type = "hidden" name = "p_select_seq"  value = "<%=v_select_seq %>"> 
    <input type = "hidden" name = "p_seq"     value = "">
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="55" align="center"><img src="/images/user/game/service/text_mem_img.gif"></td>
  </tr>
</table>
<!----------------- Search ���� ----------------->
<table width="720" border="0" cellpadding="2" cellspacing="0">
  <tr> 
	<td width="670" align="right"> 
	  <select name="p_search" >
		<option value='title'     <% if (v_search.equals("title")) out.println("selected"); %>>�����</option>
		<option value='contents' <% if (v_search.equals("contents")) out.println("selected"); %>>����</option>
	  </select>
	  <input name="p_searchtext" type="text" class="input" value="<%=v_searchtext%>">
	</td>
	<td align="left" style="padding-top:5px;"> 
		<a href='javascript:search()'><img src="/images/user/game/button/btn_j.gif" border="0"></a> 
	</td>
  </tr>
  <tr> 
	<td height="3" colspan="2"></td>
  </tr>  
  <tr> 
    <td colspan="2"><img src="/images/user/game/service/month_topline.jpg"></td>
  </tr>
</table>
<!----------------- Search �� ----------------->
<!-- ���� ���� -->
<%

	for( i = 0; i < list1.size(); i++) 
	{
		
		DataBox dbox = (DataBox)list1.get(i);
		v_seq   = dbox.getInt("d_seq");
		v_cnt	= dbox.getInt("d_cnt");
		v_title = dbox.getString("d_title");
		v_ldate = dbox.getString("d_ldate");
		v_name  = dbox.getString("d_lname");
		v_useyn = dbox.getString("d_useyn");
		v_month = dbox.getString("d_lmonth");
		v_singleword = dbox.getString("d_singleword");

		
		v_savefile = dbox.getString("d_savefile");
		v_realfile = dbox.getString("d_realfile");
		v_dispnum   = dbox.getInt("d_dispnum");				
		v_totalpage = dbox.getInt("d_totalpage");

		v_ldate   = FormatDate.getFormatDate(v_ldate,"yyyy/MM/dd");
                              
%>          
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
	<table width="720" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="15" colspan="4" align="center"></td>
        </tr>
        <tr> 
          <td width="175" align="center">
		  <table width="100" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="/images/user/game/service/month<%=v_month%>.gif"></td>
              </tr>
              <tr> 
                <td align="right">
				<table width="100" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td align="right">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td align="right"><%=v_title%> ��</td>
                    </tr>
                    <tr> 
                      <td height="5" background="/images/user/game/service/month_nameline.gif"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td width="86" valign="top">
			  <table width="78" border="1" cellpadding="0" cellspacing="1" bordercolor="#CCCCCC" bgcolor="#FFFFFF">
			    <tr> 
				  <td>
					<%if(v_savefile.equals("")){%>
						<img src="/images/user/game/service/photo_blank.gif" width="78" height="60"></td>
					<%}else{%>
						<img src="<%=conf.getProperty("url.upload")+"bulletin/"%><%=v_savefile%>" width="78" height="60"></td>
					<%}%>
			    </tr>
			  </table>
		  </td>
          <td width="10"><img src="/images/user/game/service/month_vline.gif"></td>
          <td width="449" valign="top"><a href="javascript:view('<%=v_seq%>')"><%=v_singleword%></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="8"></td>
  </tr>
  <tr>
    <td height="1" background="/images/user/game/service/dotline.gif"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<%	       
}
%>
<%
	if(i == 0 )
	{
	%>
		<table width="720" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="table_02_1" height="100" align="center"> ��ϵ� �����Ͱ� �����ϴ�. </td>
			</tr>
		</table>
<%
	}
%>
<!-- ���� �� -->
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="164" height="2" class="linecolor_service"></td>
	<td width="556" height="2" class="linecolor_ser2"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="2" class="lcolor"></td>
  </tr>
  <tr> 
    <td height="1" class="linecolor_board"></td>
  </tr>
  <tr> 
    <td height="5"></td>
  </tr>
  <tr> 
    <td align="center" valign="bottom"> 
<!----------------- ������ ���� ----------------->
	  <table width="540" border="0" cellspacing="0" cellpadding="0">
		  <tr> 
			<td>
			<%= PageUtil.printPageListGame(v_totalpage, v_pageno, 10) %>
			</td>
		  </tr>
		</table>
<!----------------- ������ �� ----------------->
	  </td>
  </tr>
  <tr> 
    <td height="5" ></td>
  </tr>
  <tr> 
    <td height="2"class="linecolor_board"></td>
  </tr>
</table>
</div>
</form>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
