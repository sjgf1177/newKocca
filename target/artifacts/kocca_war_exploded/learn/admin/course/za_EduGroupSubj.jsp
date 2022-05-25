<%
//**********************************************************
//  1. ��      ��: �����׷쿡 ����/�ڽ� ���� ȭ��
//  2. ���α׷���: za_EduGroupSubj.jsp
//  3. ��      ��: �����׷쿡 ����/�ڽ� ���� ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 11
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
    if (box == null) {
        box = RequestManager.getBox(request);
    }
    String  v_grcode    = box.getString("p_grcode");
    String v_gubun = box.getStringDefault("p_gubun","ALL");
    String  v_upperclass= box.getStringDefault("p_upperclass","ALL");


//    EduGroupData da = (EduGroupData)request.getAttribute("EduGroupData");

    ArrayList list1 = (ArrayList)request.getAttribute("TargetCourseList");
    ArrayList list2 = (ArrayList)request.getAttribute("TargetSubjectList");
    ArrayList list3 = (ArrayList)request.getAttribute("SelectedList");
        
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
    <link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language="JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function searchSubject() {
    getSelectedCodes();
    getSelectedTexts();
    document.form2.p_process.value = 'assignSubjCourse';
    document.form2.submit();
}

function ChooseCourse() {
    var boxLength    = document.form2.p_selsubjs.length;
    var selectedItem = document.form2.p_courses.selectedIndex;
    var selectedText = document.form2.p_courses.options[selectedItem].text;
    var selectedValue= document.form2.p_courses.options[selectedItem].value;
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

    document.form2.p_courses.selectedIndex=-1;
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

function whenSubmit() {
    if (!getSelectedCodes()) {
        alert("���õ� ������ �����ϴ�.");
        return;
    }
    if (!getSelectedTexts()) {
        alert("���õ� ������ �����ϴ�.");
        return;
    }
    document.form2.p_process.value = 'assignSubjCourseSave';
    document.form2.submit();
}

function getSelectedCodes() {
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
    document.form2.p_selectedcodes.value = strValues;
    return (strValues.length == 0) ? false : true;
}

function getSelectedTexts() {
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
    document.form2.p_selectedtexts.value = strValues;
    return (strValues.length == 0) ? false : true;
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form2" method = "post" action="/servlet/controller.course.EduGroupServlet">
    <input type="hidden" name="p_process"        value="">
    <input type="hidden" name="p_grcode"         value="<%=v_grcode%>">
    <input type="hidden" name="p_selectedcodes"  value="">
    <input type="hidden" name="p_selectedtexts"  value="">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
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
		        <!-------------������ ����-------------------------->
 <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>�������</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table> 
        <!--------------������ ��---------------------------->
        <!----------------- �����׷�  �������� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="4" class="table_top_line"></td>
          </tr>
          <tr> 
            <td class="table_title" width="16%" height="25"><b>�����׷�</b></td>
            <td class="table_02_2"  width="81%" colspan="3"> <b><%=GetCodenm.get_grcodenm(v_grcode)%></b></td>
          </tr>
          <!--tr> 
            <td height="25" class="table_title"><b>�ڽ� ����</b></td>
            <td class="table_02_2"> 
              <select name="p_courses" size=8 style="width:250;" onchange="ChooseCourse();">
<%  SubjectInfoData data  = null;
    for (int i=0; i<list1.size(); i++) {
        data  = (SubjectInfoData)list1.get(i); %>
                            <option value="<%=data.getSubj()%>"><%=data.getDisplayname()%>
<%  }  %>
                </select>
            </td>
          </tr-->
        <tr> 
            <td class="table_title" colspan="2" width="50%"><b>���� ����</b></td>
            <td class="table_title" colspan="2" width="50%"><b>���õ� ����</b></td>
        </tr>
        <tr> 
            <td class="table_02_2" colspan="2">
            ��������
			<%=CodeConfigBean.getCodeGubunSelect ("0004", "", 1, "p_gubun", v_gubun, "onChange='searchSubject()'", 2)%>
<!------------- �����з� ���� ------------------------------------>
<%
    SelectSubjBean selectSubj = new SelectSubjBean();
%>
                �����з�
                <select name = "p_upperclass" onChange = "javascript:searchSubject()">
                <%
                        ArrayList upperList = selectSubj.getUpperClass(box);
                        for(int k = 0; k < upperList.size(); k++) {
                            DataBox selectbox = (DataBox)upperList.get(k);  
                        %>             
                    <option value = "<%= selectbox.getString("d_upperclass")%>" <% if ((box.getString("p_upperclass").equals(selectbox.getString("d_upperclass")))) out.print("selected"); %>>
                        <%= selectbox.getString("d_classname")%></option>
                <%   }  %>
                </select>
<!------------- �����з� ��   ------------------------------------>

            </td>
            <td class="table_02_2" colspan="2">&nbsp;
			</td>
          <tr>
            <td class="table_02_2" colspan="2" >
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td align="left" bgcolor="#FFFFFF">
                    <select name="p_subjects" size=30 style="width:400;" onchange="ChooseSubject();">
<%  for (int i=0; i<list2.size(); i++) {
        data  = (SubjectInfoData)list2.get(i); %>
                      <option value="<%=data.getSubj()%>"><%=data.getDisplayname()%>
<%  }  %>
                   </select>
                </td>
              </tr>
            </table>
          </td>
          <td class="table_02_2" colspan="2"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td align="left" bgcolor="#FFFFFF">
                    <select multiple name="p_selsubjs" size=30  style="width:400;">
<%  for (int i=0; i<list3.size(); i++) {
        data  = (SubjectInfoData)list3.get(i); %>
                        <option value="<%=data.getSubj()%>"><%=data.getDisplayname()%>
<%  }  %>
                    </select>
                  &nbsp;<a href="javascript:CancelChooseSubject()"><img src="/images/admin/button/btn_del.gif" border="0"><a>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
        <!----------------- �����׷�  �������� �� ----------------->

        <br>
        <!----------------- ����, ��� ��ư ���� ----------------->
        <table border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"><a href="javascript:whenSubmit()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
			<td width=8></td>
            <td align="center"><a href="javascript:window.close()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
          </tr>
        </table>
        <!----------------- ����, ��� ��ư �� ----------------->
        <br>
      </td>
  </tr>

  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>     

</table>

</form>
</body>
</html>
