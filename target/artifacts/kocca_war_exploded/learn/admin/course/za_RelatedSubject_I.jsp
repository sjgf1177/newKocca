<%
/**
 * file name : za_RelatedSubject_I.jsp
 * date      : 2003/07/21
 * programmer:
 * function  : �������� ��� ȭ��
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.course.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  ss_grcode    = box.getString("s_grcode");           //�����׷�
    String  ss_upperclass = box.getString("s_upperclass");      //������з�
    String  ss_middleclass = box.getString("s_middleclass");    //�����ߺз�
    String  ss_lowerclass = box.getString("s_lowerclass");      //�����Һз�
    
    String  ss_subj      = box.getStringDefault("s_subj","ALL");
    String v_grcode   = box.getString("p_grcode");
    String v_subj     = box.getString("p_subj");
    String v_subjnm   = box.getString("p_subjnm");
    String v_subjgubun= box.getString("p_subjgubun");

    String v_gubun  = box.getStringDefault("p_gubun","ALL");
//    String v_upperclass = box.getStringDefault("p_upperclass",ss_upperclass);

    ArrayList list1 = (ArrayList)request.getAttribute("TargetRelatedSubjList");
    ArrayList list2 = (ArrayList)request.getAttribute("SelectedRelatedSubjList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
function SelectSubject() {
	getSelectedSubjCodes();
	getSelectedSubjTexts();
	document.form2.p_process.value = 'relatedSubjInsertPage';
	document.form2.submit();
}

function whenSelection(ss_action) {
	if (ss_action=="go")	{
	       top.ftop.setPam();
	}

		document.form2.s_action.value = ss_action;
    	document.form2.p_process.value = 'relatedSubjInsertPage';
	    document.form2.submit();

}

function ChooseSubject() {
  var boxLength    = document.form2.p_selsubjs.length;
  var selectedItem = document.form2.p_subjects.selectedIndex;
  var selectedText = document.form2.p_subjects.options[selectedItem].text;
  var selectedValue= document.form2.p_subjects.options[selectedItem].value;
  var i;
  var isNew = true;
  if (boxLength != 0) {
    for (i = 0; i < boxLength; i++) {
      thisitem = document.form2.p_selsubjs.options[i].text;
      if (thisitem == selectedText) {
        isNew = false;
        break;
      }
    }
  }
  if (isNew) {
    newoption = new Option(selectedText, selectedValue, false, false);
    document.form2.p_selsubjs.options[boxLength] = newoption;
  }
  document.form2.p_subjects.selectedIndex=-1;
}

function CancelChooseSubject() {
  var boxLength = document.form2.p_selsubjs.length;
  arrSelected = new Array();
  var count = 0;
  for (i = 0; i < boxLength; i++) {
    if (document.form2.p_selsubjs.options[i].selected) {
      arrSelected[count] = document.form2.p_selsubjs.options[i].value;
    }
    count++;
  }
  var x;
  for (i = 0; i < boxLength; i++) {
    for (x = 0; x < arrSelected.length; x++) {
      if (document.form2.p_selsubjs.options[i].value == arrSelected[x]) {
        document.form2.p_selsubjs.options[i] = null;
      }
    }
    boxLength = document.form2.p_selsubjs.length;
  }
}

function InsertRelatedSubj() {
	/*
  if (!getSelectedSubjCodes()) {
    alert("�����ڵ� ���þ���");
    return;
  }
  if (!getSelectedSubjTexts()) {
    alert("�����ڵ� ���þ���");
    return;
  }
  */
  
  getSelectedSubjCodes();
  getSelectedSubjTexts();
  document.form2.p_process.value = 'relatedSubjInsert';
  document.form2.submit();
}

function getSelectedSubjCodes() {
  var strValues = "";
  var boxLength = document.form2.p_selsubjs.length;
  var count = 0;
  if (boxLength != 0) {
    for (i = 0; i < boxLength; i++) {
      if (count == 0) {
        strValues = document.form2.p_selsubjs.options[i].value;
      }
      else {
        strValues = strValues + ";" + document.form2.p_selsubjs.options[i].value;
      }
      count++;
    }
  }
  document.form2.p_selectedsubjcodes.value = strValues;
  return (strValues.length == 0) ? false : true;
}

function getSelectedSubjTexts() {
  var strValues = "";
  var boxLength = document.form2.p_selsubjs.length;
  var count = 0;
  if (boxLength != 0) {
    for (i = 0; i < boxLength; i++) {
      if (count == 0) {
        strValues = document.form2.p_selsubjs.options[i].text;
      }
      else {
        strValues = strValues + ";" + document.form2.p_selsubjs.options[i].text;
      }
      count++;
    }
  }
  document.form2.p_selectedsubjtexts.value = strValues;
  return (strValues.length == 0) ? false : true;
}

function goRelatedSubjListPage() {
  document.form2.p_process.value  = 'relatedSubjPage';
  document.form2.submit();
}
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form2" method="post" action="/servlet/controller.course.SubjectServlet">
    <input type="hidden" name="p_process"  	value="">
    <input type="hidden" name="s_grcode"           value="<%=ss_grcode%>">
    
    <input type="hidden" name="s_subj"        value="<%=ss_subj%>">
    <input type="hidden" name="p_grcode"    value="<%=v_grcode%>">
    <input type="hidden" name="p_subj"          value="<%=v_subj%>">
    <input type="hidden" name="p_subjnm"    value="<%=v_subjnm%>">
    <input type="hidden" name="p_subjgubun" value="<%=v_subjgubun%>">
    <input type="hidden" name="p_selectedsubjcodes"  value="">
    <input type="hidden" name="p_selectedsubjtexts"  value="">
    
    <input type="hidden" name="s_action"  value="go">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/c_title01.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	  <!----------------- title �� ----------------->
      <br>
      <!----------------- �������� ���� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr> 
          <td colspan="2" class="table_top_line"></td>
        </tr>
        <tr> 
          <td width="16%" class="table_title"><b>�����ڵ�</b></td>
          <td width="81%" class="table_02_2"><%=v_subj%></td>
        </tr>
        <tr> 
          <td class="table_title"><b>������</b></td>
          <td class="table_02_2"><%=v_subjnm%></td>
        </tr>
        <tr> 
          <td class="table_title"><b>����</b></td>
          <td class="table_02_2">
            ��������
			<%=CodeConfigBean.getCodeGubunSelect ("0004", "", 1, "p_gubun", v_gubun, "onChange='SelectSubject()'", 2)%>
<!------------- �����з� ���� ------------------------------------>              

			<!--input type= "hidden" name="s_grseq" value="0001"-->
			<%= SelectSubjBean.getUpperClass(box, true, true, true)%><!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  -->
			<%= SelectSubjBean.getMiddleClass(box, true, true, true)%><!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  -->
			<%= SelectSubjBean.getLowerClass(box, true, true, true)%><!-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    �����Һз�  -->
          </td>
        </tr>
        <tr>
          <td class="table_title"><b>���� ����</b></td>
          <td class="table_02_2"><select name="p_subjects" size=8 style="width:650;" onchange="ChooseSubject();">
<%  SubjectInfoData data  = null;
    for (int i=0; i<list1.size(); i++) {
        data  = (SubjectInfoData)list1.get(i); %>
            <option value="<%=data.getSubj()%>"><%=data.getDisplayname()%>
<%  }  %>
          </select></td>
        </tr>
        <tr>
          <td class="table_title"><b>���õ� ����</b></td>
          <td class="table_02_2">
            <table width="75%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><select multiple name="p_selsubjs" size=8  style="width:650;">
<%  for (int i=0; i<list2.size(); i++) {
        data  = (SubjectInfoData)list2.get(i); %>
                <option value="<%=data.getSubj()%>"><%=data.getDisplayname()%>
<%  }  %>
                </select>&nbsp;<a href="javascript:CancelChooseSubject()"><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
              </tr>
              <tr><td height="5"></td></tr>
              <tr>
                <td align="right"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <!----------------- �������� ���� �� ----------------->
      <br>
      <!----------------- ����, ����Ʈ ��ư ���� ----------------->
      <table border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td align="center"><a href="javascript:InsertRelatedSubj()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
		  <td width=8></td>
          <td align="center"><a href="javascript:goRelatedSubjListPage()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
        </tr>
      </table>
      <!----------------- ����, ����Ʈ ��ư �� ----------------->
      <br>
    </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
