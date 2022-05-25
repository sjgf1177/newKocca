<%
//**********************************************************
//  1. ��      ��: Qna �亯
//  2. ���α׷���:  za_QnaRep_U.jsp
//  3. ��      ��: Qna �亯 �Է�ȭ��
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2005. 10. 9 ��â��
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.dunet.common.util.*" %>


<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box        = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    
    String  v_searchStart = box.getString("p_searchStart");
    String  v_searchEnd   = box.getString("p_searchEnd");
    String  v_startdate   = box.getString("p_startdate");
    String  v_enddate     = box.getString("p_enddate");
	
	String v_action      = box.getString("p_action");
    String s_userid      = box.getSession("userid");
    String s_name        = box.getSession("name");
	int    v_pageno      = box.getInt("p_pageno");
	int    v_seq         = box.getInt("p_seq");
	String v_types       = box.getString("p_types");
	String v_searchtext  = box.getString("p_searchtext");            //  ������ ������ִ� ���ϼ� 
	String v_select      = box.getString("p_select"); 
	
	String v_repseq      = box.getString("p_repseq"  );
	String v_reptype     = box.getString("p_reptype" );
	String v_reptypes    = box.getString("p_reptypes");

	DataBox dbox = (DataBox)request.getAttribute("selectQna");
	String v_inuserid   = dbox.getString("d_inuserid");
	String v_name       = dbox.getString("d_name");
	String v_type       = dbox.getString("d_type");
	String v_indate     = dbox.getString("d_indate");
	String v_title      = dbox.getString("d_title");
	v_seq               = dbox.getInt("d_seq");
	String v_contents   = dbox.getString("d_contents");
	String v_realmotion  = dbox.getString("d_realmotion");
	String v_savemotion  = dbox.getString("d_savemotion");
	String v_grcodenm    = dbox.getString("d_grcodenm");
	String v_categorycd  = dbox.getString("d_categorycd");
	String v_categorynm  = dbox.getString("d_categorynm");
	String v_grcode      = dbox.getString("d_grcode");
	String v_repstatus   = dbox.getString("d_repstatus").equals("") ? "1" : dbox.getString("d_repstatus");;
  	String contents 	 = "";
  	String width	= "540";
  	String height	= "300";
  	
  	
  	v_contents = StringManager.replace(v_contents, "&nbsp;","&amp;nbsp;" );
    String v_server   = conf.getProperty("kocca.url.value");
    String v_tem_url  = conf.getProperty("url.namo.template");
    String v_tem_name = conf.getProperty("name.namo.template.ini");
    String v_tem_url_name = v_server + v_tem_url + v_tem_name;
%>

<html>
<head>
<title>QnA �亯</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language="JavaScript">
<!--

//��ȸ������
function listpage() {
	document.form1.action = "/servlet/controller.homepage.QnaAdminServlet";
	document.form1.p_process.value = "selectList";

	document.form1.submit();
}

    // ��� ����
    function update() {

        if (document.form1.p_title.value == "") {
            alert("������ �Է��ϼ���");
            document.form1.p_title.focus();
            return;
        }
        if (realsize(document.form1.p_title.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_title.focus();
            return;
        }

		document.form1.p_contents.value = document.form1.Wec.MIMEValue;
        document.form1.p_contents.value.replace("&","&amp;");
		
        if (document.form1.Wec.TextValue.length < 3) {
            alert("������ �Է��ϼ���");
            return;
        }

        document.form1.action = "/servlet/controller.homepage.QnaAdminServlet";
        document.form1.p_process.value = "replyUpdate";
        document.form1.submit();
    }

	function realsize( value ) {//�Է±��ڼ� üũ
		var len = 0;
		if ( value == null ) return 0;
		for(var i=0;i<value.length;i++){
			var c = escape(value.charAt(i));
			if ( c.length == 1 ) len ++;
			else if ( c.indexOf("%u") != -1 ) len += 2;
			else if ( c.indexOf("%") != -1 ) len += c.length/3;
		}
		return len;
	}
	

//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post" enctype = "multipart/form-data" method = "post">
<input type="hidden" name="p_seq"         value="<%= v_seq %>">
<input type="hidden" name="p_types"       value="<%=v_types%>">
<input type="hidden" name="p_type"        value="<%=v_type%>">

<input type="hidden" name="p_searchtext"  value="<%= v_searchtext %>">
<input type="hidden" name="p_select"      value="<%= v_select %>">
<input type="hidden" name="p_pageno"      value="<%= v_pageno %>">
<input type="hidden" name="p_process"     value="">
<input type="hidden" name="p_userid"      value="<%= v_inuserid %>">
<input type="hidden" name="p_grcode"      value="<%= v_grcode %>">
<input type="hidden" name="p_categorycd"  value="<%= v_categorycd%>">
<input type="hidden" name="p_action"      value="">
<input type= "hidden" name= "p_contents"  id= "p_contents"  value= "<%=StringUtil.convertHtmlchars(v_contents)%>">   
<input type = "hidden" name = "s_grcode"      value = "<%=box.getString("s_grcode")%>">

<input type = "hidden" name = "p_repseq"         value = "<%=v_repseq%>">
<input type = "hidden" name = "p_reptype"        value = "<%=v_reptype %>">
<input type = "hidden" name = "p_reptypes"       value = "<%=v_reptypes%>">

<input type = "hidden" name = "p_searchStart" value = "<%=v_searchStart%>">
<input type = "hidden" name = "p_searchEnd"   value = "<%=v_searchEnd%>">
<input type = "hidden" name = "p_startdate" value = "<%=v_startdate %>">
<input type = "hidden" name = "p_enddate"   value = "<%=v_enddate %>">


<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/homepage/homepage_title12.gif" ></td>

        </tr>
      </table>
	        <!----------------- title �� ----------------->
      <br>

	 <table width="97%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td width="1%"><img src="/images/admin/common/icon.gif" ></td>
		<td  class=sub_title>Q&A �亯���</td>
	      <td align="right"><a href="javascript:update()"><img src="/images/admin/button/btn_save.gif" border="0"></a>
            <a href="javascript:history.back()"><img src="/images/admin/button/btn_list.gif" border="0"></a>
  		  </td>
	  </tr>
	  <tr>
		<td height="3"></td>
	  </tr>
	</table>
    <!----------------- �亯���� �Է��ϱ� ----------------->
        <table cellspacing="1" cellpadding="5" class="table_out">
          <tr> 
              <td width="13%" height="25" class="table_title"><b> �ۼ��� </b></td>
              <td class="table_02_2"><%=v_name%></td>
              <td width="13%" height="25" class="table_title"><b> �亯���� </b></td>
              <td class="table_02_2">
                <select name="p_repstatus">
                  <!--option value= "1" <%=v_repstatus.equals("1") ? " selected " : "" %> >������</option-->
                  <option value= "2" <%=v_repstatus.equals("2") ? " selected " : "" %> >�亯�غ���</option>
                  <option value= "3" <%=v_repstatus.equals("3") ? " selected " : "" %> >�亯�Ϸ�</option>
                </select>
              </td>
          </tr>
          <tr> 
              <td class="table_title" class="table_title">���� </td>
              <td class="table_02_2" colspan="3"><input type="text"  class="input" name="p_title" size = "135" maxlength = "150" value="<%=v_title%>"></td>
          </tr>
          <tr> 
              <td class="table_title" class="table_title">���� </td>
              <td class="table_02_2" colspan="3">
                <!-- ���� ��Ƽ�� ������  ���� -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript" for="Wec" event="OnInitCompleted()">document.form1.Wec.TemplateIniURL = "<%=v_tem_url_name%>";namoActiveInitCompleted("p_contents");</script>
                <script language="javascript">object_namoActivepatch('100%','500');</script>
                <!-- ���� ��Ƽ�� ������  ���� -->
    		  </td>
          </tr>
          <tr> 
              <td class="table_title" class="table_title">����÷�� </td>
              <td class="table_02_2" colspan="3">
               <%
                  Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
                  Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
                  Vector i_fileseqVector     = (Vector)dbox.getObject("d_fileseq");         // ���� �Ϸù�ȣ
                  
                  int    i_fileLimit         = QnaAdminBean.getFILE_LIMIT();              // ���� ÷�� ���ϼ�
                   
                  %>
                  <%@ include file="/learn/admin/include/za_MultiAttach.jsp" %> 
    		  </td>
          </tr>
        </table>
    	<br>
	 <table width="97%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	      <td align="right"><a href="javascript:update()"><img src="/images/admin/button/btn_save.gif" border="0"></a>
            <a href="javascript:history.back()"><img src="/images/admin/button/btn_list.gif" border="0"></a>
  		  </td>
	  </tr>
	  <tr>
		<td height="3"></td>
	  </tr>
	</table>

		<br>
    </td>
  </tr>
</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
