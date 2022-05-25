<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
    List<DataBox> subjList = (List<DataBox>)request.getAttribute("SubjectList");

	String  v_process  = box.getString("p_process");

	String s_userid   = box.getSession("userid");
	String s_username = box.getSession("name");
    String v_grcode = box.getSession("tem_grcode");
	HashMap<String, String> upperMap = null;    // ��з� �� �޴�ID ���� �� HashMap<upperlcass, menuid>

	upperMap   = ClassifySubjectBean.getMenuId(box);
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>

<script language="javascript">

	function selectArea( val ) {
		document.form1.tabid.value = val;
		document.form1.p_process.value = "subjectallinformation";
		document.form1.action = "/servlet/controller.course.EduScheduleHomePageServlet";
		document.form1.submit();
	}

</script>

<form name="form1" method="post" id="toptop">
    <input type = "hidden" name = "p_process">
    <input type = "hidden" name = "gubun" value = "8">
    <input type = "hidden" name = "menuid" value="01">
    <input type = "hidden" name = "tabid" value="<%= box.get("tabid") %>">

    <ul class="tabwrap">
		<li><a href="javascript:selectArea('3');" class="tab_online<%= box.get("tabid").equals("3") || box.get("tabid").equals("") ? " tab_online_on" : "" %>"><span>��ȭ������</span></a></li>
		<li><a href="javascript:selectArea('1');" class="tab_online<%= box.get("tabid").equals("1") ? " tab_online_on" : "" %>"><span>����������</span></a></li>
		<li><a href="javascript:selectArea('2');" class="tab_online<%= box.get("tabid").equals("2") ? " tab_online_on" : "" %>"><span>���������</span></a></li>
        <% if(v_grcode.equals("N000031")) {%>
        <li><a href="javascript:selectArea('4');" class="tab_online<%= box.get("tabid").equals("4") ? " tab_online_on" : "" %>"><span>����</span></a></li>
        <%}%>
	</ul>

	<table class="row_list">
        <tbody>
          <tr></tr>
        </tbody>
        <colgroup>
        <col width="100%" />
        </colgroup>
      </table>

<table width="690"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20px">&nbsp;</td>
  </tr>
  <tr>
    <td>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                    <strong>&lt;����� ��ȹ �� Ŀ��ŧ��&gt;</strong>
                </td>
            </tr>
        </table>
    </td>
  </tr>
  <tr>
    <td>
        <table class="row_list">
      <thead>
        <tr>
          <th width="50px">No </th>
          <th width="70px">��з�</th>
          <th width="80px">�ߺз�</th>
          <th width="100px">�Һз�</th>
          <th>������</th>
          <th width="50px">������</th>
          <!--<th width="70px">������</th>
        --></tr>
      </thead>
      <tbody>

<%	int	 count=1;
    if (subjList.size()>0) {
    for(DataBox dbox : subjList) {
		String biyong = "";


		if( dbox.getInt("d_biyong") == 0 ) {
			biyong = "����";
		} else {
			biyong = dbox.getCommaInt("d_biyong") + "��";
		}

%>
<tr>
          <td class="ta_l lp_1" style="line-height:23px"><%=count++%></td>
          <td class="ta_l"><%=dbox.get("d_uclassnm")%></td>
          <td class="ta_l"><%=dbox.get("d_mclassnm")%></td>
          <td class="ta_l"><%=dbox.get("d_lclassnm")%></td>
          <td class="ta_l"><%=dbox.get("d_subjnm")%></td>
          <td class="ta_l"><%=dbox.get("d_chisi")%></td>
          <!--<td class="ta_l" style="border-right:0"><%=biyong%></td>
        --></tr>
<%}}else {%>
      <tr>
          <td colspan="6" class="ta_l" style="line-height:23px;text-align:center;">��ϵ� ������ �����ϴ�.</td>
      </tr>
<%}%>

      </tbody>
    </table></td>
  </tr>
</table>
</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->