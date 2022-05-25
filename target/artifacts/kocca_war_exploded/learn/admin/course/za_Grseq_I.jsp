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
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    //DEFINED in relation to select START
    String  ss_grcode    = box.getString("s_grcode");           //�����׷�
    String  ss_gyear     = box.getString("s_gyear");            //�⵵
    String  ss_upperclass = box.getString("s_upperclass");      //������з�
    String  ss_middleclass = box.getString("s_middleclass");    //�����ߺз�
    String  ss_subjcourse= box.getString("s_subjcourse");       //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");          //���� ����
    String  ss_grseq   = box.getString("s_grseq");              //�����׷� ����
    //DEFINED in relation to select END

    String v_grcode = box.getString("p_grcode");
    String v_gyear  = box.getStringDefault("p_gyear", FormatDate.getDate("yyyy"));
    String v_grseqnm = box.getString("p_grseqnm");

    String p_charger = box.getString("p_charger");
    GrseqBean grseqbean = new GrseqBean();
    String v_makeoption = box.getString("p_makeoption");
    String v_copy_gyear = box.getString("p_copy_gyear");
    String v_copy_grseq = "";
    
    String s_gadmin = box.getSession("gadmin");
	String v_gadmin = null;
	if (s_gadmin==null || s_gadmin.length() == 0) v_gadmin = "";
	else v_gadmin = StringManager.substring(s_gadmin, 0, 1);
	String s_userid = box.getSession("userid");
	String v_tem_grcode = box.getSession("tem_grcode");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language="JavaScript">
$(document).ready(function(){
    $("#p_propstart1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    $("#p_propend1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    $("#p_edustart1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    $("#p_eduend1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    $("#p_startcanceldate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    $("#p_endcanceldate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    $("#p_sulstartdate1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    $("#p_sulenddate1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    $("#p_sulstartdate2").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    $("#p_sulenddate2").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--
// ����Ʈ ������ �˻�
function whenSelection() {
    document.form1.p_process.value="insertPage";
    document.form1.action="/servlet/controller.course.GrseqServlet";
    document.form1.submit();
}

// ����Ʈ ������ �˻�
function whenSelection(ss_action) {
    document.form1.p_process.value="insertPage";
    document.form1.action.value="/servlet/controller.course.GrseqServlet";
    //if (ss_action=="go")    {
            if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
                alert("�����׷��� �����ϼ���.");
                return ;
            }
      //}
    document.form1.submit();
}

// ����
function whenSubmit(){

    if (!document.form1.p_homepageyn[0].checked){
        if (!document.form1.p_homepageyn[1].checked){
            alert("Ȩ������ ���⿩�θ� ������ �ֽʽÿ�.");
            return;
        }
    }
    if (document.form1.p_gyear.value.length != 4){
        alert("�⵵�� 4�ڸ��� �Է��Ͽ� �ֽʽÿ�");
        return;
    }
    if (document.form1.p_grseqnm.value.length < 2){
        alert("������������ 2~25�ڸ��� �Է��Ͽ� �ֽʽÿ�");
        return;
    }

    var selectObj = document.form1.p_makeoption;

    if (selectObj.options[selectObj.selectedIndex].value == ""){
        alert("������� �°踦 �����ϼ���");
        selectObj.focus();
        return;
    } else {
        if(selectObj.options[selectObj.selectedIndex].value == "MAKE_ALL"){
            if(document.form1.s_grcode.value == "") {
                alert("�׷��ڵ带 �����ϼ���");
                document.form1.s_grcode.focus();
                return;
            }
        } else if (selectObj.options[selectObj.selectedIndex].value == "SELECT_ALL"){
            if(document.form1.s_grcode.value == "") {
                alert("�׷��ڵ带 �����ϼ���");
                document.form1.s_grcode.focus();
                return;
            }
            if(document.form1.s_gyear.value == "") {
                alert("�⵵�� �����ϼ���");
                document.form1.s_gyear.focus();
                return;
            }
            if(document.form1.s_grseq.value == "" || document.form1.s_grseq.value == "ALL") {
                alert("������ �����ϼ���");
                document.form1.s_grseq.focus();
                return;
            }
        }
    }

    dateChk();

    document.form1.p_copy_gyear.value = document.form1.s_gyear.value;
    document.form1.p_copy_grseq.value = document.form1.s_grseq.value;

    document.form1.submit();
}

    // �������ĺ�ȯ
    function dateChk(){
        ff = document.form1;

        if(ff.p_propstart1.value != null){
            ff.p_propstart.value=make_date(ff.p_propstart1.value)+ff.p_propstart2.options[ff.p_propstart2.selectedIndex].value;
        }
        if(ff.p_propend1.value != null){
            ff.p_propend.value=make_date(ff.p_propend1.value)+ff.p_propend2.options[ff.p_propend2.selectedIndex].value;
        }

        if(ff.p_edustart1.value != null){
            ff.p_edustart.value=make_date(ff.p_edustart1.value)+ff.p_edustart2.options[ff.p_edustart2.selectedIndex].value;
        }
        if(ff.p_eduend1.value != null){
            ff.p_eduend.value=make_date(ff.p_eduend1.value)+ff.p_eduend2.options[ff.p_eduend2.selectedIndex].value;
        }


        return true;
    }

// ���� ����(�޷�)
function whenclick(caldate) {
    caldate.value = "";
}

function changeMakeOption() {
    var selectObj = document.form1.p_makeoption;
    var selectDiv = document.getElementById("div_select");
    var trObj     = document.getElementsByName("sTr");
    var trLen     = trObj.length;

    if(selectObj.options[selectObj.selectedIndex].value == "MAKE_ALL"){
        selectDiv.style.display = "none";
        for(var i = 0 ; i < trLen ; i++) {
            trObj[i].style.display = "block";
        }
            window.resizeTo(630,600);
    } else if (selectObj.options[selectObj.selectedIndex].value == "SELECT_ALL"){
        selectDiv.style.display = "block";
        for(var i = 0 ; i < trLen ; i++) {
            trObj[i].style.display = "block";
        }
            window.resizeTo(630,600);
    } else if(selectObj.options[selectObj.selectedIndex].value == "MANUAL"){
        selectDiv.style.display = "none";
        for(var i = 0 ; i < trLen ; i++) {
            trObj[i].style.display = "none";
        }
            window.resizeTo(630,400);
    }
}

$(function() {
	$("#oUpperclass").bind("change", function(){
        var param = "type=sqlID&sqlID=selectBox.subjAttMiddleList&param=" + $(this).val();
        $.ajaxSetup({cache:false});
        $.ajax({
                type : "get"
            ,   url : "/learn/admin/common/za_GetSelectBoxAjaxResult.jsp"
            ,   dataType : "json"
            ,   data : param
            ,   success : fnSetMiddleClass
            ,   complete : function(arg1, arg2) {
                    // alert("complete : " + arg1);
                }
            ,   error :  function(arg1, arg2) {
                    // alert("error : " + arg1);
                }
        });
    });

    $("#oMiddleclass").bind("change", function(){
        var param = "type=sqlID&sqlID=selectBox.subjAttLowerList&param=" + $("#oUpperclass").val() + "," + $(this).val();
        $.ajaxSetup({cache:false});
        $.ajax({
                type : "get"
            ,   url : "/learn/admin/common/za_GetSelectBoxAjaxResult.jsp"
            ,   dataType : "json"
            ,   data : param
            ,   success : fnSetLowerClass
            ,   complete : function(arg1, arg2) {
                    // alert("complete : " + arg1);
                }
            ,   error :  function(arg1, arg2) {
                    // alert("error : " + arg1);
                }
        });
    });
});
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form name = "form1" method = "post" action="/servlet/controller.course.GrseqServlet">
    <input type="hidden" name="p_process"   value="insert">
    <input type="hidden" name="p_grcode"    value="<%=v_grcode%>">
    <!--input type="hidden" name="p_grcode"        value="<%=ss_grcode%>"-->
    <!--input type="hidden" name="p_gyear"         value="<%=ss_gyear%>"-->
    <input type="hidden" name="p_copy_gyear">
    <input type="hidden" name="p_copy_grseq">

    <input type="hidden" name="s_upperclass"    value="<%=ss_upperclass%>"> <!--in relation to select-->
    <input type="hidden" name="s_middleclass"   value="<%=ss_middleclass%>"><!--in relation to select-->
    <input type="hidden" name="s_subjcourse"    value="<%=ss_subjcourse%>"> <!--in relation to select-->
    <input type="hidden" name="s_subjseq"       value="<%=ss_subjseq%>">    <!--in relation to select-->

<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/course/c_title02.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
        <br>
        <br>

         <!----------------- �������� ���� ���/���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="20%" height="25" class="table_title"><b>�����׷�</b></td>
            <td class="table_02_2" width="81%"> <b><%=GetCodenm.get_grcodenm(v_grcode)%></b></td>
          </tr>
          <tr>
            <td class="table_title" height="25"><b>�⵵</b></td>
            <td class="table_02_2">
                <input name="p_gyear"       type="text"     class="input" size="4" value="<%=v_gyear%>">
                <!--input name="p_grseqnm"  type="hidden" value="0001"-->
            </td>
          </tr>
          <tr>
            <td class="table_title" height="25"><b>����������</b></td>
            <td class="table_02_2">
              <input name="p_grseqnm" type="text" class="input" size="40" maxlength="50" value="<%=v_grseqnm%>"> <b>ex) 2006.01.01 ~ 2006.01.31</b>
            </td>
          </tr>
          <tr>
            <td class="table_title" height="25"><b>���/����</b></td>
            <td class="table_02_2">
                <select name="p_isalways">
					<option value="Y"> ���</option>
				 	<option value="N"> ����</option>
				</select>
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><b>������� �°�</b></td>
            <td class="table_02_2">
              <select name="p_makeoption" onchange="changeMakeOption();">
                <option value=""> -- ���� --</option>
                <option value="MAKE_ALL"   <%if(v_makeoption.equals("MAKE_ALL")){%>selected<%}%>>�����׷쿡 ��ϵ� ���� ��� �ϰ�����</option>
                <option value="SELECT_ALL" <%if(v_makeoption.equals("SELECT_ALL")){%>selected<%}%>>���� ���������� ��ϵ� ���� ��� �ϰ�����</option>
                <option value="MANUAL"     <%if(v_makeoption.equals("MANUAL")){%>selected<%}%>>���� ����</option>
              </select>
            </td>
          </tr>
          <tr id="sTr" name="sTr">
            <td class="table_title" height="25"><b>������������</b></td>
            <td class="table_02_2">
                                <%--�����׷�   <kocca_select:select name="s_grcode" sqlNum="course.0001"  param=" " onChange="changes_gyear(this.value);" attr=" " selectedValue="<%= ss_grcode %>" isLoad="true" all="false" /> --%> 
                                <%-- <kocca:selectBox name="s_grcode" id="oGrcode" optionTitle="== ���� ==" type="sqlID" sqlID="code.list.course.0001" param=" " selectedValue="<%= ss_grcode %>" isLoad="true" /><br/> --%>
            <div id="div_select">
                              <%--���� <kocca_select:select name="s_gyear" sqlNum="course.year"  param="<%= ss_grcode %>" onChange="changes_grseq(s_grcode.value, this.value);" attr=" " selectedValue="<%= ss_gyear %>" isLoad="true" all="false" /> --%>
                                <%-- <kocca:selectBox name="s_gyear" id="oGyear" optionTitle="== ���� ==" type="sqlID" sqlID="code.list.course.year" param="<%= v_grcode %>" selectedValue="<%= ss_upperclass %>" isLoad="true" /><br/> --%>  
                               <%--��������   <kocca:selectBox name="s_grseq" id="oGrseq" optionTitle="== ���� ==" type="sqlID" sqlID="code.list.course.subjseq" param="<%= s_userid + ',' + s_gadmin + ',' + v_gadmin + ',' + v_gyear + ',' + v_grcode + ',' + v_gyear + ',' + v_grcode + ',' + v_gadmin + ',' + v_gyear + ',' + v_grcode + ',' + v_gyear + ',' + v_grcode %>" selectedValue="<%= ss_grseq %>" isLoad="true" /><br/> --%> 
                               <%-- <kocca_select:select name="s_grseq" sqlNum="code.list.course.subjseq" param="<%=v_grcode%>" param2="<%=v_gyear%>" attr=" style='width:130px;'" onChange="" selectedValue="<%= ss_grseq %>" isLoad="true" all="true" /> --%>  
            </div>
            <%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  --><br />
            <%= SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)   �����⵵  --><br />
            <%= SelectEduBean.getGrseq(box, true, true)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  --><br />
            </td>
          </tr>
          <tr id="sTr" name="sTr">
            <td class="table_title" height="25"><b>������û�����Ͻ�</b></td>
            <td class="table_02_2">
              <input name="p_propstart1" id="p_propstart1" type="text" class="datepicker_input1" size="10" value="">
              ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <select name="p_propstart2">
                <%=FormatDate.getDateOptions(0,23,0)%>
              </select>
              ��&nbsp;
              <a href="javascript:whenclick(document.form1.p_propstart1)"> <img src="/images/admin/button/btn_del.gif" align="absmiddle" border="0"></a>
              <input type=hidden name="p_propstart" value="">
            </td>
          </tr>
          <tr id="sTr" name="sTr">
            <td class="table_title" height="25"><b>������û�����Ͻ�</b></td>
            <td class="table_02_2">
              <input name="p_propend1" id="p_propend1" type="text" class="datepicker_input1" size="10" value="">
              ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <select name="p_propend2">
                <%=FormatDate.getDateOptions(0,23,23)%>
              </select>
              ��&nbsp;
              <a href="javascript:whenclick(document.form1.p_propend1)"> <img src="/images/admin/button/btn_del.gif" align="absmiddle" border="0"></a>
              <input type=hidden name="p_propend"  value="">
            </td>
          </tr>
          <tr id="sTr" name="sTr">
            <td class="table_title" height="25"><b>�н� �����Ͻ�</b></td>
            <td class="table_02_2">
              <input name="p_edustart1" id="p_edustart1" type="text" class="datepicker_input1" size="10" value="">
              ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <select name="p_edustart2">
                <%=FormatDate.getDateOptions(0,23,0)%>
              </select>
              ��&nbsp;
              <a href="javascript:whenclick(document.form1.p_edustart1)"> <img src="/images/admin/button/btn_del.gif" align="absmiddle" border="0"></a>
              <input type=hidden name="p_edustart"  value="">
            </td>
          </tr>
          <tr id="sTr" name="sTr">
            <td class="table_title" height="25"><b>�н� �����Ͻ�</b></td>
            <td class="table_02_2">
              <input name="p_eduend1" id="p_eduend1" type="text" class="datepicker_input1" size="10" value="">
              ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <select name="p_eduend2">
                <%=FormatDate.getDateOptions(0,23,23)%>
              </select>
              ��&nbsp;
              <a href="javascript:whenclick(document.form1.p_eduend1)"> <img src="/images/admin/button/btn_del.gif" align="absmiddle" border="0"></a>
              <input type=hidden name="p_eduend" value="">
            </td>
          </tr>
          <tr id="sTr" name="sTr">
            <td class="table_title" height="25"><b>������û��ұⰣ</b></td>
            <td class="table_02_2">
                <input name="p_startcanceldate" id="p_startcanceldate" type="text" class="datepicker_input1" size="10" value="" onMouseover="if(this.value=='') this.value=p_propstart1.value"> ��
                - <input name="p_endcanceldate" id="p_endcanceldate" type="text" class="datepicker_input1" size="10" value="" onMouseover="if(this.value=='') this.value=p_propend1.value"> ��
              �н������Ϸκ��� <input type="text" name="p_canceldays" id="p_canceldays" value="" size="5" class="input" onMouseover=""> �� 
            </td>
          </tr>
          <tr id="sTr" name="sTr">
            <td class="table_title" height="25">Ȩ���������⿩��</td>
            <td class="table_02_2">
              <input type="radio" value="Y" name="p_homepageyn" >����&nbsp;&nbsp;&nbsp;
              <input type="radio" value="N" name="p_homepageyn" >�̳���
            </td>
          </tr>
          <tr id="sTr" name="sTr">
            <td align="center" class="table_title">��������</td>
            <td class="table_02_2">
              <%=grseqbean.selectSulPaper("p_sulpaper1",v_grcode, "",1)%>
              <br><br>
              �����Ⱓ : <input type="text" name="p_sulstartdate1" id="p_sulstartdate1" class="datepicker_input1" size="10" value=""> ��
              ~ <input type="text" name="p_sulenddate1" id="p_sulenddate1" class="datepicker_input1" size="10" value=""> ��
            </td>
          </tr>

          <tr id="sTr" name="sTr">
            <td align="center" class="table_title">���ļ���</td>
            <td class="table_02_2">
              <%=grseqbean.selectSulPaper("p_sulpaper2",v_grcode, "",1)%>
              <br><br>
              �����Ⱓ : <input type="text" name="p_sulstartdate2" id="p_sulstartdate2" class="datepicker_input1" size="10" value=""> ��
              ~ <input type="text" name="p_sulenddate2" id="p_sulenddate2" class="datepicker_input1" size="10" value=""> ��
            </td>
          </tr>
          <tr id="sTr" name="sTr">
            <td align="center" class="table_title">����</td>
            <td class="table_02_2">
                <input type="text" name="p_charger" />
            </td>
          </tr>

        </table>
        <!----------------- �������� ���� ���/���� �� ----------------->
        <br>


        <!----------------- ����, ��� ��ư ���� ----------------->
        <table  border="0" cellspacing="0" cellpadding="0">
          <tr onMouseover="if(p_startcanceldate.value=='') p_startcanceldate.value=p_propstart1.value;if(p_endcanceldate.value=='') p_endcanceldate.value=p_propend1.value">
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
