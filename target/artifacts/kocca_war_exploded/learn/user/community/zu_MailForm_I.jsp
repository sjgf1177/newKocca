<%
//**********************************************************
//  1. ��      ��: Ŀ�´�Ƽ ��ü�˸� 
//  2. ���α׷��� : zu_MsPopNotice.jsp
//  3. ��      ��: Ŀ�´�Ƽ ����Ÿ����.
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2005.07.01 
//  7. ��      ��: 2005.07.01 
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage   = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process         = box.getStringDefault("p_process","gomsnoticePop");
    String  v_static_cmuno    = box.getString("p_static_cmuno");
    String  v_cmuno           = box.getString("p_cmuno");
    String  v_parent_userid   = box.getString("p_parent_userid");

    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");

    String  content      = box.getString("content");
    String  width = "600";
    String  height = "200";

    //Ŀ�´�Ƽ Ÿ������
    String v_top_display_fg =( new CommunityCreateBean()).getSingleColumn(box.getString("p_cmuno"),"html_skin_fg");
    if(v_top_display_fg.equals("")) v_top_display_fg="1";
    String[] v_title_color={"","",""};
    if("1".equals(v_top_display_fg)){v_title_color[0]="line_color_blue";v_title_color[1]="tbl_dbtit1";v_title_color[2]="tbl_dbtit2";}
    if("2".equals(v_top_display_fg)){v_title_color[0]="line_color_green";v_title_color[1]="tbl_gtit1" ;v_title_color[2]="tbl_gtit2";}
    if("3".equals(v_top_display_fg)){v_title_color[0]="line_color_pink";v_title_color[1]="tbl_ptit1" ;v_title_color[2]="tbl_ptit2";}
    if("4".equals(v_top_display_fg)){v_title_color[0]="line_color_yellow";v_title_color[1]="tbl_ytit1" ;v_title_color[2]="tbl_ytit2";}
    if("5".equals(v_top_display_fg)){v_title_color[0]="line_color_violet";v_title_color[1]="tbl_vtit1" ;v_title_color[2]="tbl_vtit2";}

    ArrayList list       = (ArrayList)request.getAttribute("list");
    String s_parent_user_nm="";
    if (list.size()>0){
       DataBox dbx = (DataBox)list.get(0);
       s_parent_user_nm =dbx.getString("d_name");

    }
%>  
<html>
<head>
<title>���Ͼ˸�</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="../../css/user_style_community2.css" rel="stylesheet" type="text/css">
</head>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
//����
function uf_cfmOK() {
        if(document.form1.p_title.value ==''){
           alert('������ �Է��Ͽ����մϴ�.');document.form1.p_title.focus();return;
        }
    if(document.all.use_editor[0].checked) {        
        form1.content.value = ObjEditor.document.all.tags("html")[0].outerHTML;
    }else {
        form1.content.value = document.all.txtDetail.value;
    }


    document.form1.action = "/servlet/controller.community.CommunityPopUpServlet";
    document.form1.p_process.value = "sendmailData";
    document.form1.submit();
}
//-->
</script>
<body leftmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<form name = "form1"    method = "post">
<input type = "hidden" name = "p_process"     value="">
<input type = "hidden" name = "p_userid"      value = "">
<input type = "hidden" name = "p_static_cmuno"      value = "<%=v_static_cmuno%>">
<input type = "hidden" name = "p_cmuno"      value = "<%=v_cmuno%>">

<input type = "hidden" name = "p_pgm"      value = "popnotice">
<table width="800" height="210" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2" valign="top" background="../../images/community/pop_bg.gif" style="padding-left:6px; padding-top:6px; padding-right:6px;"> 
      <table width="100%" border="1" cellspacing="0" 
                         cellpadding="5"   style="border-collapse:collapse;" bordercolor="#B7BEC1">
        <tr> 
          <td align="center" valign="top" bgcolor="#FFFFFF"> 
            <!-- ���� -->
            <table width="97%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="1" bgcolor="CCCCCC"></td>
              </tr>
              <tr> 
                <td><table width="243" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="bottom" class="title"><strong><img src="../../images/community/pop_bl.gif" align="absmiddle">���ϰ���</strong><img src="../../images/community/title_vline.gif" align="absbottom"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="1" bgcolor="CCCCCC"></td>
              </tr>
              <tr> 
                <td height="20"></td>
              </tr>
            </table>
            <table width="97%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td align="center" valign="top"> 
                  <!-- �ʴ볻�뾲�� -->
                  <table width="98%" border="2" cellspacing="0" 
            cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed" frame="hsides">
                    <tr  class="lcolor"> 
                      <td height="3" colspan="2" class="<%=v_title_color[0]%>"></td>
                    </tr>
                    <tr> 
                      <td width="100" class="<%=v_title_color[1]%>" >�޴»��</td>
                      <td  class="tbl_comleft" ><input name="p_kor_name" type="text" value="<%=s_parent_user_nm%>" class="input2" size="30" readonly><input type=hidden name=p_parent_userid value="<%=v_parent_userid%>">
                      </td>
                    </tr> 
                    <tr>
                      <td class="<%=v_title_color[2]%>" >����</td>
                      <td class="tbl_comleft" ><input name="p_title" type="text" class="input2" size="55"></td>
                    </tr>
                    <tr> 
                      <td class="<%=v_title_color[1]%>" >����</td>
                      <td class="comm_contents"  ><%@ include file="/include/DhtmlEditor.jsp" %></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="20"></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td width="411" height="38" valign="top" background="../../images/community/pop_bobg.jpg"><img src="../../images/community/pop_backimg.jpg"></td>
    <td width="109" background="../../images/community/pop_bobg.jpg"><a href="javascript:uf_cfmOK();"><img src="../../images/user/button/btn_confirm.gif" border="0"></a> 
      <a href="javascript:this.close();"><img src="../../images/user/button/btn_cancel.gif" border="0"></a> 
    </td>
  </tr>
</table>
</form>
</body>
</html>
