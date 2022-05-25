<%
//**********************************************************
//  1. ��      ��: �������� ������������
//  2. ���α׷��� : za_MasterForm_U.jsp
//  3. ��      ��: �������� ������������ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 11. 24
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.contents.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String  p_subj      = box.getString("p_subj");

    String  p_process       = box.getString("p_process");
    String  ss_contenttype  = box.getString("p_contenttype");   //�������� ����Ʈ ContentType
    String  ss_upperclass   = box.getString("s_upperclass");    //�������� ����Ʈ ȭ�� ��з�
    String  ss_middleclass  = box.getString("s_middleclass");   //�������� ����Ʈ ȭ�� �ߺз�
    String  ss_lowerclass   = box.getString("s_lowerclass");    //�������� ����Ʈ ȭ�� �Һз�


    MasterFormData  da  =(MasterFormData)request.getAttribute("MasterFormData");
    String  v_ismfbranch    = da.getIsmfbranch();
    String  v_subjnm        = da.getSubjnm();
    String  v_dir           = da.getDir();
    String  v_contenttypetxt= da.getContenttypetxt();
    String  v_unchangableMaxLesson = da.getUnchangableMaxLesson();


    ArrayList  list1 = (ArrayList)request.getAttribute("MfDateDate");
    DataBox    dbox1 = null;
    String v_module   = "";
    String v_lesson   = "";
    String v_sdesc    = "";
    String v_fromdate = "";
    String v_todate   ="";

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
</head>
<script language="javascript">
function whenSubmit(){
    document.f2.p_process.value="updateDate";
    document.f2.submit();
}
</script>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">


  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/course/c_title03.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <!-------------������ ����-------------------------->
      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>��¥����</td>
        </tr>
        <tr>
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table>
      <!--------------������ ��---------------------------->
      <%@ include file="/learn/admin/contents/include_MasterFormAdmin.jsp" %>

        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td bgcolor="#636563">
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
                <FORM name = "f2" method = "post" action="/servlet/controller.contents.MasterFormServlet">
                    <input type=hidden name=p_process       value="">
                    <input type=hidden name=p_action        value="">
                    <input type=hidden name=p_subj          value="<%=p_subj%>">
                    <input type=hidden name=p_contenttype   value="<%=da.getContenttype()%>">
                    <input type=hidden name=s_upperclass    value="<%=ss_upperclass%>">
                    <input type=hidden name=s_middleclass   value="<%=ss_middleclass%>">
                    <input type=hidden name=s_lowerclass    value="<%=ss_lowerclass%>">
                    <input type=hidden name=s_contenttype   value="<%=ss_contenttype%>">
                <tr>
                  <td bgcolor="#FFFFFF" align="center" valign="top">
                  <br>

                    <table width="99%" border="0" cellspacing="1" cellpadding="5">
                      <tr>
                        <td colspan="7" class="table_top_line"></td>
                      </tr>
                      <tr>
                        <td width="5%" height="25" class="table_title"><b>����</b></td>
                        <td class="table_title"><b>���ø�</b></td>
                        <td class="table_title"><b>������</b></td>
                        <td class="table_title"><b>������</b></td>
                      </tr>
<%
                for (int i=0; i<list1.size(); i++) {
                    dbox1  = (DataBox)list1.get(i);
                    v_module   = dbox1.getString("d_module");
                    v_lesson   = dbox1.getString("d_lesson");
                    v_sdesc    = dbox1.getString("d_sdesc");
                    v_fromdate = dbox1.getString("d_fromdate");
                    v_todate   = dbox1.getString("d_todate");

%>
                      <tr>
                        <td align="center" bgcolor="#EEEEEE" height="25"><%=v_lesson%></td>
                        <td class="table_02_2"><%=v_sdesc%></td>
                        <td class="table_02_1">
                          <input name="p_module" type="hidden" value="<%=v_module%>">
                          <input name="p_lesson" type="hidden" value="<%=v_lesson%>">
                          <input name="p_sdesc"  type="hidden" value="<%=v_sdesc%>">
                          ���������Ϸκ��� <input name="p_fromdate" type="text" class="input" size="5" maxlength="3" value="<%=v_fromdate%>"> ��
                        </td>
                        <td class="table_02_1">
                          ���������Ϸκ��� <input name="p_todate" type="text" class="input" size="5" maxlength="3" value="<%=v_todate%>"> ��
                        </td>
                      </tr>
<%
            }
%>

                    </table>
                    <!----------------- ������������ �� ----------------->
                    <br>
                    <!----------------- �����ư ���� ----------------->
                    <table border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td> <a href="javascript:whenSubmit()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
                        <td width=8></td>
                        <td><a href="javascript:whenList()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
                      </tr>
                      <tr>
                        <td height="8"></td>
                        <td height="8"></td>
                        <td height="8"></td>
                      </tr>
                    </table>
                    <!----------------- �����ư �� ----------------->
                  </td>
                </tr>
                </FORM>
              </table>
            </td>
          </tr>
        </table>
        <br>

      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
