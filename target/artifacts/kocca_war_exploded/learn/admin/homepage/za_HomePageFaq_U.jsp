<%
//**********************************************************
//  1. ��      ��: HomePage FAQ ����
//  2. ���α׷���: za_HomePageFaq_U.jsp
//  3. ��      ��: HomePage FAQ ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2005. 6. 25 �̿���
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.dunet.common.util.*" %> 
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    DataBox dbox = (DataBox)request.getAttribute("selectHomePageFaq");
    String contents        = "";
    String v_faqcategory   = box.getString("p_faqcategory");
    String v_faqcategorynm = box.getString("p_faqcategorynm");
    String  v_grcode      = box.getString("p_grcode");
    int v_fnum             = box.getInt("p_fnum");
    String v_title         = dbox.getString("d_title");
    String v_contents      = dbox.getString("d_contents");
    String content         = v_contents;
    String width    = "540";
    String height   = "300";

    String v_server   = conf.getProperty("kocca.url.value");
    String v_tem_url  = conf.getProperty("url.namo.template");
    String v_tem_name = conf.getProperty("name.namo.template.ini");
    
    String v_tem_url_name = v_server + v_tem_url + v_tem_name;
%>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script src="/script/cafe_select.js" language="JavaScript"></script>
<SCRIPT LANGUAGE="javascript">
    function update2Action() {
        document.form1.p_content.value = document.form1.Wec.MIMEValue;
        document.form1.p_content.value.replace("&","&amp;");

        if (document.form1.Wec.Value.length < 3) {
            alert("������ �Է��ϼ���");
            return;
        }

    if(document.form1.p_title.value == ""){
        alert("FAQ ������ �Է��ϼ���!");
        document.form1.p_title.focus();
        return;
    }

    if (confirm("�����Ͻðڽ��ϱ�?")) {
        document.form1.action = "/servlet/controller.homepage.HomePageFaqCategoryAdminServlet";
        document.form1.p_process.value = "update2";
        document.form1.submit();
    }else{
        return;
    }

}

function delete2Action() {
    if (confirm("�����Ͻðڽ��ϱ�?")) {
        document.form1.action = "/servlet/controller.homepage.HomePageFaqCategoryAdminServlet";
        document.form1.p_process.value = "delete2";
        document.form1.submit();
    }
    else {
        return;
    }
}

</script>

</head>

<body topmargin=0 leftmargin=0 >
        <form  name = "form1"  method = "post">
        <input type = "hidden" name = "p_process"     value = "">
        <input type = "hidden" name = "p_faqcategory" value = "<%=v_faqcategory%>">
        <input type = "hidden" name = "p_grcode" value="<%=v_grcode%>">
        <input type = "hidden" name = "p_fnum"        value = "<%=v_fnum%>">
		<input type = "hidden" name = "p_content"     value = "<%=StringUtil.convertHtmlchars(v_contents)%>">



<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">

    <table width="970" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/homepage/h_title02.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
       <br>
      <table width="970"  border="0"  cellpadding="0" cellspacing="1" class="table_out">
        <tr>
          <td class="table_title" width="18%">FAQ ī�װ��ڵ�</td>
          <td class="table_02_2"  width="82%"><%=v_faqcategory%></td>
        </tr>
        <tr>
          <td class="table_title">FAQ ī�װ���</td>
          <td class="table_02_2"><%=HomePageFaqCategoryAdminBean.getFaqCategoryName(v_faqcategory)%></td>
        </tr>
        <tr>
          <td class="table_title">FAQ ��ȣ</td>
          <td class="table_02_2"><%=v_fnum%></td>
        </tr>
        <tr>
          <td class="table_title">FAQ ����</td>
          <td class="table_02_2"><input name="p_title" type="text" class="input" style="width:300" value="<%=v_title%>"></td>
        </tr>
		 <tr>
          
        <td class="table_title"><font color="#CC0000">�����ǻ���</font></td>
        <td class="table_02_2">�̹����� �Բ� �ø���� �̹��� ���λ�����510�� ���� �ʰ� ���ּ���.<font color="#CC3300">(510�� 
          ������ ����Ʈ����)</font></td>
        </tr>
        <tr>
          <td class="table_title">FAQ �亯</td>
          <td class="table_02_2" >
                <!-- ���� ��Ƽ�� ������  ���� -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript" for="Wec" event="OnInitCompleted()">document.form1.Wec.TemplateIniURL = "<%=v_tem_url_name%>";namoActiveInitCompleted("p_content");</script>
                <script language="javascript">object_namoActivepatch('100%','500');</script>
                <!-- ���� ��Ƽ�� ������  ���� -->
                
        </tr></td>
        </tr>
      </table>

      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height=6></td>
          <td height=6></td>
          <td height=6></td>
          <td align="right" height=6></td>
          <td width="12" height=6></td>
          <td align="right" height=6></td>
        </tr>
        <tr>
          <td width="823" align="right" ></td>
          <td width="45" align="right">
              <a href="javascript:update2Action()" onfocus=this.blur()>
              <img src="/images/admin/button/btn_modify.gif" border = "0"></td>
          <td width="14">&nbsp;</td>
          <td width="32" align="right">
              <a href="javascript:delete2Action()" onfocus=this.blur()>
              <img src="/images/admin/button/btn_del.gif" border = "0"></td>
          <td width="12">&nbsp;</td>
          <td width="44" align="right">
              <a href="javascript:history.back();" onfocus=this.blur()>
              <img src="/images/admin/button/btn_list.gif" border = "0"></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
