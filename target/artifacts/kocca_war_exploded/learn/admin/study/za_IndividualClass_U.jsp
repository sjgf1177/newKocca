<%
/**
 * file name : za_IndividualClass_I.jsp
 * date      : 2003/08/05
 * programmer:
 * function  : Ŭ���� ���� (���κ�)
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.study.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

      //DEFINED in relation to select START
    String  ss_grcode    = box.getString("s_grcode");           //�����׷�
    String  ss_gyear     = box.getString("s_gyear");            //�⵵
    String  ss_grseq     = box.getString("s_grseq");            //��������
    String  ss_grseqnm   = box.getString("s_grseqnm");          //����������
    String  ss_upperclass = box.getString("s_upperclass");      //������з�
    String  ss_middleclass = box.getString("s_middleclass");    //�����ߺз�
    String  ss_lowerclass = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse= box.getString("s_subjcourse");       //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");          //���� ����
    String  ss_company   = box.getString("s_company");          //ȸ��


    String  v_subj      = box.getString("p_subj");
    String  v_year      = box.getString("p_year");
    String  v_subjseq01 = box.getString("p_subjseq01");
    String  v_class     = box.getString("p_class");
    
    String  v_mtutor    = box.getString("p_mtutor");
    String  v_mtutorid  = box.getString("p_mtutorid");
    String  v_stutor    = box.getString("p_stutor");
    int     v_tutorcnt  = box.getInt("p_tutorcnt");

    Hashtable  subjinfo = (Hashtable)request.getAttribute("SubjectInfo");
%>
<html>
<head>
<title>Ŭ���� ����(���κ�)</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language="JavaScript">
<!--
function whenSelectClass() {
  document.form2.p_process.value='classUpdatePage';
  document.form2.submit();
}
function goPluralClassList() {
    document.form2.p_process.value='plurallistPage';
    document.form2.p_action.value='go';
    document.form2.submit();
}
function whenUpdate() {
  if (document.form2.p_mtutorid.selectedIndex < 0) {
    alert('�ְ��縦 �����Ͻʽÿ�');
    return;
  }
  document.form2.p_process.value='classUpdate';
    document.form2.submit();
}
function openSubTutor() {
  window.self.name = "winSubTutor";
  window.open("", "openSubTutorUpdate", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width=580, height=300, top=0, left=0");
  document.form3.target = "openSubTutorUpdate";
  document.form3.action = "/servlet/controller.study.ClassServlet";
  document.form3.p_process.value = "subTutorPage";
    document.form3.p_class.value  = document.form2.p_class.options[document.form2.p_class.selectedIndex].value;
  document.form3.submit();
}


function insertFileToDB() {
    window.self.name = "winInsertPage";     //      opener ��ü�� name �� �����Ѵ�
    farwindow = window.open("", "openWinInsert", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 800, height = 670, top=0, left=0");
    document.form2.target = "openWinInsert"
    document.form2.p_process.value = "classFileToDBPage";
    document.form2.p_action.value = "go";
    document.form2.p_subj.value = document.form2.s_subjcourse.value;
    document.form2.action = "/servlet/controller.study.ClassServlet";
    document.form2.submit();

    farwindow.window.focus();
    document.form2.target = window.self.name;
}

//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/study/s_title11.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
            <!----------------- title �� ----------------->
      <br>
      <!----------------- form ���� ----------------->
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <tr> 
          <td bgcolor="#C6C6C6" align="center"> 
            <table cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr> 
                <td height="3"></td>
              </tr>
              <tr> 
                <td align="center" valign="middle"> 
                  <table cellspacing="0" cellpadding="0" width="99%" class="form_table">
                    <tr> 
                      <td width="13%" height="25">��<b> �����ְ�</b></td>
                      <td width="35%">: <%=(String)subjinfo.get("p_grcodenm")%></td>
                      <td width="13%">��<b> �⵵</b></td>
                      <td>: <%=(String)subjinfo.get("p_gyear")%>��</td>
                    </tr>
                    <tr> 
                      <td height="25">��<b> ��������</b></td>
                      <td>: <%=(String)subjinfo.get("p_grseqnm")%></td>
                      <td>��<b> �з�</b></td>
                      <td>: <%=(String)subjinfo.get("p_classname")%></td>
                    </tr>
                    <tr> 
                      <td height="25">��<b> ����</b></td>
                      <td>: <%=(String)subjinfo.get("p_subjnm")%></td>
                      <td>��<b> ����</b></td>
                      <td>: <%//=(String)subjinfo.get("p_subjseq")%><%=StringManager.cutZero((String)subjinfo.get("p_subjseqgr"))%>��</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="3"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <br>
      <br>
      <table cellspacing="1" cellpadding="0" width=970>
      <form name="form2" method="post" action="/servlet/controller.study.ClassServlet">
        <input type="hidden" name="p_process"    value="">
        <input type="hidden" name="p_action"     value="">
        <input type="hidden" name="s_grcode"     value="<%=ss_grcode%>">
        <input type="hidden" name="s_gyear"      value="<%=ss_gyear%>">
        <input type="hidden" name="s_grseq"      value="<%=ss_grseq%>">
        <input type="hidden" name="s_grseqnm"    value="<%=ss_grseqnm%>">
        <input type="hidden" name="s_upperclass"     value="<%=ss_upperclass%>">
        <input type="hidden" name="s_subjcourse" value="<%=ss_subjcourse%>">
        <input type="hidden" name="s_subjseq"    value="<%=ss_subjseq%>">
        <input type="hidden" name="s_comp"       value="<%=ss_company%>">
        <input type="hidden" name="p_subj"       value="<%=v_subj%>">
        <input type="hidden" name="p_year"       value="<%=v_year%>">
        <input type="hidden" name="p_subjseq01"  value="<%=v_subjseq01%>">
                  
        <tr>
          <td>
            <table cellspacing="0" cellpadding="0" width=100%>
              <tr>
                <td> 
                  <!----------------- Ŭ������, ���.����Ʈ ��ư ���� ----------------->
                  <table cellpadding="0" cellspacing="0" width=100%>
                    <tr> 
                      <td width="835" height="20" valign="bottom">
                         Ŭ������ <% SelectParam param = new SelectParam("p_class", "whenSelectClass()", false, 24, box.getHttpSession()); %><%=SelectionUtil.getSubjClass(v_subj, v_year, v_subjseq01, v_class, param)%>
                      </td>
                      <td align="right" width="10">&nbsp;</td>
                      <td align="right" width="88"><a href="javascript:whenUpdate()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
                      <td align="right" width="10">&nbsp;</td>
                      <td align="right" width="32"><a href="javascript:goPluralClassList()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td height="3"></td>
                      <td height="3"></td>
                      <td height="3"></td>
                      <td height="3"></td>
                    </tr>
                  </table>
                  <!----------------- Ŭ������, ���.����Ʈ ��ư �� ----------------->
                  <!----------------- ���κ� ���� ----------------->
                  <table cellspacing="1" cellpadding="0" width=100% bgcolor="76ABE0">
                    <tr> 
                      <td colspan="8" class="table_top_line"></td>
                    </tr>
                    <tr> 
                      <td width="5%" class="table_title"><b>NO</b></td>
                      <td class="table_title"><b>ȸ��</b></td>
                      <td class="table_title"><b>ID</b></td>
                      <td class="table_title"><b>����</b></td>
                      <td class="table_title"><b>�μ�</b></td>
                      <td class="table_title"><b>����</b></td>
                      <td class="table_title"><b>Ŭ������</b></td>
                      <td class="table_title">&nbsp;</td>
                    </tr>
<%  ArrayList  list = (ArrayList)request.getAttribute("ClassInsertList");
    ClassMemberData data = null;
    for (int i=0; i<list.size(); i++) {
        data = (ClassMemberData)list.get(i); %>
                    <tr> 
                      <td class="table_01"><%=String.valueOf(i+1)%></td>
                      <td class="table_02_1"><%=data.getCompanynm()%></td>
                      <td class="table_02_1"><%=data.getUserid()%></td>
                      <td class="table_02_1"><%=data.getName()%></td>
                      <td class="table_02_1"><%=data.getAsgnnm()%></td>
                      <td class="table_02_1"><%=data.getJikwinm()%></td>
                      <td class="table_02_1"><%=data.getClassnm()%></td>
                      <td class="table_02_1"> 
                        <input type="checkbox" name="p_checks" value="<%=data.getUserid()%>">
                      </td>
                    </tr>
<%  } %>        
                  </table>
                  <br>
                  <table cellspacing="1" cellpadding="0" width=100% bgcolor="76ABE0">
                    <tr> 
                      <td colspan="3" class="table_top_line"></td>
                    </tr>
                    <tr> 
                      <td width="48%" height="25" class="table_title"><b>����</b></td>
                      <td class="table_title"><b>�ΰ�����</b></td>
                      <td class="table_title"><b>�ΰ�������</b></td>
                    </tr>
                    <tr> 
                      <td class="table_02_1"> 
                        <% SelectParam param2 = new SelectParam("p_mtutorid", "", false, 24, box.getHttpSession()); %><%=SelectionUtil.getSubjTutor(v_subj, v_year, v_subjseq01, v_class, v_mtutorid, param2)%>
                      </td>
                      <td class="table_02_1"><%=v_stutor%></td>
                      <td class="table_02_1"><% if (v_tutorcnt > 1) { %><a href="javascript:openSubTutor()"><img src="/images/admin/student/appoint1_butt.gif" width="37" height="18" border="0"></a><% } %></td>
                    </tr>
                  </table>
                  <!----------------- ���κ� �� ----------------->
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </form>
      </table>
      <br>
    </td>
  </tr>

<form name="form3" method="post" action="/servlet/controller.study.ClassServlet">
<input type="hidden" name="p_process"    value="">
<input type="hidden" name="p_action"     value="">
<input type="hidden" name="s_grcode"     value="<%=ss_grcode%>">
<input type="hidden" name="s_gyear"      value="<%=ss_gyear%>">
<input type="hidden" name="s_grseq"      value="<%=ss_grseq%>">
<input type="hidden" name="s_grseqnm"    value="<%=ss_grseqnm%>">
<input type="hidden" name="s_upperclass" value="<%=ss_upperclass%>">
<input type="hidden" name="s_subjcourse" value="<%=ss_subjcourse%>">
<input type="hidden" name="s_subjseq"    value="<%=ss_subjseq%>">
<input type="hidden" name="s_comp"       value="<%=ss_company%>">
<input type="hidden" name="p_subj"       value="<%=v_subj%>">
<input type="hidden" name="p_year"       value="<%=v_year%>">
<input type="hidden" name="p_subjseq01"  value="<%=v_subjseq01%>">
<input type="hidden" name="p_class"      value="">
<input type="hidden" name="p_call_url"   value="za_IndividualClass_U">
</form>  
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>




