<%
/**
 * file name : za_OffLineApproval_L.jsp
 * date      :
 * programmer:
 * function  : ������û ���� ����Ʈ ��ȸȭ��
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.propose.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String  v_process  = "listPage";

    String  ss_grcode          = box.getString("s_grcode");             //�����׷�
    String  ss_grseq           = box.getString("s_grseq");              //��������
    String  ss_grseqnm         = box.getString("s_grseqnm");            //����������
    String  ss_mastercd        = box.getString("s_mastercd");           //����&�ڽ�
    String  ss_upperclass      = box.getString("s_upperclass");         //������з�
    String  ss_middleclass     = box.getString("s_middleclass");        //�����ߺз�
    String  ss_lowerclass      = box.getString("s_lowerclass");         //�����Һз�
    String  ss_subjcourse      = box.getString("s_subjcourse");         //����&�ڽ�
    String  ss_subjseq         = box.getString("s_subjseq");            //���� ����
    String  ss_selgubun        = box.getString("s_selgubun");
    String  ss_seltext         = box.getString("s_seltext");
    String  ss_seldept         = box.getString("s_seldept");
    String  ss_edustart        = box.getString("s_start");              //����������
    String  ss_eduend          = box.getString("s_end");                //����������
    String  v_isManagerPropose = box.getString("isManagerPropose");     //��ڽ���
    String  ss_subjgubun        = box.getString("s_subjgubun");     //�������� ���� ����
    String  ss_super            = box.getString("p_super");         //���/�Ϲ� ȸ�� ����

    String  v_step      = box.getString("p_step");
    String  v_appstatus = box.getString("p_appstatus");
    String  v_searchkind = box.getStringDefault("p_searchkind", "subjseq");

    String  v_action    = box.getString("p_action");
    String  v_gadmin    = box.getString("s_gadmin");

//    int     v_appauth   = ((Integer)request.getAttribute("appauth")).intValue();
    //int       v_appauth = 0;
    String []   stat_k  = {"ALL","W","Y","N"};
    String []   stat_v  = {"��ü","��ó��","����","�ݷ�"};


    String  v_finalString = ""; //�������� select box �±�

    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
    int i=0;

    String  v_ongo     = "whenSelection('go')";
    String  v_seq      = box.getString("isManagerPropose");

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
	$("#p_propstart").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_propend").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

//�˻�
function whenSelection(p_action) {

  document.form1.p_action.value = p_action;

  if (p_action == 'go') {
    if (chkParam() == false) {
      return;
    }
    top.ftop.setPam();
  }


  document.form1.action='/servlet/controller.propose.ApprovalServlet';
  document.form1.p_process.value = 'OffLinelistPage';                  //APPROVALBEAN.SelectApprovalScreenList (ATTR 
  
  document.form1.target = window.self.name;
  document.form1.submit();
}

// �˻����� üũ -> �����׷��� �ʼ�
function chkParam() {
  if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
    alert("�����׷��� �����ϼ���.");
    return false;
  }/*
  if (document.form1.s_grseq.value == 'ALL' || document.form1.s_grseq.value == '') {
    alert("���������� �����ϼ���.");
    return false;
  }
  */
}

// ����
function ordering(column) {
    if (document.form1.p_orderType.value == " asc") {
        document.form1.p_orderType.value = " desc";
    } else {
        document.form1.p_orderType.value = " asc";
    }

    document.form1.p_order.value = column;
    whenSelection("go");
}

// ����(���,����)ó��
function whenApprovalProcess(){
    if (chkParam() == false) {
      return;
    }
    document.ff.p_process.value = "OffLineapprovalProcess";

    document.ff.submit();
}

//��ü �ɼǼ��� ��ư
function whenChangeAll(idx){
    if(!confirm("���氡���� ���οɼ��� ��� ����˴ϴ�.\n\n����Ͻðڽ��ϱ�?")) return;

    for(var i=0;i<document.ff.length;i++){
    //alert(document.ff.elements[i].type+":"+document.ff.elements[i].selectedIndex);
        if(document.ff.elements[i].type=="select-one"){
            document.ff.elements[i].selectedIndex=idx;
        }
    }

    alert("[Ȯ��]��ư�� �����ž߸� ����˴ϴ�");

}

// ȸ������
function whenMemberInfo(userid) {
    window.self.name = "ProposeList";
    open_window("openMember","","100","100","600","260");
    document.form1.target = "openMember";
    document.form1.action='/servlet/controller.library.SearchServlet?p_userid='+userid;
    document.form1.p_process.value = 'memberInfo';
    document.form1.submit();
    document.form1.target = window.self.name;
}

//-------------------------------
    // excel file ����.
    //-------------------------------
    function whenExcel()
    {
        f = document.form1;
        
        if (chkParam() == false) {
      return;
    }
        
        document.form1.method = 'post';
        document.form1.target = 'mainFrame';

        document.form1.action='/servlet/controller.propose.ApprovalServlet';
        document.form1.p_process.value = 'OffLineExcelDown'; 
        document.form1.p_action.value = "go";

        document.form1.submit();                    
        
    }
//-->
</script>
</head>



<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
        <tr>
          <td><img src="/images/admin/propose/tit_offline_apply.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->
        <br>

<!------------------------------------- form ���� ------------------------------------->
<form name = "form1" method = "post" action="/servlet/controller.propose.ApprovalServlet">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="p_masternm"  value="">
    <input type="hidden" name="p_mastercd"  value="<%=ss_mastercd%>">
    <input type="hidden" name="p_action"  value="">
    <input type="hidden" name="p_order"  value="name">
    <input type="hidden" name="p_orderType" value="<%=v_orderType%>">

    <input type="hidden" name="p_grcode"    >
    <input type="hidden" name="p_grseq"     >
    <input type="hidden" name="p_gyear"     >
    <input type="hidden" name="p_subj"     >
    <input type="hidden" name="p_subjseq"   >
    <input type="hidden" name="p_gubun"     value="3">
    <input type="hidden" name="p_gubunnm"   value="��������">
    <input type="hidden" name="p_ispropose" value="">
    <input type="hidden" name="p_isapproval" value="">
    <input type="hidden" name="p_searchkind" value="<%=v_searchkind%>">

    <input type="hidden" name="p_returnurl"       value="/servlet/controller.propose.ApprovalServlet">
    <input type="hidden" name="p_returnprocess"   value="OffLinelistPage">


      <!----------------- form ���� ----------------->
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="center">

            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center">
                  <table border="0" cellspacing="0" cellpadding="0" width="99%" class="form_table">
                   
                    <tr>
                      <td width="90%" colspan='4'>
                            <!------------------- ���ǰ˻� ���� ------------------------->
                            <font color="red">��</font>���� �з�
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
	<kocca_select:select name="s_subjgubun" sqlNum="gubun"  param="0061"
	onChange="" attr=" " selectedValue="<%= ss_subjgubun %>" isLoad="true" all="false" />
                        <!------------------- ���ǰ˻� ���� ------------------------->
<font color="red">��</font>
	�����׷� <kocca_select:select name="s_grcode" sqlNum="course.0001"  param=" "
	onChange="" attr=" " selectedValue="<%= ss_grcode %>" isLoad="true" all="false" />
                        
                             <input type="hidden" name="p_step"  value="2">
                             ����
                              <select name="p_appstatus">
                              <%
                                  for(int ix=0;ix<4;ix++){
                                      %>  <option value="<%=stat_k[ix]%>" <%=((v_appstatus.equals(stat_k[ix])? "selected":" "))%> ><%=stat_v[ix]%></option> <%
                                  }
                              %>
                              </select>

                            <!-------------------- ���ǰ˻� �� ---------------------------->
							������û�� <input name="p_propstart" id="p_propstart" type="text" class="datepicker_input1" size="10" value="">
                        ~ <input name="p_propend" id="p_propend" type="text" class="datepicker_input1" size="10" value="">
                            <input type = "hidden" name="s_start">
                            <input type = "hidden" name="s_end">
                            <input type="hidden" name="p_step"  value="2">
                        <td width="10%" align="right"><%@ include file="/learn/admin/include/za_GoButton.jsp" %></td><!-- whenSelection('go') -->
                    </tr>
                    
                  </table>
                </td>
              </tr>
              <tr>
                <td height="9"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>

      <!----------------- form �� ----------------->

</form>


<!---------------------////////////////////////////// ����/�������� ////////////////////////////////-------------------------->
        <%
        String v_ispropose          ="";
        String v_proposetype        ="";
        String v_isedutarget        ="";
        String v_educnt             ="";
        String v_mastercd           ="";
        String v_masternm           ="";

        if (!ss_subjcourse.equals("ALL")&&!ss_subjseq.equals("ALL")&&!ss_subjcourse.equals("")&&!ss_subjseq.equals("")&&v_action.equals("go")) {
            DataBox dbox1 = (DataBox)request.getAttribute("isOffLineManagerStatus");
            if (dbox1 !=null ) {
                  v_ispropose          = dbox1.getString("d_ispropose");
                  v_mastercd           = dbox1.getString("d_mastercd");
                  v_masternm           = dbox1.getString("d_masternm");
                  v_proposetype        = dbox1.getString("d_proposetype");
                  v_isedutarget        = dbox1.getString("d_isedutarget");
                  v_educnt             = dbox1.getString("d_educnt");
            }
        }
%>

        <!---------------------////////////////////////////// ����/���������� ////////////////////////////////-------------------------->


        <!----------------- ��ν���, ��ν������, Ȯ�� ��ư ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
            <td  class=sub_title>����������ȸ</td>
            <td align="right" height="20" width="58"></td>
            <td width=8></td>
            <td align="right" height="20" width="70"><a href="javascript:whenChangeAll(0)"><img src="/images/admin/button/btn_allok.gif" border="0"></a></td>
            <td width=8></td>
            <td align="right" height="20" width="90"><a href="javascript:whenChangeAll(1)"><img src="/images/admin/button/btn_allcancel.gif" border="0"></a></td>
            <td width=8></td>
            <td align="right" height="20" width="70"><a href="javascript:whenChangeAll(2)"><img src="/images/admin/button/btn_alldelete.gif" border="0"></a></td>
            <td width=8></td>
            <td align="right" height="20" width="40"><a href="javascript:whenApprovalProcess()"><img src="/images/admin/button/btn_checkok.gif" border="0"></a></td>
            <td width=8></td>
            <td align="right" height="20" width="70"><a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif" border="0"></a></td>
          </tr>
          <tr>
            <td height="3"></td>
            <td height="3"></td>
            <td height="3"></td>
            <td height="3"></td>
            <td height="3"></td>
            <td height="3"></td>
            <td height="3"></td>
            <td height="3"></td>
            <td height="3"></td>
            <td height="3"></td>
            <td height="3"></td>
          </tr>
        </table>
        <!----------------- ��ν���, ��ν������, Ȯ�� ��ư �� ----------------->

        <!----------------- ����������ȸ ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="9" class="table_top_line"></td>
          </tr>
          <FORM name="ff" method="post" action="/servlet/controller.propose.ApprovalServlet">
            <input type="hidden" name="p_process"    value="approvalProcess">
            <input type="hidden" name="p_grcode"     value="<%=ss_grcode%>">
            <input type="hidden" name="p_grseq"      value="<%=ss_grseq%>">
            <input type="hidden" name="p_grseqnm"    value="<%=ss_grseqnm%>">
            <input type="hidden" name="p_uclass"     value="<%=ss_upperclass%>">
            <input type="hidden" name="p_mclass"     value="<%=ss_middleclass%>">
            <input type="hidden" name="p_lclass"     value="<%=ss_lowerclass%>">
            <input type="hidden" name="p_subjcourse" value="<%=ss_subjcourse%>">
            <input type="hidden" name="p_subjseq"    value="<%=ss_subjseq%>">
            <input type="hidden" name="p_searchkind" value="<%=v_searchkind%>">
            <input type="hidden" name="p_mastercd"   value="<%=ss_mastercd%>">
            <input type="hidden" name="p_masternm"   value="">
            <input type="hidden" name="s_subjgubun"   value="<%=ss_subjgubun%>">
            <input type="hidden" name="p_step"       value="<%=v_step%>">
            <input type="hidden" name="p_appstatus"  value="<%=v_appstatus%>">

          <tr>
            <td class="table_title" width="10%"><b><a href="javascript:ordering('c.codenm')" class="e">�з�</a></b></td>
            <td class="table_title" width="20%"><a href="javascript:ordering('s.subjnm')" class="e">���Ǹ�</a></b></td>
            <td class="table_title" width="10%"><b>������û�Ⱓ</b></td>
            <td class="table_title" width="10%"><b><a href="javascript:ordering('s.dday')" class="e">���� �Ͻ�</a></b></td>
            <td class="table_title" width="10%"><b>�ð�</b></td>
            <td class="table_title" width="5%"><b><a href="javascript:ordering('p.userid')" class="e">ID</a></b></td>
            <td class="table_title" width="5%"><b><a href="javascript:ordering('m.name')" class="e">����</a></b></td>
            <td class="table_title" width="5%"><b>��������</b></td>
            <td class="table_title" width="10%"><b><a href="javascript:ordering('p.ldate')" class="e">��û�Ͻ�</a></b></td>
          </tr>

<%  //out.println(v_action);
        if (v_action.equals("go")) {
        ArrayList  list = (ArrayList)request.getAttribute("OffLineApprovalList");
        int v_today = Integer.parseInt(FormatDate.getDate("yyyyMMddHH"));  //���� ��¥ �Ͻ� �ʱ�ȭ

        v_seq   = "";
        String v_gubunNm    = "";
        String v_subjnm     = "";
        String v_propstart  = "";
        String v_propend    = "";
        String v_dday       = "";
        String v_starttime  = "";
        String v_endtime    = "";
        String v_membergubun = "";
        String v_userid     = "";
        String v_superyn    = "";
        String v_status     = "";
        String v_name       = "";
        String v_ldate      = "";

        for (i=0; i<list.size(); i++) 
        {
            DataBox dbox = (DataBox)list.get(i);

            v_seq       = dbox.getString("d_seq");
            v_gubunNm   = dbox.getString("d_gubunnm");
            v_subjnm    = dbox.getString("d_subjnm");
            v_propstart = dbox.getString("d_propstart");
            v_propend   = dbox.getString("d_propend");
            v_dday      = dbox.getString("d_dday");
            v_starttime = dbox.getString("d_starttime");
            v_endtime   = dbox.getString("d_endtime");
            v_membergubun= dbox.getString("d_membergubun");
            v_userid    = dbox.getString("d_userid");
            v_superyn   = dbox.getString("d_superyn");
            v_status    = dbox.getString("d_status");
            v_name      = dbox.getString("d_name");
            v_ldate     = dbox.getString("d_ldate");

            if(v_superyn.equals("Y")) { v_superyn = "��";}
            else {v_superyn = "";}

            //��¥ ó��
            if(v_propstart.equals("")){v_propstart = "����";}
            else{v_propstart     = FormatDate.getFormatDate(v_propstart,"yyyy/MM/dd");}

            if(v_propend.equals("")){v_propend = "����";}
            else{v_propend     = FormatDate.getFormatDate(v_propend,"yyyy/MM/dd");}

            if(v_dday.equals("")){v_dday = "����";}
            else{v_dday     = FormatDate.getFormatDate(v_dday,"yyyy/MM/dd");}
%>
            <tr class="table_02_1">
                <td class="table_02_1"><%=v_gubunNm%></td>
                <td class="table_02_2"><%=v_subjnm%></td>
                <td class="table_02_1"><%=v_propstart%> ~ <br> <%=v_propend%></td>
                <td class="table_02_1"><%=v_dday%></td>
                <td class="table_02_1"><%=v_starttime%> �� ~ <br> <%=v_starttime%>��</td>
                <td class="table_02_1"><a href="javascript:whenMemberInfo('<%=v_userid%>')" class="e"><%=v_userid%><%=v_superyn%></a></td>
                <td class="table_02_1"><%=v_name%></td>
                <td class="table_02_1">
                    <select name="p_status">
                        <option value="<%=(v_seq + ":" + ss_grcode + ":"+v_userid)%>:Y" <% if(v_status.equals("Y")) { %> selected <%}%>>����</option>
                        <option value="<%=(v_seq + ":" + ss_grcode + ":"+v_userid)%>:W" <% if(v_status.equals("W")) { %> selected <%}%>>��ó��</option>
                        <option value="<%=(v_seq + ":" + ss_grcode + ":"+v_userid)%>:N" <% if(v_status.equals("N")) { %> selected <%}%>>�ݷ�</option>
                        <option value="<%=(v_seq + ":" + ss_grcode + ":"+v_userid)%>:D" <% if(v_status.equals("D")) { %> selected <%}%>>����</option>
                    </select></td>
                <td class="table_02_1"><%=FormatDate.getFormatDate(v_ldate,"yyyy-MM-dd HH:mm:ss")%></td>                
            </tr>
<%          //}
        }
        if (i == 0)
            { %>
            <tr>
                <td align="center" bgcolor="#FFFFFF" height="100" colspan="9">��ϵ� ������ �����ϴ�.</td>
              </tr>
            <%}
    }

%>
           
            </FORM>
        </table>
        <!----------------- ����������ȸ �� ----------------->

        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="right" class="ms">��<b> TOTAL : <%=i%> ��</b></td>
          </tr>
        </table>

        <br>

      </td>
  </tr>

</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
