<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>


<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box       = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String  v_process     = box.getString("p_process");
    String  v_tem_grcode   = box.getSession("tem_grcode");
    
    String v_content    = "";
    String v_code       = "";
    String v_title      = "";
    
    DataBox dbox = (DataBox)request.getAttribute("selectView");
    if (dbox != null) {
    	v_content    = dbox.getString("d_content");
        v_code       = dbox.getString("d_code");
        v_title      = dbox.getString("d_title");
     }
    
    
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
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

</SCRIPT>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1" enctype = "multipart/form-data" method = "post">
		<input type = "hidden" name = "p_process"   value = "">
		<input type = "hidden" name = "p_tab"		value = "">
		<input type = "hidden" name = "p_code"      value = "">
		
		<%if( box.getSession("tem_grcode").equals("N000001")) { %>
		
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr><td>
		
		<table width="672" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" colspan="2" class="h_road">&nbsp;</td>
        </tr>
        <tr>
          <td><img src="/images/portal/homepage_renewal//member/stitle_11.gif" alt="����Ʈ��" /></td>
          <td class="h_road">Home &gt; �̿�ȳ� &gt; <strong>����Ʈ��</strong></td>
        </tr>
        <tr>
          <td height="12" colspan="2"></td>
        </tr>
        <tr>
          <td height="1" colspan="2" bgcolor="E5E5E5"></td>
        </tr>
      </table>
		
		<!--Ÿ��Ʋ�κ�//-->
      <table width="672" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="/images/portal/homepage_renewal/member/sitemap.jpg" border="0" usemap="#Map" /> </td>
        </tr>
        <tr>
          <td></td>
        </tr>
    </table>

<map name="Map" id="Map">

<!-- ���� ���ǽ� -->
  <area shape="rect" coords="23,51,104,72" href="javascript:menuMainForward('3','/servlet/controller.study.MyClassServlet?p_process=EducationSubjectPage');" alt="���� ���ǽ� Ȩ" />
  <area shape="rect" coords="23,75,104,96" href="javascript:menuForward('3','11');" alt="�������� ����" />
  <area shape="rect" coords="23,100,144,121" href="javascript:menuForward('3','02');" alt="���Ǳ����̷�" />
  <area shape="rect" coords="23,125,144,146" href="javascript:menuForward('3','18');" alt="��ٱ���" />
  <area shape="rect" coords="24,151,144,172" href="javascript:menuForward('3','17');" alt="������û Ȯ��/���" />
  <area shape="rect" coords="24,176,144,197" href="javascript:menuForward('3','19');" alt="������ ���� ��ȸ/����" />
  <area shape="rect" coords="25,201,144,222" href="javascript:menuForward('3','12');" alt="���� ��㳻��" />
  <area shape="rect" coords="24,226,144,247" href="javascript:menuForward('3','07');" alt="���� ����" />


<!-- �¶��� ���� -->
  <area shape="rect" coords="203,52,284,73" href="javascript:menuMainForward('1','/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList');" alt="�¶��� ��ü ��������" />
  <area shape="rect" coords="202,76,283,97" href="javascript:menuForward('1','14');" alt="��ȹ" />
  <area shape="rect" coords="202,101,283,122" href="javascript:menuForward('1','15');" alt="����" />
  <area shape="rect" coords="202,126,283,147" href="javascript:menuForward('1','16');" alt="����" />
  <area shape="rect" coords="202,151,283,172" href="javascript:menuForward('1','17');" alt="�濵����" />
  <area shape="rect" coords="203,177,284,198" href="javascript:menuForward('1','13');" alt="������û �ȳ�" />


<!-- �������� ���� -->
  <area shape="rect" coords="380,52,461,73" href="javascript:menuMainForward('2','/servlet/controller.off.ProposeOffServlet?p_process=SubjectList');" alt="�������� ��ü��������" />
  <area shape="rect" coords="380,76,461,97" href="javascript:menuForward('2','01');" alt="��ۿ���" />
  <area shape="rect" coords="380,101,461,122" href="javascript:menuForward('2','02');" alt="��������" />
  <area shape="rect" coords="380,126,461,147" href="javascript:menuForward('2','03');" alt="��ȹâ��" />
  <area shape="rect" coords="380,152,461,173" href="javascript:menuForward('2','04');" alt="�����ڷ��" />
  <area shape="rect" coords="381,177,462,198" href="javascript:menuForward('2','05');" alt="������������" />
  <area shape="rect" coords="381,201,462,222" href="javascript:menuForward('2','06');" alt="������������" />
  <area shape="rect" coords="381,227,462,248" href="javascript:menuForward('2','07');" alt="������û �ȳ�" />


<!-- �н������ȳ� -->
  <area shape="rect" coords="558,51,650,72" href="javascript:menuForward('4','07');" alt="��������" />
  <area shape="rect" coords="558,75,639,96" href="javascript:menuForward('4','01');" alt="FAQ" />
  <area shape="rect" coords="558,100,639,121" href="javascript:menuForward('4','02');" alt="Q/A" />
  <area shape="rect" coords="558,125,639,146" href="javascript:menuForward('4','03');" alt="S/W�ٿ�ε�" />
  <area shape="rect" coords="558,151,639,172" href="javascript:menuForward('4','05');" alt="�н�ȯ�� �����" />
  <area shape="rect" coords="559,176,640,197" href="javascript:menuForward('4','09');" alt="1:1����" />
  <area shape="rect" coords="558,200,646,222" href="javascript:menuForward('4','10');" alt="����ȳ�" />
  <area shape="rect" coords="558,226,639,247" href="javascript:menuForward('4','12');" alt="�̺�Ʈ ��" />


<!-- ���Ŭ���� -->
  <area shape="rect" coords="25,342,106,363" href="javascript:menuMainForward('5','/servlet/controller.infomation.GoldClassHomePageServlet?p_process=mainPage');" alt="��ü��������" />
  <area shape="rect" coords="25,368,106,389" href="javascript:menuForward('5','12');" alt="��ۿ���" />
  <area shape="rect" coords="27,393,108,414" href="javascript:menuForward('5','13');" alt="��ȭ" />
  <area shape="rect" coords="26,417,114,439" href="javascript:menuForward('5','14');" alt="��ť���͸�" />
  <area shape="rect" coords="26,442,107,463" href="javascript:menuForward('5','15');" alt="��ȭ����" />
  <area shape="rect" coords="26,466,107,485" href="javascript:menuForward('5','16');" alt="��Ÿ" />


<!-- ��ī���̼Ұ� -->
  <area shape="rect" coords="203,343,284,364" href="javascript:menuForward('7','01');" alt="���� �λ縻" />
  <area shape="rect" coords="203,369,284,390" href="javascript:menuForward('7','02');" alt="��������/����" />
  <area shape="rect" coords="205,394,286,415" href="javascript:menuForward('7','05');" alt="������� �ȳ�" />
  <area shape="rect" coords="204,418,286,440" href="javascript:menuForward('7','03');" alt="�����ü� �ȳ�" />
  <area shape="rect" coords="204,443,303,465" href="javascript:menuForward('7','06');" alt="�������±�� �ȳ�" />
  <area shape="rect" coords="204,468,286,490" href="javascript:menuForward('7','04');" alt="���ô� ��" />



<!-- �̿�ȳ� -->
  <area shape="rect" coords="379,342,460,363" href="javascript:menuForward('90','01');" alt="ȸ������" />
  <area shape="rect" coords="379,368,497,389" href="javascript:menuForward('90','02');" alt="���̵�/�н����� ã��" />
  <area shape="rect" coords="380,393,461,414" href="javascript:menuForward('90','03');" alt="ȸ������ ����" />
  <area shape="rect" coords="380,416,462,438" href="javascript:menuForward('90','07');" alt="��й�ȣ ����" />
  <area shape="rect" coords="380,442,462,464" href="javascript:menuForward('90','04');" alt="ȸ��Ż��" />
  <area shape="rect" coords="380,466,481,488" href="javascript:menuForward('90','05');" alt="�̿���" />
  <area shape="rect" coords="380,491,481,513" href="javascript:menuForward('90','06');" alt="�������� ó����ħ" />

</map>

</td></tr></table>
		
		<%}else{ %>

    <h2><img src="/images/portal/studying/h2_tit10.gif" alt="����Ʈ��" class="fl_l" /><p class="category">Home > �н��������� > <strong>����Ʈ��</strong></p></h2>

    <% if(mainMenuList != null || mainMenuList.size() > 0 ) {
           for(int top_i = 0 ; top_i <  mainMenuList.size() ; top_i++){
               DataBox mainBbox = (DataBox)mainMenuList.get(top_i);
           
               mMenuGrtype  = mainBbox.getString("d_grtype");
               mMenuGubun   = mainBbox.getString("d_gubun");
               mMenuId      = mainBbox.getString("d_menuid");
               mMenuName    = mainBbox.getString("d_menuname");
               mMenuUrl     = mainBbox.getString("d_menuurl");
               mMenuImg     = mainBbox.getString("d_menuimg");
               mMenuOverImg = mainBbox.getString("d_menuoverimg");
        %>
        <dl class="sitemap">
        <dt><img src="/images/portal/studying/sitemap_tit<%=mMenuGubun %>.gif" alt="<%=mMenuName %>" /></dt>
        <dd><a href="javascript:menuMainForward('<%=mMenuGubun%>','<%=mMenuUrl %>');"><%=mMenuName %> Ȩ</a></dd>
        <%      
                for(int top_j = 0 ; top_j < subMenuList.size(); top_j++) {
                    DataBox subBox = (DataBox)subMenuList.get(top_j);

                    sMenuGubun   = subBox.getString("d_gubun");
                    sMenuId      = subBox.getString("d_menuid");
                    sMenuName    = subBox.getString("d_menuname");
                    sMenuUrl     = subBox.getString("d_menuurl");
                    sMenuImg     = subBox.getString("d_menuimg");
                    sMenuOverImg = subBox.getString("d_menuoverimg");
                    sSubImg       = subBox.getString("d_subimg");
                    sSubOverImg   = subBox.getString("d_suboverimg");
                    sMenuImgPath  = StringUtil.replaceAll(subBox.getString("d_imgpath"), '\\', '/');
                    
                   if(sMenuGubun.equals(mMenuGubun)) {
        %>
                    <dd><a href="javascript:menuForward('<%=sMenuGubun %>', '<%=sMenuId %>');"><%=sMenuName %></a></dd>
        <%        
                   }
               }%>
        </dl>
        <%
                }
           }
        %>
        
        <%} %>

</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->