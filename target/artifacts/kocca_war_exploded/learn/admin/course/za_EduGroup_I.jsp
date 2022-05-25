<%
//**********************************************************
//  1. ��      ��: �����׷��� ȭ��
//  2. ���α׷���: za_EduGroup_I.jsp
//  3. ��      ��: �����׷��� ȭ��
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
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
    //String v_grcode = box.getString("p_grcode");
    
    String v_grcodenm       = box.getString("p_grcodenm");    
    String v_masterName     = box.getString("p_masterName");
    String v_master         = box.getString("p_master");
    String v_managerComptel = box.getString("p_managerComptel");
    String v_managerEmail   = box.getString("p_managerEmail");
    
%>                  
<html>              
<head>              
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

//����Ű ó��
function key_press(e) { 
    if (e.keyCode =='13'){
        searchMaster();
    }
}

// ���
function whenSubmit(){
    var compTxt ="";
    if(document.form1.p_grcodenm.value=="") {
        alert("�����׷���� �Է��ϼ���.");
        document.form1.p_grcodenm.focus();
        return;
    }
/*
    if(document.form1.p_comp.length==0){
        alert("���ȸ�縦 ����ϼ���.");
        return;
    }
*/
    for(var i=0;i<document.form1.p_comp.length;i++){
        compTxt=compTxt+document.form1.p_comp.options[i].value+";";
    }
    
    document.form1.p_compTxt.value=compTxt;

    document.form1.submit();
}

//����ڰ˻�
function searchMaster() {
  if (document.form1.p_masterName.value=="") {
    alert("����� �̸��� �Է��ϼ���.");
    document.form1.p_masterName.focus();
    return;
  }

  var p_gubun = 'name';
  var p_key1  = document.form1.p_masterName.value;
  var p_key2  = 'p_master';
  var url = "/servlet/controller.library.SearchServlet?p_process=member&p_gubun="+ p_gubun +"&p_key1="+ p_key1 +"&p_key2="+p_key2;
  open_window("",url,"0","0","100","100");
}


// ��� �˻� �� ó��
function receiveMember(userid, name, resno, email, registgubun, comptext, tmp1, tmp2, tmp3){
  if (tmp1 == 'p_master') {
    document.form1.p_masterName.value =  name;
    document.form1.p_master.value = userid;  
    document.form1.p_managerEmail.value = email;  
    document.form1.p_managerComptel.value = tmp3;
  } else if (tmp1 == 'p_manager') {
    document.form1.p_managerName.value =  name;
    document.form1.p_manager.value = userid;  
  }
}

// ȸ�� �˻�
function searchGrpComp() {
  var url = "/servlet/controller.library.SearchServlet?p_process=grpcomp&p_gubun=companynm&p_key1=&p_key2=";
  open_window("",url,"0","0","100","100");
}

// ȸ�� �˻� �� ó��
function receiveGrpComp(comp , compnm, comptype, groupnm, companynm, tmp1, tmp2, tmp3){
  var Length = document.form1.p_comp.length;
  
  for (i = 0; i < Length; i++) {
    if (document.form1.p_comp.options[i].value == comp) {
        return;
    }
  }

  var newoption = new Option(compnm, comp, false, false);
  document.form1.p_comp.options[Length] = newoption;
}

// ���ȸ�� ����
function deleteGrpComp() {
  var boxLength = document.form1.p_comp.length;
  arrSelected = new Array();
  var count = 0;
  for (i = 0; i < boxLength; i++) {
    if (document.form1.p_comp.options[i].selected) {
      arrSelected[count] = document.form1.p_comp.options[i].value;
    }
    count++;
  }
  var x;
  for (i = 0; i < boxLength; i++) {
    for (x = 0; x < arrSelected.length; x++) {
      if (document.form1.p_comp.options[i].value == arrSelected[x]) {
        document.form1.p_comp.options[i] = null;
      }
    }
    boxLength = document.form1.p_comp.length;
  }
}

//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post" action="/servlet/controller.course.EduGroupServlet">
    <input type="hidden" name="p_process" value="insert">

    <table width="1024" border="0" cellspacing="0" cellpadding="0" height="663">
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
                <!----------------- �����׷� ���/����/�󼼺��� ���� ----------------->
                <table width="97%" border="0" cellspacing="1" cellpadding="5" class="table_out">
                    <tr> 
                        <td colspan="2" height="3" bgcolor="#4DA1F6"></td>
                    </tr>

                    <tr> 
                        <td class="table_title" height="25"  width="15%" height="25"z><b>�����׷��</b></td>
                        <td class="table_02_2"> 
                            <input name="p_grcodenm" type="text" class="input" size="30" value="<%=v_grcodenm%>">
                        </td>
                    </tr>
                    <tr> 
                        <td class="table_title" height="25"><b>���ñ��</b></td>
                        <td class="table_02_2"> 
                        <% if (StringManager.substring(box.getSession("gadmin"), 0, 1).equals("A")) { %>
                        <%=CodeConfigBean.getCodeSelect("grtype","p_grtype","",0)/*CodeConfigBean.getCodeCheck("grtype","p_grtype",false)*/ %>
                        <% } else  {                                                   %>
                        <%=CodeConfigBean.getCodeName("grtype",box.getSession("grtype")) %>
                            <input type="hidden" name="p_grtype" value="<%=box.getSession("grtype")%>">
                        <% }                                                           %>
                        </td>
                    </tr>    

                    <tr> 
                        <td class="table_title" height="25"><b>��������</b></td>
                        <td class="table_02_2"> 
                            <kocca_select:select                                       
                                name="p_grgubun"                                         
                                sqlNum="0001"                                    
                                param="0107"             
                                onChange=""                         
                                isLoad="true"                                           
                                type="1"                                                
                                styleClass=""
                                all="" />
                        </td>
                    </tr>  

                    <tr> 
                        <td class="table_title" height="25"><b>������</b></td>
                        <td class="table_02_2"><input name="p_domain" type="text" class="input" size="30" maxlength=50 value="">&nbsp;</td>
                    </tr>

                    <tr>
                        <td class="table_title" height="25"><b>�޴�Ÿ��</b></td>
                        <td class="table_02_2" colspan="3">
                            <select name="p_menutype">
                                <option value="1">Type 1</option>
                                <option value="2">Type 2</option>
                                <option value="3">Type 3</option>
                            </select>
                        </td>
                    </tr>
                    <tr> 
                        <td class="table_title" height="25"><b>���ȸ��</b></td>
                        <td class="table_02_2">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                    <td width="258"> 
                                        <select name="p_comp" size="4" style="width:190">
                                        </select>
                                        <input type=hidden name="p_compTxt" value="">
                                    </td>
                                    <td>
                                        <table width="30%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td align="center" height="25"><a href="javascript:searchGrpComp()"><img src="/images/admin/button/search3_butt.gif"  border="0"></a></td>
                                            </tr>
                                            <tr>
                                                <td align="center" height="25"><a href="javascript:deleteGrpComp()"><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="table_title" width="15%"><b>�����</b></td>
                        <td class="table_02_2" >
                            <table width="48%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                    <td> �̸� : <input name="p_masterName" type="text" class="input" size="10" maxlength=13 value="<%=v_masterName%>" onkeypress="key_press(event)">&nbsp;
                                        <input name="p_master" type="text" class="input" size="10" maxlength=13 value="<%=v_master%>" readonly>
                                    </td>
                                    <td>
                                        <a href="javascript:searchMaster()"><img src="/images/admin/button/search3_butt.gif"  border="0"></a>
                                    </td>
                                </tr>
                            </table>
                            <br>

                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>Tel &nbsp;&nbsp;&nbsp;<input name="p_managerComptel" type="text" class="input" size="20" maxlength=13 value="<%=v_managerComptel%>" readonly><br>
                                        EMail <input name="p_managerEmail" type="text" class="input" size="20" maxlength=13 value="<%=v_managerEmail%>" readonly>
                                    </td>
                                </tr>
                            </table>

                        </td>
                    </tr>
                    <tr>
                        <td class="table_title" height="25"><b>�����׷� PREFIX</b></td>
                        <td class="table_02_2">
                            <input type="text" name="p_gr_prefix" class="input" size =10 maxlength=10 value="">
                        </td>
                    </tr>
                    
    <!--
                    <tr> 
                        <td class="table_title" height="25"><b>������û��ұⰣ</b></td>
                        <td class="table_02_2" colspan="3"><input name="p_cancel" type="text" class="input" size="7" maxlength=13 value="">&nbsp;��</td>
                    </tr>
    --->
              
                </table>
                <!----------------- �����׷� ���/����/�󼼺��� �� ----------------->
                <br>
                <!----------------- ����, ��� ��ư ���� ----------------->
                <table border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                        <td align="center"><a href="javascript:whenSubmit()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
                        <td width=8></td>
                        <td align="center"><a href="javascript:history.back()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
                    </tr>
                </table>
                <!----------------- ����, ��� ��ư �� ----------------->
                <br>
            </td>
        </tr>
        <tr>
            <td><%@ include file = "/learn/library/getJspName.jsp" %>
            </td>
        </tr>     
    </table>

</form>
</body>
</html>