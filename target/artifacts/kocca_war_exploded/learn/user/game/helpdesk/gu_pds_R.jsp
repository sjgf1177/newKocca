<%
//**********************************************************
//  1. ��      ��: HelpDesk > �ڷ��
//  2. ���α׷��� : gu_pds_R.jsp
//  3. ��      ��: �ڷ�� �󼼺���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.26
//  7. ��      ��: 
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box       = (RequestBox)request.getAttribute("requestbox");
    int     v_tabseq     = box.getInt("p_tabseq");
    String  v_process    = box.getString("p_process");
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");

    int v_pageno     = box.getInt("p_pageno");
    int v_seq        = box.getInt("p_seq");                  // �Խù� ID
    int v_orgseq     = v_seq;
    int v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�
    int v_levels     = 0;
    int v_dispnum    = 0;
    int v_totalpage  = 0;
    int v_rowcount   = 0;
    int i            = 0;
    int v_cnt        = 0;
    String v_userid  = "";
    String v_name    = "";
    String v_indate  = "";
    String v_title   = "";
    String v_content = "";
    Vector v_realfileVector = null;
    Vector v_savefileVector = null;

    DataBox dbox = (DataBox)request.getAttribute("selectHomePageBoard");
    if (dbox != null ) {
        v_seq           = dbox.getInt("d_seq");
        v_userid        = dbox.getString("d_userid");
        v_name          = dbox.getString("d_name");
        v_title         = dbox.getString("d_title");
        v_content       = dbox.getString("d_content");

        v_cnt           = dbox.getInt("d_cnt");
        v_indate        = dbox.getString("d_indate");
        v_realfileVector = (Vector)dbox.getObject("d_realfile");
        v_savefileVector = (Vector)dbox.getObject("d_savefile");

    }

    String s_userid    = box.getSession("userid");
    String s_username  = box.getSession("name");
	String ss_gadmin   = (String)box.getSession("gadmin");

    // ����Ʈ
    ArrayList list = (ArrayList)request.getAttribute("selectHomePageList");
box.put("leftmenu","04");                       // �޴� ���̵� ����

%>


<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topHelpdesk.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script language="JavaScript" type="text/JavaScript">
<!--

//�亯�������� �̵�
function replyPage() {
    document.form1.action = "/servlet/controller.homepage.HomePageBoardServlet";
    document.form1.p_process.value = "replyPage";
    document.form1.submit();
}

//���� ����
function delete_HomePageBoard() {
    if (confirm("������ �����Ͻðڽ��ϱ�?")) {
        document.form1.p_userid.value = "<%= v_userid %>";
        document.form1.p_pageno.value = "1";
        document.form1.action = "/servlet/controller.homepage.HomePageBoardServlet";
        document.form1.p_process.value = "delete";
        document.form1.submit();
    }
    else {
        return;
    }
}

//����Ʈ �������� �̵�
function selectList() {
    document.form1.p_pageno.value = "1";
    document.form1.action = "/servlet/controller.homepage.HomePageBoardServlet";
    document.form1.p_process.value = "selectList";
    document.form1.submit();
}

//���� �������� �̵�
function updatePage() {
	document.form1.action = "/servlet/controller.homepage.HomePageBoardServlet";
	document.form1.p_process.value = "updatePage";
	document.form1.submit();
}

//-->
</script>

<form name = "form1" enctype = "multipart/form-data" method = "post">
		<input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
		<input type = "hidden" name = "p_tabseq"     value = "<%=v_tabseq %>">
		<input type = "hidden" name = "p_search"     value = "<%=v_search %>">
		<input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
		<input type = "hidden" name = "p_seq"        value = "<%= v_seq %>">
		<input type = "hidden" name = "p_upfilecnt"  value = "<%= v_upfilecnt %>">
		<input type = "hidden" name = "p_userid"     value = "<%= v_userid %>">
		<input type = "hidden" name = "p_process"	 value = "">

		  <!-- center start -->
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="720" height="35" align="right"  background="/images/user/game/helpdesk/<%=tem_subimgpath%>/tit_pds.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
      HOME > Help Desk > �ڷ��</td>
  </tr>
  <tr> 
    <td height="20"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="/images/user/game/helpdesk/text_pds.gif"></td>
  </tr>
  <tr> 
    <td height="15">&nbsp;</td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="81" height="2" class="linecolor_helpdesk01"></td>
	<td width="639" height="2" class="linecolor_helpdesk02"></td>
  </tr>
</table>
<table width="720" border="2" cellspacing="0" 
    cellpadding="0"  style="border-collapse:collapse;" bordercolor="#A9B2CD" frame="hsides" rules="rows" >
  <tr> 
    <td width="150" class="tbl_grc"><img src="/images/user/game/helpdesk/text_subject.gif"></td>
    <td width="8" valign="bottom" ><img src="/images/user/game/helpdesk/vline.gif"></td>
    <td width="625" class="tbl_bleft"><strong><%= v_title %></strong></td>
  </tr>
  <tr> 
    <td  class="tbl_grc"><img src="/images/user/game/helpdesk/text_writer.gif"></td>
    <td  valign="bottom"><img src="/images/user/game/helpdesk/vline.gif" ></td>
    <td bgcolor="F8F7EF" class="tbl_bleft"> ��� (<%=v_userid%>)</td>
  </tr>

  <tr> 
    <td class="tbl_grc"><img src="/images/user/game/helpdesk/text_page.gif"></td>
    <td valign="bottom"><img src="/images/user/game/helpdesk/vline.gif"></td>
    <td class="tbl_contents"><%=v_content%></td>
  </tr>
    <tr> 
    <td class="tbl_grc"><img src="/images/user/game/helpdesk/text_addfile.gif"></td>
    <td valign="bottom"><img src="/images/user/game/helpdesk/vline.gif"></td> 
    
    <td bgcolor="F8F7EF" class="tbl_bleft"><table width="611" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="611" bgcolor="EEF0F5"><strong>
			  <%		
				if( v_realfileVector != null ) { 
					for(i = 0; i < v_realfileVector.size(); i++) {      //     ÷������ ������ ����

						String v_realfile = (String)v_realfileVector.elementAt(i);
						String v_savefile = (String)v_savefileVector.elementAt(i);  	

						if(v_realfile != null && !v_realfile.equals("")) {  %> 
			<a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'> 
              <%= v_realfile%></a><br>
              <input type="hidden" name="p_savefile"  value=<%=v_savefile%>>
              <%	}else{
			  %>
			÷�ε� ������ �����ϴ�.
			<%			}
					}
				}%>
			</strong></td>
        </tr>
		
		
      </table></td>
  </tr>
  
  </table>
  <table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="81" height="2" class="linecolor_helpdesk01"></td>
	<td width="639" height="2" class="linecolor_helpdesk01"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="2" colspan="2" class="lcolor"></td>
  </tr>
  <tr> 
    <td height="1" colspan="2"></td>
  </tr>
  <tr> 
    <td height="5" colspan="2"></td>
  </tr>
  <tr> 
    <td width="560" align="center" valign="bottom">&nbsp;</td>
	<%if( ss_gadmin.equals("B2") || StringManager.substring(ss_gadmin,0,1).equals("A") ){%>
    <td align="right"><a href="javascript:updatePage()"><img src="/images/user/game/button/btn_mod.gif" border="0"></a></td>
    <td align="right"><a href="javascript:delete_HomePageBoard()"><img src="/images/user/game/button/btn_del.gif" border="0"></a></td>
    <%}%>
    <td align="right" valign="bottom"><a href="javascript:selectList()"><img src="/images/user/game/button/btn_list.gif" border="0"></a></td>
  </tr>
  <tr> 
    <td height="5" colspan="2" ></td>
  </tr>
  <tr> 
    <td height="2" colspan="2"></td>
  </tr>
</table>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->