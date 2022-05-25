<%
//**********************************************************
//  1. ��      ��: Topic List
//  2. ���α׷���: za_Topic_L.jsp
//  3. ��      ��: ��й� ����������Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 23
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    String  v_grcode    = box.getString("p_grcode");
    String  v_grcodenm  = box.getString("p_grcodenm");
    String  v_gyear     = box.getString("p_gyear");
    String  v_grseq     = box.getString("p_grseq");
    String  v_subj      = box.getString("p_subj");
    String  v_subjnm    = box.getString("p_subjnm");
    String  v_year      = box.getString("p_year");
    String  v_subjseq   = box.getString("p_subjseq");
	String  v_subjseqgr   = box.getString("p_subjseqgr");
    String  v_tpcode    = "";
    String  v_started   = "";
    String  v_ended     = "";
    String  v_title     = "";
    String  v_name      = "";
    String  v_addate    = "";
    String  v_finished  = "";
    int     i           = 0;
     ArrayList list     = null;
	//DEFINED class&variable END

    //DEFINED in relation to select START
    String  ss_grcode    = box.getString("s_grcode");        //�����׷�
    String  ss_gyear     = box.getString("s_gyear");         //�⵵
    String  ss_grseq     = box.getString("s_grseq");         //��������
    String  ss_uclass    = box.getString("s_uclass");        //�����з�
    String  ss_subjcourse= box.getString("s_subjcourse");    //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");       //���� ����
    String  ss_action    = box.getString("s_action");
    int v_pageno         = box.getInt("p_pageno");
    //DEFINED in relation to select END

    list = (ArrayList)request.getAttribute("topicList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
    function toron_list() {
        document.form1.target = "_self";
    	document.form1.p_process.value='ToronList';
    	document.form1.action='/servlet/controller.study.ToronAdminServlet';
    	document.form1.submit();
    }

    function topicView(tpcode){
        document.form1.p_process.value = "TopicSelect";
        document.form1.p_tpcode.value = tpcode;
        document.form1.action = "/servlet/controller.study.ToronAdminServlet";
        document.form1.submit();
    }

    function topic_insert() {
        document.form1.target = "_self";
    	document.form1.p_process.value='TopicInsertPage';
    	document.form1.action='/servlet/controller.study.ToronAdminServlet';
    	document.form1.submit();
    }

    function toron_cal() {
        document.form1.target = "_self";
    	document.form1.p_process.value='StudentMemberList';
    	document.form1.action='/servlet/controller.study.ToronAdminServlet';
    	document.form1.submit();
    }
//-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
    <form name="form1" method="post" action="">
    <input type="hidden" name="p_process">
    <input type="hidden" name="s_action"    value="<%=ss_action%>">    <!--in relation to select-->
    <input type="hidden" name="s_grcode"    value="<%=ss_grcode%>">     <!--in relation to select-->
    <input type="hidden" name="s_gyear"     value="<%=ss_gyear%>">      <!--in relation to select-->
    <input type="hidden" name="s_grseq"     value="<%=ss_grseq%>">      <!--in relation to select-->
    <input type="hidden" name="s_uclass"    value="<%=ss_uclass%>">     <!--in relation to select-->
    <input type="hidden" name="s_subjcourse"value="<%=ss_subjcourse%>"> <!--in relation to select-->
    <input type="hidden" name="s_subjseq"   value="<%=ss_subjseq%>">    <!--in relation to select-->
    <input type="hidden" name="p_grcode"    value="<%=v_grcode%>">
    <input type="hidden" name="p_grcodenm"  value="<%=v_grcodenm%>">
    <input type="hidden" name="p_gyear"     value="<%=v_gyear%>">
    <input type="hidden" name="p_grseq"     value="<%=v_grseq%>">
    <input type="hidden" name="p_subjnm"    value="<%=v_subjnm%>">
    <input type="hidden" name="p_subj"      value="<%=v_subj%>">
    <input type="hidden" name="p_year"      value="<%=v_year%>">
    <input type="hidden" name="p_subjseq"   value="<%=v_subjseq%>">
	<input type="hidden" name="p_subjseqgr"   value="<%=v_subjseqgr%>">
    <input type="hidden" name="p_tpcode">
    <input type="hidden" name="p_pageno"  value="<%=v_pageno%>">

    <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/course/co_title06.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	        <!----------------- title �� ----------------->
      <br>
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <!--<td><img src="/images/admin/study/icon1.gif" width="14" height="10" border="0"> <%=v_grcodenm%> �����׷�
            &gt; <%=v_gyear%> �⵵ &gt;  <%=v_grseq%> �������� &gt;  <%=v_subjnm%> ���� &gt; <%=StringManager.cutZero(v_subjseqgr)%> ��
          </td>-->
          <td><img src="/images/admin/study/icon1.gif" width="14" height="10" border="0">
              <b><%=v_subjnm%> </b>
          </td>
        </tr>
      </table>

      <br>

      <!----------------- ����Ʈ, �������� ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="bottom" height="20" class=dir_txt>�� �Ʒ����� ��п� ������ ������ �����Ͻʽÿ�.</td>
          <td align="center" width="75">
          <a href="javascript:toron_cal()">�����</a>
          </td>
          <td align="center" width="75">
          <a href="javascript:topic_insert()"><img src="/images/admin/button/btn_subject.gif"  border="0"></a>
          </td>
          <td align="right" width="65">
          <a href="javascript:toron_list()"><img src="/images/admin/button/btn_list.gif" border="0"></a>
          </td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- ����Ʈ, �������� ��ư �� ----------------->

      <!----------------- ��й� ���� ���� ----------------->
      <table class="table_out" cellspacing="1" cellpadding="5">
        <tr>
          <td colspan="6" class="table_top_line"></td>
        </tr>
        <tr>
          <td width="5%" class="table_title"><b>NO</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>����</b></td>
          <td class="table_title"><b>������</b></td>
          <td class="table_title" width="10%"><b>������</b></td>
          <td class="table_title" width="17%"><b>��бⰣ</b></td>
        </tr>
        <%
        for(i = 0; i < list.size(); i++) {
            ToronData data  = (ToronData)list.get(i);
            v_tpcode    = data.getTpcode();
            v_started   = data.getStarted();
            v_ended     = data.getEnded();
            v_title     = data.getTitle();
            v_name      = data.getName();
            v_addate    = data.getAddate();

            if(!v_ended.equals("") && (Integer.parseInt(FormatDate.getFormatDate(v_ended,"yyyyMMdd")) < Integer.parseInt(FormatDate.getDate("yyyyMMdd")))){
                v_finished = "����";
            } else {  v_finished = "������";
            }
            v_addate    = FormatDate.getFormatDate(v_addate,"yyyy/MM/dd");
            v_started   = FormatDate.getFormatDate(v_started,"yyyy/MM/dd");
            v_ended     = FormatDate.getFormatDate(v_ended,"yyyy/MM/dd");
        %>
        <tr>
          <td class="table_01"><%= list.size() - i%></td>
          <td class="table_02_1"><%=v_finished%></td>
          <td class="table_02_1"><a href="javascript:topicView('<%=v_tpcode%>')"><%=v_title%></a></td>
          <td class="table_02_1"><%=v_name%></td>
          <td class="table_02_1"><%=v_addate%></td>
          <td class="table_02_1"><%=v_started%>~<%=v_ended%></td>
        </tr>
        <% }
        if(i == 0){ %>
              <tr>
                <td class="table_02_1" colspan="6">��ϵ� ������ �����ϴ�</td>
              </tr>
         <%  } %>
      </table>
      <!----------------- ��й� ���� �� ----------------->
      <br>
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>
</form>
</body>
</html>
