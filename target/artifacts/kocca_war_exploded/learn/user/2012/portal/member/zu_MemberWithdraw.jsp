<%
//**********************************************************
//  1. ��      ��: ȸ��Ż��
//  2. ���α׷��� :zu_MemberWithdraw.jsp
//  3. ��      ��: ȸ��Ż��
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
   
	String v_userid   = box.getSession("userid");
	box.put("submenu","5");
%>


<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<!-- ��ũ��Ʈ���� -->
<script language="JavaScript" type="text/JavaScript">
<!--//

//Ż���û
function doWithdraw(){
    var fm=document.form1;

    if( (fm.p_userid.value) == ""){
        alert("���̵� �����ϴ�");        
    }
    if( (fm.p_pwd.value) == ""){
        alert("��й�ȣ�� �Է��ϼ���");
        fm.p_pwd.focus();return;
    }

    //document.form1.target="_self";
    document.form1.p_process.value="MemberWithdrawOk";
    document.form1.action="/servlet/controller.homepage.MainMemberJoinServlet";
    document.form1.submit()
}
//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- form ���� -->
<form name="form1"  action="" method="post" action="">
	<input type="hidden"	name="p_process"	value="" >
    <input type="hidden"	name="p_userid"	value="<%=v_userid %>" >
	<div class="content">
		<table class="rootinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"><img src="/images/2012/sub/page0/title/member_out.gif" alt="ȸ��Ż��"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > <u>ȸ��Ż��</u></td>
			</tr>
		</table>
		<div class="memberout">
			<ul class="memberoutlayout">
				<li class="leftspace">
					<img src="/images/2012/sub/page0/memberout_image.gif" alt="�̹���"><br><br><br>
					<p><img src="/images/2012/sub/icon_dot.png" class="dot" align="absmiddle" alt="dot">ȸ��Ż�� ��û�Ͻø� �ش� ���̵�� ����� �����ǹǷ� <u>�ش� ���̵�δ� �簡����</u><br>&nbsp;<u>�Ұ���</u>�մϴ�.</p>
					<p><img src="/images/2012/sub/icon_dot.png" class="dot" align="absmiddle" alt="dot">ȸ��Ż���� ȸ�������� �����Ǹ�, ���� ������ ID�� �ű԰��� ID���� ID �ߺ�������<br>&nbsp;�Խñ� ������ ���Ͽ� ����� ID�� �����ϴ�.</p>
					<p><img src="/images/2012/sub/icon_dot.png" class="dot" align="absmiddle" alt="dot">ȸ�� Ż�� �� �簡�� �����ϸ�, ���������� <u>ȸ��Ż��� ���ÿ� ���� �� �ı�</u>�˴ϴ�.</p>
					<p><���� : �ѱ���������ī���� ��� TEL. 02-2161-0077></p>
				</li>
				<li class="rightspace">
					<div class="becouse" cellspacing="0" cellpadding="0" summary="ȸ��Ż�� �ϱ� ���� ���� �׸��� �ۼ����ּ���">
						<table class="insert" cellspacing="0" cellpadding="0">
							<colgroup><col width="80"><col width="*"></colgroup>
							<tr>
								<th>���̵�</th>
								<td><%=v_userid %></td>
							</tr>
							<tr>
								<th>��й�ȣ</th>
								<td><input type="password" tabindex="171" name="p_pwd" class="password" title="��й�ȣ�� �Է����ּ���."></td>
							</tr>
							<tr>
								<th>Ż�����</th>
								<td><textarea class="reason" tabindex="172" name="p_leave_reason" title="Ż���Ͻô� ������ �����ּ���."></textarea></td>
							</tr>
						</table>
						<div class="insertfooter"><a href="javascript:doWithdraw();" tabindex="173" title="���� �Է��Ͻ� ������ ȸ��Ż�� ��û�մϴ�"><img src="/images/2012/sub/page0/btn_memberout.gif" alt="ȸ��Ż�� ��û�մϴ�."></a></div>
					</div>
				</li>
			</ul>
			<div class="clearL"></div>
		</div>
	</div>
</form>	
<!-- footer -->
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
<!--// footer -->