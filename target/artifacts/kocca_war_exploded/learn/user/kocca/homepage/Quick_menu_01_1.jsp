
<%
//**********************************************************
//  1. ��      ��: Ȩ������ �����ε��
//  2. ���α׷��� : Quick_menu_01.jsp
//  3. ��      ��: Ȩ������ �����ε��
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.22
//  7. ��      ��:
//***********************************************************
%>


<td height="21"><img src="/images/user/kocca/homepage/type1/quick_menu_01-1.gif" width="166" height="20" border="0" usemap="#Map2"><map name="Map2"><area shape="rect" coords="21,2,80,20" href="javascript:viewLoad2('road1')"><area shape="rect" coords="93,2,154,20" href="javascript:viewLoad2('road2')"></map><br></td>




<SCRIPT LANGUAGE="JavaScript">
<!--

     function viewLoad2(gubun) {

		if(gubun == "road1" ){
	        document.pform1.p_process.value = "select";
	 }else{
	        document.pform1.p_process.value = "select2";
	 }
        window.self.name = "winSelectView";
        farwindow = window.open("", "openWin", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=no, width = 762, height = 750, top=0, left=0");
        document.pform1.target = "openWin"
        document.pform1.action = "/servlet/controller.course.SubjLoadMapServlet";
        document.pform1.submit();

        farwindow.window.focus();
        document.pform1.target = window.self.name;
     }

//-->
</SCRIPT>