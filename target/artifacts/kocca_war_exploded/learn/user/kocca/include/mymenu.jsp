<%
//**********************************************************
//  1. ��      ��: ���ǰ��ǽ� ����
//  3. ��      ��: �����ȳ�
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: 06.01.10 �̳��� 
//  7. ��      ��:
//***********************************************************
%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.common.*" %>
<%

    String  my_userid    = box.getSession("userid");
    String  my_name      = box.getSession("name");

    String  my_subj          = box.getString("subj");
    String  my_subjnm        = "";
    String  my_year          = box.getString("year");
    String  my_subjseq       = box.getString("subjseq");

    String my_eduurl  = "";

	String s_grcode = box.getSession("tem_grcode");
	String s_grtype = GetCodenm.get_grtype(box,s_grcode);

%>

<Script language="javascript">

function studyOpenMenu() {
<%      if (box.getSession("gadmin").equals("ZZ")) {  %>	
	var url = document.myform1.p_course.value;
    open_window('openApp',url,0,0,1024,768,false,false,'yes','yes','yes');
<%      } else {                                      %>
            alert ("�н��� ������ �ƴմϴ�.");
<%      }                                             %>
}

//-->
</Script>

<form name="myform1" method="post" action="">
	<input type="hidden" name="p_process" value="">
                  
                  <table width="195" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="10"></td>
                    </tr>
                    <tr> 
                      <td align="center"> 
                        <select name="p_course" style="width:150;" onchange="javascript:studyOpenMenu();" >
                            <option >:: ���ǽ� �ٷΰ��� :: </option>
                            <%=(new MyClassBean().selectMyCourseMenu(box))%>
                        </select>                     
                      </td>
                    </tr>
                  </table>
                  <!-- Ŀ�´�Ƽ�ٷΰ��� -->
                  <table width="195" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="10"></td>
                    </tr>
                    <tr> 
                      <td align="center"> 
                        <select name="p_static_cmuno" onchange="javascript:uf_moveMyCommunity();"  style="width:150">
                            <option >:: Ŀ�´�Ƽ �ٷΰ��� :: </option>
                            <%=(new CommunityIndexBean()).selectMyCuminity(my_userid, box.getString("p_static_cmuno"), s_grtype)%>
                        </select> 
                      </td>
                    </tr>
                  </table>
</form>

<SCRIPT LANGUAGE="JavaScript">
<!--

//����Ŀ�´�Ƽ Ȩ���� �̵�
function uf_moveMyCommunity() {

   var url = "/servlet/controller.community.CommunityIndexServlet?p_process=selectmyindex&p_cmuno="+document.myform1.p_static_cmuno.value+"&p_static_cmuno="+document.myform1.p_static_cmuno.value;

   var v_win = window.open(url, "selfTest1","toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 920, height = 640, top=0, left=0");

   //document.myform1.p_process.value = "selectmyindex";
   document.myform1.submit();

}


//-->
</SCRIPT>   

