<%
//**********************************************************
//  1. ��      ��: �����׷������ȸ
//  2. ���α׷���: za_Subject_L.jsp
//  3. ��      ��: �����׷������ȸȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 10. 29
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %> 
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    //DEFINED in relation to select START
    String  v_grcode			= box.getString("p_grcode");				//�����׷��ڵ�
    String  ss_upperclass = box.getString("s_upperclass");      //������з�
    String  ss_middleclass= box.getString("s_middleclass");    //�����ߺз�
    String  ss_lowerclass = box.getString("s_lowerclass");      //�����Һз�
    String  ss_action    	= box.getString("s_action");
    String  v_introducefilenamereal = "";
    String  v_introducefilenamenew  = "";
    String  v_introducefile_view = "";
    String  v_grcodes     = "";
    //DEFINED in relation to select END
    ArrayList list      	= null;
    if(ss_action.equals("go")){    //go button ���ýø� list ���
        list = (ArrayList)request.getAttribute("SubjectList2");
    } 

		EduGroupData data = null;

    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���

%>
<html>
<head>
<title>�����׷����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script> 
<SCRIPT LANGUAGE="JavaScript">
<!--
// ����Ʈ ������ �˻�
function whenSelection(ss_action) {
        document.form1.s_action.value = ss_action;
        document.form1.p_process.value = 'recomSubj';
        document.form1.submit();

}

//����
function whenOrder(column) {
    if (document.form1.p_orderType.value == " asc") {
        document.form1.p_orderType.value = " desc";
    } else {
        document.form1.p_orderType.value = " asc";
    }

    document.form1.s_action.value = "go";
    document.form1.p_process.value = 'recomSubj';   
    document.form1.p_orderColumn.value = column;

    document.form1.submit();
}

function insertGrSubj(){
	if(document.form1.all['p_checks'] == '[object]') {
  var v_chkcnt = 0;

  	if (document.form1.p_checks.checked) {
    	v_chkcnt=1;
  	}

  	if (document.form1.p_checks.length > 0) {
    	for (i=0; i<document.form1.p_checks.length; i++) {
      	if (document.form1.p_checks[i].checked == true)
      	v_chkcnt+=1;
    	}
  	}  
  	if (v_chkcnt==0) {
    	alert('������ ������ �����ϴ�.');
    	return;           
  	}

  } else {
    alert('������ ������ �����ϴ�.');
    return;
  }

  document.form1.action = "/servlet/controller.course.EduGroupServlet";
  document.form1.p_process.value = "recomSubjCourseSave";
  document.form1.submit();
}  
  function whenAllSelect() {
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            document.form1.p_checks[i].checked = true;
          }
        } else {
          document.form1.p_checks.checked = true;
        }
      }
    }

    function whenAllSelectCancel() {
      if(document.form1.all['p_checks'] == '[object]') {
        if (document.form1.p_checks.length > 0) {
          for (i=0; i<document.form1.p_checks.length; i++) {
            document.form1.p_checks[i].checked = false;
          }
        } else {
          document.form1.p_checks.checked = false;
        }
      }
    }
-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="700" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/system/unite_title08.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <!----------------- form ���� ----------------->
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <form name="form1" method="post" action="/servlet/controller.course.EduGroupServlet">
        	<input type="hidden" name="p_grcode"  value="<%=v_grcode%>">
          <input type="hidden" name="p_process"  value="">
          <input type="hidden" name="p_subj"     value="">
          <input type="hidden" name="p_subjnm"   value="">
          <input type="hidden" name="s_action"  value="">
          <input type="hidden" name="p_orderColumn">
          <input type="hidden" name="p_orderType" value="<%=v_orderType%>">

          
        <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg">
              <tr>
                <td height="7" width="99%"></td>
              </tr>
              <tr>
                <td align="center" width="99%" valign="middle">
                  <table width="99%" cellspacing="0" cellpadding="0" class="form_table">
                    <tr>
                      <td>
                        <!------------------- ���ǰ˻� ���� ------------------------->
                         <table cellspacing="0" cellpadding="0" width="99%">
                            <tr>
                                <td>
                                    <table border="0" cellspacing="0" cellpadding="0" width="99%">
                                        <tr>
                                            <td width="65%">
                                                <%= SelectSubjBean.getUpperClass(box, true, true, true)%><!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  -->
                                                <%= SelectSubjBean.getMiddleClass(box, true, true, true)%><!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  -->
                                                <%= SelectSubjBean.getLowerClass(box, true, true, true)%><!-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    �����Һз�  -->
                                            </td>
                                            <td  width="10%" align="right"><%@ include file="/learn/admin/include/za_GoButton.jsp" %><!-- whenSelection('go') --></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <!-------------------- ���ǰ˻� �� ---------------------------->
                       </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="7" width="99%"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <br>
      <table cellspacing="1" cellpadding="5"  width="100%">
        <tr>
        	<td align="right"><a href="javascript:insertGrSubj();"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
        </tr>
			</table>
      <!----------------- ���� ���� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out" width="100%">
        <tr>
          <td colspan="8" class="table_top_line"></td>
        </tr>
        <tr>
          <td class="table_title" width="5%"><b>NO</b></td>
          <td class="table_title" width="15%"><a href="javascript:whenOrder('classname')" class="e">�����з�</a></td>
          <td class="table_title" width="10%"><a href="javascript:whenOrder('codenm')" class="e">��������</a></td>
          <td class="table_title" width="10%"><a href="javascript:whenOrder('isuse')" class="e">��뿩��</a></td>
          <td class="table_title" width="10%"><a href="javascript:whenOrder('introducefilenamereal')" class="e">�����Ұ��̹���</a></td>
          <td class="table_title" width="10%"><a href="javascript:whenOrder('subj')" class="e">�����ڵ�</a></td>
          <td class="table_title" width="45%"><a href="javascript:whenOrder('subjnm')" class="e">������</a></td>
          <td class="table_title" width="5%"><%@ include file="/learn/admin/include/za_checkboxall.jsp" %></td>
        </tr>
<%  if(ss_action.equals("go")){    //go button ���ýø� list ���
    for (int i=0; i<list.size(); i++) {
         //data  = (EduGroupData)list.get(i);
         DataBox dbox = (DataBox)list.get(i);
         v_grcodes = dbox.getString("d_grcode");
         v_introducefilenamereal = dbox.getString("d_introducefilenamereal");
         v_introducefilenamenew  = dbox.getString("d_introducefilenamenew");
         
         if (!v_introducefilenamereal.equals("")) {
            v_introducefile_view   = "<a href = '/servlet/controller.library.DownloadServlet?p_savefile=" + v_introducefilenamenew + "&p_realfile=" + v_introducefilenamereal +"'><img src='/images/admin/course/ico_img.gif' border='0'></a>";
        } else {
             v_introducefile_view   = "";
        }
%>
        <tr>
          <td class="table_01"><%=String.valueOf(i+1)%></td>
          <td class="table_02_1"><%=dbox.getString("d_classname")%></td>
          <td class="table_02_1"><%=dbox.getString("d_codenm")%></td>
          <td class="table_02_1"><%=dbox.getString("d_isuse")%></td>
          <td class="table_02_1"><%=v_introducefile_view%></td>
          <td class="table_02_1"><%=dbox.getString("d_subj")%></td>
          <td class="table_02_2"><%=dbox.getString("d_subjnm")%></td>
          <td class="table_02_2"><input name="p_checks" type="checkbox" value="<%=dbox.getString("d_subj")%>" <%=v_grcodes.equals("")?"":"checked"%>></td>
        </tr> 
<%  } %>

      <% if (list.size()==0) {
           if (!StringManager.substring(box.getSession("gadmin"),0,1).equals("H")) { %>
           <tr><td colspan=12 class="table_02_1">��ϵ� ������ �����ϴ�.</td></tr>
        <%} else { %>
            <tr><td colspan=9 class="table_02_1">��ϵ� ������ �����ϴ�.</td></tr>  
        <% }
         } %>
<%} %>
      </table>
      <!----------------- ���� ���� �� ----------------->
      <br>
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>
</form>
</body>
</html>
