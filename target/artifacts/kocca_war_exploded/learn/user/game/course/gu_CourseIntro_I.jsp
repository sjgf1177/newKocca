<%
//**********************************************************
//  1. ��      ��: �����ȳ�
//  2. ���α׷���: gu_CourseIntro_L.jsp
//  3. ��      ��: �����ȳ� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2005.12.14
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    box.put("leftmenu","01");                       // �޴� ���̵� ����

    String  v_process     = box.getString("p_process");
    String  v_iscourseYn  = box.getStringDefault("p_iscourseYn","N");
    String v_tabnum       = box.getStringDefault("p_tabnum","design");

    String  v_code       = "";
    String  v_codenm     = "";
    String  v_tab_bg     = "";
    String  v_tab_class  = "";

    String v_subj           = "";
    String v_subjnm         = "";
    String v_upperclass     = "";
    String v_middleclass    = "";
    String v_sclowerclass   = "";
    String v_isonoff        = "";
    String v_usebook        = "";
    String v_isnew          = "";
    String v_ishit          = "";
    String v_isrecom        = "";
    String v_uclassnm       = "";
    String v_mclassnm       = "";

    String v_imgbook        = "";
    String v_imgNew         = "";
    String v_imgHit         = "";
    String v_imgRecom       = "";
    double v_sul_avg = 0; // ���� ������ 

    double tmp_sul_avg = 0;
    String v_imgStart = "";

    ArrayList list1      = null;
    list1 = (ArrayList)request.getAttribute("SubjectList");         // ���� ����Ʈ

%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topCourse.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--
// �Ϲ�/������, ��з��ڵ� ����
function whenSelect(sel,gubun){
    document.form1.p_iscourseYn.value = sel;
    document.form1.p_tabnum.value   = gubun;
    document.form1.target = "_self";
    document.form1.action='/servlet/controller.course.CourseIntroServlet';
    document.form1.p_process.value = 'SubjectList';

    document.form1.submit();
}

// ���� ���뺸��
function whenSubjInfo(subj,tabnum){
    document.form1.p_subj.value     = subj;
    document.form1.p_tabnum.value   = tabnum;
    document.form1.p_process.value  = 'SubjectPreviewPage';
    document.form1.p_rprocess.value = 'SubjectList';
    document.form1.action='/servlet/controller.course.CourseIntroServlet';
    document.form1.target = "_self";
    document.form1.submit();
}
//-->
</SCRIPT>

<form name="form1" method="post" >
    <input type='hidden' name='p_process' value="<%=v_process%>">
    <input type='hidden' name='p_rprocess' value="">
    <input type='hidden' name='p_iscourseYn' value="<%=v_iscourseYn%>">
    <input type='hidden' name='p_tabnum'  value="<%=v_tabnum%>">
    <input type='hidden' name='p_subj' value="">




<!-- title -->
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="35" align="right"  background="/images/user/game/course/<%=tem_subimgpath%>/tit_eduintro.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> HOME > �����ȳ� > ���������Ұ� </td>
  </tr>
  <tr style="padding-top:30px"> 
    <td align="center"><img src="/images/user/game/course/intro_img.gif"></td>
  </tr>
  <tr>
  	<td align="center">
  		<table border="0" cellpadding="0" cellspacing="0" background="/images/user/game/course/intro_bg01.gif" width="665" height="122">
  			<tr>
  				<td align="right" valign="bottom" style="padding: 0 10 13 0">
  					<table border="0" cellpadding="0" cellspacing="0" width="490" height="65">
  						<tr>
  							<td valign="top">�н����踦 ���� ���ϴ� Ŀ��ŧ���� ã�ƺ� �� �ֽ��ϴ�.<br>�� �о߸��� �������� �н��� ���� �н��� ȿ������ ���� �� �ֽ��ϴ�.</td>
  						</tr>
  						<tr>
  							<td align="right" height="16"><a href="/servlet/controller.course.CourseIntroServlet?p_process=SubjectPage"><img src="/images/user/game/course/go.gif" border="0"></a></td>
  						</tr>
  					</table>
  				</td>
  			</tr>
  		</table>
  	</td>
  </tr>
  <tr style="padding: 10 0 0 0">
  	<td align="center">
  		<table border="0" cellpadding="0" cellspacing="0" background="/images/user/game/course/intro_bg02.gif" width="665" height="122">
  			<tr>
  				<td align="right" valign="bottom" style="padding: 0 10 13 0">
  					<table border="0" cellpadding="0" cellspacing="0" width="490" height="65">
  						<tr>
  							<td valign="top">���̹����Ӿ�ī������ ��ü ������ �ѹ��� �� �� �ֽ��ϴ�.<br>������ ��ü ����Ʈ�� ���� ���ϴ� ������ �����ϼ���.</td>
  						</tr>
  						<tr>
  							<td align="right" height="16"><a href="/servlet/controller.course.CourseIntroServlet?p_process=SubjectList"><img src="/images/user/game/course/go.gif" border="0"></a></td>
  						</tr>
  					</table>
  				</td>
  			</tr>
  		</table>
  	</td>
  </tr>
</table>

</form>
<map name="Map" id="Map20">
    <area shape="rect" coords="3,2,120,25"   href="#" onclick="whenSelect('N','design');" />
    <area shape="rect" coords="122,2,232,27" href="#" onclick="whenSelect('N','program');" />
    <area shape="rect" coords="234,2,340,28" href="#" onclick="whenSelect('N','graphic');" />
    <area shape="rect" coords="345,2,450,27" href="#" onclick="whenSelect('N','common');" />
</map>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
